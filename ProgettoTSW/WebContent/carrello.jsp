<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./Css/carrello.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap%27">
<title>Snackz</title>
</head>
<body>
	<jsp:include page="./header.jsp" />
	<h1>Carrello</h1>
	<div class="cart-container">
	
		<% Map<String,Integer> carrello = (Map<String,Integer>) request.getSession().getAttribute("carrello");
		if(carrello != null){
			Iterator<String> iterKeys = carrello.keySet().iterator();
			List<ProdottoBean> prodotti = (List<ProdottoBean>) request.getSession().getAttribute("prodotti");
			List<DettaglioProdottoBean> dettagliProdotti = (List<DettaglioProdottoBean>) request.getSession().getAttribute("dettagliProdotti");
			Double costoTot = 0.0;
			
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
				
				costoTot += dettagli.getCostoUnitario().doubleValue() * quantita;
				%>
				  
				     <div class="cart-container-interno">
				        <div class="info">
				        <img src="<% out.print(dettagli.getImmagine()); %>" alt="ciao">
				        </div>
				        <div class="info">
				        <p><% out.print(prodotto.getNome()); %></p>
				        </div>
				        <div class="info">
				          <p> <% out.print(dettagli.getCostoUnitario()); %></p>
				        </div>
				        <div class="info">
				         <form action="Carrello" method="get"> 
							<input type="hidden" name="prodotto" value="<%out.print(prodotto.getCodiceSeriale());%>">
							<input type="hidden" name="mode" value="update">
							<input type="number" placeholder="Quantità" name="quantita" value="<% out.print(quantita); %>">
							<button type="submit" name="Aggiorna">Aggiorna</button>
						</form>
				        </div>
				        <div class="info">
						<form action="Carrello" method="get">
							<input type="hidden" name="prodotto" value="<%out.print(prodotto.getCodiceSeriale());%>">
							<input type="hidden" name="mode" value="remove">
							<button type="submit" name="Rimuovi">Rimuovi</button>
						</form>
				    </div>
				</div>
			<%}%>
			<div class="totale">
				<div class="totale-interno">
						<h2>Costo Totale Ordine</h2>
							<p>
							<% 
							out.println(String.format("%.2f", costoTot));%> &euro;
							</p>

				<p>Prezzo totale<br>
					<%out.println(String.format("%.2f", costoTot));%> &euro;
				</p>
				<form action="ordine" method="get">
					<input type="hidden" name="costoTot" value="<%out.print(costoTot);%>">
					<button type="submit">Procedi all'acquisto</button>
				</form>
				<form action="Carrello" method="get">
					<input type="hidden" name="mode" value="reset">
					<button type="submit">Pulisci carrello</button>
				</form>
					</div>
				</div>
			</div>
			<%} else {%>
			<div class="carrello-vuoto">
			<p>Carrello vuoto!</p>
			</div >
			<%}%>
		<jsp:include page="./footer.jsp" />

</body>
</html>