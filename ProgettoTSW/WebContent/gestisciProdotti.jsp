<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./Css/gestisciProdotti.css">
<title>Snackz</title>
</head>
<body>
	<% boolean admin = (boolean) request.getSession().getAttribute("admin");
		if(!admin){
			response.sendError(401);
		}
	%>
	<jsp:include page="./header.jsp" />
	
	<div class="container-gestione">
		<div class="container-tabella">
			<h2 id="titolo_tabella">Lista Prodotti</h2>
			<table class="table">
			     <thead>
			     	<tr>
			     	 <th>Codice Seriale</th>
			     	 <th>Nome</th>
			     	 <th>Marca</th>
			     	 <th>Opzione</th>
			     	 
			     	</tr>
			     </thead>
			     
			     <% List<ProdottoBean> prodotti = (List<ProdottoBean>) request.getSession().getAttribute("prodotti");
				    	List<DettaglioProdottoBean> dettagliLista = (List<DettaglioProdottoBean>) request.getSession().getAttribute("dettagliProdotti");
				    	Iterator<ProdottoBean> iter = prodotti.iterator();
				    	Iterator<DettaglioProdottoBean> iterDettagli = dettagliLista.iterator();
				    	ProdottoBean prodotto = new ProdottoBean();
				    	DettaglioProdottoBean dettagli = new DettaglioProdottoBean();
				    	while(iter.hasNext()){
				    		prodotto = iter.next();
				    		while(iterDettagli.hasNext()){
				    			dettagli = iterDettagli.next();
				    			if(prodotto.getCodiceSeriale().equalsIgnoreCase(dettagli.getProdotto())) break;
				    		}
    				%>
			     <tbody>
			     
			     	 <tr>
			     	  	  <td data-label="Codice Seriale"><% out.println(prodotto.getCodiceSeriale());%></td>
			     	  	  <td data-label="Nome"><% out.println(prodotto.getNome()); %></td>
			     	  	  <td data-label="Marca"><% out.println(prodotto.getMarca()); %></td>
			     	  	  <td data-label="Opzione">
			     	  	  <a href="modificaProdotto?mode=modifica&prodotto=<% out.println(prodotto.getCodiceSeriale());%>">Modifica</a><br><br>
				          <a href="modificaProdotto?mode=elimina&prodotto=<% out.println(prodotto.getCodiceSeriale());%>">Elimina</a></td>
     				</tr>
    	<%}%>
			     </tbody>
   			</table>
		</div>
	</div>

  	  <div class="container_form">
  	  <h2>Aggiungi un prodotto</h2>
  <form action="modificaProdotto" method="get">
  <input required type="hidden" name="mode" value="aggiungi">
    <div class="row">
      <div class="col-25">
        <label for="codiceSeriale">Codice seriale</label>
      </div>
      <div class="col-75">
        <input required type="text" id="codiceSeriale" name="codiceSeriale" placeholder="GGCA..">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="nome">Nome</label>
      </div>
      <div class="col-75">
        <input required type="text" id="nome" name="nome" placeholder="Chip potato..">
      </div>
    </div>
     <div class="row">
      <div class="col-25">
        <label for="marca">Marca</label>
      </div>
      <div class="col-75">
        <input required type="text" id="marca" name="marca" placeholder="Chip potato..">
        <p class="errors" id="error-marca"></p>
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="desc">Descrizione</label>
      </div>
      <div class="col-75">
        <textarea required id="desc" name="desc" placeholder="Write something.." style="height:200px"></textarea>
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="edLimitata">Edizione limitata</label>
      </div>
      <div class="col-75">
        <select required id="edLimitata" name="edLimitata">
          <option value="si">Si</option>
          <option value="no">No</option>
        </select>
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="tipo">Tipo prodotto</label>
      </div>
      <div class="col-75">
        <input required type="text" id="tipo" name="tipo" placeholder="Snack o drink">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="costo">Costo</label>
      </div>
      <div class="col-75">
        <input required type="text" id="costo" name="costo" placeholder="Costo unitario">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="sconto">Prezzo scontanto</label>
      </div>
      <div class="col-75">
        <input type="text" id="sconto" name="sconto" placeholder="Prezzo scontato">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="IVA">IVA</label>
      </div>
      <div class="col-75">
        <input required type="text" id="IVA" name="IVA" placeholder="22%..">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="quantita">Quantita</label>
      </div>
      <div class="col-75">
        <input required type="text" id="quantita" name="quantita" placeholder="1,2,3...">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="origine">Origine</label>
      </div>
      <div class="col-75">
        <input required type="text" id="origine" name="origine" placeholder="America, Giappone...">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="scadenza">Scadenza</label>
      </div>
      <div class="col-75">
        <input required type="date" id="scadenza" name="scadenza" placeholder="20-10-2022">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="peso">Peso</label>
      </div>
      <div class="col-75">
        <input required type="text" id="peso" name="peso" placeholder="Lascia vuoto e usa volume per i drink">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="volume">Volume</label>
      </div>
      <div class="col-75">
        <input required type="text" id="volume" name="volume" placeholder="Lascia vuoto e usa peso per gli snack">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="img">Immagine</label>
      </div>
      <div class="col-75">
        <input type="text" id="img" name="img" placeholder="Vai su gitHub, genera link e incollalo qui">
      </div>
    </div>
    <div class="row">
      <input type="submit" value="Aggiungi Prodotto">
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
