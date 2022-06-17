<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8" import="model.*" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
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
		<div class="gestione">
		<a href="gestisciProdotti"></a>
        <div class="grid-card" id="img-aggiungi">
          <div class="img">
            <img src="https://raw.githubusercontent.com/ImCirot/Progetto-TSW/main/Immagini%20catalogo/plus.png" alt="aggiungiProdotto">
          </div>
          
          <div class="nome_prodotto">
            <h2>Gestisci prodotti</h2>
          </div>
          
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
        <div class="cliccabile" onclick="click('<%out.print(prodotto.getCodiceSeriale());%>')">
        <a href="select?type=prodotto&prodotto=<%out.println(prodotto.getCodiceSeriale());%>"></a>
          <div class="img">
            <img src="<% out.println(dettagli.getImmagine()); %>" alt="prodotto">
          </div>
          <div class="nome_prodotto">
            <h2><% out.println(prodotto.getNome()); %></h2>
          </div>
          <div class="prezzo">
            <p><% out.println(dettagli.getCostoUnitario().toPlainString()); %>&euro;</p>
          </div>
          </div>
          <div class="acquista">
          	<button class="addtocart" id="added<% out.print(prodotto.getCodiceSeriale()); %>" onclick="addToCart('<% out.print(prodotto.getCodiceSeriale());%>')">
				  <div class="pretext">
				     Acquista
				  </div>
				  
				  <div class="pretext done" id="done<% out.print(prodotto.getCodiceSeriale()); %>">
				    <div class="posttext"> Aggiunto</div>
				  </div>
				  
				</button>
          </div>
          <div class="inside">
      				<div class="icon"><i class="material-icons">info_outline</i></div>
      				<div class="contents">
        					<p><% out.println(prodotto.getDescrizioneBreve());%></p>
      				</div>
    					</div>
        </div>
        <% } %>
      </div>
	<jsp:include page="./footer.jsp" />
	<script src="./JS/addedToCart.js"></script>
	<script>
    $(".cliccabile").click(function(){
        window.location=$(this).find("a").attr("href");
        return false;
      });
	</script>
	 <script type="text/javascript">
      $(".gestione").click(function(){
        window.location=$(this).find("a").attr("href");
        return false;
      });
    </script>
</body>
</html>