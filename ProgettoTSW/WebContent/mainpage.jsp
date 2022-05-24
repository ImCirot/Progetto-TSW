<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*" import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Snackz</title>
<link rel="stylesheet" href="./Css/mainpage.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap%27">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<!-- <script src="./JS/addedToCart.js"></script> -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
  <jsp:include page="./header.jsp" />
  <div class="container-catalogo">

  	<% 
  	Boolean admin = (boolean) request.getSession().getAttribute("admin");
		if((admin != null) && admin) {
	%>
		<div class="prodotto">
			<a href="gestisciProdotti">
			<img src="https://raw.githubusercontent.com/ImCirot/Progetto-TSW/main/Immagini%20catalogo/plus.png" alt="aggiungiProdotto">
			</a>
			<h4>Gestisci prodotti</h4>
		</div>
	<% }
  	List<ProdottoBean> prodotti = (List<ProdottoBean>) request.getSession().getAttribute("prodotti");
  		List<DettaglioProdottoBean> dettagliProdotti = (List<DettaglioProdottoBean>) request.getSession().getAttribute("dettagliProdotti");
  		Iterator<ProdottoBean> iterProdotto = prodotti.iterator();
  		Iterator<DettaglioProdottoBean> iterDettagli;
  		ProdottoBean prodotto = new ProdottoBean();
  		DettaglioProdottoBean dettagli = new DettaglioProdottoBean(); %>
		
  		<% while(iterProdotto.hasNext()){
  			prodotto = iterProdotto.next();
  			iterDettagli = dettagliProdotti.iterator();
  			while(iterDettagli.hasNext()){
  				dettagli = iterDettagli.next();
  				if(prodotto.getCodiceSeriale().equals(dettagli.getProdotto())) break;
  			}%>
			
		<div class="prodotto">
				<div class="posizione">
  				<a href="SelectProdottoServlet?prodotto=<%out.println(prodotto.getCodiceSeriale());%>">	
  				<img src="<% out.println(dettagli.getImmagine()); %>" alt="prodotto">
  				</a>
  				</div>
  				<div class="posizione">
  				<h2><% out.println(prodotto.getNome()); %></h2>
  				</div>
  				<div class="posizione">
  				<p class="prezzo"><% out.println(dettagli.getCostoUnitario().toPlainString()); %>&euro;</p>
  				</div>
  				<div class="posizione">
  				<form action="Carrello" method="get">
  					<input type="hidden" id="mode" name="mode" value="add">
  					<input type="hidden" id="prodotto" name="prodotto" value="<% out.print(prodotto.getCodiceSeriale()); %>">
  					<input type="hidden" id="quantita" value="1" name="quantita">
  					<input type="hidden" id="catalogo" value="catalogo" name="catalogo">
  					<button id="addToCart<% out.print(prodotto.getCodiceSeriale());%>" type="submit">Acquista</button>
  					<input type="hidden" name="mode" value="add">
  					<input type="hidden" name="prodotto" value="<% out.print(prodotto.getCodiceSeriale()); %>">
  					<input type="hidden" value="1" name="quantita">
  					<input type="hidden" value="catalogo" name="catalogo">
					<button class="addToCart" type="submit">Acquista</button>
  				</form>
  				</div>
  				 <div class="inside">
    				<div class="icon"><i class="material-icons">info_outline</i></div>
    				<div class="contents">
      					<p><% out.println(prodotto.getDescrizioneBreve());%></p>
    				</div>
  					</div>
  				<p id="added">Aggiunto al carrello!</p>
  			</div>	
  		<% } %>
  		</div>
</body>
</html>
