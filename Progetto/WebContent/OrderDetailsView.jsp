<%@ page import="it.unisa.model.*"
     import="java.util.Collection"
     import="java.util.Iterator"
%>

<% Collection<?> products = (Collection<?>) request.getSession().getAttribute("products"); %>
  
<!DOCTYPE html>
<html>
	<head>
		<link href="css/container.css" rel="stylesheet">
		<title>CCeShop</title>
	</head>
	<body>
	<div id="container">
	<%@include file="fragments/header.jsp" %>
	<%@include file="fragments/navigationBar.jsp" %>
		<div id="content">
		<h2>Detail</h2>
				<table border="1">
					<tr>
						<th>Code</th>
						<th>Name</th>
						<th>Description</th>
						<th>Unit Price</th>
				
					</tr>
					<%
						if (products != null && products.size() != 0) {
							Iterator<?> it = products.iterator();
							while (it.hasNext()) {
								ProductBean product = (ProductBean) it.next();
					%>
					<tr>
						<td><%=product.getCode()%></td>
						<td><%=product.getName()%></td>
						<td><%=product.getDescription()%></td>
						<td><%=product.getPrice()%></td>
					</tr>
					<%}}%>
				</table>
				</div>
	</div>
	<%@include file="fragments/footer.jsp" %>	
	</body>
</html>