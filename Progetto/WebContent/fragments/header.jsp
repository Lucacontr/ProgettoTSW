<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.*"%>

<%	
	Cart cart = (Cart) request.getSession().getAttribute("cart");
	if(cart==null){
		cart=new Cart();
	}
%>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="<c:url value="/css/header.css"/>">
	<link rel="stylesheet" href="<c:url value="/css/container.css"/>">
	<link rel="stylesheet" href="<c:url value="/css/general.css"/>">
	<title>CCeShop</title>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
	<link rel="shortcut icon" href="<c:url value="/images/favicon.ico"/>" type="image/x-icon">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

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
		                	$("#result").show();
		                    $("#result").html(" " + html);
		                }
		            });
		        }
		        else{
		        	$("#result").hide();
		        }
		    });
		    
		});
		
			$(window).resize(function(){
					$("#hamburger").show();
			        if ($(window).width() < 768) {  
			    	   $("#hamburger").click(function() {
								$( "#menu" ).slideDown("slow", function(){
							    	$( "#hamburger" ).hide();
									$( "#cross" ).show();
								});
						});
			    	   $("#cross").click(function() {
				    	   $("#menu").slideUp("slow", function(){
				    		    $("#hamburger" ).show();
								$( "#cross" ).hide();
							});
			    	   });
			        } 
			        else{
			        	$( "#menu" ).hide();
				    	$( "#hamburger" ).hide();
						$( "#cross" ).hide();
			        }
			});
</script>

<header>
		<div id="logo"><a href="index.jsp"><img src="<c:url value="/images/nuovo/logo.png"/>"></a></div>
   		<form method=get action="product" id="ricerca">
   			<div id="search_container">
				<input type="search" id="s" name="s" placeholder="Cerca sul sito">
				<button type="submit" id="sub"><i class="fa fa-search"></i></button>
				<div id="result"></div>
				<input type="hidden" name="action" value="ricerca">
			</div>
		</form>		
		
		<div id="userLogged">
			<%
	 			UserBean currentUser = (UserBean) session.getAttribute("currentSessionUser");
				if (currentUser!=null&&(currentUser.isValid())){
				    %>Ciao, <%=currentUser.getFirstName()%><%
				}
			%>		
		</div>
		<div id="bottoniera">				
	   		<div id="bottone_utente">
	   			<%
				if ((currentUser!=null) &&(currentUser.isValid())){
				%><a href="userLogged.jsp">
				<%
				}else{
				%><a href="login.jsp">
				<%}%>
				<img src="<c:url value="/images/nuovo/user.png"/>"></a></a>
			</div>
			<div id="bottone_carrello">
				<a href="cart?action=Cart"><img src="<c:url value="/images/nuovo/cart2.png"/>"></a>
			</div>
			<button id="hamburger">&#9776;</button>
			<div id="cartQuantity">(<%=cart.getTotalQuantity() %>)</div>
			
  			<button id="cross">&#735;</button>
		</div> 
</header>

<div id="menu">
  <ul>
    <li><a href="category.jsp?nome=informatica">Informatica</a></li>
    <li><a href="category.jsp?nome=smartphone">Smartphone</a></li>
    <li><a href="category.jsp?nome=tv">TV</a></li>
    <li><a href="category.jsp?nome=videogames">Videogames</a></li>
    <li><a href="offerte.jsp">Offerte</a></li>
    <li><a href="CartView.jsp">Carrello</a></li>
    <li><a href="userLogged.jsp">Area Utente</a></li>
  </ul>
</div> 
