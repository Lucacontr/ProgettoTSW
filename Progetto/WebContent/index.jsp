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
	
%>

<!DOCTYPE html>
<html>
	<head>
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
					<br/><br/><br/><div id="categorie"><h1>CATEGORIE</h1></div>
					<div class="box_container">
						<%
							if (categories != null && categories.size() != 0) {
								Iterator<?> it = categories.iterator();
								while (it.hasNext()) {
									CategoriaBean bean = (CategoriaBean) it.next();
						%>
								<div id="box" class="hvr-grow-shadow">
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
					</div>
					
					<br/><br/><br/><div id="piuVisti"><h1>I PIU' VISTI</h1></div>
					<div class="box_container">
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
										<div id="prezzo">Prezzo: <%=bean.getPrice()%></div>
									</a>
								</div>
						<%
								}
							}
						%>
					</div>
					<div id="+venduti">
						<br/><br/><br/><div id="piuVend"><h1>I PIU' VENDUTI</h1></div>
						<div class="box_container">
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
				</div>
			<%@include file="fragments/chiSiamo.jsp" %>
		</div>
		<%@include file="fragments/footer.jsp" %>
	</body>
</html>