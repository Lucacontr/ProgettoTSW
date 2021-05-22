<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	if(products == null) {
		response.sendRedirect("product");	
		return;
	}
	
	Cart cart = (Cart) request.getSession().getAttribute("cart");
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="ProductStyle.css" rel="stylesheet" type="text/css">
	<title>CCeShop</title>
</head>

<body>
	<h2>Products</h2>
	<table border="1">
		<tr>
			<th><a href="product?sort=id">Code </a></th>
			<th><a href="product?sort=nome">Name </a></th>
			<th><a href="product?sort=descrizione">Description </a></th>
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
						<td><a href="product?action=delete&id=<%=bean.getCode()%>">Delete</a><br>
							<a href="product?action=read&id=<%=bean.getCode()%>">Details</a><br>
							<a href="cart?action=add&id=<%=bean.getCode()%>">Add to cart</a>
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
	<a href="cart?action=Cart">Vai al carrello</a>
</body>
</html>