<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.*"%>

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
		
		function myFunction(){
			$( "#cross" ).hide();
			$( "#menu" ).hide();
			$( "#hamburger" ).show();
			$( "#hamburger" ).click(function() {
				$( "#menu" ).slideToggle( "slow", function() {
					$( "#hamburger" ).hide();
					$( "#cross" ).show();
				});
			});

			$( "#cross" ).click(function() {
				$( "#menu" ).slideToggle( "slow", function() {
					$( "#cross" ).hide();
					$( "#hamburger" ).show();
				});
			});
		}
		
		var x = window.matchMedia("(max-width: 768px)")
		myFunction(x) // Call listener function at run time
		x.addListener(myFunction)
</script>

<header>
		<div id="logo"><a href="index.jsp"><img src="<c:url value="/images/nuovo/logo.png"/>"></a></div>
   		<div id="ricerca">
   			<form method=get action="product">
				<input type="search" id="s" name="s" placeholder="Cerca sul sito">
				<button type="submit" id="sub"><i class="fa fa-search"></i></button>
				<div id="result"></div>
				<input type="hidden" name="action" value="ricerca">
			</form>		
		</div>
		<div id="userLogged">
			<%
	 			UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));
				if ((currentUser!=null)&&(currentUser.isValid()))
				{	
				    %>Ciao, currentUser.getName()<% 
				    return;
				}
			%>
		</div>
		<div id="bottoniera">				
	   		<div id="bottone_utente">
				<a href="login.jsp"><img src="<c:url value="/images/nuovo/user.png"/>"></a>
			</div>
			<div id="bottone_carrello">
				<a href="cart?action=Cart"><img src="<c:url value="/images/nuovo/cart2.png"/>"></a>
			</div>
			<button id="hamburger">&#9776;</button>
  			<button id="cross">&#735;</button>
		</div> 
</header>

<div id="menu">
  <ul>
    <a href="category.jsp?nome=informatica"><li>Informatica</li></a>
    <a href="category.jsp?nome=smartphone"><li>Smartphone</li></a>
    <a href="category.jsp?nome=tv"><li>TV</li></a>
    <a href="category.jsp?nome=videogames"><li>Videogames</li></a>
    <a href="offerte.jsp"><li>Offerte</li></a>
    <a href="fragments/chiSiamo.jsp"><li>Chi SiamoE</li></a>
    <a href="userLogged.jsp"><li>Area Utente</li></a>
  </ul>
</div> 
