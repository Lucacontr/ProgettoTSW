<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.ProductDAO"%>
<%
	Collection<?> products = (Collection<?>) ProductDAO.doRetrieveAll(null);
// Check user credentials
	Boolean adminRoles = (Boolean) session.getAttribute("adminRoles");
	if ((adminRoles == null) || (!adminRoles.booleanValue())){	
	    response.sendRedirect("../adminLogin.jsp");
	    return;
	}
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="../ProductStyle.css" rel="stylesheet">
	<title>CCeShop</title>
</head>



<body>
	<h2>Insert</h2>
	<form action="../product" method="post">
		<input type="hidden" name="action" value="insert"> 
		
		<label for="nome">Name:</label><br> 
		<input name="nome" type="text" maxlength="20" required placeholder="enter name"><br> 
		
		<label for="descrizione">Description:</label><br>
		<textarea name="descrizione" maxlength="100" rows="3" required placeholder="enter description"></textarea><br>
		
		<label for="prezzo">Price:</label><br> 
		<input name="prezzo" type="number" min="0" step="0.01" value="0.0" required><br>

		<label for="quantita">Quantity:</label><br> 
		<input name="quantita" type="number" min="1" value="1" required><br>

		<label for="sconto">Sconto:</label><br> 
		<input name="sconto" type="text" min="0" value="0.0" ><br>

		<label for="iva">IVA:</label><br> 
		<input name="iva" type="number" min="0" value="0.0" step="0.1" required><br>

		<input type="submit" value="Add"><input type="reset" value="Reset">
	</form>
</body>
</html>