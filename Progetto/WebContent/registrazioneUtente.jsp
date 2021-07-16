<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<script src="scripts/jquery.js"></script>
		<script type="text/javascript" src="js/formCheck.js"></script>
		<title>CCeShop</title>
		<link href="css/general.css" rel="stylesheet">
		<link href="css/container.css" rel="stylesheet">
	</head>
	<body>
		<div id="container">
		<%@include file="fragments/header.jsp" %>
		<%@include file="fragments/navigationBar.jsp" %>
			<div id="content">
				<h2>REGISTRAZIONE UTENTE</h2>
				<form action="login" method="post">
				<fieldset>
					<legend>NOME E COGNOME</legend>
					<label>Nome: </label><input id="name" name="name" type="text" placeholder="Mario" required onblur="checkNome(this.form.name)"><div id="nomeDiv"></div>
					<br>
					<label>Cognome: </label><input id="surname" name ="surname" type="text" placeholder="Rossi" required onblur="checkCognome(this.form.surname)"><div id="cognomeDiv"></div>
				</fieldset><br>
				<fieldset>
					<legend>Email e PASSWORD</legend>
					<label>Email: </label> <input id="email" name="email" type="text" placeholder="mrossi@gmail.com" required onblur="checkEmail(this.form.email)"><div id="emailDiv"></div>
					<br>
					<label>Password: </label><input id="pw" name="pw" type="password" placeholder="password" required>
				</fieldset><br>
				<fieldset>
					<legend>DATI PAGAMENTO E SPEDIZIONE</legend>
					<label>Numero Carta: </label><input id="PAN" name="PAN" type="text" placeholder="xxxx-xxxx-xxxx-xxxx" required minlength="16" maxlength="16" >
					<br>
					<label>Data Scadenza: </label><input id="expDate" name="expDate" type="text" placeholder="MM/AA" required>
					<br>
					<label>CVV: </label><input id="CVV" name="CVV" type="text" placeholder="xxx" required minlength="3" maxlength="3">
					<br>
					<label>Indirizzo: </label><input id="address" name="address" type="text" placeholder="Via Guglielmo Marconi, 14" required>
					<label>Telefono: </label><input id="tel" name="tel" type="text" placeholder="3334567891" required onblur="checkTelefono(this.form.address)">
				
				</fieldset>
				<input type="submit"> <input type="reset">
				<input type="hidden" name="action" value="registration">
				</form>
			</div>
		</div>
	<%@include file="fragments/footer.jsp" %>
	</body>
</html>