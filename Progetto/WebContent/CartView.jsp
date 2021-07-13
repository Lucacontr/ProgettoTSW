<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% Cart cart = (Cart) request.getSession().getAttribute("cart");%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="<c:url value="/css/general.css"/>">
	<link rel="shortcut icon" href="<c:url value="/images/favicon.ico"/>" type="image/x-icon">
	<title>CCeShop</title>
</head>

<body>
<div class="container">
<%@include file="fragments/header.jsp" %>
<%@include file="fragments/navigationBar.jsp" %>
	<% if(cart != null && cart.getSize()!=0) { %>
		<h2>Cart</h2>
		<table border="1">
		<tr>
			<th>Name</th>
			<th>Quantity</th>
			<th>Total Price</th>
			<th>Action</th>
		</tr>
		<% List<ProductBean> prodcart = cart.getProducts(); 	
		   for(ProductBean beancart: prodcart) {
		%>
		<tr>
			<td><%=beancart.getName()%></td>
			<td> 
				<form action="cart">
					<input type="hidden" name="action" value="increaseQ">
					<input type="hidden" name="id" value="<%=beancart.getCode()%>">
					<input type="submit" value="+" >
				</form>
				<%=beancart.getCartQuantity()%>
				<form action="cart">
					<input type="hidden" name="action" value="decreaseQ">
					<input type="hidden" name="id" value="<%=beancart.getCode()%>">
					<input type="submit" value="-" >
				</form>
			</td>
			
			<td><%=String.format("%.2f", beancart.getTot())%></td>
			<td><a href="cart?action=delete&id=<%=beancart.getCode()%>">Delete from cart</a></td>
		</tr>
		<%} %>
	</table>
	<p><%
	%>
		Prezzo totale:<%=String.format("%.2f", cart.getTotPrice())%>
		</p>
	<% } else { %>	
		<h1>Il tuo carrello è vuoto</h1>
	<% } %>
	
	<br/><a href="order?action=checkout">
		<input type="submit" name="submit" value="Checkout"></a>
		
<%@include file="fragments/footer.jsp" %>	
</div>
</body>
</html>