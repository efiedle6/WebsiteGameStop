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

	<jsp:useBean id="User" class="mybean.User" />
	<jsp:useBean id="UserHashMap" class="mybean.UserHashMap" />

<html>



	<%@include file="Header.jsp"%>
	
	<%if (request.getMethod().equals("POST")) {%>
		<%String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		String repeat = request.getParameter("repeat");
		String userPermissions = request.getParameter("userPermissions");%>
		
		
		<%HashMap<String, User> hm = new HashMap<String,User>();
		if(userPermissions.equals("Customer")){
			hm.putAll(UserHashMap.customer);
		}else if(userPermissions.equals("Salesman")){
			hm.putAll(UserHashMap.salesman);
		}else if(userPermissions.equals("Manager")){
			hm.putAll(UserHashMap.manager);
		}%>
		
		<%User username = hm.get(userid);
		if(username!=null){
			displayRegister(request, response, out, true, false);
		} 
		else if(!password.equals(repeat)){
				displayRegister(request, response, out, false, true);
		}
		else {
			User user = new User(userid,password,userPermissions);
				if (userPermissions.equals("Customer")) {
					UserHashMap.customer.put(userid, user);
				} else if (userPermissions.equals("Salesman")) {
					UserHashMap.salesman.put(userid, user);
				} else if (userPermissions.equals("Manager")) {
					UserHashMap.manager.put(userid, user);
				}
				
				if(session.getAttribute("userid")!=null){
					response.sendRedirect("/HW3/Home.jsp");
					return;
				}
				else{
					response.sendRedirect("/HW3/UserLogin.jsp");
					return;
				}
			}
	
	} %> 
		
		<% if (request.getMethod().equals("GET")) {
			displayRegister(request, response, out, false, false);
		}
			%>
		
        

		<%@include file="Sidebar.jsp"%>

<div class="clear"></div>
    </div>
    <footer>
        <%@include file="Footer.jsp"%>
    </footer>
</div>
</body>
</html>


<%!protected void displayRegister(HttpServletRequest request, HttpServletResponse response, JspWriter printer, boolean nameUsed,
		boolean passwordNotMatching)	throws ServletException, IOException {
		
		printer.print("<div id='body' class='width'>");
		printer.print("<section id='content'>");
		printer.print("<h2>Register New User</h2>");
		printer.println("<article>");
		if(nameUsed){
			printer.print("<h4 style='color:red'> Username already in use, please choose another.</h4>");
		}
		if(passwordNotMatching){
			printer.print("<h4 style='color:red'> Passwords not matching. Please Try Again.</h4>");
		}
		
		printer.print("<form method='post' action='Register.jsp'>");
		printer.print("<table>");
		printer.print("<tr><td>");
		printer.print("<h3>Username:</h3></td><td><input type='text' name='userid' class='input' required></input></td>");
		printer.print("</tr><tr><td>");
		printer.print("<h3>Password:</h3></td><td><input type='password' name='password' class='input' required></input></td>");
		printer.print("</tr><tr><td>");
		printer.print("<h3>Re-Type Password:</h3></td><td><input type='password' name='repeat' class='input' required></input></td>");
		printer.print("</tr><tr><td>");
		printer.print("<h3>User Permission:</h3></td><td><select name='userPermissions' class='input'>"
			+ "<option value='Customer' selected>Customer</option>"
			+ "<option value='Salesman'>Salesman</option>"
			+ "<option value='Manager'>Manager</option></select></td>");
		printer.print("</tr><br><tr><td>");
		printer.print("<input type='submit' class='button' value='Create User' style='color:red'; font-size: 24px; width: 200px; display: block;'></input><td>");
		printer.print("</tr>");
		printer.print("</table>");
		printer.print("</form></article></section>");
		
		} %>