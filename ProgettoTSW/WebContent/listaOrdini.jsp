<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8" import="model.*" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="./Css/indirizzi.css">
	<title>I miei ordini</title>
</head>
<body>
	<jsp:include page="./header.jsp" />
	 <div class="sezione">
    	<% if(request.getSession().getAttribute("logged") == null) {
    		response.sendRedirect("./loginForm.jsp");
    	} else {%>
      <% List<OrdineBean> ordini = (List<OrdineBean>) request.getSession().getAttribute("ordini"); 
  		Iterator<OrdineBean> iterOrdini = ordini.iterator();
  		boolean admin = (boolean) request.getSession().getAttribute("admin");
  		OrdineBean ordine = new OrdineBean(); 
  		while (iterOrdini.hasNext()){
  			ordine = iterOrdini.next();%>
  		<div class="carte">
  		<h3>Ordine #<% out.println(ordine.getNumOrdineProgressivo()); %></h3>
  		<%  if(admin) {%>
  			<b style="font-size:1.2em;">Cliente: <% out.println(ordine.getCliente()); %></b>
  		<% } %>
  		<p style="font-size:1.2em;">
  			<strong>Data acquisto:</strong> <% out.print(ordine.getDataAcquisto()); %>
  		</p>
   		<p style="font-size:1.2em;">
  			<strong>Totale:</strong> <% out.println(String.format("%.2f", ordine.getCostoTotale())); %> &euro;<br><br>
  		</p>
  			<form action="gestisciOrdine" method="get">
  				<input type="hidden" name="ordine" value="<%out.print(ordine.getNumOrdineProgressivo());%>">
  				<input type="hidden" name="cliente" value="<% out.print(ordine.getCliente()); %>">
  				<button class="cta">
					  <span>Vedi dettagli</span>
					  <svg viewBox="0 0 13 10" height="10px" width="15px">
					    <path d="M1,5 L11,5"></path>
					    <polyline points="8 1 12 5 8 9"></polyline>
					  </svg>
				</button>
  			</form>
  		</div>
  		<%}
  		}%>
        
      </div>
   
	
	
	
	
	
	<jsp:include page="./footer.jsp" />
</body>
</html>