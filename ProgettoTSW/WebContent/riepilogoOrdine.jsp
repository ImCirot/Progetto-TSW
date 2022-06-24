<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./Css/riepilogoOrdine.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap%27">
<title>Snackz</title>
</head>
<body>
	<jsp:include page="./header.jsp" />
	<% 
		Boolean admin = (Boolean) request.getSession().getAttribute("admin");
	
	if(request.getSession().getAttribute("carrello") == null) {
		response.sendRedirect("index.jsp");
	}
	if(admin){
		request.getSession().setAttribute("messaggio", "L'admin non può acquistare. Utilizza un account pubblico!");
		response.sendRedirect("./personalArea.jsp");
	} else {
	List<MetodoDiPagamentoBean> listaMetodi = (List<MetodoDiPagamentoBean>) request.getSession().getAttribute("metodiPagamento");
		List<IndirizzoBean> listaIndirizzi = (List<IndirizzoBean>) request.getSession().getAttribute("indirizzi");
		
		if(listaMetodi.isEmpty() || listaIndirizzi.isEmpty()){
			request.getSession().setAttribute("messaggio", "Devi aggiungere un indirizzo/metodo di pagamento prima di continuare con l'acquisto");
			response.sendRedirect("./userPersonalArea.jsp");
		}
		Iterator<MetodoDiPagamentoBean> iterMetodiPagamento = listaMetodi.iterator();
		Iterator<IndirizzoBean> iterIndirizzi = listaIndirizzi.iterator(); 
		IndirizzoBean indirizzo = new IndirizzoBean();
		MetodoDiPagamentoBean metodPagamento = new MetodoDiPagamentoBean();%>
		<form action="ordine" method="post">
		<div class="container">
		
			<div class="container-interno">
			<h4>Scegli indirizzo di spedizione</h4><br>
		<%	while(iterIndirizzi.hasNext()){
			indirizzo = iterIndirizzi.next();
			if(indirizzo.getPreferito().equals("si")){ %>
				<input type="radio" name="indirizzo" id="indirizzo" value="<%out.print(indirizzo.getNumIndirizzoProgressivo());%>" checked>
				<label for="indirizzo"><% out.println(indirizzo.getVia() + " " + indirizzo.getCivico() + " " 
					+ indirizzo.getCitta() + " " + indirizzo.getCAP() + " " + indirizzo.getProvincia() + " " + indirizzo.getNazione());
					if(indirizzo.getScala() != null){
						out.print(indirizzo.getScala() + " ");
					}
					if(indirizzo.getInterno() != null){
						out.print(indirizzo.getInterno());
					}
					%></label><br><br>
			<%} else { %>
				<input type="radio" name="indirizzo" id="indirizzo" value="<%out.print(indirizzo.getNumIndirizzoProgressivo());%>">
				<label for="indirizzo"><% out.println(indirizzo.getVia() + " " + indirizzo.getCivico() + " " 
						+ indirizzo.getCitta() + " " + indirizzo.getCAP() + " " + indirizzo.getProvincia() + " " + indirizzo.getNazione());
						if(indirizzo.getScala() != null){
							out.print(indirizzo.getScala() + " ");
						}
						if(indirizzo.getInterno() != null){
							out.print(indirizzo.getInterno());
						}
						%></label><br><br>
			<% } %>
		<%}%>
		<a href="modificaInfo?mode=add&target=indirizzo">Aggiungi indirizzo</a>
		</div>
		
		
		<div class="container-interno">
		<h4>Scegli un metodo di pagamento</h4>
		<% while(iterMetodiPagamento.hasNext()){
			metodPagamento = iterMetodiPagamento.next();
			if(metodPagamento.getPreferito().equals("si")){%>
				<input type="radio" name="metodoPagamento" id="pagamento" value="<%out.print(metodPagamento.getNumPagamentoProgressivo());%>" checked>
				<label for="pagamento"><% out.println(metodPagamento.getTipo());
			if(metodPagamento.getTipo().equals("IBAN")) {
				out.println(metodPagamento.getIBAN());
			} else {
				out.println(metodPagamento.getNumCarta());
			}
						%></label><br><br>
		<% } else { %>
			<input type="radio" name="metodoPagamento" id="pagamento" value="<%out.print(metodPagamento.getNumPagamentoProgressivo());%>">
			<label for="pagamento"><% out.println(metodPagamento.getTipo());
			if(metodPagamento.getTipo().equals("IBAN")) {
				out.println(metodPagamento.getIBAN());
			} else {
				out.println(metodPagamento.getNumCarta());
			}
						%></label><br><br>
		<% }
		} %>
		<a href="modificaInfo?mode=add&target=metodoPagamento">Aggiungi metodo di pagamento</a>
		</div>
		
		<%
			 Map<String,Integer> carrello = (Map<String,Integer>) request.getSession().getAttribute("carrello");
			Iterator<String> iterKeys = carrello.keySet().iterator();
			List<ProdottoBean> prodotti = (List<ProdottoBean>) request.getSession().getAttribute("prodotti");
			List<DettaglioProdottoBean> dettagliProdotti = (List<DettaglioProdottoBean>) request.getSession().getAttribute("dettagliProdotti");			
			Integer quantita = 0;
			ProdottoBean prodotto = new ProdottoBean();
			DettaglioProdottoBean dettagli = new DettaglioProdottoBean();
			Iterator<ProdottoBean> iterProdotti;
			Iterator<DettaglioProdottoBean> iterDettagli;
			String key;
			
			while(iterKeys.hasNext()){
				key = iterKeys.next();
				quantita = carrello.get(key);
				iterProdotti = prodotti.iterator();
				while(iterProdotti.hasNext()){
					prodotto = iterProdotti.next();
					if(prodotto.getCodiceSeriale().equals(key)) break;
				}
				
				iterDettagli = dettagliProdotti.iterator();
				while(iterDettagli.hasNext()){
					dettagli = iterDettagli.next();
					if(dettagli.getProdotto().equals(key)) break;
				}
				%>
				  
				     <div class="cart-container-interno">
				        	<div class="info-prodotto"> 
				        	<a href="SelectProdottoServlet?prodotto=<%out.println(prodotto.getCodiceSeriale());%>"> 	
				        	<img src="<% out.print(dettagli.getImmagine()); %>" alt="ciao"></a>
				        	</div>
				        
				        <div class="info-prodotto">
				        <p><% out.print(prodotto.getNome()); %></p>
				        </div>
				        <div class="info-prodotto">
				        <% if(dettagli.getPrezzoScontato() != null) { %>
				        <p><del class="full-price"><% out.print(dettagli.getCostoUnitario()); %> &euro;</del>  <% out.print(dettagli.getPrezzoScontato()); %> &euro;</p>
				        <% } else { %>
				          <p> <% out.print(dettagli.getCostoUnitario()); %> &euro;</p>
				         <% } %>
				        </div>
				        <div class="info-prodotto" class="flex-el">
							<p> Quantita: <% out.print(quantita); %></p>
 				        </div>
				</div>
			<%}%>
			</div>
			<div class="riepilogo">
			      <div class="totale_parziale">
			        <div class="prova">
			
			        </div>
			        <div class="card">
			          <h2 class="h2_style">Totale parziale:</h2>
			        </div>
			        <div class="card2">
			          <p class="p_style"  id="netto"></p>
			        </div>
			
			      </div>
			
			      <div class="totale_parziale">
			        <div class="prova">
			
			        </div>
			        <div class="card">
			            <h2 class="h2_style">Spedizione:</h2>
			        </div>
			        <div class="card2">
			            <p class="p_style" id="spedizione"></p>
			        </div>
			
			      </div>
			      <div class="totale_parziale">
			        <div class="prova">
			
			        </div>
			        <div class="card">
			              <h2 class="h2_style">Totale:</h2>
			        </div>
			        <div class="card2">
			          <p class="p_style" id="prezzoTot"></p>
			        </div>
			      </div>
			      <div class="totale_parziale">
			        <div class="prova">
			
			        </div>
			        <div class="card">
			             
			        </div>
			        <div class="card2">
			          <div id="procedi" > 
								<button type="submit" class="noselect2"><span class="text">Acquista</span><span class="icon"> <img id="checkbox" src="./Images/checkbox.png" alt=""></span></button> 
						</div> 
			        </div>
			      </div>
     
    		</div>
		</form>
		
		
		
		<% } %>
		<script src="./JS/updateCart.js"></script>
	<jsp:include page="./footer.jsp" />
</body>
</html>