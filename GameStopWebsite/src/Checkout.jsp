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

	<jsp:useBean id="User" class="mybean.User" />
	<jsp:useBean id="UserHashMap" class="mybean.UserHashMap" />

<html>


	<%@include file="Header.jsp"%>
	
	<% if (request.getMethod().equals("GET")) { 
		String userid = session.getAttribute("userid").toString();
		ArrayList<CartItem> carts = CartHashMap.orderList.get(userid);
		double totalCost = 0.0;
		int numItems = 0;
		for (CartItem temp: carts){
			CartItem cart = temp;
			totalCost = totalCost + cart.getPrice();
			numItems++;
		}%>

		<section id='content'>
		
		<article>
		<h2>Order Information</h2>
		<h4>Total Number of items: <%=numItems%></h4>
		<h4>Total Price: <%=totalCost%></h4>
		</article>
		
		<article>
		<h2>Enter Your Personal Information</h2><ul>
		<form method='post' action='Checkout.jsp'><table>
		<input type='hidden' name='numItems' value='<%=numItems%>'>
		<input type='hidden' name='totalCost' value='<%=totalCost%>'>
		<tr><td><h3>Full Name:</h3></td><td><input type='text' name='UserName' class='input' required>
		</input></td></tr><tr><td><h3>Full Street Address:</h3></td><td>
		<input type='text' name='Address' class='input' required></input></td></tr>
		<tr><td><h3>Credit Card Number:</h3></td><td><input type='text' name='CardNumber' class='input' required>
		</input></td></tr><br>
		<tr><td><input type='submit' class='button' value='Submit'></input><td></tr>
		</table></form>
		</article>
		</section>
	<%}%>
	
	<%if (request.getMethod().equals("POST")) {
		String name = request.getParameter("UserName");
		String address = request.getParameter("Address");
		String number = request.getParameter("CardNumber");
		String numItemsStr = request.getParameter("numItems");
		int numItems = Integer.parseInt(numItemsStr);
		String totalCostStr = request.getParameter("totalCost");
		double totalCost = Double.parseDouble(totalCostStr);%>
		
		<%if(session.getAttribute("userid")!=null){
			String userid = session.getAttribute("userid").toString();
			ArrayList<CartItem> carts = CartHashMap.orderList.get(userid);
			Date timeComp = new Date(session.getLastAccessedTime()); 
			Date deliverTime = new Date(session.getLastAccessedTime() + (1210000000)); //add two weeks for deliver time in milliseconds
			Date cancelDueTime = new Date(session.getLastAccessedTime() + (1210000000) - (432000000)); //subtract 5 days for cancel date in milliseconds
			String orderID = new String("" + OrdersHashMap.incOrderNumber() +"");%>
			
			<%try {
				Class.forName("com.mysql.jdbc.Driver");
				
				String dbURL = "jdbc:mysql://localhost:3306/orders";
				String username = "edward";
				String password = "root";
				Connection connection = DriverManager.getConnection(dbURL, username, password);
			
				Statement statement = connection.createStatement();
				String stat = "INSERT INTO orders (OrderID, NumItems, OrderPrice, UserName, Address," 
					+ "CardNumber) VALUES ('"+ orderID + "','"+ numItemsStr+ "','"+ totalCostStr +"',"
					+ "'"+ name + "','"+ address+"','"+ number +"')";
				statement.executeUpdate(stat);
				statement.close();
				connection.close();
			} catch (ClassNotFoundException e) {
				return;
			} catch (SQLException e) {
				return;
			}%>
			
			<%ArrayList<Orders> orderList = OrdersHashMap.orders.get(userid);
			if(orderList == null){
				orderList = new ArrayList<Orders>();
			}%>
			
			<%Orders newOrder = new Orders(orderID, name, address, number, numItems, totalCost, carts, timeComp, deliverTime, cancelDueTime);%>

	
			<%orderList.add(newOrder);
			OrdersHashMap.orders.put(userid, orderList);
			clearShoppingCart(session);
			response.sendRedirect("/HW3/OrdersList.jsp");%>
			
		<%}
		else{%>
		
			<div id='body' class='width'>
			<section id='content'>
			<article>
			<h2>Error Creating Order, Please Try Again</h2>
			</article>
			</section>
		<%
		}
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

<%!protected void clearShoppingCart(HttpSession session){
		String userid = session.getAttribute("userid").toString();
		ArrayList<CartItem> carts = CartHashMap.orderList.get(userid);
		carts.clear();
	}%>