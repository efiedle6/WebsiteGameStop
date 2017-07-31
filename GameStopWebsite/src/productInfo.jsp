<html>
<%@include file="Header.jsp"%>
  <link rel="stylesheet" type="text/css" href="styles.css">
  <div id='body' class='width'>
		<section id='content'>
		<h2>Product Information</h2>
		
  
  <body>

    <table>
      <tr>
        <th colspan="2"> </th>
      </tr>
      <tr>
        <td>Producer Name: </td>
        <td>${requestScope.product.producer}</td>
      </tr>
      <tr>
        <td>Product Name: </td>
        <td>${requestScope.product.item}</td>
      </tr>
      <tr>
        <td>In Stock: </td>
        <td>${requestScope.product.stock}</td>
      </tr>      
    </table>
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
