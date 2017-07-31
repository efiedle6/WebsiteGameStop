<!doctype html>

	<%@ page import="mybean.CartItem" %>
	<%@ page import="mybean.CartHashMap" %>
	<%@ page import="mybean.CartHashMap" %>
	<%@ page import="java.lang.*" %>
	<%@ page import="java.io.InputStream" %>
	<%@ page import="java.io.InputStreamReader" %>
	<%@ page import="java.io.PrintWriter" %>
	<%@ page import="java.net.URL" %>
	<%@ page import="java.net.URLConnection" %>
	<%@ page import="java.text.DateFormat" %>
	<%@ page import="java.text.SimpleDateFormat" %>
	<%@ page import="java.util.ArrayList" %>
	<%@ page import="java.util.Date" %>
	<%@ page import="java.util.HashMap" %>
	<%@ page import="java.util.Map" %>
	<%@ page import="javax.servlet.http.HttpServletRequest" %>
	<%@ page import="javax.servlet.http.HttpSession" %>
	
	<jsp:useBean id="CartItem" class="mybean.CartItem" />
	<jsp:useBean id="CartHashMap" class="mybean.CartHashMap" />

	
<head>
<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
<title>GameSpeed</title>
<script type="text/javascript" src="javascript.js"></script>
<link rel="stylesheet" type="text/css" href="styles.css">
<meta name='viewport' content='width=device-width, minimum-scale=1.0, maximum-scale=1.0' />
</head>

<body onload="init()">
	<div id='container'>
	<header>
	<div class='width'>    		
	<h1><a href='/HW3/Home.jsp'><img src='images/site/GameON.jpg' alt=''
		style='height: 80px'/> GameSpeed</a>
		<br>
		</h1>
		<form name="autofillform" action="autocomplete">
      <table border="0" cellpadding="5"> 
        <tbody>
          <tr>
            <td><strong>Search Products:</strong></td>
                        <td>
							<input type="text"
							size="40" 
							id="productfield"
							onkeyup="doCompletion()">
                        </td>
			</tr>
          <tr>
              <td id="auto-row" colspan="2">
                <table id="producttable" class="popupBox"/>
              </td>
          </tr>
        </tbody>
      </table>
    </form>

	</header>
	</div>
	<nav>
	<div class='width'>
    <ul>
    <li class='start selected'><a href='/HW3/Home.jsp'>Home</a></li>
	<li><a href='/HW3/ReviewsList.jsp'>Reviews</a></li>

	
		<% if(session.getAttribute("userid")!=null){ %>
			<li><a>Hello, <%=session.getAttribute("userid")%></a></li>
			<li><a href='UserLogout.jsp'>Logout</a></li>
			<%if(session.getAttribute("userPermissions").equals("Salesman")){ %>
				<li><a href='Register.jsp'>  Register a Customer  </a></li>
			<% } %>
			<li><a href='ShoppingCart.jsp'>Cart</a></li>
			<li><a href='OrdersList.jsp'>Past Orders</a></li>
		<% } else { %>
			<li><a href='UserLogin.jsp'>Login</a></li>
			<li><a href='ShoppingCart.jsp'>Cart</a></li>
		<% } %>

		
		</ul>
	</div>
	</nav>
	</div>
	</body>
