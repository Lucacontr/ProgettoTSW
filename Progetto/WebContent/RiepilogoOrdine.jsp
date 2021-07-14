<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<% UserBean user = (UserBean) request.getSession().getAttribute("currentSessionUser"); %>
<% Cart cart = (Cart) request.getSession().getAttribute("cart");%>
    
<!DOCTYPE html>
<html>
	<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.*"%>
	
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="css/container.css" rel="stylesheet">
	<title>Riepilogo Ordine</title>
</head>

<body>

	<%@include file="fragments/header.jsp" %>
	<%@include file="fragments/navigationBar.jsp" %>
	<table>
	<tr>
		<td>Nome: </td>
		<td>Cognome: </td>
		<td>Email: </td>
		<td>Indirizzo Spedizione: </td>
		<td>PAN: </td>
		<td>Scadenza: </td>
	</tr>
	<tr>
		<td><%=user.getFirstName()%></td>
		<td><%=user.getLastName()%></td>
		<td><%=user.getEmail()%></td>
		<td><%=user.getAddress()%></td>
		<td><%=user.getPAN()%></td>
		<td><%=user.getExpDate()%></td>
	</tr>
	</table>
	<table>
	<tr>
		<td>Nome: </td>
		<td>Quantità: </td>
		<td>Code: </td>
		<td>Descrizione: </td>
		<td>Prezzo: </td>
		
	</tr>
		<% List<ProductBean> prodcart = cart.getProducts(); 	
		   for(ProductBean beancart: prodcart) {
		%>
	<tr>
		<td><%=beancart.getName()%></td>
		<td><%=beancart.getCartQuantity()%></td>
		<td><%=String.format("%.2f", beancart.getTot())%></td>
		<td><a href="cart?action=delete&id=<%=beancart.getCode()%>">Elimina</a></td>
	</tr>
	<%} %>
	</table>
	<br><br>
	<form method="get" action="order">
		<input type="hidden" name="action" value="conferma">
		<button type="submit" id="sub">Procedi all'ordine</button>
	</form>	
	<br>
	
	
	
	<%@include file="fragments/footer.jsp" %>	
</body>
</html>