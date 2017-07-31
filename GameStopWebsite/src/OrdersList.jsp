<!doctype html>

<%@ page import="java.io.IOException"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="mybean.*" %>

<%@ page import="javax.servlet.ServletException"%>
<%@ page import="javax.servlet.annotation.WebServlet"%>
<%@ page import="javax.servlet.http.HttpServlet"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%@ page import="java.sql.*"%>

	<jsp:useBean id="Orders" class="mybean.Orders" />
	<jsp:useBean id="OrdersHashMap" class="mybean.OrdersHashMap" />

<html>



	<%@include file="Header.jsp"%>

	<%if (request.getMethod().equals("POST")) { 
		showOrderList(session, out);
	}%>
	
	<% if (request.getMethod().equals("GET")) { 
		String clear = request.getParameter("clear");
		String orderID2 = request.getParameter("orderID");
		if(clear!=null && clear.equals("true")){
			String userid = session.getAttribute("userid").toString();
			ArrayList<Orders> orders = OrdersHashMap.orders.get(userid);
			Date cancelTime=null;
			int index = -1;
			String orderNum = "-1";
			for(Orders temp: orders){
				Orders ord = temp;
				if (ord.getOrderID().equals(orderID2)){
					index = orders.indexOf(ord);
					orderNum = ord.getOrderID().toString();
					cancelTime = ord.getCancelDueTime();
				}
			}
			Date currentTime = new Date(session.getLastAccessedTime());
			if(index!=-1 && cancelTime!=null && (currentTime.compareTo(cancelTime)<0)){
				orders.remove(index);
				
				try {
				Class.forName("com.mysql.jdbc.Driver");
				
				String dbURL = "jdbc:mysql://localhost:3306/orders";
				String username = "edward";
				String password = "root";
				Connection connection = DriverManager.getConnection(dbURL, username, password);
			
				Statement statement = connection.createStatement();
				String stat = "DELETE FROM orders.orders WHERE OrderID = '"+ orderNum +"';";
				statement.executeUpdate(stat);
				statement.close();
				connection.close();
				} catch (ClassNotFoundException e) {
					return;
				} catch (SQLException e) {
					return;
				}	
			
			}
			else{%>
			
			<section><h2 style='color:red'>Error Removing Order, Perhaps Past Cancel Date</h2></section>
			
			<%}
		}
		showOrderList(session, out);
	}%>

	<%@include file="Sidebar.jsp"%>

<div class="clear"></div>
    </div>
    <footer>
        <%@include file="Footer.jsp"%>
    </footer>
</div>
</body>
</html>

<%!protected void showOrderList(HttpSession session, JspWriter printer) throws ServletException, IOException{

		printer.print("<div id='body' class='width'>");
		printer.print("<section id='content'>");
		printer.print("<h2>Your Orders</h2>");
		printer.println("<article>");
		
		if(session.getAttribute("userid")!=null){
			String userid = session.getAttribute("userid").toString();
			ArrayList<Orders> orders = OrdersHashMap.orders.get(userid);
			if(orders==null || orders.size()==0){
				printer.print("<h4 style='color:red'>You have no past orders</h4>");
			}
			else{
				
				for (Orders temp: orders){
					Orders ord = temp;
					printer.print("<div class='entry'><table id='bestseller'>");
					printer.println("<article>");
					printer.print("<tr>");
					printer.print("<td>");
					printer.print("<h4>OrderID:" + ord.getOrderID() +"</h4>");
					printer.print("<h4><color='Red'>Order Cost: $"+ord.getTotalCost()+"</color></h4><ul>");
					printer.print("<h4>You may cancel by: " + ord.getCancelDueTime() + "<h4>");
					printer.print("<a class='button' href='OrdersList.jsp?clear=true&orderID="+ord.getOrderID()+"'>Cancel This Order</a>");
					printer.print("</ul></td>");
					printer.print("</tr>");
					printer.print("</table></div>");
					
				}
			}
		} else{
			printer.print("<h3 style='color:red'>Not logged in, please login to view your Orders</h3>");
		}
		
		printer.print("</section>");

	}%>