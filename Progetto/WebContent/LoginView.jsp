<%@ page language="java" 
    contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"
    import="it.unisa.model.UserBean"
%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>

<html>
	<head>
		<link rel="icon" href="images/favicon.ico" type="image/x-icon" />
		<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
        <title>CCeShop</title>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="js/formCheck.js"></script>
		<link href="css/container.css" rel="stylesheet">
	</head>

	<body>
		<div class="container">
	<%@include file="fragments/header.jsp" %>
	<%@include file="fragments/navigationBar.jsp" %>
		<script>
		$(document).ready(function(){
            $('#submit').click(function(){   
                var user=$('#email').val();
                var pwd=$('#password').val();
                $.ajax({
                    type: "GET",
                    url:"login?action=login",
                    data: {
                    	un: user,
                    	pw:pwd
                    },
                    success: function (data) {
                    	window.location.replace("userLogged.jsp");
                    }
                });                                
            });
        });
		</script>
			Please enter your email 		
			<input type="text" id="email" name="email" onblur="checkEmail(document.getElementById('email'))"><div id="emailDiv"></div><br>		
		
			Please enter your password
			<input type="password" id="password" name="pw"/>
			
			<input type="submit" id="submit" value="Invia">			
		<br><br>
		<a href="guest.jsp">Acquista senza registrarti</a><br/>
		<a href="registrazioneUtente.jsp">Registrati</a>
		<%@include file="fragments/footer.jsp" %>	
	</div>
	</body>
</html>