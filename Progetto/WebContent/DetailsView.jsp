<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean"%>
<% ProductBean product = (ProductBean) request.getAttribute("product"); %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "a" %>

<!DOCTYPE html>
<html>
	<head>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
		<link rel="stylesheet" href="<a:url value="/css/general.css"/>">
		<link rel="shortcut icon" href="<a:url value="/images/favicon.ico"/>" type="image/x-icon">
		<link href="css/container.css" rel="stylesheet">
		<title>CCeShop</title>
	</head>

	<body>
		<div id="container">
			<div id="content">
			<%@include file="fragments/header.jsp" %>
			<%@include file="fragments/navigationBar.jsp" %>
			<h2 style="color: #2690F8">DETTAGLI DEL PRODOTTO</h2><br>
			<%
				if (product != null) {
			%>
					<h2 style="color: #2690F8"><%=product.getName()%></h2>
					<div id="detailDiv">
						
						<div id="detailImage" class="detailContent">
							<img src="<%=product.getThumbnail()%>" alt="IMG" align="left">
						</div>
						
						<br><br>
						<div id="info" class="detailContent">
						
							<table cellspacing="40px" style="border: 2px solid #2690F8;" >
								<tr>
									<th>CODICE</th>
									<th>NOME</th>
									<th>DESCRIZIONE</th>
									<th>PREZZO (€)</th>
									<th>QUANTITA' DISPONIBILE</th>
								</tr>
								<tr>
									<td><%=product.getCode()%></td>
									<td><%=product.getName()%></td>
									<td><%=product.getDescription()%></td>
									<td><%=product.getPrice()%></td>
									<td><%=product.getQuantity()%></td>
								</tr>
							</table><br>
							<form action="cart?action=addCartDetails&id=<%=product.getCode()%>" method="post">
								<input type="submit" value="Aggiungi al carrello" id="butt">
							</form>
						</div>
					</div>
			<%
				}
			%>
			</div>
		</div>
		<%@include file="fragments/footer.jsp" %>
	</body>
</html>