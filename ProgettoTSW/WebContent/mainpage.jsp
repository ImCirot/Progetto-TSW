<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*" import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Snackz</title>
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
  		DettaglioProdottoBean dettagli = new DettaglioProdottoBean();

  		while(iterProdotto.hasNext()){
  			prodotto = iterProdotto.next();
  			iterDettagli = dettagliProdotti.iterator();
  			while(iterDettagli.hasNext()){
  				dettagli = iterDettagli.next();
  				if(prodotto.getCodiceSeriale().equals(dettagli.getProdotto())) break;
  			}%>

  			<div class="prodotto">
  				<a href="SelectProdottoServlet?prodotto=<%out.println(prodotto.getCodiceSeriale());%>">
  				<img src="<% out.println(dettagli.getImmagine()); %>" alt="prodotto">
  				</a>
  				<h4><% out.println(prodotto.getNome()); %></h4>
  				<p class="prezzo"><% out.println(dettagli.getCostoUnitario().toPlainString()); %>&euro;</p>
  			</div>

  		<%} %>
  		
  </div>
  <jsp:include page="./footer.jsp" />
</body>
</html>
