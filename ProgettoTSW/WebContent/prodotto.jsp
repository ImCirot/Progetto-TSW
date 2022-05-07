<%@page import="model.DettaglioProdottoBean"%>
<%@page import="model.ProdottoBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Snackz</title>
<link rel="stylesheet" href="./Css/prodotto.css">
</head>
<body>
	<% ProdottoBean prodotto = (ProdottoBean) request.getAttribute("prodotto");
		DettaglioProdottoBean dettagli = (DettaglioProdottoBean) request.getAttribute("dettagliProdotto");
	%>
	<jsp:include page="./header.jsp" />
<form action="Carrello" method="get">
  <div class="prodottoDettagli">
    <img src="<%out.println(dettagli.getImmagine());%>" alt="immagineProdotto">
    <div class="descrizione">
      <p class="prezzo"><%out.println(dettagli.getCostoUnitario());%>&euro;</p>
      <p><%out.println(prodotto.getDescrizioneBreve());%></p>
      	<input type="hidden" name="prodotto" value="<% out.print(prodotto.getCodiceSeriale());%>">
      	<input type="number" name="quantita" min="1" max="<% out.print(dettagli.getQuantita());%>" value="1"><br><br>
      	<button type="submit">Aggiungi al carrello</button>
      	
      	<% String aggiunto = (String) request.getSession().getAttribute("aggiunto");
      	request.getSession().removeAttribute("aggiunto");
      	
      		if(aggiunto != null){ %>
      		<p>
      		<%out.println(aggiunto);%>
      		</p>	
      		<%}%>
    </div>
  </div>
</form>
	<jsp:include page="./footer.jsp" />
</body>
</html>
