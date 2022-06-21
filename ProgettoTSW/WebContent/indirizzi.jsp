<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8" import="model.*" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="./Css/indirizzi.css">
	<title>I miei indirizzi</title>
</head>
<body>
	<jsp:include page="./header.jsp" />
	 <div class="sezione">
      <div class="aggiungi">
      <img alt="" src="./Images/metodo_pagamento.png">
      	<form action="modificaInfo" method="get">
  				<input type="hidden" value="<% out.print(request.getSession().getAttribute("utente"));%>" name="utente">
  				<input type="hidden" name="mode" value="add">
  				<input type="hidden" name="target" value="indirizzo">
  				<button class="cta">
					  <span id="aggiungi" >Aggiungi</span>
					  <svg viewBox="0 0 13 10" height="10px" width="15px">
					    <path d="M1,5 L11,5"></path>
					    <polyline points="8 1 12 5 8 9"></polyline>
					  </svg>
				</button>
  			</form>
      </div>
      <% List<IndirizzoBean> indirizzi = (List<IndirizzoBean>) request.getSession().getAttribute("indirizzi"); 
  		Iterator<IndirizzoBean> iterIndirizzi = indirizzi.iterator();
  		int i = 0;
  		IndirizzoBean indirizzo = new IndirizzoBean(); %>
  		
  		<% while(iterIndirizzi.hasNext()){
  			indirizzo = iterIndirizzi.next();
  			i += 1;%>
      <div class="carte">
      	<% if(indirizzo.getPreferito().equalsIgnoreCase("si")) { %>
  						<h3>Indirizzo predefinito</h3>
  					<%} else{%>
      		<h3>Indirizzo <%out.print(i);%></h3>
  <% }%>
  			<p>
  				<% out.print(indirizzo.getVia() + " " + indirizzo.getCivico() + " ");
  					if(indirizzo.getScala() != null) {
  						out.print(indirizzo.getScala() + " ");
  					}
  					
  					if(indirizzo.getInterno() != null) {
  						out.print(indirizzo.getInterno() + "  ");
  					}%>
  				</p>
  				<p><%
  					//out.print("\n");
  					out.println(indirizzo.getCitta() + ", " + indirizzo.getProvincia() + " " + indirizzo.getCAP());
  					out.println(indirizzo.getNazione()); %>
  			</p>
  			<form action="modificaInfo" method="get">
  				<input type="hidden" value="<% out.print(indirizzo.getNumIndirizzoProgressivo());%>" name="indirizzoID">
				<input type="hidden" name="mode" value="update">
				<input type="hidden" name="target" value="indirizzo">
				<button class="cta">
					  <span>Modifica</span>
					  <svg viewBox="0 0 13 10" height="10px" width="15px">
					    <path d="M1,5 L11,5"></path>
					    <polyline points="8 1 12 5 8 9"></polyline>
					  </svg>
				</button>
  			</form>
  			<form action="modificaInfo" method="post">
  				<input type="hidden" value="<% out.print(request.getSession().getAttribute("utente"));%>" name="utente">
  				<input type="hidden" value="<% out.print(indirizzo.getNumIndirizzoProgressivo());%>" name="indirizzoID">
				<input type="hidden" name="mode" value="delete">
				<input type="hidden" name="target" value="indirizzo">
				<button id="bottone_elimina" type="submit">Elimina</button>
  			</form>
  			</div>
  			<%}%>
      </div>
	<jsp:include page="./footer.jsp" />
</body>
</html>