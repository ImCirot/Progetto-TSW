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
<!-- <form action="Carrello" method="get"> -->
<!--   <div class="prodottoDettagli"> -->
<%--     <img src="<%out.println(dettagli.getImmagine());%>" alt="immagineProdotto"> --%>
<!--     <div class="descrizione"> -->
<%--       <p class="prezzo"><%out.println(dettagli.getCostoUnitario());%>&euro;</p> --%>
<%--       <p><%out.println(prodotto.getDescrizioneBreve());%></p> --%>
<%--       	<input type="hidden" name="prodotto" value="<% out.print(prodotto.getCodiceSeriale());%>"> --%>
<%--       	<input type="number" name="quantita" min="1" max="<% out.print(dettagli.getQuantita());%>" value="1"> --%>
<!--       	<input type="hidden" name="mode" value="add"><br><br> -->
<!--       	<button type="submit">Aggiungi al carrello</button> -->
      	
<%--       	<% String aggiunto = (String) request.getSession().getAttribute("aggiunto"); --%>
<!-- //       	request.getSession().removeAttribute("aggiunto"); -->
      	
<%--       		if(aggiunto != null){ %> --%>
<!--       		<p> -->
<%--       		<%out.println(aggiunto);%> --%>
<!--       		</p>	 -->
<%--       		<%}%> --%>
<!--     </div> -->
<!--   </div> 
</form>
-->


    
    
    
    
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
              <p><%out.println(dettagli.getCostoUnitario());%> &euro;</p>
            </div>
            <div class="info_pagamento">
              <ul>
                <li><span class="material-icons md-36">credit_card</span><span class="info_pagamento_testo">Puoi pagare con carta di credito o IBAN</span></li>
                <li><span class="material-icons md-36">local_shipping</span><span class="info_pagamento_testo">Consegna gratis sopra i 59&euro;</span></li>
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

	<jsp:include page="./footer.jsp" />
	<script src="./JS/addedToCart.js"></script>
</body>
</html>
