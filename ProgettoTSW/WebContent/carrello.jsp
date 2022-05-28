<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./Css/carrello.css">

<title>Snackz</title>
</head>
<body>
	<jsp:include page="./header.jsp" />
	<h1>Carrello</h1>
	<div class="cart-container">
		
		<% Map<String,Integer> carrello = (Map<String,Integer>) request.getSession().getAttribute("carrello");
		if(carrello == null){%>
			<div class="carrello-vuoto">
				<p>Carrello vuoto!</p>
			</div>
			<%}else{ 
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
				        <div class="info-prodotto">
				        	<img src="<% out.print(dettagli.getImmagine()); %>" alt="ciao">
				        </div>
				        <div class="info-prodotto">
				        <p><% out.print(prodotto.getNome()); %></p>
				        </div>
				        <div class="info-prodotto">
				          <p> <% out.print(dettagli.getCostoUnitario()); %> &euro;</p>
				        </div>
				        <div class="info-prodotto" class="flex-el">
				         <form action="Carrello" method="get"> 
							<input type="hidden" name="prodotto" value="<%out.print(prodotto.getCodiceSeriale());%>">
							<input type="hidden" name="mode" value="update">
							<input type="number" placeholder="Quantità" name="quantita" value="<% out.print(quantita); %>">
							
						</form>
				        </div>
				        <div class="info-prodotto class="flex-el"">
						<form action="Carrello" method="get">
							<input type="hidden" name="prodotto" value="<%out.print(prodotto.getCodiceSeriale());%>">
							<input type="hidden" name="mode" value="remove">
							
							<button class="noselect"><span class="text">Rimuovi</span><span class="icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M24 20.188l-8.315-8.209 8.2-8.282-3.697-3.697-8.212 8.318-8.31-8.203-3.666 3.666 8.321 8.24-8.206 8.313 3.666 3.666 8.237-8.318 8.285 8.203z"></path></svg></span></button>
						</form>
				    </div>
				</div>
			<%}%>
			<div class="totale">
				<div class="totale-interno">
				<div id="costo" class="totale-interno-disposizione">
						<h2>Costo Totale Ordine</h2>
						</div>
						<div id="prezzo" class="totale-interno-disposizione">
							<p>
							<% 
							out.println(String.format("%.2f", costoTot));%> &euro;
							</p>
						</div>
				<div id="procedi" class="totale-interno-disposizione">
				<form action="ordine" method="get">
					<input type="hidden" name="costoTot" value="<%out.print(costoTot);%>">
					<button class="noselect2"><span class="text">Procedi</span><span class="icon"> <img id="checkbox" src="./Images/checkbox.png" alt=""></span></button>
				</form>
				</div>
				<div id="pulisci" class="totale-interno-disposizione">
				<form action="Carrello" method="get">
					<input type="hidden" name="mode" value="reset">
					<button  type="submit">Pulisci carrello</button>
				</form>
				</div>
					</div>
				</div>
				<%} %>
			</div>
		
		<jsp:include page="./footer.jsp" />
</body>
</html>