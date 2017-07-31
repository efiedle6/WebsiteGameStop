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

	<jsp:useBean id="Accessory" class="mybean.Accessory" />
	<jsp:useBean id="Consoles" class="mybean.Consoles" />
	<jsp:useBean id="ConsolesHashMap" class="mybean.ConsolesHashMap" />

<html>



	<%@include file="Header.jsp"%>

		<%String CategoryName = request.getParameter("page");
		String ConsoleName = request.getParameter("console");
		HashMap<String, Consoles> hm = new HashMap<String, Consoles>();
		if(CategoryName.equals("microsoft")){
			hm.putAll(ConsolesHashMap.microsoft);
		}
		else if(CategoryName.equals("sony")){
			hm.putAll(ConsolesHashMap.sony);
		}
		else if(CategoryName.equals("nintendo")){
			hm.putAll(ConsolesHashMap.nintendo);
		}%>
		
		<%Consoles console = hm.get(ConsoleName);%>

		
		<div id='body' class='width'>
		<section id='content'>
		<article>

		<h2><%=console.getName()%>: Accessories</h2>

		<%for(Map.Entry<String, Accessory> entry : console.getAccessories().entrySet()){
			Accessory accessory = entry.getValue();%>
			<tr>
			<td>
			<h4><%=accessory.getName()%></h4>
			<h4><color='Red'>$ <%=accessory.getPrice()%></color></h4><ul>
			<li id='item'><img src='images/accessories/<%=accessory.getImage()%>' style='width: 300px; display: block; ' /></li>
			
			<%if(session.getAttribute("userid")!=null){%>
			<li><form method='post' action='ShoppingCart.jsp'>
					<input type='hidden' name='name' value='<%=entry.getKey()%>'>
					<input type='hidden' name='type' value='accessories'>
					<input type='hidden' name='page' value='<%=CategoryName%>'>
					<input type='hidden' name='access' value='<%=ConsoleName%>'>
					<input type='submit' class='button' value='Buy Now' href='#'></input></form></li>
				</li>
				<%	} %>
			</ul></td>
			</tr>
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