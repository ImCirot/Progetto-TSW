<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*" import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Snackz</title>
<link rel="stylesheet" href="./Css/catalogo.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap%27">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
  <jsp:include page="./header.jsp" />
 	 <% 
  	Boolean empty = (boolean) request.getSession().getAttribute("empty");
  	if(empty){%>
  		<h1>Nessun prodotto trovato!</h1>
  	<% } else { 
  	if(request.getSession().getAttribute("search") != null) {%>
  	<h3>Risultati della ricerca "<%out.print(request.getSession().getAttribute("search"));%>"</h3>
  	<% } request.getSession().removeAttribute("search"); %>
  <div class="section">
  	<% Boolean admin = (boolean) request.getSession().getAttribute("admin");
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
  	List<ProdottoBean> prodottiTrovati = (List<ProdottoBean>) request.getSession().getAttribute("prodottiTrovati");
  		List<DettaglioProdottoBean> dettagliProdotti = (List<DettaglioProdottoBean>) request.getSession().getAttribute("dettagliProdotti");
  		Iterator<ProdottoBean> iterProdotto = prodottiTrovati.iterator();
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
        <a href="Select?type=prodotto&prodotto=<%out.println(prodotto.getCodiceSeriale());%>"></a>
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
  		<% } %>
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