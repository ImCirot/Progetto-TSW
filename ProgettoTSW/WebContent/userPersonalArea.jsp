<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Snackz</title>
<link rel="stylesheet" href="./Css/userArea.css">
</head>
<body>
	<% boolean logged = (boolean) request.getSession().getAttribute("logged");
		if(!logged){
			response.sendRedirect("./loginForm.jsp");
		}
	%>
	<jsp:include page="./header.jsp" />
	<div class="dati">
    <p>
    Ciao <% out.println(request.getSession().getAttribute("nome") + " " + request.getSession().getAttribute("cognome")); %>
    </p>
    <br />
    <form action="LogOutServlet" method="get">
		<input type="submit" value="logout" />
	</form>
  </div>
  
  <div class="container-info">
  	<div class="container-info-interno">
  		<div class="info">
  			<h4>I tuoi indirizzi di spedizione</h4>
  		</div>
  	<% List<IndirizzoBean> indirizzi = (List<IndirizzoBean>) request.getSession().getAttribute("indirizzi"); 
  		Iterator<IndirizzoBean> iterIndirizzi = indirizzi.iterator();
  		int i = 0;
  		IndirizzoBean indirizzo = new IndirizzoBean(); %>
  		
  		<% while(iterIndirizzi.hasNext()){
  			indirizzo = iterIndirizzi.next();
  			i += 1;%>
  			
  			<div class="info">
  			<h4>Indirizzo <%out.print(i);%></h4>
  
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
  			</div>
  			<%}%>
  		
  		
  		<div class="info">
  			<a href="#">Aggiungi un indirizzo di consegna</a>
  		</div>
  		</div>
  		<div class="container-info-interno">
  		<div class="info">
  			<h4>I tuoi metodi di pagamento</h4>
  		</div>
  		<% List<MetodoDiPagamentoBean> metodiPagamento = (List<MetodoDiPagamentoBean>) request.getSession().getAttribute("metodiPagamento"); 
  		Iterator<MetodoDiPagamentoBean> iterMetodi = metodiPagamento.iterator();
  		i = 0;
  		MetodoDiPagamentoBean metodoPagamento = new MetodoDiPagamentoBean(); %>
  		
  		<% while(iterMetodi.hasNext()){
  			metodoPagamento = iterMetodi.next();
  			i += 1;%>
  			<div class="info">
  			<h4>Metodo di pagamento <%out.print(i);%></h4>
  			<p>
  				<% 
  					out.println(metodoPagamento.getTipo());
  					if(metodoPagamento.getIBAN() != null) {
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
  			</div>
  			<% } %>
  			
  		<div class="info">
  			<a href="#">Aggiungi un metodo di pagamento</a>
  		</div>
  		</div>
  		<div class="container-info-interno">
  			<div class="info">
  			<h4>I tuoi ordini</h4>
  		</div>
  		<% List<OrdineBean> ordini = (List<OrdineBean>) request.getSession().getAttribute("ordini"); 
  		Iterator<OrdineBean> iterOrdini = ordini.iterator();
  		OrdineBean ordine = new OrdineBean(); 
  		while (iterOrdini.hasNext()){
  			ordine = iterOrdini.next();%>
  		
  		<div class="info">
  		<h4>Ordine <% out.println(ordine.getNumOrdineProgressivo()); %></h4>
  		<p>
  			<% out.println(ordine.getCostoTotale()); %>
  			<a href="#">Vedi dettagli</a>
  		</p>
  		</div>
  		</div>
  		<%}%>
  </div>
  
	<jsp:include page="./footer.jsp" />
</body>
</html>
