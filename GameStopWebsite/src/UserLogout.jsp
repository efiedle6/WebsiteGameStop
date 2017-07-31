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

		<%session.removeAttribute("userid");
		session.removeAttribute("userPermissions");%>

	<%@include file="Header.jsp"%>
	

		
		<div id='body' class='width'>
		<section id='content'>
		<h2 style='color:red'>Successfully logged out</h2>
		</section>

        

		<%@include file="Sidebar.jsp"%>

<div class="clear"></div>
    </div>
    <footer>
        <%@include file="Footer.jsp"%>
    </footer>
</div>
</body>
</html>