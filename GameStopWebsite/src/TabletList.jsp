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

	<jsp:useBean id="Tablets" class="mybean.Tablets" />
	<jsp:useBean id="TabletHashMap" class="mybean.TabletHashMap" />

<html>



	<%@include file="Header.jsp"%>

		<%String name = null;
		String CategoryName = request.getParameter("page");
		HashMap<String, Tablets> hm = new HashMap<String, Tablets>();%>
		
		<%
			if (CategoryName.equals("tabletapple")) {
				hm.putAll(TabletHashMap.apple);
				name = TabletHashMap.string_apple;
			} else if (CategoryName.equals("tabletmicrosoft")) {
				hm.putAll(TabletHashMap.microsoft);
				name = TabletHashMap.string_microsoft;
			} else if (CategoryName.equals("tabletsamsung")) {
				hm.putAll(TabletHashMap.samsung);
				name = TabletHashMap.string_samsung;
			}%>
		<div id='body' class='width'>
		<section id='content'><div id='content'><div class='post'><h2 class='title meta'>
		<h2><%=name%> Tablets</h2>
		
		<%for(Map.Entry<String, Tablets> entry : hm.entrySet()){
			Tablets tablets = entry.getValue();%>
			<div class='entry'><table id='bestseller'>
			<article>
			<tr>
			<td>
			<h4><%=tablets.getName()%></h4>
			<h4><color='Red'>$ <%=tablets.getPrice()%></color></h4><ul>
			<li id='item'><img src='images/tablets/<%=tablets.getImage()%>' style='width: 200px; display: block; ' /></li>
			<%if(session.getAttribute("userid")!=null){%>
				<li><form method='post' action='ShoppingCart.jsp'>
					<input type='hidden' name='name' value='<%=entry.getKey()%>'>
					<input type='hidden' name='type' value='tablets'>
					<input type='hidden' name='page' value='<%=CategoryName%>'>
					<input type='hidden' name='access' value=''>
					<input type='submit' class='button' value='Buy Now' href='#'></input></form>
				<% } %>
				</li>
			</ul></td>
			</tr>
			</table></div>
			
		<% } %>
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