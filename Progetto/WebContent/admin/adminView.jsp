<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	if(request.getSession().getAttribute("currentSessionUser")!=null)
		request.getSession().removeAttribute("currentSessionUser");
%>

<html>
	<head>
		<link href="${pageContext.request.contextPath}/css/container.css" rel="stylesheet">
		
		<title>CCeShop</title>
	</head>

	<%
		Collection<?> products = (Collection<?>) ProductDAO.doRetrieveAll();
	// Check user credentials
		Boolean adminRoles = (Boolean) session.getAttribute("adminRoles");
		if ((adminRoles == null) || (!adminRoles.booleanValue())){	
		    response.sendRedirect("../adminLogin.jsp");
		    return;
		}
	%>

	<body>
	
	<div id="container">
	<%@include file="../fragments/header.jsp" %>
	<%@include file="../fragments/navigationBar.jsp" %>
		<div id="content">
			<h2 style="color: #2690F8;">PRODOTTI</h2>
			<table id="adminViewTable">
				<tr>
					<th><a href="../product?sort=id">Codice: </a></th>
					<th><a href="../product?sort=nome">Nome: </a></th>
					<th><a href="../product?sort=descrizione">Descrizione: </a></th>
					<th><a href="../product?sort=prezzo">Prezzo: </a></th>
					<th><a href="../product?sort=quantità">Quantità: </a></th>
					<th><a href="../product?sort=sconto">Sconto: </a></th>
					<th><a href="../product?sort=prezzo_scontato">Prezzo Scontato: </a></th>
					<th><a href="../product?sort=iva">IVA: </a></th>
					<th><a href="../product?sort=nvendite">#Vendite: </a></th>
					<th><a href="../product?sort=nvisualizzazioni">#Visualizzazioni: </a></th>
					<th>Action</th>
				</tr>
				<%
					if (products != null && products.size() != 0) {
						Iterator<?> it = products.iterator();
						while (it.hasNext()) {
							ProductBean bean = (ProductBean) it.next();
				%>
							<tr>
								<td><%=bean.getCode()%></td>
								<td><%=bean.getName()%></td>
								<td><%=bean.getDescription()%></td>
								<td><%=bean.getPrice()%></td>
								<td><%=bean.getQuantity()%></td>
								<td><%=bean.getSconto()%></td>
								<td><%=bean.getPrezzoScontato()%></td>
								<td><%=bean.getIva()%></td>
								<td><%=bean.getNvendite()%></td>
								<td><%=bean.getNvisualizzazioni()%></td>
								<td><a href="../product?action=delete&id=<%=bean.getCode()%>">Delete</a><br>
									<a href="modify.jsp?id=<%=bean.getCode()%>">Modifica</a>
								</td>
							</tr>
				<%
						}
					}
					else {
				%>
				<tr>
					<td colspan="6">No products available</td>
				</tr>
				<%
					}
				%>
			</table><br/>
			
			<a href="insert.jsp">Inserisci un nuovo prodotto al catalogo</a><br/><br/>
			<a href="OrdersView.jsp">Visualizza ordini</a><br/><br/>
			</div>
		</div>
		<%@include file="../fragments/footer.jsp" %>
	</body>
</html>