<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.*"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "a" %>

<!DOCTYPE html>
<html>

	<%
		Collection<?> products = (Collection<?>) ProductDAO.doRetrieveOfferte();
		if(products == null) {
			response.sendRedirect("product");	
			return;
		}
	%>

	<head>
		<title>CCeShop</title>
		<link rel="stylesheet" href="<a:url value="/css/general.css"/>">
		<link rel="shortcut icon" href="<a:url value="/images/favicon.ico"/>" type="image/x-icon">
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
					<div id="box" class="hvr-grow-shadow">
						<a href="product?action=read&id=<%=bean.getCode()%>">
							<div id="img">
								<img src="<%=bean.getThumbnail()%>" alt="IMG">
							</div>
							<div class="nome"><%=bean.getName()%></div>
							<s><div class="nome"><%=bean.getPrice()%></div></s>
							<div class="nome"><%=bean.getPrezzoScontato()%></div>
						</a>
					</div>
				<%
					}
				}
				%>	
				
			</div>
		</div>
		<%@include file="fragments/footer.jsp" %>
	</body>
	
</html>