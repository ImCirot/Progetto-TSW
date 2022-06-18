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
	
	
    <br><br><br><br><br>
  	  
    <div class="aggiungiProdotto">
	    <h3>Aggiungi un prodotto</h3>
	    <form action="modificaProdotto" method="get">
	      <input required type="hidden" name="mode" value="aggiungi">	
	      <label for="codiceSeriale">Codice Seriale</label><br>
	      <input required type="text" name="codiceSeriale" placeholder="Codice seriale"><br><br>
	      <label for="nome">Nome</label><br>
	      <input required type="text" name="nome" placeholder="Nome"><br><br>
	      <label for="marca">Marca</label><br>
	      <input required type="text" name="marca" placeholder="Marca"><br><br>
	      <label for="desc">Descrizione</label><br>
	      <textarea required name="desc" rows="8" cols="80"></textarea><br><br>
	      <label for="edLimitata">Edizione Limitata</label><br>
	      <select required name="edLimitata">
	        <option value="si">Si</option>
	        <option value="no">No</option>
	      </select><br><br>
	      <label for="tipo">Tipo prodotto</label><br>
	      <input required type="text" name="tipo" placeholder="Snack o drink"><br><br>
	      <label for="costo">Costo</label><br>
	      <input required type="text" name="costo" placeholder="Costo unitario"><br><br>
	      <label for="sconto">Prezzo scontato</label><br>
	      <input type="text" name="sconto" placeholder="Prezzo scontato"><br><br>
	      <label for="IVA">IVA</label><br>
	      <input required type="text" name="IVA" placeholder="IVA"><br><br>
	      <label for="quantita">Quantita'</label><br>
	      <input required type="text" name="quantita" placeholder="Quantita'"><br><br>
	      <label for="origine">Origine</label><br>
	      <input required type="text" name="origine" placeholder="Origine"><br><br>
	      <label for="scadenza">Data scadenza</label><br>
	      <input required type="date" name="scadenza"><br><br>
	      <label for="peso">Peso</label><br>
	      <input required type="text" name="peso" placeholder="Lascia vuoto e usa volume per i drink"><br><br>
	      <label for="volume">Volume</label><br>
	      <input required type="text" name="volume" placeholder="Lascia vuoto e usa peso per gli snack"><br><br>
	      <label for="img">Link immagine</label><br>
	      <input type="text" name="img" placeholder="Vai su github, genera link e incollalo qui"><br><br>
	      <input type="submit" value="Aggiungi Prodotto">
	    </form>
    </div>
    <br><br><br>
  <jsp:include page="./footer.jsp" />
</body>
</html>
