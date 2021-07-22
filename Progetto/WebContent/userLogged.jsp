<%@ page language="java" 
         pageEncoding="windows-1256"
         import="java.util.*"
         import="it.unisa.model.*"
   %>
   <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "a" %>
<% 
// Check user credentials
  
	Collection<?> orders = (Collection<?>) request.getSession().getAttribute("orders");

%>
<!DOCTYPE html>
<html>
      <head>
		<link href="css/container.css" rel="stylesheet">
         <title>CCeShop</title>
         <link rel="shortcut icon" href="<a:url value="/images/favicon.ico"/>" type="image/x-icon">
      </head>
      <body>
      <div id="container">
      <%@include file="fragments/header.jsp" %>
      <%@include file="fragments/navigationBar.jsp" %>
      	<div id="content">
	      <%
	      	if ((currentUser==null)||(!currentUser.isValid())){	
				   	response.sendRedirect("login.jsp"); 
				    return;
		  	} 
		  %>
			<h2>Ordini effettuati</h2>
			<table cellspacing="40px" id="tab1">
			<tr>
				<th>Code </th>
				<th>Data </th>
				<th>Prezzo Totale</th>
				<th></th>
			</tr>
			<%
				if (orders != null && orders.size() != 0) {
					Iterator<?> it = orders.iterator();
					while (it.hasNext()) {
						OrderBean bean = (OrderBean) it.next();
			%>
						<tr>
							<td><%=bean.getId()%></td>
							<td><%=bean.getDataEff()%></td>
							<td><%=bean.getPrezzoTot()%></td>
							<td><button id="butt"><a id="elimina" href="order?action=detail&id=<%=bean.getId()%>">Dettaglio ordine</a></button></td>
						</tr>
			<%
					}
				}
				else {
			%>
			<tr>
				<td colspan="6">No orders available</td>
			</tr>
			<%
				}
			%>
		</table><br/>
		</div>
	</div>
	<%@include file="fragments/footer.jsp" %>	
    </body>
	
</html>