<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

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
		
		$( document ).ready(function() {

			$( "#cross" ).hide();
			$( "#menu" ).hide();
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

		});
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
    <a href="#"><li>LINK ONE</li></a>
    <a href="#"><li>LINK TWO</li></a>
    <a href="#"><li>LINK THREE</li></a>
    <a href="#"><li>LINK FOUR</li></a>
    <a href="#"><li>LINK FIVE</li></a>
  </ul>
</div> 
