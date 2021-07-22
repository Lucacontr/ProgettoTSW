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
			<%@include file="fragments/header.jsp" %>
			<%@include file="fragments/navigationBar.jsp" %>
			<div id="contentDetail">
			<h2 style="color: #2690F8">DETTAGLI DEL PRODOTTO</h2><br><br>
			<%
				if (product != null) {
			%>
					<h2 style="color: #2690F8"><%=product.getName()%></h2><br><br>
						<div id="detailImage">
							<img id="imgDetail" src="<%=product.getThumbnail()%>" alt="IMG">
						</div>
						
						<br><br><br><br>
						<div id="info" >
						
							<table cellspacing="40px" style="border: 2px solid #2690F8;" >
								<tr>
									<th>CODICE</th>
									<th>NOME</th>
									<th>DESCRIZIONE</th>
									<th>PREZZO (€)</th>
									<th>QUANTITA' DISPONIBILE</th>
									<th></th>
								</tr>
								<tr>
									<td><%=product.getCode()%></td>
									<td><%=product.getName()%></td>
									<td><%=product.getDescription()%></td>
									<td><%=product.getPrice()%></td>
									<td><%=product.getQuantity()%></td>
									<td>
										<form action="cart?action=addCartDetails&id=<%=product.getCode()%>" method="post"  style="margin:auto;">
											<input type="submit" value="Aggiungi al carrello" id="butt" style="margin:auto;">
										</form>
									</td>
								</tr>
							</table><br>
						</div>
			<%
				}
			%>
			</div>
		</div>
		<%@include file="fragments/footer.jsp" %>
		
		
		<script>
			const container = document.getElementById('detailImage')
			const img = document.getElementById('imgDetail')
	
			container.addEventListener('mousemove', (e) =>{
			    const x = e.clientX - e.target.offsetLeft
			    const y = e.clientY - e.target.offsetTop
	
			    console.log(x, y)
			    img.style.transformOrigin = `${x}px ${y}px`
			    img.style.transform = 'scale(1.3)'
	
			})
	
			container.addEventListener('mouseleave', (e) =>{
			    img.style.transform =" scale(1)"
			})
		</script>
		
		
	</body>
</html>