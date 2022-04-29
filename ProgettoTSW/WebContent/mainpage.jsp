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
  	<% List<ProdottoBean> prodotti = (List<ProdottoBean>) request.getAttribute("prodotti");
  		List<DettaglioProdottoBean> dettagliProdotti = (List<DettaglioProdottoBean>) request.getAttribute("dettagliProdotti");
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
  			}
  			%>

  			<div class="prodotto">
  				<a href="SelectProdottoServlet?prodotto=<%out.println(prodotto.getCodiceSeriale());%>">
  				<img src="<% out.println(dettagli.getImmagine()); %>" alt="prodotto">
  				</a>
  				<h4><% out.println(prodotto.getNome()); %></h4>
  				<p class="prezzo"><% out.println(dettagli.getCostoUnitario().toPlainString()); %>&euro;</p>
  				
  			</div>

  		<%}%>
  </div>
  <jsp:include page="./footer.jsp" />
</body>
</html>
