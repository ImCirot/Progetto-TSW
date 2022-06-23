<%@page import="model.*" import="java.util.*"%>
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
              <% if(dettagli.getQuantita() == 0) { %>
                <button disabled class="addtocart" id="added<% out.print(prodotto.getCodiceSeriale()); %>" onclick="addToCartN('<% out.print(prodotto.getCodiceSeriale());%>')">
                    <div class="pretext-terminato">
                       Terminato
                    </div>
                    <div class="pretext done" id="done<% out.print(prodotto.getCodiceSeriale()); %>">
                      <div class="posttext"> Aggiunto</div>
                    </div>
                </button>
                <% } else { %>
                <button disabled class="addtocart" id="added<% out.print(prodotto.getCodiceSeriale()); %>" onclick="addToCartN('<% out.print(prodotto.getCodiceSeriale());%>')">
                    <div class="pretext">
                       Acquista
                    </div>
                    <div class="pretext done" id="done<% out.print(prodotto.getCodiceSeriale()); %>">
                      <div class="posttext"> Aggiunto</div>
                    </div>
                </button>
                <% } %>
              </div>
            </div>
      </div>
    </div>
    
<!--     RECENSIONI -->
	
	<% 	if(request.getSession().getAttribute("logged") != null){
		boolean logged = (boolean) request.getSession().getAttribute("logged");
		if(logged) {
			List<RecensioneBean> listaRecensioni = (List<RecensioneBean>) request.getSession().getAttribute("recensioni");
			Iterator<RecensioneBean> iterRecensioni = listaRecensioni.iterator();
			RecensioneBean recensione = new RecensioneBean();
			boolean recensito = false;
			
			while(iterRecensioni.hasNext()) {
				recensione = iterRecensioni.next();
				
				if(recensione.getCodiceSerialeProdotto().equalsIgnoreCase(prodotto.getCodiceSeriale())) {
					recensito = true;
					break;
				}
			}
		
			if(recensito){%>
				<h1>Hai gia recensito questo prodotto!</h1>
			<%} else {
				Map<Integer,List<ComposizioneOrdineBean>> composizioniOrdini = (Map<Integer,List<ComposizioneOrdineBean>>) request.getSession().getAttribute("composizioniOrdini");
				Iterator<Integer> iterOrdineID = composizioniOrdini.keySet().iterator();
				Iterator<ComposizioneOrdineBean> iterComposizioni;
				Integer ordineID = null;
				List<ComposizioneOrdineBean> composizioni = new ArrayList<>();
				ComposizioneOrdineBean composizione = new ComposizioneOrdineBean();
				boolean acquistato = false;
				
				while(iterOrdineID.hasNext()){
					ordineID = iterOrdineID.next();
					composizioni = composizioniOrdini.get(ordineID);
					iterComposizioni = composizioni.iterator();
					
					while(iterComposizioni.hasNext()){
						composizione = iterComposizioni.next();
						
						if(composizione.getProdotto().equalsIgnoreCase(prodotto.getCodiceSeriale())){
							acquistato = true;
							break;
						}
					}
				}
				
				if(acquistato) {
			%>	
    			<div class="container_form">
  	  				<h3>Aggiungi nuova recensione</h3>
				  	   <form action="recensione" method="post">
				  	   		<input type="hidden" name="mode" value="aggiungi">
							<input type="hidden" name="seriale" value="<% out.print(prodotto.getCodiceSeriale());%>">
							<input type="hidden" name="prodotto" value="<%out.print(prodotto.getNome());%>">
				    
				    <div class="row">
					      <div class="col-25">
					        <label for="recensione">Recensione</label>
					      </div>
					      <div class="col-75">
					        <textarea required id="recensione" name="testo" style="height:200px" placeholder="Max 250 caratteri"></textarea>
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
						    <input required name="voto" type="radio" id="c4l-rate1" value="1" checked/>
						    <input required class="input_prodotto" name="c4l-rating" type="radio" id="c4l-rate1" value="1" checked/>
						    <label for="c4l-rate1"></label>
						    <input name="voto" type="radio" id="c4l-rate2" value="2" />
						    <input class="input_prodotto" name="c4l-rating" type="radio" id="c4l-rate2" value="2" />
						    <label for="c4l-rate2"></label>
						    <input name="voto" type="radio" id="c4l-rate3" value="3" />
						    <input class="input_prodotto" name="c4l-rating" type="radio" id="c4l-rate3" value="3" />
						    <label for="c4l-rate3"></label>
						    <input name="voto" type="radio" id="c4l-rate4" value="4" />
						    <input class="input_prodotto" name="c4l-rating" type="radio" id="c4l-rate4" value="4" />
						    <label for="c4l-rate4"></label>
						    <input name="voto" type="radio" id="c4l-rate5" value="5"  />
						    <input class="input_prodotto" name="c4l-rating" type="radio" id="c4l-rate5" value="5"  />
						    <label for="c4l-rate5"></label>
						</div>
				    </div>
				      </div>
				      
					    <div class="row">
				      		<input type="submit" class="input_prodotto" value="Aggiungi Recensione">
				    	</div>
				    	
				    </form>
	   			</div>
   				<% } else { %>
						<h1>Devi prima acquistare il prodotto per recensire</h1>
					<%}
				}
			}
		}%>
	<jsp:include page="./footer.jsp" />
	<script src="./JS/addedToCart.js"></script>
</body>
</html>
