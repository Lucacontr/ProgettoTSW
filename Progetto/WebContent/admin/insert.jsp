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
				<h2 style="color: #2690F8">INSERISCI PRODOTTO</h2>
				<form action="../product" method="post">
					<input type="hidden" name="action" value="insert"> 
					<table style="width: 100%; border: 2px solid #2690F8;">
					<tr>
						<th><label for="nome">Nome</label></th>
						<th><label for="descrizione">Descrizione</label></th>
						<th><label for="prezzo">Prezzo</label></th>
						<th><label for="quantita">Quantità</label></th>
						<th><label for="sconto">Sconto</label></th>
						<th><label for="iva">IVA</label></th>
						<th><label for="thumb">Thumbnail</label></th>
						<th><label for="images">Inserisci immagini</label></th>
						<th><label>Seleziona le categorie</label></th>
					</tr>
					<tr>
						<td><input name="nome" type="text" maxlength="20" required placeholder="enter name"></td>
						<td><textarea name="descrizione" maxlength="100" rows="3" required placeholder="enter description"></textarea></td>
						<td><input name="prezzo" type="number" min="0" step="0.01" value="0.0" required></td>
						<td><input name="quantita" type="number" min="1" value="1" required></td>
						<td><input name="sconto" type="text" min="0" value="0.0" ></td>
						<td><input name="iva" type="number" min="0" value="0.0" step="0.1" required></td>
						<td><input name="thumb" type="text" required placeholder="enter link thumbnail"></td>
						<td><input name="images" type="text" placeholder="enter link image"></td>
						<td>
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
						</td>
			
					</tr>
					</table>
					<br/><br/><input type="submit" value="Aggiungi" id="butt"> <input type="reset" value="Reset" id="butt">
					
				</form>
			</div>
			<%@include file="../fragments/footer.jsp" %>
		</div>
	</body>
</html>