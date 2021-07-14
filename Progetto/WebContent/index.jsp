<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.*"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "a" %>

<%
	Collection<?> categories = (Collection<?>) request.getAttribute("categories");
	if(categories == null) {
		response.sendRedirect("product");	
		return;
	}
	
	Collection<?> visti = (Collection<?>) ProductDAO.doRetrievePiuVisti();
	Collection<?> venduti = (Collection<?>) ProductDAO.doRetrievePiuVenduti();
	
	Cart cart = (Cart) request.getSession().getAttribute("cart");
%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>CCeShop</title>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
		<link rel="stylesheet" href="<a:url value="/css/general.css"/>">
		<link rel="shortcut icon" href="<a:url value="/images/favicon.ico"/>" type="image/x-icon">
	</head>

	<body>
		<div id="container">   
		<%@include file="fragments/header.jsp" %>
		<%@include file="fragments/navigationBar.jsp" %>
				<div id="content">
					<br/><br/><br/><h2>CATEGORIE</h2>
					<%
						if (categories != null && categories.size() != 0) {
							Iterator<?> it = categories.iterator();
							while (it.hasNext()) {
								CategoriaBean bean = (CategoriaBean) it.next();
					%>
							<div id="box">
								<a href="category.jsp?nome=<%=bean.getNome()%>">
									<div id="img">
										<img src="<%=bean.getThumbnail()%>" alt="IMG">
									</div>
									<div id="prodotto"><%=bean.getNome()%></div>
								</a>
							</div>
					<%
							}
						}
					%>
					
					<div id="+visti">
						<br/><br/><br/><h2>I PIÙ VISTI</h2>
						<%
							if (visti != null && visti.size() != 0) {
								Iterator<?> it = visti.iterator();
								while (it.hasNext()) {
									ProductBean bean = (ProductBean) it.next();
						%>
								<div id="box">
									<a href="product?action=read&id=<%=bean.getCode()%>">
										<div id="img">
											<img src="<%=bean.getThumbnail()%>" alt="IMG">
										</div>
										<div id="nome"><%=bean.getName()%></div>
									</a>
								</div>
						<%
								}
							}
						%>
					</div>
					
					<div id="+venduti">
						<br/><br/><br/><h2>I PIÙ VENDUTI</h2>
						
						<%
							if (venduti != null && venduti.size() != 0) {
								Iterator<?> it = venduti.iterator();
								while (it.hasNext()) {
									ProductBean bean = (ProductBean) it.next();
						%>
								<div id="box">
									<a href="product?action=read&id=<%=bean.getCode()%>">
										<div id="img">
											<img src="<%=bean.getThumbnail()%>" alt="IMG">
										</div>
										<div id="nome"><%=bean.getName()%></div>
									</a>
								</div>
						<%
								}
							}
						%>
						
					</div>
				
				</div>
			<%@include file="fragments/chiSiamo.jsp" %>
		</div>
		<%@include file="fragments/footer.jsp" %>
	</body>
</html>