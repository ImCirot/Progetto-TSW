<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Snackz</title>
</head>
<body>
	<jsp:include page="./header.jsp" />
	
	<% OrdineBean ordine = (OrdineBean) request.getAttribute("ordine");
		List<ComposizioneOrdineBean> composizioneOrdine = (List<ComposizioneOrdineBean>) request.getAttribute("composizione");
		Iterator<ComposizioneOrdineBean> iterComposizione = composizioneOrdine.iterator();
		ComposizioneOrdineBean singolaComposizione = new ComposizioneOrdineBean();%>
		
		<h4>Ordine num: <% out.println(ordine.getNumOrdineProgressivo()); %></h4>
		<h3>Cliente: <% out.println(ordine.getCliente()); %></h3>
		<table border="1">
		<tr>
			<th>CodiceSeriale</th>
			<th>Quantita</th>
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
		
		<h4>Totale</h4>
		<p>
			<% out.println(ordine.getCostoTotale()); %>
		</p>
		<h4>Spedito a</h4>
			<p>
  				<% out.println(ordine.getVia() + " " + ordine.getCivico() + " ");
  					out.println(ordine.getCitta() + ", " + ordine.getProvincia() + " " + ordine.getCAP());
  					out.println(ordine.getNazione()); %>
  			</p>
		<h4>Pagato con</h4>
			<p>
				<% out.println(ordine.getTipoPagamento());
				 if(ordine.getTipoPagamento().equals("carta")){
					out.println(ordine.getNumCarta());
					 } else { 
					 	out.println(ordine.getIBAN());
					 } %>
			</p>
	<jsp:include page="./footer.jsp" />
</body>
</html>