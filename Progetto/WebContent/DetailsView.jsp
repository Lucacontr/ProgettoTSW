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
			<h2>Details</h2>
			<%
				if (product != null) {
			%>
						<div id="detailImage" class="prod" class="detailContent">
							<img src="<%=product.getThumbnail()%>" alt="IMG">
						</div>
						<div id="info" class="detailContent">
							<div id="product_cod" class="prod">Codice:<%=product.getCode()%></div>
							<div id="product_nome" class="prod">Nome:<%=product.getName()%></div>
							<div id="product_desc" class="prod">Descrizione:<%=product.getDescription()%></div>
							<div id="product_prezzo" class="prod">Prezzo:<%=product.getPrice()%></div>
							<div id="product_q" class="prod">Quantità(in magazzino):<%=product.getQuantity()%></div>
							<a href="cart?action=addCartDetails&id=<%=product.getCode()%>">Add to cart</a>
						</div>
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