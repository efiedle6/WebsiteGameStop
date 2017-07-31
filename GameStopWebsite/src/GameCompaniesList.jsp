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

	<jsp:useBean id="GameCompanies" class="mybean.GameCompanies" />
	<jsp:useBean id="GameCompaniesHashMap" class="mybean.GameCompaniesHashMap" />

<html>



	<%@include file="Header.jsp"%>

		<%String name = null;
		String CategoryName = request.getParameter("page");
		HashMap<String, GameCompanies> hm = new HashMap<String, GameCompanies>();%>

			<%if(CategoryName.equals("ea")){
				hm.putAll(GameCompaniesHashMap.electronicArts);
				name = GameCompaniesHashMap.string_electronicArts;
			}
			else if(CategoryName.equals("activision")){
				hm.putAll(GameCompaniesHashMap.activision);
				name = GameCompaniesHashMap.string_activision;
			}
			else if(CategoryName.equals("takeTwoInteractive")){
				hm.putAll(GameCompaniesHashMap.takeTwoInteractive);
				name = GameCompaniesHashMap.string_takeTwoInteractive;
			}%>
		

		<div id='body' class='width'>
		<section id='content'><div id='content'><div class='post'><h2 class='title meta'>
		
		<h2><%=name%> Games</h2>
		<div class='entry'>
		<article>
		<%for(Map.Entry<String, GameCompanies> entry : hm.entrySet()){
			GameCompanies games = entry.getValue();%>
			<tr>
			<td>
			<h4><%=games.getName()%></h4>
			<h4><color='Red'>$ <%=games.getPrice()%></color></h4><ul>
			<li id='item'><img src='images/games/<%=games.getImage()%>' style='width: 200px; display: block; ' /></li>
					<%if(session.getAttribute("userid")!=null){ %>					
					<li><form method='post' action='ShoppingCart.jsp'>
						<input type='hidden' name='name' value='<%=entry.getKey()%>'>
						<input type='hidden' name='type' value='games'>
						<input type='hidden' name='page' value='<%=CategoryName%>'>
						<input type='hidden' name='access' value=''>
						<input type='submit' class='button' value='Buy Now' href='#'></input></form>
					</li>
					<% } %>

					</ul></td>
				</tr>

		
		<% } %>
        </section>
        </div>
		</div>

		<%@include file="Sidebar.jsp"%>

<div class="clear"></div>
    </div>
    <footer>
        <%@include file="Footer.jsp"%>
    </footer>
</div>
</body>
</html>