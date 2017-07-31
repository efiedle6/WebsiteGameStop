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
	<jsp:useBean id="Tablets" class="mybean.Tablets" />
	<jsp:useBean id="TabletHashMap" class="mybean.TabletHashMap" />
	<jsp:useBean id="GameCompanies" class="mybean.GameCompanies" />
	<jsp:useBean id="GameCompaniesHashMap" class="mybean.GameCompaniesHashMap" />

<html>



	<%@include file="Header.jsp"%>
	

	<%if (request.getMethod().equals("POST")) {
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		String page1 = request.getParameter("page");
		String access = request.getParameter("access");
		String warranty = request.getParameter("warranty");

		addItemToCart(session, name, type, page1, access, warranty);

		showShoppingCart(out, session);
	} %>

    <% if (request.getMethod().equals("GET")) { 
		String clear = request.getParameter("clear");
		if(clear!=null && clear.equals("true")){
			clearShoppingCart(session);
		}
		showShoppingCart(out, session);
	}
	%>
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


<%! protected void clearShoppingCart(HttpSession session){
		String userid = session.getAttribute("userid").toString();
		ArrayList<CartItem> carts = CartHashMap.orderList.get(userid);
		carts.clear();
	} %>
	
	
	<%!protected void addItemToCart(HttpSession session, String name, String type, String page, String access, String warranty){
		//get the session userid
		String userid = session.getAttribute("userid").toString();
		
		//if there isn't a Cart for the user yet create one
		if(!CartHashMap.orderList.containsKey(userid)){
			ArrayList<CartItem> cart = new ArrayList<CartItem>();
			CartHashMap.orderList.put(userid, cart);
		}
		
		//get the cart
		ArrayList<CartItem> cart = CartHashMap.orderList.get(userid);
		
		//for each type (consoles, games, tablets, accessories) determine the correct item and put it into the Cart
		//for consoles
		if(type.equals("consoles")){
			//Create the Consoles object
			Consoles con = null;
			if(page.equals("sony")){
				con = ConsolesHashMap.sony.get(name);
			}
			else if(page.equals("microsoft")){
				con = ConsolesHashMap.microsoft.get(name);
			}
			else if(page.equals("nintendo")){
				con = ConsolesHashMap.nintendo.get(name);
			}
			//create a single CartItem to place into the users Cart
			if(warranty.equals("true")){
				String newName = (con.getName() + " w/ 1yr Warranty");
				double newPrice = con.getPrice() + 50.00;
				CartItem newItem = new CartItem(newName, type, newPrice, con.getImage(), con.getCompany());
				cart.add(newItem);
				
			}
			else{
				CartItem newItem = new CartItem(con.getName(), type, con.getPrice(), con.getImage(), con.getCompany());
				cart.add(newItem);
			}
		}
		
		//for games
		if(type.equals("games")){
			//Create the GameCompanies object
			GameCompanies gam = null;
			if(page.equals("ea")){
				gam = GameCompaniesHashMap.electronicArts.get(name);
			}
			else if(page.equals("activision")){
				gam = GameCompaniesHashMap.activision.get(name);
			}
			else if(page.equals("takeTwoInteractive")){
				gam = GameCompaniesHashMap.takeTwoInteractive.get(name);
			}
			//create a single CartItem to place into the users Cart
			CartItem newItem = new CartItem(gam.getName(), type, gam.getPrice(), gam.getImage(), gam.getCompany());
			cart.add(newItem);
		}
		
		//for tablets
		if(type.equals("tablets")){
			//Create the Tablets object
			Tablets tab = null;
			if(page.equals("tabletapple")){
				tab = TabletHashMap.apple.get(name);
			}
			else if(page.equals("tabletmicrosoft")){
				tab = TabletHashMap.microsoft.get(name);
			}
			else if(page.equals("tabletsamsung")){
				tab = TabletHashMap.samsung.get(name);
			}
			//create a single CartItem to place into the users Cart
			CartItem newItem = new CartItem(tab.getName(), type, tab.getPrice(), tab.getImage(), tab.getCompany());
			cart.add(newItem);
		}
		
		//for accessories
		if(type.equals("accessories")){
			//Create the Console object to figure out which system the accessory is for
			Consoles con = null;
			//for accessories we need to get the console they belong to using (String access)
			if(page.equals("sony")){
				con = ConsolesHashMap.sony.get(access);
			}
			else if(page.equals("microsoft")){
				con = ConsolesHashMap.microsoft.get(access);
			}
			else if(page.equals("nintendo")){
				con = ConsolesHashMap.nintendo.get(access);
			}
			
			//create the Accessory object based off of the inputs to the method (String name)
			Accessory acc = con.getAccessories().get(name);
			//create a single CartItem to place into the users Cart
			CartItem newItem = new CartItem(acc.getName(), type, acc.getPrice(), acc.getImage(), acc.getCompany());
			cart.add(newItem);
		}
		
	} %>
	
<%! protected void showShoppingCart(JspWriter printer, HttpSession session) throws ServletException, IOException{
		
		printer.print("<div id='body' class='width'>");
		printer.print("<section id='content'>");
		printer.print("<h2>Your Shopping Cart</h2>");
		printer.println("<article>");
		
		if(session.getAttribute("userid")!=null){
			String userid = session.getAttribute("userid").toString();
			ArrayList<CartItem> carts = CartHashMap.orderList.get(userid);
			if(carts==null || carts.size()==0){
				printer.print("<h4 style='color:red'>Your Cart Is Empty</h4>");
			}
			else{
				
				for (CartItem temp: carts){
					CartItem cart = temp;
					printer.print("<div class='entry'><table id='bestseller'>");
				printer.println("<article>");
				printer.print("<tr>");
				printer.print("<td>");
				printer.print("<h4>" + cart.getName() +"</h4>");
				printer.print("<h4><color='Red'>$"+cart.getPrice()+"</color></h4><ul>");
				printer.print("<li id='item'><img src='images/" + cart.getType() + "/"+cart.getImage()+"' style='width: 200px; display: block; ' /></li>");
				printer.print("</ul></td>");
				printer.print("</tr>");
				printer.print("</table></div>");
				
				}
			}
		} else{
			printer.print("<h3 style='color:red'>Not logged in, please login to view your Cart</h3>");
		}
		if(session.getAttribute("userid")!=null){
			String userid = session.getAttribute("userid").toString();
			ArrayList<CartItem> carts = CartHashMap.orderList.get(userid);
			if(carts!=null && carts.size()!=0){
			printer.print("<form action='/HW3/ShoppingCart.jsp'>");
			printer.print("<input type='hidden' name='clear' value='true'>");
			printer.print("<a style=float:left; class='button' href='ShoppingCart.jsp?clear=true'>Clear Shopping Cart</a>");
			printer.print("<a style=float:right; class='button' href='Checkout.jsp'>Checkout</a>");
			}
		}
		
	} %>
	
	