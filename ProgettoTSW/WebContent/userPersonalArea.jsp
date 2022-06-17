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
	<% Boolean logged = (Boolean) request.getSession().getAttribute("logged");
		if(logged == null){
			response.sendRedirect("./loginForm.jsp");
		} else {
		
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
		
		<button class="cta">
			  <span>Modifica informazioni</span>
			  <svg viewBox="0 0 13 10" height="10px" width="15px">
			    <path d="M1,5 L11,5"></path>
			    <polyline points="8 1 12 5 8 9"></polyline>
			  </svg>
		</button>
	</form>
  </div>
  
  <div class="container-info">
  	<div class="container-info-interno">
  		<div class="info">
  			<div class="prova"><h3>I tuoi indirizzi di spedizione</h3></div>
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
				<button type="submit">Elimina</button>
  			</form>
  			</div>
  			<%}%>
  		
  		
  		<div class="info">
  			<div class="prova">
  			<form action="modificaInfo" method="get">
  				<input type="hidden" value="<% out.print(request.getSession().getAttribute("utente"));%>" name="utente">
  				<input type="hidden" name="mode" value="add">
  				<input type="hidden" name="target" value="indirizzo">
  				<button class="cta">
					  <span id="aggiugni" >Aggiungi</span>
					  <svg viewBox="0 0 13 10" height="10px" width="15px">
					    <path d="M1,5 L11,5"></path>
					    <polyline points="8 1 12 5 8 9"></polyline>
					  </svg>
				</button>
  			</form>
  			</div>
  		</div>
  		</div>
  		<div class="container-info-interno">
  		<div class="info">
  			<div class="prova"><h3>I tuoi metodi di pagamento</h3></div>
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
  				<input type="hidden" value="<% out.print(metodoPagamento.getNumPagamentoProgressivo());%>" name="metodoPagamentoID">
				<input type="hidden" name="mode" value="delete">
				<input type="hidden" name="target" value="metodoPagamento">
				<button class="noselect"><span class="text">Rimuovi</span><span class="icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M24 20.188l-8.315-8.209 8.2-8.282-3.697-3.697-8.212 8.318-8.31-8.203-3.666 3.666 8.321 8.24-8.206 8.313 3.666 3.666 8.237-8.318 8.285 8.203z"></path></svg></span></button>
  			</form>
  			</div>
  			<% } %>
  			
  		<div class="info">
  		<div class="prova">
  			
  				<img alt="ciao" src="./Images/metodo_pagamento.png">
  			
  			
  			<form action="modificaInfo" method="get">
  				<input type="hidden" value="<% out.print(request.getSession().getAttribute("utente"));%>" name="utente">
  				<input type="hidden" name="mode" value="add">
  				<input type="hidden" name="target" value="metodoPagamento">
  				<button class="cta">
					  <span id="aggiugni">Aggiungi</span>
					  <svg viewBox="0 0 13 10" height="10px" width="15px">
					    <path d="M1,5 L11,5"></path>
					    <polyline points="8 1 12 5 8 9"></polyline>
					  </svg>
				</button>
  			</form>
  			</div>
  		</div>
  		</div>
  		<div class="container-info-interno">
  			<div class="info">
  			<div class="prova"><h3>I tuoi ordini</h3></div>
  		</div>
  		<% List<OrdineBean> ordini = (List<OrdineBean>) request.getSession().getAttribute("ordini"); 
  		Iterator<OrdineBean> iterOrdini = ordini.iterator();
  		OrdineBean ordine = new OrdineBean(); 
  		while (iterOrdini.hasNext()){
  			ordine = iterOrdini.next();%>
  		<div class="info">
  		<h3>Ordine <% out.println(ordine.getNumOrdineProgressivo()); %></h3>
  		<p>
  			<% out.println(String.format("%.2f", ordine.getCostoTotale())); %> &euro;<br><br>
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
  				<button class="cta">
					  <span>Vedi dettagli</span>
					  <svg viewBox="0 0 13 10" height="10px" width="15px">
					    <path d="M1,5 L11,5"></path>
					    <polyline points="8 1 12 5 8 9"></polyline>
					  </svg>
				</button>
  			</form>
  		</div>
  		<%}%>
  		</div>
  <% } 
  }%>
	<jsp:include page="./footer.jsp" />
</body>
</html>
