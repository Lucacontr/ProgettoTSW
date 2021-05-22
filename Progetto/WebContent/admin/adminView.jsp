<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.ProductDAO"%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="../ProductStyle.css">
	<title>CCeShop</title>
</head>

<%
	Collection<?> products = (Collection<?>) ProductDAO.doRetrieveAll(null);
// Check user credentials
	Boolean adminRoles = (Boolean) session.getAttribute("adminRoles");
	if ((adminRoles == null) || (!adminRoles.booleanValue())){	
	    response.sendRedirect("../adminLogin.jsp");
	    return;
	}
%>

<body>
	<h2>Products </h2>
	<table>
		<tr>
			<th><a href="../product?sort=id">Code </a></th>
			<th><a href="../product?sort=nome">Name </a></th>
			<th><a href="../product?sort=descrizione">Description </a></th>
			<th><a href="../product?sort=prezzo">Prezzo </a></th>
			<th><a href="../product?sort=quantità">Quantità </a></th>
			<th><a href="../product?sort=sconto">Sconto </a></th>
			<th><a href="../product?sort=prezzo_scontato">Prezzo Scontato </a></th>
			<th><a href="../product?sort=iva">IVA </a></th>
			<th><a href="../product?sort=nvendite">#Vendite </a></th>
			<th><a href="../product?sort=nvisualizzazioni">#Visualizzazioni </a></th>
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
	
	<a href="insert.jsp">Inserisci un nuovo prodotto al catalogo</a>
	
</body>
</html>