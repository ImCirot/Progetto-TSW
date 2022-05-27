<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8" import="model.*" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="./Css/catalogo.css">
	<title>Snackz</title>
</head>
<body>
	<jsp:include page="./header.jsp" />
	  <div class="section">
	<% 
  	Boolean admin = (boolean) request.getSession().getAttribute("admin");
		if((admin != null) && admin) {
	%>
        <div class="grid-card">
        <a id="gestisciProdotto" href="gestisciProdotti"></a>
          <div class="img">
            <img src="https://raw.githubusercontent.com/ImCirot/Progetto-TSW/main/Immagini%20catalogo/plus.png" alt="aggiungiProdotto">
          </div>
          <div class="nome_prodotto">
            <h2>Gestisci prodotti</h2>
          </div>
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
        <div class="grid-card">
        <a href="SelectProdottoServlet?prodotto=<%out.println(prodotto.getCodiceSeriale());%>"></a>
          <div class="img">
            <img src="<% out.println(dettagli.getImmagine()); %>" alt="prodotto">
          </div>
          <div class="nome_prodotto">
            <h2><% out.println(prodotto.getNome()); %></h2>
          </div>
          <div class="prezzo">
            <p><% out.println(dettagli.getCostoUnitario().toPlainString()); %>&euro;</p>
          </div>
          <div class="acquista">
            <button type="submit" onclick="addToCart('<% out.print(prodotto.getCodiceSeriale());%>')">Acquista</button>
          </div>
          <div class="inside">
      				<div class="icon"><i class="material-icons">info_outline</i></div>
      				<div class="contents">
        					<p><% out.println(prodotto.getDescrizioneBreve());%></p>
      				</div>
    					</div>
    	  <p id="added<% out.print(prodotto.getCodiceSeriale());%>" class="addMessage">Aggiunto al carrello!</p>
        </div>
        
        <div class="grid-card">
          <div class="img">
            <img src="./Images/prova.png" alt="">
          </div>
          <div class="nome_prodotto">
            <h2>Dr. Pepper</h2>
          </div>
          <div class="prezzo">
            <p>5</p>
          </div>
          <div class="acquista">
            <button type="button" name="button">Acquista</button>
          </div>
          <div class="inside">
      				<div class="icon"><i class="material-icons">info_outline</i></div>
      				<div class="contents">
        					<p></p>
      				</div>
    					</div>
        </div>
        
        

        <% } %>

      </div>
	<jsp:include page="./footer.jsp" />
	<script src="./JS/addedToCart.js"></script>
</body>
</html>