<%@page import="model.DettaglioProdottoBean"%>
<%@page import="model.ProdottoBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Snackz</title>
<link rel="stylesheet" href="./Css/style.css">
</head>
<body>
	<% ProdottoBean prodotto = (ProdottoBean) request.getAttribute("prodotto");
		DettaglioProdottoBean dettagli = (DettaglioProdottoBean) request.getAttribute("dettagliProdotto");
	%>
	<jsp:include page="./header.jsp" />
  <div class="prodottoDettagli">
    <img src="<%out.println(dettagli.getImmagine());%>" alt="immagineProdotto">
    <div class="descrizione">
      <p class="prezzo"><%out.println(dettagli.getCostoUnitario());%>&euro;</p>
      <p><%out.println(prodotto.getDescrizioneBreve());%></p>
      <button>Acquista</button>
    </div>
  </div>
	<jsp:include page="./footer.jsp" />
</body>
</html>
