<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="model.*"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="./Css/home.css">
    <title>Snackz</title>
  </head>
  <body>
  	<jsp:include page="./header.jsp" />
  	<div class="main">
      <div class="slide_show">
        <img src="./Images/img.jpg" alt="">
      </div>

      <div class="content">
        <div class="content_img">
          <img src="./Images/img2.png" alt="">
        </div>
        <div class="description">
          <p>Siamo 4 amici appasionati di informatica e snack e abbiamo deciso di creare il nostro sito personale per la vendita di snack provenienti da tutto il mondo.</p>
        </div>
      </div>

      <div class="titolo_centrato">
        <h2>Special edition</h2>
      </div>
      <div class="content_flex">
      	<% List<ProdottoBean> prodotti = (List<ProdottoBean>) request.getSession().getAttribute("prodotti");
     	List<DettaglioProdottoBean> dettagliProdotti = (List<DettaglioProdottoBean>) request.getSession().getAttribute("dettagliProdotti");
      	Iterator<ProdottoBean> iterProdotti = prodotti.iterator();
      	Iterator<DettaglioProdottoBean> iterDettagli;
      	ProdottoBean prodotto = new ProdottoBean();
      	DettaglioProdottoBean dettaglio = new DettaglioProdottoBean();
      	Integer i = 0;
      	
      	while(iterProdotti.hasNext()){
      		prodotto = iterProdotti.next();
      		if(prodotto.isEdLimitata()){
	      		iterDettagli = dettagliProdotti.iterator();
	      		
	      		while(iterDettagli.hasNext()){
	      			dettaglio = iterDettagli.next();
	      			
	      			if(prodotto.getCodiceSeriale().equalsIgnoreCase(dettaglio.getProdotto())) {
	      				i++;
	      				break;
	      			}	
      			} %> 
      		<div class="main_card" onclick="click('<%out.print(prodotto.getCodiceSeriale());%>')">
            <img src="<% out.print(dettaglio.getImmagine()); %>" alt="">
            <a href="select?type=prodotto&prodotto=<%out.print(prodotto.getCodiceSeriale());%>"></a>
          	</div>
      	<% 
      		}
      	if(i == 4) break;
      	}%>
      </div>
      
      
      <div class="content content_reverse">
        <div class="content_img content_img_reverse">
          <img src="./Images/img3.jpg" alt="">
        </div>
        <div class="description">
          <p>Siamo 4 amici appasionati di informatica e snack e abbiamo deciso di creare il nostro sito personale per la vendita di snack provenienti da tutto il mondo.</p>
        </div>
      </div>
    
      <div class="titolo_centrato">
        <h2>Offerte speciali</h2>
      </div>
      
      <div class="content_flex">
		<% List<ProdottoBean> prodottiSconto = (List<ProdottoBean>) request.getSession().getAttribute("prodottiSconto");
      	i = 0;
      	Iterator<ProdottoBean> iterProdottiSconto = prodottiSconto.iterator();
      	
      	while(iterProdottiSconto.hasNext()){
      		prodotto = iterProdottiSconto.next();
      		iterDettagli = dettagliProdotti.iterator();
      		
      		while(iterDettagli.hasNext()){
      			dettaglio = iterDettagli.next();
      			
      			if(prodotto.getCodiceSeriale().equalsIgnoreCase(dettaglio.getProdotto())) {
      				i++;
      				break;
      			}	
      		}%> 
      		<div class="main_card" onclick="click('<%out.print(prodotto.getCodiceSeriale());%>')">
      		 <a href="select?type=prodotto&prodotto=<%out.print(prodotto.getCodiceSeriale());%>"></a>
            <img src="<% out.print(dettaglio.getImmagine()); %>" alt="">
          	</div>
      	<% 
      		if(i == 4) break;
      	} %>
    </div> 
    </div>
    <jsp:include page="./footer.jsp" />
    <script>
    $(".main_card").click(function(){
        window.location=$(this).find("a").attr("href");
        return false;
      });
	</script>
  </body>
</html>