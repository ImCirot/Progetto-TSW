<%@page import="model.DettaglioProdottoBean"%>
<%@page import="model.ProdottoBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Snackz</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="./Css/prodotto.css">
</head>
<body>
	<% ProdottoBean prodotto = (ProdottoBean) request.getAttribute("prodotto");
		DettaglioProdottoBean dettagli = (DettaglioProdottoBean) request.getAttribute("dettagliProdotto");
	%>
	<jsp:include page="./header.jsp" />
    <div class="grid-display">
      <div class="immagine_prodotto">
        <img src="<%out.println(dettagli.getImmagine());%>" alt="">
      </div>
      <div class="informazioni_prodotto">
            <div class="nome_prodotto">
              <h1><% out.println(prodotto.getNome()); %></h1>
            </div>
            <div class="descrizione_prodotto">
              <p><%out.println(prodotto.getDescrizioneBreve());%></p>
            </div>
            <div class="prezzo_prodotto">
            <% if(dettagli.getPrezzoScontato() != null) { %>
            <p class="sale"><del class="full-price"><% out.println(dettagli.getCostoUnitario().toPlainString()); %>&euro;</del>    <% out.println(dettagli.getPrezzoScontato().toPlainString()); %>&euro;</p>
            <% } else { %>
              <p><%out.println(dettagli.getCostoUnitario());%> &euro;</p>
            <% } %>
            </div>
            <div class="info_pagamento">
              <ul>
                <li><span class="material-icons md-36">credit_card</span><span class="info_pagamento_testo">Puoi pagare con carta di credito o IBAN</span></li>
                <li><span class="material-icons md-36">local_shipping</span><span class="info_pagamento_testo">Consegna gratis sopra i 45&euro;</span></li>
                <li><span class="material-icons md-36">lock</span><span class="info_pagamento_testo">Pagamenti sicuri e criptati</span></li>
              </ul>
            </div>
            <div class="acquistare">
              <div class="input_quantita">
<!--                 <input type="text" name="quantita" value="1"> -->
                <input type="number" id="quantita" name="quantita" min="1" max="<% out.print(dettagli.getQuantita());%>" value="1">
              </div>

              <div class="bottone_prodotto">
                <button class="addtocart" id="added<% out.print(prodotto.getCodiceSeriale()); %>" onclick="addToCartN('<% out.print(prodotto.getCodiceSeriale());%>')">
                    <div class="pretext">
                       Acquista
                    </div>
                    <div class="pretext done" id="done<% out.print(prodotto.getCodiceSeriale()); %>">
                      <div class="posttext"> Aggiunto</div>
                    </div>
                </button>
              </div>
            </div>
      </div>
    </div>
    
<!--     RECENSIONI -->

    			<div class="container_form">
  	  				<h3>Aggiungi nuova recensione</h3>
				  	   <form action="modificaInfo" method="post">
							<input type="hidden" name="utente" value="">
							<input type="hidden" name="target" value="indirizzo">
							<input type="hidden" name="mode" value="add">
				    
				    <div class="row">
					      <div class="col-25">
					        <label for="recensione">Recensione</label>
					      </div>
					      <div class="col-75">
					        <textarea required id="recensione" name="recensione" style="height:200px" placeholder="Max 250 caratteri"></textarea>
					      </div>
	    			</div>
	    			<div class="row">
				      <div class="col-25">
				        <label for="anonimo">Anonimo</label>
				      </div>
				      <div class="col-75">
				        <select required id="anonimo" name="anonimo">
			 					<option value="si" selected>Si</option>
			 					<option value="no">No</option>
				        </select>
				      </div>
				       </div>
				      <div class="row">
				      <div class="col-25">
				        <label for="anonimo">Voto</label>
				      </div>
				      <div class="col-75">
				       	<div class="c4l-rating">
						    <input required name="c4l-rating" type="radio" id="c4l-rate1" value="1" checked/>
						    <label for="c4l-rate1"></label>
						 
						    <input name="c4l-rating" type="radio" id="c4l-rate2" value="2" />
						    <label for="c4l-rate2"></label>
						 
						    <input name="c4l-rating" type="radio" id="c4l-rate3" value="3" />
						    <label for="c4l-rate3"></label>
						 
						    <input name="c4l-rating" type="radio" id="c4l-rate4" value="4" />
						    <label for="c4l-rate4"></label>
						 
						    <input name="c4l-rating" type="radio" id="c4l-rate5" value="5"  />
						    <label for="c4l-rate5"></label>
						</div>
				    </div>
				      </div>
				      
					    <div class="row">
				      		<input type="submit" value="Aggiungi Recensione">
				    	</div>
				    	
				    </form>
	   			</div>
   
    
    
    
    
    
    
    
    
	<jsp:include page="./footer.jsp" />
	<script src="./JS/addedToCart.js"></script>
</body>
</html>
