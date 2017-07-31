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
		String userPermissions = request.getParameter("userPermissions");%>
		
		<%HashMap<String, User> hm = new HashMap<String,User>();
		if(userPermissions.equals("Customer")){
			hm.putAll(UserHashMap.customer);
		}else if(userPermissions.equals("Salesman")){
			hm.putAll(UserHashMap.salesman);
		}else if(userPermissions.equals("Manager")){
			hm.putAll(UserHashMap.manager);
		} %>
		
		<%User username = hm.get(userid);
		if(username!=null){
			String userPassword = username.getPassword();
			if(password.equals(userPassword)){
				session.setAttribute("userid", username.getName());
				session.setAttribute("userPermissions", username.getUserPermissions());
				
				response.sendRedirect("/HW3/Home.jsp");
				return;
			} 
			else {
				displayLogin(request, response, out, false, true); %>
				<%@include file="Sidebar.jsp"%>
				<div class="clear"></div>
				</div>
				<footer>
				<%@include file="Footer.jsp"%>
				</footer>
				</div>
				</body>
				</html>
				<%return;
			}
		}

		displayLogin(request, response, out, true, false);  %>
		<%@include file="Sidebar.jsp"%>
		<div class="clear"></div>
		</div>
		<footer>
		<%@include file="Footer.jsp"%>
		</footer>
		</div>
		</body>
		</html>
		<%return;
		} %> 
		
		<% if (request.getMethod().equals("GET")) {
			displayLogin(request, response, out, false, false);%>
			<%@include file="Sidebar.jsp"%>
			<div class="clear"></div>
			</div>
			<footer>
			<%@include file="Footer.jsp"%>
			</footer>
			</div>
			</body>
			</html>
			<%return;
		}
			%>
		
        


	<%! protected void displayLogin(HttpServletRequest request, HttpServletResponse response,  JspWriter printer, boolean nameError,
		boolean passwordError)	throws ServletException, IOException {
			
		printer.print("<div id='body' class='width'>");
		printer.print("<section id='content'>");
		printer.print("<h2>Login</h2>");
		printer.println("<article>");

		if(nameError){
			printer.print("<h4 style='color:red'> Username Not Found. Please Register Below.</h4>");
		}
		if(passwordError){
			printer.print("<h4 style='color:red'> Password Incorrect. Please Try Again.</h4>");
		}

		printer.print("<form method='post' action='UserLogin.jsp'>");
		printer.print("<table>");
		printer.print("<tr><td>");
		printer.print("<h3>Username:</h3></td><td><input type='text' name='userid' class='input' required></input></td>");
		printer.print("</tr><tr><td>");
		printer.print("<h3>Password:</h3></td><td><input type='password' name='password' class='input' required></input></td>");
		printer.print("</tr><tr><td>");
		printer.print("<h3>User Permission:</h3></td><td><select name='userPermissions' class='input'>"
			+ "<option value='Customer' selected>Customer</option>"
			+ "<option value='Salesman'>Salesman</option>"
			+ "<option value='Manager'>Manager</option></select></td>");
		printer.print("</tr><br><tr><td>");
		printer.print("<input type='submit' class='button' value='Login' style='color:red; font-size: 24px; width: 200px; display: block;'></input><td>");
		printer.print("</tr><tr><td>");
		printer.print("<a class='button' href='Register.jsp'><h4>Register Here</h4></a></td>");
		printer.print("</tr>");
		printer.print("</table>");
		printer.print("</form></section>");

		} %>