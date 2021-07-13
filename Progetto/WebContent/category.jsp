<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.*"%>

<%
	Collection<?> products = (Collection<?>) CategoriaDAO.doRetrieveProductsbyCategoria(request.getParameter("nome"));
	if(products == null) {
		response.sendRedirect("product");	
		return;
	}
	
	Cart cart = (Cart) request.getSession().getAttribute("cart");
%>


<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>CCeShop</title>
		<link rel="stylesheet" href="<c:url value="/css/container.css"/>">
		<link rel="stylesheet" href="<c:url value="/css/general.css"/>">
	</head>
	<body>
		<div id="container">   
		<%@include file="fragments/header.jsp" %>
		<%@include file="fragments/navigationBar.jsp" %>
			<div id="content">
			<%
				if (products != null && products.size() != 0) {
					Iterator<?> it = products.iterator();
					while (it.hasNext()) {
						ProductBean bean = (ProductBean) it.next();
			%>
					<div id="box">
						<a href="product?action=read&id=<%=bean.getCode()%>">
							<div id="img">
								<img src="<%=bean.getThumbnail()%>" alt="IMG">
							</div>
							<label class="nome"><%=bean.getName()%></label>
						</a>
					</div>
			<%
					}
				}
				else {
			%>
				
			<%
				}
			%>
			</div>
		<%@include file="fragments/footer.jsp" %>
		</div>	
	</body>
</html>