<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.*"%>

<!DOCTYPE html>
<html>
	<head>
		<script src="scripts/jquery.js"></script>
		<script type="text/javascript" src="js/formCheck.js"></script>
		<title>CCeShop</title>
		<link href="css/container.css" rel="stylesheet">
	</head>
	<body>
		<div id="container">
			<div id="content">
				<%@include file="fragments/header.jsp" %>
				<%@include file="fragments/navigationBar.jsp" %>
				<%
					if(cart != null){
				%>
						<br><br><h3 align="center"><a href="login.jsp">Accedi</a> o continua ad acquistare senza loggarti:</h3><br>
						<form action="order" method="post">
						<table id="tab1" cellspacing="40px">
							<tr>
								<th>Nome</th>
								<th>Cognome</th>
							</tr>
							<tr>
								<td><input id="nome" name="nome" type="text" placeholder="Mario" required onblur="checkNome(this.form.nome)"></td>
								<td><input id="cognome" name ="cognome" type="text" placeholder="Rossi" required onblur="checkCognome(this.form.cognome)"></td>
							</tr>
						</table><br>
						<table id="tab1" cellspacing="40px">
							<tr>
								<th>E-Mail</th>
								<th>Telefono</th>
							</tr>
							<tr>
								<td><input id="email" name="email" type="text" placeholder="mariorossi@gmail.com" required onblur="checkEmail(this.form.email)"></td>
								<td><input id="telefono" name ="telefono" type="text" placeholder="3332343123" required onblur="checkTelefono(this.form.telefono)"></td>
							
							</tr>
						</table><br>
						<table id="tab1" cellspacing="40px">
							<tr>
								<th>Numero Carta</th>
								<th>Data Scadenza</th>
								<th>CVV</th>
								<th>Indirizzo</th>
							</tr>
							<tr>
								<td><input id="PAN" name="PAN" type="text" placeholder="xxxx-xxxx-xxxx-xxxx" required minlength="16" maxlength="16" ></td>
								<td><input id="expDate" name="expDate" type="text" placeholder="MM/AA" required></td>
								<td><input id="CVV" name="CVV" type="text" placeholder="xxx" required minlength="3" maxlength="3"></td>
								<td><input id="address" name="indirizzo" type="text" placeholder="Via Guglielmo Marconi, 14" required></td>
							</tr>				
						</table><br>
						<table id="tab1" cellspacing="40px">
							<tr>
								<td><input type="submit" value="Invia" id="butt"></td>
								<td><input type="reset" id="butt"></td>
							</tr>
						
						</table>
						
							<input type="hidden" name="action" value="guest">
							<br><br>
							 
						</form>
				<%
					}
					else{
				%>
					<h2>Il tuo carrello è vuoto</h2>
				<%
					}
				%>
			</div>	
		</div>
		<%@include file="fragments/footer.jsp" %>
	</body>
</html>