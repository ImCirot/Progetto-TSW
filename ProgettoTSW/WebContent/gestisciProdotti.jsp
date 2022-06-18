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
			     	  	  <td data-label="Marca"><% out.println(prodotto.getMarca()); %> &euro;</td>
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
  	  
<!--       <div class="aggiungi-container"> -->
<!--         <h1>Aggiungi prodotti</h1> -->
<!--           <form action="modificaProdotto" method="get"> -->
<!--             <input type="hidden" name="mode" value="aggiungi"> -->
            
<!-- 			<div class= "group"> -->
<!-- 				<input required="" type="text" name="codiceSeriale" class="input"> -->
<!-- 				  <span class="highlight"></span> -->
<!-- 				  <span class="bar"></span> -->
<!-- 				  <label class="label-registrazione">Codice Seriale</label> -->
<!-- 			</div>   -->
            
            
<!--             <div class= "group"> -->
<!-- 				<input required="" type="text" name="nome" class="input"> -->
<!-- 				  <span class="highlight"></span> -->
<!-- 				  <span class="bar"></span> -->
<!-- 				  <label class="label-registrazione">Nome</label> -->
<!-- 			</div>  -->
			
<!-- 			 <div class= "group"> -->
<!-- 				<input required="" type="text" name="marca" class="input"> -->
<!-- 				  <span class="highlight"></span> -->
<!-- 				  <span class="bar"></span> -->
<!-- 				  <label class="label-registrazione">Marca</label> -->
<!-- 			</div> -->
			
 <!-- 			 <div class= "group"> -->
<!-- 				<textarea name="desc" rows="8" cols="80"></textarea> -->
<!-- 				  <span class="highlight"></span> -->
<!-- 				  <span class="bar"></span> -->
<!-- 				  <label class="label-registrazione">Descrizione</label> --> 
<!-- 			</div> -->
			
			
			
<!-- 			 <div class= "group"> -->
<!-- 				<input required="" type="text" name="tipo" class="input"> -->
<!-- 				  <span class="highlight"></span> -->
<!-- 				  <span class="bar"></span> -->
<!-- 				  <label class="label-registrazione">Tipo</label> -->
<!-- 			</div> -->
			
<!-- 			 <div class= "group"> -->
<!-- 				<input required="" type="text" name="costo" class="input"> -->
<!-- 				  <span class="highlight"></span> -->
<!-- 				  <span class="bar"></span> -->
<!-- 				  <label class="label-registrazione">Costo unitario</label> -->
<!-- 			</div> -->
			
<!-- 			 <div class= "group"> -->
<!-- 				<input required="" type="text" name="IVA" class="input"> -->
<!-- 				  <span class="highlight"></span> -->
<!-- 				  <span class="bar"></span> -->
<!-- 				  <label class="label-registrazione">IVA</label> -->
<!-- 			</div> -->
			
<!-- 			 <div class= "group"> -->
<!-- 				<input required="" type="text" name="quantita" class="input"> -->
<!-- 				  <span class="highlight"></span> -->
<!-- 				  <span class="bar"></span> -->
<!-- 				  <label class="label-registrazione">Quantità</label> -->
<!-- 			</div> -->
			
<!-- 			 <div class= "group"> -->
<!-- 				<input required="" type="text" name="origine" class="input"> -->
<!-- 				  <span class="highlight"></span> -->
<!-- 				  <span class="bar"></span> -->
<!-- 				  <label class="label-registrazione">Origine</label> -->
<!-- 			</div> -->
			
			 
				
		
			
<!-- 			 <div class= "group"> -->
<!-- 				<input required="" type="text" name="peso" class="input"> -->
<!-- 				  <span class="highlight"></span> -->
<!-- 				  <span class="bar"></span> -->
<!-- 				  <label class="label-registrazione">Peso (Lascia vuoto e usa volume per i drink)</label> -->
<!-- 			</div> -->
			
<!-- 			 <div class= "group"> -->
<!-- 				<input required="" type="text" name="volume" class="input"> -->
<!-- 				  <span class="highlight"></span> -->
<!-- 				  <span class="bar"></span> -->
<!-- 				  <label class="label-registrazione">Volume (Lascia vuoto e usa peso per gli snack)</label> -->
<!-- 			</div> -->
			
<!-- 			 <div class= "group"> -->
<!-- 				<input required="" type="text" name="img" class="input"> -->
<!-- 				  <span class="highlight"></span> -->
<!-- 				  <span class="bar"></span> -->
<!-- 				  <label class="label-registrazione">Immagine (Vai su gdurl, genera link e incollalo qui)</label> -->
<!-- 			</div> -->
			
<!-- 			<label>Sesso</label> -->
<!-- 					<br> -->
<!-- 							<span class="dropdown-el" >  -->
<!-- 								    <input class="drop" type="radio" name="sesso" value="M" id="sort-best" checked><label class="edLimitata" for="sort-best">Uomo</label> -->
<!-- 								    <input class="drop" type="radio" name="sesso" value="F" id="sort-low"><label class="edLimitata" for="sort-low">Donna</label> -->
<!--   							</span> -->
					
<!-- 					<br><br> -->
			
<!-- 			<input type="date" name="scadenza"> -->
<!-- 				  <span class="highlight"></span> -->
<!-- 				  <span class="bar"></span> -->
<!-- 				  <label class="label-registrazione">Scadenza</label> -->
			
<!-- 			  <input type="submit" value="Aggiungi Prodotto"> -->
<!--           </form>  -->
<!--     </div> -->
    <div class="aggiungiProdotto">
	    <h3>Aggiungi un prodotto</h3>
	    <form action="modificaProdotto" method="get">
	      <input type="hidden" name="mode" value="aggiungi">	
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
	      <label for="sconto">Prezzo scontato</label><br>
	      <input type="text" name="sconto" placeholder="Prezzo scontato"><br><br>
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
	      <input type="submit" value="Aggiungi Prodotto">
	    </form>
    </div>
    <br><br><br>
  <jsp:include page="./footer.jsp" />
</body>
</html>
