<%@page import="model.DettaglioProdottoBean"%>
<%@page import="model.ProdottoBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Snackz</title>
</head>
<body>
	<% ProdottoBean prodotto = (ProdottoBean) request.getAttribute("prodotto");
		DettaglioProdottoBean dettagli = (DettaglioProdottoBean) request.getAttribute("dettagli");
	%>
	<jsp:include page="./header.jsp" />
	<div class="modificaForm">
	<form action="modificaProdotto" method="post">
		<h4>Riempi i campi che vuoi cambiare con la modifica</h4>
		<input type = "hidden" name = "mode" value = "modifica">
		 <input type ="hidden" name ="prodotto" value="<% out.println(prodotto.getCodiceSeriale());%>">
	      <label for="nome">Nome</label><br>
	      <input type="text" name="nome" placeholder="Nome" value="<%out.println(prodotto.getNome());%>"><br><br>
	      <label for="marca">Marca</label><br>
	      <input type="text" name="marca" placeholder="Marca" value="<%out.println(prodotto.getMarca());%>"><br><br>
	      <label for="desc">Descrizione</label><br>
	      <textarea name="desc" rows="8" cols="80"><% out.println(prodotto.getDescrizioneBreve());%></textarea><br><br>
	      <label for="edLimitata">Edizione Limitata</label><br>
	      <select name="edLimitata">
	      <% if(prodotto.isEdLimitata()) {%>
	      	<option selected value="si">Si</option>
	        <option value="no">No</option>
	      <% } else { %>
	        <option value="si">Si</option>
	        <option selected value="no">No</option>
	      <% } %>
	      </select><br><br>
	      <label for="tipo">Tipo prodotto</label><br>
	      <input type="text" name="tipo" placeholder="Snack o drink" value="<%out.println(dettagli.getTipo());%>"><br><br>
	      <label for="costo">Costo</label><br>
	      <input type="text" name="costo" placeholder="Costo unitario" value="<%out.println(dettagli.getCostoUnitario().toString());%>"><br><br>
	      <label for="IVA">IVA</label><br>
	      <input type="text" name="IVA" placeholder="IVA" value="<%out.println(dettagli.getIVA());%>"><br><br>
	      <label for="quantita">Quantita'</label><br>
	      <input type="text" name="quantita" placeholder="Quantita'" value="<%out.println(dettagli.getQuantita());%>"><br><br>
	      <label for="origine">Origine</label><br>
	      <input type="text" name="origine" placeholder="Origine" value="<%out.println(dettagli.getOrigine());%>"><br><br>
	      <label for="scadenza">Data scadenza</label><br>
	      <input type="text" name="scadenza" value="<%out.println(dettagli.getScadenza().toString());%>"><br><br>
	      <% if(dettagli.getTipo().equalsIgnoreCase("snack")){ %>
	    	  <label for="peso">Peso</label><br>
		      <input type="text" name="peso" placeholder="Peso" value="<%out.println(dettagli.getPeso());%>"><br><br>
	      <%} else {%>
	      <label for="volume">Volume</label><br>
	      <input type="text" name="volume" placeholder="Volume" value="<%out.println(dettagli.getVolume());%>"><br><br>
	      <%} %>
	      <label for="img">Link immagine</label><br>
	      <input type="text" name="img" placeholder="Vai su gdurl, genera link e incollalo qui" value="<%out.println(dettagli.getImmagine());%>"><br><br>
	      <input type="submit" value="Modifica Prodotto">
	</form>
	</div>
	<jsp:include page="./footer.jsp" />
</body>
</html>