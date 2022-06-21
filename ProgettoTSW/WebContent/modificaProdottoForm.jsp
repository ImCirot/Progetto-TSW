<%@page import="model.DettaglioProdottoBean"%>
<%@page import="model.ProdottoBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./Css/gestisciProdotti.css">
<title>Snackz</title>
</head>
<body>
	<% ProdottoBean prodotto = (ProdottoBean) request.getAttribute("prodotto");
		DettaglioProdottoBean dettagli = (DettaglioProdottoBean) request.getAttribute("dettagli");
	%>
	<jsp:include page="./header.jsp" />
	<div class="container_form">
  	  <h3>Riempi i campi che vuoi cambiare con la modifica</h3>
	  	   <form action="modificaProdotto" method="post">
			<input type = "hidden" name = "mode" value = "modifica">
			 <input type ="hidden" name ="prodotto" value="<%out.print(prodotto.getCodiceSeriale());%>">
	    <div class="row">
	      <div class="col-25">
	        <label for="nome">Nome</label>
	      </div>
	      <div class="col-75">
	        <input required type="text" id="nome" name="nome" placeholder="Nome" value="<%out.print(prodotto.getNome());%>">
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-25">
	        <label for="marca">Marca</label>
	      </div>
	      <div class="col-75">
	        <input required type="text" id="marca" name="marca" placeholder="Marca" value="<%out.print(prodotto.getMarca());%>" >
	      </div>
	    </div>
	     <div class="row">
	      <div class="col-25">
	        <label for="desc">Descrizione</label>
	      </div>
	      <div class="col-75">
	        <textarea required id="desc" name="desc" style="height:200px"><%out.print(prodotto.getDescrizioneBreve());%></textarea>
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-25">
	        <label for="edLimitata">Edizione Limitata</label>
	      </div>
	      <div class="col-75">
	        <select required id="edLimitata" name="edLimitata">
	          <% if(prodotto.isEdLimitata()) {%>
		      	<option selected value="si">Si</option>
		        <option value="no">No</option>
		      <% } else { %>
		        <option value="si">Si</option>
		        <option selected value="no">No</option>
		      <% } %>
	        </select>
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-25">
	        <label for="tipo">Tipo prodotto</label>
	      </div>
	      <div class="col-75">
	        <input required type="text" id="tipo" name="tipo" placeholder="Snack o drink" value="<%out.print(dettagli.getTipo());%>">
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-25">
	        <label for="costo">Costo</label>
	      </div>
	      <div class="col-75">
	        <input required type="text" id="costo" name="costo" placeholder="Costo unitario" value="<%out.print(dettagli.getCostoUnitario());%>">
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-25">
	        <label for="sconto">Prezzo scontanto</label>
	      </div>
	      <div class="col-75">
	       <% if (dettagli.getPrezzoScontato() != null) { %>
		      <input type="text" name="sconto" placeholder="Prezzo scontato" value="<%out.print(dettagli.getPrezzoScontato().toString());%>">
		      <% } else { %>
		      <input type="text" name="sconto" placeholder="Prezzo scontato" value="">
		      <% } %>
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-25">
	        <label for="IVA">IVA</label>
	      </div>
	      <div class="col-75">
	        <input required type="text" id="IVA" name="IVA" placeholder="22%.." value="<%out.print(dettagli.getIVA());%>">
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-25">
	        <label for="quantita">Quantita</label>
	      </div>
	      <div class="col-75">
	        <input required type="text" id="quantita" name="quantita" placeholder="1,2,3..." value="<%out.print(dettagli.getQuantita());%>">
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-25">
	        <label for="origine">Origine</label>
	      </div>
	      <div class="col-75">
	        <input required type="text" id="origine" name="origine" placeholder="America, Giappone..." value="<%out.print(dettagli.getOrigine());%>">
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-25">
	        <label for="scadenza">Scadenza</label>
	      </div>
	      <div class="col-75">
	        <input required type="date" id="scadenza" name="scadenza" placeholder="20-10-2022" value="<%out.print(dettagli.getScadenza().toString());%>">
	      </div>
	    </div>
	    <% if(dettagli.getTipo().equalsIgnoreCase("snack")){ %>
	    <div class="row">
	      <div class="col-25">
	        <label for="peso">Peso</label>
	      </div>
	      <div class="col-75">
	        <input required type="text" id="peso" name="peso" value="<%out.print(dettagli.getPeso());%>">
	      </div>
	    </div>
	    <%} else {%>
	    <div class="row">
	      <div class="col-25">
	        <label for="volume">Volume</label>
	      </div>
	      <div class="col-75">
	        <input required type="text" id="volume" name="volume" value="<%out.print(dettagli.getVolume());%>">
	      </div>
	    </div>
	    <%}%>
	    <div class="row">
	      <div class="col-25">
	        <label for="img">Immagine</label>
	      </div>
	      <div class="col-75">
	        <input type="text" id="img" name="img" placeholder="Vai su gitHub, genera link e incollalo qui" value="<%out.print(dettagli.getImmagine());%>">
	      </div>
	    </div>
	    <div class="row">
	      <input type="submit" value="Modifica Prodotto">
	    </div>
	  </form>
</div>
	<jsp:include page="./footer.jsp" />
	<script>
	$(document).ready(function() {
		$("#marca").keyup(function() {
			let marca = $("#marca").val();

			if(marca.match("suca")){
				$("#error-marca").text("marche combaciano");
				
			} else {
				$("#error-marca").text("marche non combaciano");
			}
		});
	});
	</script>
</body>
</html>