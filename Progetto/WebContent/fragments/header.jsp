<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<head>
	<link rel="stylesheet" href="<c:url value="/css/header.css"/>">
	<link rel="stylesheet" href="<c:url value="/css/container.css"/>">
	<link rel="stylesheet" href="<c:url value="/css/general.css"/>">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<header>
  		<div id="logo"><a href="index.jsp"><img src="<c:url value="/images/nuovo/logo.png"/>"></a></div>
  		
	   		<div id="ricerca">
	   			<form method=get action="product">
					<input type="search" id="s" name="s" placeholder="Cerca sul sito"><div id="result"></div>
					<button type="submit" id="sub"><i class="fa fa-search"></i></button>
					<input type="hidden" name="action" value="ricerca">
				</form>					
			</div>
		<div id="bottoniera">				
	   		<div id="bottone_utente">
				<a href="LoginView.jsp"><img src="<c:url value="/images/nuovo/user.png"/>"></a>
			</div>
			<div id="bottone_carrello">
				<a href="cart?action=Cart"><img src="<c:url value="/images/nuovo/cart2.png"/>"></a>
			</div>
		</div> 
</header>