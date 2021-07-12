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
	<title>CCeShop</title>
	<script type="text/javascript" src="scripts/jquery.js"></script>
</head>

<body>
<script>
$(document).ready(function() {
    $("#search").keyup(function() {
        var search = $(this).val();
        if(search != '') {
            $.ajax({
                type : "GET",
                url : "product?search="+search+"&action=search",
                success : function(html) {
                    $("#result").html(html);
                    $("#result").css({"color":"red"});
                },
                error: function (xmlHttpRequest, textStatus, errorThrown) {
                    alert(errorThrown);
               }
            });
        }
    });
});
</script>
<div class="container">   
<%@include file="fragments/header.jsp" %>
<%@include file="fragments/navigationBar.jsp" %>
	
		<%
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					ProductBean bean = (ProductBean) it.next();
		%>
				<div id="product_container">
					<div id="img">
					
					</div>
					<%=bean.getName()%>
					<button id="add"><a href="cart?action=add&id=<%=bean.getCode()%>">Add to cart</a></button> 
				</div>		
		<%
				}
			}
			else {
		%>
			No products available
		<%
			}
		%>
</div>
<%@include file="fragments/footer.jsp" %>	
</div> 
</body>
</html>