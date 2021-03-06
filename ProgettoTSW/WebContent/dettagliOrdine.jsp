<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./Css/dettagliOrdine.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap%27">
<title>Snackz</title>
</head>
<body>
	<jsp:include page="./header.jsp" />
	<% if(request.getAttribute("acquisto") != null){ 
	request.removeAttribute("acquisto");
	response.setHeader("Cache-Control","no-cache");
	  response.setHeader("Cache-Control","no-store");
	  response.setHeader("Pragma","no-cache");
	  response.setDateHeader ("Expires", 0);%>
	<h1 style="text-align: center;">Acquisto affettuato!</h1>
	<% } %>
	<div class="container">
	<% OrdineBean ordine = (OrdineBean) request.getAttribute("ordine");
		List<ComposizioneOrdineBean> composizioneOrdine = (List<ComposizioneOrdineBean>) request.getAttribute("composizione");
		Iterator<ComposizioneOrdineBean> iterComposizione = composizioneOrdine.iterator();
		ComposizioneOrdineBean singolaComposizione = new ComposizioneOrdineBean();
		List<DettaglioProdottoBean> listaDettagli = (List<DettaglioProdottoBean>) request.getSession().getAttribute("dettagliProdotti");
		Iterator<DettaglioProdottoBean> iterDettagli = null;
		DettaglioProdottoBean dettaglio = new DettaglioProdottoBean();
		%>
		
		<div class="container-ordine">
		<h1>Ordine #<% out.println(ordine.getNumOrdineProgressivo()); %></h1>
		<h3>Cliente: <% out.println(ordine.getCliente()); %></h3>
		</div>
		<div class="container-tabella">
			<table class="table">
			     <thead>
			     	<tr>
			     	 <th>Codice seriale prodotto</th>
			     	 <th>Quantita</th>
			     	 <th>Prezzo</th>
			     	 <th>Immagine</th> 
			     	</tr>
			     </thead>
			     	<% while(iterComposizione.hasNext()){
						singolaComposizione = iterComposizione.next();
						iterDettagli = listaDettagli.iterator();
						while(iterDettagli.hasNext()){
							dettaglio = iterDettagli.next();
							if(dettaglio.getProdotto().equals(singolaComposizione.getProdotto())) break;
						}
					%>
			     <tbody>
			     	  <tr>
			     	  	  <td data-label="Nome prodotto"><% out.println(singolaComposizione.getProdotto());%></td>
			     	  	  <td data-label="Quantita"><% out.println(singolaComposizione.getQuantitaProdotto()); %></td>
			     	  	  <td data-label="Prezzo"><% out.println(singolaComposizione.getCostoUnitario()); %> &euro;</td>
			     	  	  <td data-label="Immagine"><img style="width:100px" src=" <% out.print(dettaglio.getImmagine()); %>"></td>  
			     	  </tr> 
			     </tbody>
			     <% } %>
   			</table>
		</div>
		
		<div class="container-info">

		<p>
			<% if((ordine.getCostoTotale().doubleValue() - 5) < 45) {%>
			<strong>Totale prodotti</strong>: <% out.println(String.format("%.2f",ordine.getCostoTotale().doubleValue() - 5)); %> &euro;
			<% } else { %>
			<strong>Totale prodotti</strong>: <% out.println(String.format("%.2f",ordine.getCostoTotale())); %> &euro;
			<% } %>
		</p>
		
		<p> 
		<% if((ordine.getCostoTotale().doubleValue() - 5) < 45) {%>
			<strong>Spedizione</strong>: 5.00 &euro;
			<% } else { %>
			<strong>Spedizione</strong>: 0.00 &euro;
			<% } %>
		</p>
		<p>
			<strong>Totale</strong>: <% out.println(String.format("%.2f",ordine.getCostoTotale())); %> &euro;
		</p>
			<p>
  				<strong>Spedito a</strong>: <% out.println(ordine.getVia() + " " + ordine.getCivico() + " ");
  					out.println(ordine.getCitta() + ", " + ordine.getProvincia() + " " + ordine.getCAP());
  					out.println(ordine.getNazione()); %>
  			</p>

			<p>
				<strong>Pagato Con</strong>: <% out.println(ordine.getTipoPagamento().toUpperCase());%>
				<br><br>
				<% if(ordine.getTipoPagamento().equals("carta")){%>
				 <strong>Num. Carta: </strong>
					<% out.println(ordine.getNumCarta());
					 } else { %>
					<strong>Num. IBAN:</strong>
					 <% out.println(ordine.getIBAN());
					 } %>
			</p>
			</div>
		</div>
		<div class="genera">
			<form action="fattura" method="post">
				<input type="hidden" name="ordine" value="<% out.print(ordine.getNumOrdineProgressivo()); %>">
				<input type="hidden" name="cliente" value="<% out.print(ordine.getCliente()); %>">
				<button id="bottone_fattura" type="submit">Genera fattura</button>
			</form>
		</div>
	<jsp:include page="./footer.jsp" />
</body>
</html>