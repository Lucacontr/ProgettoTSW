<%@ page language="java" 
         pageEncoding="windows-1256"
         import="java.util.*"
         import="it.unisa.model.*"
   %>
<% 
// Check user credentials
  
	Collection<?> orders = (Collection<?>) request.getSession().getAttribute("orders");

%>
   <!DOCTYPE html>
   <html>
      <head>
		<link href="css/container.css" rel="stylesheet">
         <title>CCeShop</title>
      </head>
      <body>
      <div class="container">
      <%@include file="fragments/header.jsp" %>
      <%@include file="fragments/navigationBar.jsp" %>
      <%
      	if ((currentUser==null)||(!currentUser.isValid())){	
			   	response.sendRedirect("login.jsp"); 
			    return;
	  	} 
	  %>
<h4>Ordini effettuati</h4>
	<table border="1">
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
						<td><a href="order?action=detail&id=<%=bean.getId()%>">Dettaglio ordine</a></td>
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
	<%@include file="fragments/footer.jsp" %>	
	</div>
	
    </body>
	
</html>