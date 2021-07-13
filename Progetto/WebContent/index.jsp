<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Collection<?> categories = (Collection<?>) request.getAttribute("categories");
	if(categories == null) {
		response.sendRedirect("product");	
		return;
	}
	
	Cart cart = (Cart) request.getSession().getAttribute("cart");
%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "a" %>
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.*"%>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>CCeShop</title>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
		<link rel="stylesheet" href="<a:url value="/css/general.css"/>">
		<link rel="shortcut icon" href="<a:url value="/images/favicon.ico"/>" type="image/x-icon">
	</head>

	<body>
		<script>
		$(document).ready(function() {
		    $("#s").keyup(function() {
		        var search = $(this).val();
		        if(search != '') {
		            $.ajax({
		                type : "GET",
		                url : "product?action=search",
		                data: {
		                	search:search
		                },
		                success : function(html) {
		                    $("#result").html(html);
		                    $("#result").css({"color":"red"});
		                }
		            });
		        }
		    });
		});
		</script>
		
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
									<div id="nome"><%=bean.getNome()%></div>
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