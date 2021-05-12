<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Registrazione utente</title>
</head>
<body>
	<h1>REGISTRAZIONE UTENTE</h1>
	<form action="login" method="post">
	<fieldset>
		<legend>NOME E COGNOME</legend>
		<label>Nome: </label><input id="name" name="name" type="text" placeholder="Mario" required><br><br>
		<label>Cognome: </label><input id="surname" name ="surname" type="text" placeholder="Rossi" required>
	</fieldset><br>
	<fieldset>
		<legend>Username e PASSWORD</legend>
		<label>Username: </label> <input id="user" name="username" type="text" placeholder="username" required>
		<% 
			if(request.getSession().getAttribute("username")!=null && request.getSession().getAttribute("username").equals("false"))
			{	
				%>   Username già utilizzato, scegline un altro
			<%}%>
		<br><br>
		<label>Password: </label><input id="pw" name="pw" type="password" placeholder="password" required>
	</fieldset><br>
	<input type="submit"> <input type="reset">
	<input type="hidden" name="action" value="registration">
	</form>
</body>
</html>