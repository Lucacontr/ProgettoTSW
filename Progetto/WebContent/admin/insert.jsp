<!DOCTYPE html>

<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.*"%>
<%
	Collection<?> categories = (Collection<?>) CategoriaDAO.doRetrieveAll();
	if(categories == null) {
		response.sendRedirect("../product");	
		return;
	}

	// Check admin credentials
	Boolean adminRoles = (Boolean) session.getAttribute("adminRoles");
	if ((adminRoles == null) || (!adminRoles.booleanValue())){	
	    response.sendRedirect("../adminLogin.jsp");
	    return;
	}
	
	
%>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>CCeShop</title>
	</head>



	<body>
		<div id="container">
			<%@include file="../fragments/header.jsp" %>
			<%@include file="../fragments/navigationBar.jsp" %>
			<div id="content">
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
					
					<label for="thumb">Thumbnail:</label><br> 
					<input name="thumb" type="text" required placeholder="enter link thumbnail"><br> 
					
					<label for="images">Inserisci immagini</label><br>
					 <input name="images" type="text" placeholder="enter link image">
					
					<label>Seleziona le categorie:</label><br> 
					<% 
						if (categories != null && categories.size() != 0) {
						Iterator<?> it = categories.iterator();
						while (it.hasNext()) {
							CategoriaBean bean = (CategoriaBean) it.next();
					%>
						<input type="checkbox" name="categoria" value="<%=bean.getNome()%>">
						<label for="categoria"><%=bean.getNome()%></label>
					<%
							}
						}
					%>
					
					<br/><br/><input type="submit" value="Add"><input type="reset" value="Reset">
				</form>
			</div>
			<%@include file="../fragments/footer.jsp" %>
		</div>
	</body>
</html>