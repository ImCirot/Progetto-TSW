<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Snackz</title>
<link rel="stylesheet" href="./Css/userArea.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap%27">
</head>
<body>
	<% boolean logged = (boolean) request.getSession().getAttribute("logged");
		if(!logged){
			response.sendRedirect("./loginForm.jsp");
		}
		
		boolean admin = (boolean) request.getSession().getAttribute("admin");
	%>
	<jsp:include page="./header.jsp" />
	<h1>
    Ciao <% out.println(request.getSession().getAttribute("nome") + " " + request.getSession().getAttribute("cognome")); %>
    </h1>
    <% String message = (String) request.getSession().getAttribute("message");
    	if(message != null) {%>
    		<p><% out.println(message); %></p>
    	<% request.getSession().removeAttribute("message"); } %>
    <% if (!admin) {%>
	<div class="dati">
   	
    <form action="LogOutServlet" method="get">
		<button type="submit">Logout</button>
	</form>
	<br>
	<form action="modificaInfo" method="get">
		<input type="hidden" value="<% out.print(request.getSession().getAttribute("utente"));%>" name="utente">
		<input type="hidden" name="mode" value="update">
		<input type="hidden" name="target" value="utente">
		<button type="submit">Modifica informazioni personali</button>
	</form>
  </div>
  
  <div class="container-info">
  	<div class="container-info-interno">
  		<div class="info">
  			<h3>I tuoi indirizzi di spedizione</h3>
  		</div>
  	<% List<IndirizzoBean> indirizzi = (List<IndirizzoBean>) request.getSession().getAttribute("indirizzi"); 
  		Iterator<IndirizzoBean> iterIndirizzi = indirizzi.iterator();
  		int i = 0;
  		IndirizzoBean indirizzo = new IndirizzoBean(); %>
  		
  		<% while(iterIndirizzi.hasNext()){
  			indirizzo = iterIndirizzi.next();
  			i += 1;%>
  			
  			<div class="info">
  			<h3>Indirizzo <%out.print(i);%></h3>
  
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
  			<% if(indirizzo.getPreferito().equalsIgnoreCase("si")) { %>
  						<h4>Indirizzo predefinito</h4>
  					<%}%>
  			<form action="modificaInfo" method="get">
  				<input type="hidden" value="<% out.print(request.getSession().getAttribute("utente"));%>" name="utente">
  				<input type="hidden" value="<% out.print(indirizzo.getNumIndirizzoProgressivo());%>" name="indirizzoID">
				<input type="hidden" name="mode" value="update">
				<input type="hidden" name="target" value="indirizzo">
				<button type="submit">Modifica</button>
  			</form>
  			<form action="modificaInfo" method="post">
  				<input type="hidden" value="<% out.print(request.getSession().getAttribute("utente"));%>" name="utente">
  				<input type="hidden" value="<% out.print(indirizzo.getNumIndirizzoProgressivo());%>" name="indirizzoID">
				<input type="hidden" name="mode" value="delete">
				<input type="hidden" name="target" value="indirizzo">
				<button type="submit">Elimina</button>
  			</form>
  			</div>
  			<%}%>
  		
  		
  		<div class="info">
  			<form action="modificaInfo" method="get">
  				<input type="hidden" value="<% out.print(request.getSession().getAttribute("utente"));%>" name="utente">
  				<input type="hidden" name="mode" value="add">
  				<input type="hidden" name="target" value="indirizzo">
  				<button type="submit">Aggiungi nuovo indirizzo</button>
  			</form>
  		</div>
  		</div>
  		<div class="container-info-interno">
  		<div class="info">
  			<h3>I tuoi metodi di pagamento</h3>
  		</div>
  		<% List<MetodoDiPagamentoBean> metodiPagamento = (List<MetodoDiPagamentoBean>) request.getSession().getAttribute("metodiPagamento"); 
  		Iterator<MetodoDiPagamentoBean> iterMetodi = metodiPagamento.iterator();
  		i = 0;
  		MetodoDiPagamentoBean metodoPagamento = new MetodoDiPagamentoBean(); %>
  		
  		<% while(iterMetodi.hasNext()){
  			metodoPagamento = iterMetodi.next();
  			i += 1;%>
  			<div class="info">
  			<h3>Metodo di pagamento <%out.print(i);%></h3>
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
  			<% if(metodoPagamento.getPreferito().equalsIgnoreCase("si")) { %>
						<h4>Metodo di pagamento predefinito</h4>
					<%}%>
			<form action="modificaInfo" method="get">
  				<input type="hidden" value="<% out.print(request.getSession().getAttribute("utente"));%>" name="utente">
  				<input type="hidden" value="<% out.print(metodoPagamento.getNumPagamentoProgressivo());%>" name="metodoPagamentoID">
				<input type="hidden" name="mode" value="update">
				<input type="hidden" name="target" value="metodoPagamento">
				<button type="submit">Modifica</button>
  			</form>
  			<form action="modificaInfo" method="post">
  				<input type="hidden" value="<% out.print(request.getSession().getAttribute("utente"));%>" name="utente">
  				<input type="hidden" value="<% out.print(metodoPagamento.getNumPagamentoProgressivo());%>" name="metodoPagamentoID">
				<input type="hidden" name="mode" value="delete">
				<input type="hidden" name="target" value="metodoPagamento">
				<button type="submit">Elimina</button>
  			</form>
  			</div>
  			<% } %>
  			
  		<div class="info">
  			<img alt="ciao" src="./Images/metodo_pagamento.png">
  			
  			<form action="modificaInfo" method="get">
  				<input type="hidden" value="<% out.print(request.getSession().getAttribute("utente"));%>" name="utente">
  				<input type="hidden" name="mode" value="add">
  				<input type="hidden" name="target" value="metodoPagamento">
  				<button type="submit">Aggiungi nuovo metodo di pagamento</button>
  			</form>
  			
  		</div>
  		</div>
  		<div class="container-info-interno">
  			<div class="info">
  			<h3>I tuoi ordini</h3>
  		</div>
  		<% List<OrdineBean> ordini = (List<OrdineBean>) request.getSession().getAttribute("ordini"); 
  		Iterator<OrdineBean> iterOrdini = ordini.iterator();
  		OrdineBean ordine = new OrdineBean(); 
  		while (iterOrdini.hasNext()){
  			ordine = iterOrdini.next();%>
  		<div class="info">
  		<h3>Ordine <% out.println(ordine.getNumOrdineProgressivo()); %></h3>
  		<p>
  			<% out.println(ordine.getCostoTotale()); %> &euro;<br><br>
  		</p>
  			<form action="gestisciOrdine" method="get">
  				<input type="hidden" name="ordine" value="<%out.print(ordine.getNumOrdineProgressivo());%>">
  				<input type="hidden" name="cliente" value="<% out.print(ordine.getCliente()); %>">
  				<button type="submit">Vedi dettagli</button>
  			</form>
  		</div>
  		<%}%>
  		</div>
  </div>
  <% } else { %>
	  <div class="dati">
	   	
	    <form action="LogOutServlet" method="get">
			<button type="submit">Logout</button>
		</form>
		<br>
	  </div>
  		<div class="container-info-interno">
  			<div class="info">
  			<h3>Storico ordini utenti</h3>
  		</div>
  		<% List<OrdineBean> ordini = (List<OrdineBean>) request.getSession().getAttribute("ordini"); 
  		Iterator<OrdineBean> iterOrdini = ordini.iterator();
  		OrdineBean ordine = new OrdineBean(); 
  		while (iterOrdini.hasNext()){
  			ordine = iterOrdini.next();%>
  		<div class="info">
  		<h3>Ordine <% out.println(ordine.getNumOrdineProgressivo()); %></h3><hr>
  		<p>
  			<% 
  			out.print(ordine.getCliente()); %> <hr>
  			<% out.print(ordine.getDataAcquisto()); %><hr>
  			<% out.print(ordine.getCostoTotale()); %> &euro;<hr><br>
  		</p>
  			<form action="gestisciOrdine" method="get">
  				<input type="hidden" name="ordine" value="<%out.print(ordine.getNumOrdineProgressivo());%>">
  				<input type="hidden" name="cliente" value="<% out.print(ordine.getCliente()); %>">
  				<button type="submit">Vedi dettagli</button>
  			</form>
  		</div>
  		<%}%>
  		</div>
  <% } %>
	<jsp:include page="./footer.jsp" />
</body>
</html>
