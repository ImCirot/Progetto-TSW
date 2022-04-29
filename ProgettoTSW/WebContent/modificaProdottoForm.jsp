<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Snackz</title>
</head>
<body>
	<jsp:include page="./header.jsp" />
	<div class="modificaForm">
	<form action="modificaProdotto" method="post">
		<h4>Riempi i campi che vuoi cambiare con la modifica</h4>
		<input type = "hidden" name = "mode" value = "modifica">
		 <label for="codiceSeriale">Codice Seriale</label><br>
	      <input type="text" name="codiceSeriale" placeholder="Codice seriale"><br><br>
	      <label for="nome">Nome</label><br>
	      <input type="text" name="nome" placeholder="Nome"><br><br>
	      <label for="marca">Marca</label><br>
	      <input type="text" name="marca" placeholder="Marca"><br><br>
	      <label for="desc">Descrizione</label><br>
	      <textarea name="desc" rows="8" cols="80"></textarea><br><br>
	      <label for="edLimitata">Edizione Limitata</label><br>
	      <select name="edLimitata">
	        <option value="si">Si</option>
	        <option value="no">No</option>
	      </select><br><br>
	      <label for="tipo">Tipo prodotto</label><br>
	      <input type="text" name="tipo" placeholder="Snack o drink"><br><br>
	      <label for="costo">Costo</label><br>
	      <input type="text" name="costo" placeholder="Costo unitario"><br><br>
	      <label for="IVA">IVA</label><br>
	      <input type="text" name="IVA" placeholder="IVA"><br><br>
	      <label for="quantita">Quantita'</label><br>
	      <input type="text" name="quantita" placeholder="Quantita'"><br><br>
	      <label for="origine">Origine</label><br>
	      <input type="text" name="origine" placeholder="Origine"><br><br>
	      <label for="scadenza">Data scadenza</label><br>
	      <input type="date" name="scadenza"><br><br>
	      <label for="peso">Peso</label><br>
	      <input type="text" name="peso" placeholder="Lascia vuoto e usa volume per i drink"><br><br>
	      <label for="volume">Volume</label><br>
	      <input type="text" name="volume" placeholder="Lascia vuoto e usa peso per gli snack"><br><br>
	      <label for="img">Link immagine</label><br>
	      <input type="text" name="img" placeholder="Vai su gdurl, genera link e incollalo qui"><br><br>
	      <input type="submit" value="Modifica Prodotto">
	</form>
	</div>
	<jsp:include page="./footer.jsp" />
</body>
</html>