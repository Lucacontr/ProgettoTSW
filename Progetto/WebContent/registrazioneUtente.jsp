<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<script src="scripts/jquery.js"></script>
	<script type="text/javascript" src="js/formCheck.js"></script>
	<title>CCeShop</title>
	<link href="css/container.css" rel="stylesheet">
</head>
<body>
<div class="container">
<%@include file="fragments/header.jsp" %>
<%@include file="fragments/navigationBar.jsp" %>
	<h1>REGISTRAZIONE UTENTE</h1>
	<form action="login" method="post">
	<fieldset>
		<legend>NOME E COGNOME</legend>
		<label>Nome: </label><input id="name" name="name" type="text" placeholder="Mario" required onblur="checkNome(this.form.name)"><div id="nomeDiv"></div>
		<br><br>
		<label>Cognome: </label><input id="surname" name ="surname" type="text" placeholder="Rossi" required onblur="checkCognome(this.form.surname)"><div id="cognomeDiv"></div>
	</fieldset><br>
	<fieldset>
		<legend>Email e PASSWORD</legend>
		<label>Email: </label> <input id="email" name="email" type="text" placeholder="mrossi@gmail.com" required onblur="checkEmail(this.form.email)"><div id="emailDiv"></div>
		<br><br>
		<label>Password: </label><input id="pw" name="pw" type="password" placeholder="password" required>
	</fieldset><br>
	<input type="submit"> <input type="reset">
	<input type="hidden" name="action" value="registration">
	</form>
</div>
<%@include file="fragments/footer.jsp" %>
	
</body>
</html>