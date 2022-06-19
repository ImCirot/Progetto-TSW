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
      
	 <div class="slider">
  <div class="slide_viewer">
    <div class="slide_group">
      <div class="slide">
      	
      </div>
      <div class="slide">
     
      </div>
      <div class="slide">
      	
      </div>
    </div>
  </div>
</div><!-- End // .slider -->

<div class="slide_buttons">
</div>

<div class="directional_nav">
  <div class="previous_btn" title="Previous">
    <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="65px" height="65px" viewBox="-11 -11.5 65 66">
      <g>
        <g>
          <path fill="#474544" d="M-10.5,22.118C-10.5,4.132,4.133-10.5,22.118-10.5S54.736,4.132,54.736,22.118
			c0,17.985-14.633,32.618-32.618,32.618S-10.5,40.103-10.5,22.118z M-8.288,22.118c0,16.766,13.639,30.406,30.406,30.406 c16.765,0,30.405-13.641,30.405-30.406c0-16.766-13.641-30.406-30.405-30.406C5.35-8.288-8.288,5.352-8.288,22.118z"/>
          <path fill="#474544" d="M25.43,33.243L14.628,22.429c-0.433-0.432-0.433-1.132,0-1.564L25.43,10.051c0.432-0.432,1.132-0.432,1.563,0	c0.431,0.431,0.431,1.132,0,1.564L16.972,21.647l10.021,10.035c0.432,0.433,0.432,1.134,0,1.564	c-0.215,0.218-0.498,0.323-0.78,0.323C25.929,33.569,25.646,33.464,25.43,33.243z"/>
        </g>
      </g>
    </svg>
  </div>
  <div class="next_btn" title="Next">
    <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="65px" height="65px" viewBox="-11 -11.5 65 66">
      <g>
        <g>
          <path fill="#474544" d="M22.118,54.736C4.132,54.736-10.5,40.103-10.5,22.118C-10.5,4.132,4.132-10.5,22.118-10.5	c17.985,0,32.618,14.632,32.618,32.618C54.736,40.103,40.103,54.736,22.118,54.736z M22.118-8.288	c-16.765,0-30.406,13.64-30.406,30.406c0,16.766,13.641,30.406,30.406,30.406c16.768,0,30.406-13.641,30.406-30.406 C52.524,5.352,38.885-8.288,22.118-8.288z"/>
          <path fill="#474544" d="M18.022,33.569c 0.282,0-0.566-0.105-0.781-0.323c-0.432-0.431-0.432-1.132,0-1.564l10.022-10.035 			L17.241,11.615c 0.431-0.432-0.431-1.133,0-1.564c0.432-0.432,1.132-0.432,1.564,0l10.803,10.814c0.433,0.432,0.433,1.132,0,1.564 L18.805,33.243C18.59,33.464,18.306,33.569,18.022,33.569z"/>
        </g>
      </g>
    </svg>
  </div>
</div><!-- End // .directional_nav -->
    
    
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
     <script src="./JS/slider.js"></script>
    <script>
    $(".main_card").click(function(){
        window.location=$(this).find("a").attr("href");
        return false;
      });
	</script>
  </body>
</html>