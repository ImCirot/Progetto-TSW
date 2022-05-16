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
	
	<div class="container">
	<% OrdineBean ordine = (OrdineBean) request.getAttribute("ordine");
		List<ComposizioneOrdineBean> composizioneOrdine = (List<ComposizioneOrdineBean>) request.getAttribute("composizione");
		Iterator<ComposizioneOrdineBean> iterComposizione = composizioneOrdine.iterator();
		ComposizioneOrdineBean singolaComposizione = new ComposizioneOrdineBean();%>
		
		
		<div class="container-ordine">
		<h1>Ordine num: <% out.println(ordine.getNumOrdineProgressivo()); %></h1>
		<h3>Cliente: <% out.println(ordine.getCliente()); %></h3>
		</div>
		<div class="container-tabella">
		<table border="1">
		<tr>
			<th>Codice Seriale</th>
			<th>Quantità</th>
			<th>Costo Unitario</th>
		</tr>
		<% while(iterComposizione.hasNext()){
			singolaComposizione = iterComposizione.next();
		%>
		<tr>
			<td><% out.println(singolaComposizione.getProdotto());%></td>
			<td><% out.println(singolaComposizione.getQuantitaProdotto()); %></td>
			<td><% out.println(singolaComposizione.getCostoUnitario()); %></td>
		</tr>
		<% } %>
		</table>
		</div>
		
		<div class="container-info">

		<p>
			<strong>Totale</strong>: <% out.println(ordine.getCostoTotale()); %> &euro;
		</p>
		
			<p>
  				<strong>Spedito a</strong>: <% out.println(ordine.getVia() + " " + ordine.getCivico() + " ");
  					out.println(ordine.getCitta() + ", " + ordine.getProvincia() + " " + ordine.getCAP());
  					out.println(ordine.getNazione()); %>
  			</p>

			<p>
				<strong>Pagato Con</strong>: <% out.println(ordine.getTipoPagamento());
				 if(ordine.getTipoPagamento().equals("carta")){
					out.println(ordine.getNumCarta());
					 } else { 
					 	out.println(ordine.getIBAN());
					 } %>
			</p>
			</div>
		</div>
		<script type="text/javascript" src="./Js/fatturapdf.js"></script>
	<jsp:include page="./footer.jsp" />
</body>
</html>