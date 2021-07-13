<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<script src="scripts/jquery.js"></script>
		<script type="text/javascript" src="js/formCheck.js"></script>
		<title>CCeShop</title>
		<link href="css/container.css" rel="stylesheet">
	</head>
	<body>
	<div class="container">
		<%@include file="fragments/header.jsp" %>
		<%@include file="fragments/navigationBar.jsp" %>
		<a href="LoginView.jsp">Accedi</a> o continua ad acquistare senza loggarti:
		<form action="order" method="post">
			<input type="hidden" name="action" value="guest">
			<label>Nome: <input id="nome" name="nome" type="text" placeholder="Mario" required onblur="checkNome(this.form.nome)"></label><br><br><div id="nomeDiv"></div>
			<label>Cognome: <input id="cognome" name ="cognome" type="text" placeholder="Rossi" required onblur="checkCognome(this.form.cognome)"></label><div id="cognomeDiv"></div>
			<label>Email: <input id="email" name="email" type="text" placeholder="mariorossi@gmail.com" required onblur="checkEmail(this.form.email)"></label><br><br><div id="emailDiv"></div>
			<label>Telefono: <input id="telefono" name ="telefono" type="text" placeholder="3332343123" required onblur="checkTelefono(this.form.telefono)"></label><div id="telefonoDiv"></div>
			<label>Indirizzo: <input id="indirizzo" name="indirizzo" type="text" placeholder="via Umberto Nobile 1, Eboli SA" required></label><br><br>
			<input type="submit" value="Invia"> <input type="reset">
		</form>
		<%@include file="fragments/footer.jsp" %>	
	</div>
	</body>
</html>