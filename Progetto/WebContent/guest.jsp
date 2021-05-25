<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout</title>
</head>
<body>
	<a href="LoginView.jsp">Accedi</a> o continua ad acquistare senza loggarti:
	<form action="order" method="post">
		<input type="hidden" name="action" value="guest">
		<label>Nome: <input id="nome" name="nome" type="text" placeholder="Mario" required></label><br><br>
		<label>Cognome: <input id="cognome" name ="cognome" type="text" placeholder="Rossi" required></label>
		<label>Email: <input id="email" name="email" type="text" placeholder="mariorossi@gmail.com" required></label><br><br>
		<label>Telefono: <input id="telefono" name ="telefono" type="text" placeholder="3332343123" required></label>
		<label>Indirizzo: <input id="indirizzo" name="indirizzo" type="text" placeholder="via Umberto Nobile 1, Eboli SA" required></label><br><br>
		<input type="submit" value="Invia"> <input type="reset">
	</form>

</body>
</html>