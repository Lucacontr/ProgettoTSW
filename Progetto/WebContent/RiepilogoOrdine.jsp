<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.*"%>
	
<% UserBean user = (UserBean) request.getSession().getAttribute("currentSessionUser"); %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="css/container.css" rel="stylesheet">
		<title>Riepilogo Ordine</title>
	</head>

	<body>
		<div id="container">
			<%@include file="fragments/header.jsp" %>
			<%@include file="fragments/navigationBar.jsp" %>
			<div id="content">
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
					<button type="submit" id="butt">Procedi all'ordine</button>
				</form>	
				<br>
			</div>
		</div>
		<%@include file="fragments/footer.jsp" %>	
	</body>
</html>