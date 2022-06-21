<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8" import="model.*" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="./Css/indirizzi.css">
	<title>I miei metodi di pagamento</title>
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
      <% List<MetodoDiPagamentoBean> metodiPagamento = (List<MetodoDiPagamentoBean>) request.getSession().getAttribute("metodiPagamento"); 
  		Iterator<MetodoDiPagamentoBean> iterMetodi = metodiPagamento.iterator();
  		int i = 0;
  		MetodoDiPagamentoBean metodoPagamento = new MetodoDiPagamentoBean(); %>
  		
  		<% while(iterMetodi.hasNext()){
  			metodoPagamento = iterMetodi.next();
  			i += 1;%>
  			<div class="carte">
  			<% if(metodoPagamento.getPreferito().equalsIgnoreCase("si")) { %>
  						<h3>Metodo di pagamento predefinito</h3>
  					<%} else{%>
      		<h3>Metodo di pagamento <%out.print(i);%></h3>
  <% }%>
  			<p>
  				<% 
  					out.println(metodoPagamento.getTipo());
  					if(metodoPagamento.getTipo().equals("IBAN")) {
  						out.println(metodoPagamento.getIBAN() + " ");
  					} else {
  						out.println(metodoPagamento.getNumCarta() + " ");
  					}%>
  			</p>		
  			<p>
  				<% 
  					out.println(metodoPagamento.getVia() + " " + metodoPagamento.getCivico());
  					out.println(metodoPagamento.getCitta() + ", " + metodoPagamento.getProvincia() + " " + metodoPagamento.getCAP());
  					out.println(metodoPagamento.getNazione()); %>
  			</p>
			<form action="modificaInfo" method="get">
  				<input type="hidden" value="<% out.print(request.getSession().getAttribute("utente"));%>" name="utente">
  				<input type="hidden" value="<% out.print(metodoPagamento.getNumPagamentoProgressivo());%>" name="metodoPagamentoID">
				<input type="hidden" name="mode" value="update">
				<input type="hidden" name="target" value="metodoPagamento">
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
  				<input type="hidden" value="<% out.print(metodoPagamento.getNumPagamentoProgressivo());%>" name="indirizzoID">
				<input type="hidden" name="mode" value="delete">
				<input type="hidden" name="target" value="indirizzo">
				<button id="bottone_elimina" type="submit">Elimina</button>
  			</form>
  			</div>
  			<% } %>
      </div>
	<jsp:include page="./footer.jsp" />
</body>
</html>