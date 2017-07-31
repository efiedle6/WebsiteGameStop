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

	<jsp:useBean id="Reviews" class="mybean.Reviews" />
	<jsp:useBean id="ReviewsArray" class="mybean.ReviewsArray" />

<html>


	<%@include file="Header.jsp"%>
	
	<%if (request.getMethod().equals("POST")) {
		String productModelName = request.getParameter("productModelName");
		String productCategory = request.getParameter("productCategory");
		String productPrice = request.getParameter("productPrice");
		String retailerName = request.getParameter("retailerName");
		String zip = request.getParameter("zip");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String productOnSale = request.getParameter("productOnSale");
		String manufacturerName = request.getParameter("manufacturerName");
		String manufacturerRebate = request.getParameter("manufacturerRebate");
		String userID = request.getParameter("userID");
		String userAge = request.getParameter("userAge");
		String userGender = request.getParameter("userGender");
		String userOccupation = request.getParameter("userOccupation");
		String rating = request.getParameter("rating");
		String date = request.getParameter("date");
		String reviewText = request.getParameter("reviewText");%>

		<%Reviews newRev = new Reviews(productModelName,productCategory,productPrice,retailerName,zip,city,state,productOnSale,manufacturerName,manufacturerRebate,userID,userAge,userGender,userOccupation,rating,date,reviewText);
		ReviewsArray.reviewList.add(newRev);%>
		
		<div id='body' class='width'>
		<section id='content'>
		<h2>Reviews</h2>
		<article>
		
		<%showReviews(out);
		if(session.getAttribute("userid")!=null){
			showForm(out);
		} %> 
		</section>
		
		<% } %>
	
	<% if (request.getMethod().equals("GET")) { %>
		<div id='body' class='width'>
		<section id='content'>
		<h2>Reviews</h2>
		<article>
		
		<%showReviews(out);
		if(session.getAttribute("userid")!=null){
			showForm(out);
		} %>
		</section>
		<% } %>

    

	<%@include file="Sidebar.jsp"%>

<div class="clear"></div>
    </div>
    <footer>
        <%@include file="Footer.jsp"%>
    </footer>
</div>
</body>
</html>

<%!protected void showForm(JspWriter out) throws ServletException, IOException{
		
		out.print("<form method='post' action='ReviewsList.jsp'>");
		out.print("<h2>Submit New Review</h2>");
		out.print("<table>");
		out.print("<tr><td><h4>Product Model Name:</h4></td><td><input type='text' name='productModelName' class='input' required></input></td></tr>");
		out.print("<tr><td><h4>Product Category:</h4></td><td><input type='text' name='productCategory' class='input' required></input></td></tr>");
		out.print("<tr><td><h4>Product Price:</h4></td><td><input type='text' name='productPrice' class='input' required></input></td></tr>");
		out.print("<tr><td><h4>Retailer Name:</h4></td><td><input type='text' name='retailerName' class='input' required></input></td></tr>");
		out.print("<tr><td><h4>ZIP:</h4></td><td><input type='text' name='zip' class='input' required></input></td></tr>");
		out.print("<tr><td><h4>City:</h4></td><td><input type='text' name='city' class='input' required></input></td></tr>");
		out.print("<tr><td><h4>State:</h4></td><td><input type='text' name='state' class='input' required></input></td></tr>");
		out.print("<tr><td><h4>Product On Sale:</h4></td><td><input type='text' name='productOnSale' class='input' required></input></td></tr>");
		out.print("<tr><td><h4>Manufacturer Name:</h4></td><td><input type='text' name='manufacturerName' class='input' required></input></td></tr>");
		out.print("<tr><td><h4>Manufacturer Rebate:</h4></td><td><input type='text' name='manufacturerRebate' class='input' required></input></td></tr>");
		out.print("<tr><td><h4>UserName:</h4></td><td><input type='text' name='userID' class='input' required></input></td></tr>");
		out.print("<tr><td><h4>User Age:</h4></td><td><input type='text' name='userAge' class='input' required></input></td></tr>");
		out.print("<tr><td><h4>User Gender:</h4></td><td><input type='text' name='userGender' class='input' required></input></td></tr>");
		out.print("<tr><td><h4>User Occupation:</h4></td><td><input type='text' name='userOccupation' class='input' required></input></td></tr>");
		out.print("<tr><td><h4>Rating:</h4></td><td><input type='text' name='rating' class='input' required></input></td></tr>");
		out.print("<tr><td><h4>Date:</h4></td><td><input type='text' name='date' class='input' required></input></td></tr>");
		out.print("<tr><td><h4>Summary:</h4></td><td><input type='text' name='reviewText' class='input' required></input></td></tr>");
		out.print("</tr>");
		out.print("</table>");

		out.print("<input type='submit' class='button' value='Submit Review' style='color:red; font-size: 24px; width: 200px; display: block;'></input><td>");

		out.print("</form>");
		
	}%>
	
<%!protected void showReviews(JspWriter out) throws ServletException, IOException{
		
		ArrayList<Reviews> rev = ReviewsArray.reviewList;
			if(rev==null || rev.size()==0){
				out.print("<h4 style='color:red'>No Reviews</h4>");
			}
			else{
				for (Reviews temp: rev){
					Reviews review = temp;
				out.print("<div class='entry'><table id='bestseller'>");
				out.println("<article>");
				out.print("<tr>");
				out.print("<td>");
				out.print("<ul>");
				out.print("<li><h4>Product Model Name:</h4>"+ review.getRetailerName() +"</li>");
				out.print("<li><h4>Product Category:</h4>"+ review.getProductModelName() +"</li>");
				out.print("<li><h4>Product Price:</h4>"+ review.getProductCategory() +"</li>");
				out.print("<li><h4>Retailer Name:</h4>"+ review.getProductPrice() +"</li>");
				out.print("<li><h4>ZIP:</h4>"+ review.getZip() +"</li>");
				out.print("<li><h4>City:</h4>"+ review.getCity() +"</li>");
				out.print("<li><h4>State:</h4>"+ review.getState() +"</li>");
				out.print("<li><h4>Product On Sale:</h4>"+ review.getProductOnSale() +"</li>");
				out.print("<li><h4>Manufacturer Name:</h4>"+ review.getManufacturerName() +"</li>");
				out.print("<li><h4>Manufacturer Rebate:</h4>"+ review.getManufacturerRebate() +"</li>");
				out.print("<li><h4>UserName:</h4>"+ review.getUserID() +"</li>");
				out.print("<li><h4>User Age:</h4>"+ review.getUserAge() +"</li>");
				out.print("<li><h4>User Gender:</h4>"+ review.getUserGender() +"</li>");
				out.print("<li><h4>User Occupation:</h4>"+ review.getUserOccupation() +"</li>");
				out.print("<li><h4>Rating:</h4>"+ review.getRating() +"</li>");
				out.print("<li><h4>Date:</h4>"+ review.getDate() +"</li>");
				out.print("<li><h4>Summary:</h4>"+ review.getReviewText() +"</li>");
				out.print("</ul></td>");
				out.print("</tr>");
				out.print("</table></div>");
				
				}
			}
	} %>