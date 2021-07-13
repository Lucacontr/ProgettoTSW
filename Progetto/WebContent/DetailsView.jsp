<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% ProductBean product = (ProductBean) request.getAttribute("product"); %>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="css/container.css" rel="stylesheet">
	<title>CCeShop</title>
</head>

<body>
<div class="container">
<%@include file="fragments/header.jsp" %>
<%@include file="fragments/navigationBar.jsp" %>
<a href="ProductView.jsp">Home</a>
	<h2>Details</h2>
	<%
		if (product != null) {
	%>
			<table border="1">
				<tr>
					<th>Code</th>
					<th>Name</th>
					<th>Description</th>
					<th>Price</th>
					<th>Quantity</th>
					<th>Action</th>
			
				</tr>
				<tr>
					<td><%=product.getCode()%></td>
					<td><%=product.getName()%></td>
					<td><%=product.getDescription()%></td>
					<td><%=product.getPrice()%></td>
					<td><%=product.getQuantity()%></td>
					<td><a href="cart?action=addCartDetails&id=<%=product.getCode()%>">Add to cart</a></td>
				</tr>
			</table>
	<%
		}
	%>
	<br/><a href="cart?action=Cart">Vai al carrello</a>
	<%@include file="fragments/footer.jsp" %>
	</div>
</body>
</html>