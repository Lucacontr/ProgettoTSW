<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>CCeShop</title>
		<link href="css/container.css" rel="stylesheet">
	</head>
	<body>
	<div class="container">
		<%@include file="fragments/header.jsp" %>
		<%@include file="fragments/navigationBar.jsp" %>
		<form action="login" method="post"> 
		<fieldset>
		     <legend>Login Custom</legend>
		     <input type="hidden" name="action" value="admin">
		     <label for="username">Login</label>
		     <input id="username" type="text" name="username" placeholder="enter login"> 
		     <br>   
		     <label for="password">Password</label>
		     <input id="password" type="password" name="password" placeholder="enter password"> 
		     <br>
		     <input type="submit" value="Login"/>
		     <input type="reset" value="Reset"/>
		</fieldset>
		</form> 
	</div>
<%@include file="fragments/footer.jsp" %>	
	</body>
</html>
