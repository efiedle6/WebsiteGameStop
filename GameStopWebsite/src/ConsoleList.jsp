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

    <%String name = null;
	String CategoryName = request.getParameter("page");
	PrintWriter printer = response.getWriter();
	HashMap<String, Consoles> hm = new HashMap<String, Consoles>();
		
		
			if(CategoryName.equals("microsoft")){
				hm.putAll(ConsolesHashMap.microsoft);
				name = ConsolesHashMap.string_microsoft;
			}
			else if(CategoryName.equals("sony")){
				hm.putAll(ConsolesHashMap.sony);
				name = ConsolesHashMap.string_sony;
			}
			else if(CategoryName.equals("nintendo")){
				hm.putAll(ConsolesHashMap.nintendo);
				name = ConsolesHashMap.string_nintendo;
			}%>
		<div id='body' class='width'>
		<section id='content'><div id='content'><div class='post'><h2 class='title meta'>
		<h2><%= name%> Consoles</h2>
		
		<%for(Map.Entry<String, Consoles> entry : hm.entrySet()){
			Consoles console = entry.getValue(); %>
			<div class='entry'><table id='bestseller'>
			<article>
			<tr>
			<td>
			<h4><%=console.getName()%></h4>
			<h4><color='Red'>$ <%=console.getPrice()%></color></h4><ul>
			<li id='item'><img src='images/consoles/<%=console.getImage()%>' style='width: 400px; display: block; ' /></li>
			
			<%if(session.getAttribute("userid")!=null){%>
					<li><form method='post' action='ShoppingCart.jsp'>
					<input type='hidden' name='name' value='<%=entry.getKey()%>'>
					<input type='hidden' name='type' value='consoles'>
					<input type='hidden' name='page' value='<%=CategoryName%>'>
					<input type='hidden' name='access' value=''>
					<input type='hidden' name='warranty' value='false'>
					<input type='submit' class='button' value='Buy Now' href='#'></input></form>
					</li>
				<%	} %>
					
			
			<% if(session.getAttribute("userid")!=null){ %>
					<li><form method='post' action='ShoppingCart.jsp'>
					<input type='hidden' name='name' value='<%=entry.getKey()%>'>
					<input type='hidden' name='type' value='consoles'>
					<input type='hidden' name='page' value='<%=CategoryName%>'>
					<input type='hidden' name='access' value=''>
					<input type='hidden' name='warranty' value='true'>
					<input type='submit' class='button' value='Buy w/ 1yr Warranty for $50' href='#'></input></form>
					</li>
					<% } %>
					
			<li><a class='button' href='AccessoryList.jsp?page=<%=CategoryName%>&console=<%=entry.getKey().toString()%>'>View Accessories</a></li>
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