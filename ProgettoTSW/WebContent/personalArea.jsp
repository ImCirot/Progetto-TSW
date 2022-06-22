<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<link rel="stylesheet" href="./Css/personalArea.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Il mio account</title>
</head>
<body>

		<% Boolean logged = (Boolean) request.getSession().getAttribute("logged");
		if(logged == null){
			response.sendRedirect("./loginForm.jsp");
		} else {
		
		boolean admin = (boolean) request.getSession().getAttribute("admin");
	%>
	<jsp:include page="./header.jsp" />
	
	<div class="titolo">
      <h1>Bentornato <% out.println(request.getSession().getAttribute("nome")); %></h1>
      <% if(request.getSession().getAttribute("messaggio") != null) {
    	  String messaggio = (String) request.getSession().getAttribute("messaggio");
    	  request.getSession().removeAttribute("messaggio");%>
    	<p><% out.println(messaggio);%></p>
      <%}%>
    </div>
     <% if (!admin) { %>
     <div class="section">
		
		<div class="grid-card" id="img-aggiungi">
          <div class="img">
            <span class="material-icons-personal">build</span>
          </div>
          <div class="card-description">
            <h2>Accesso e impostizioni di sicurezza</h2>
            <p>Modifica credenziali: username, password, nome, email.</p>
            <a href="modificaInfo?mode=update&target=utente"></a>
          </div>
        </div>
		
        <div class="grid-card">
          <div class="img">
            <span class="material-icons-personal">assignment</span>
          </div>
          <div class="card-description">
            <h2>I miei ordini</h2>
            <p>Controlla i tuoi ordini</p>
            <a href="./listaOrdini.jsp"></a>
          </div>
        </div>

        <div class="grid-card">
          <div class="img">
            <span class="material-icons-personal">location_on</span>
          </div>
          <div class="card-description">
            <h2>I miei indirizzi</h2>
            <p>Controlla e/o modifica i tuoi indirizzi</p>
            <a href="./indirizzi.jsp"></a>
          </div>
        </div>

        <div class="grid-card">
          <div class="img">
           <span class="material-icons-personal">credit_card</span>
          </div>
          <div class="card-description">
            <h2>I miei metodi di pagamento</h2>
            <p>Controlla e/o modifica i tuoi metodi di pagamento</p>
            <a href="./metodiDiPagamento.jsp"></a>
          </div>
        </div>
        
        <div class="grid-card">
          <div class="img">
           <span class="material-icons-personal">star</span>
          </div>
          <div class="card-description">
            <h2>Le mie recensioni</h2>
            <p>Controlla e/o modifica le tue recensioni</p>
            <a href="./listaRecensioni.jsp"></a>
          </div>
        </div>
    </div>
	<% } else { %>
		 <div class="section">
        <div class="grid-card">
          <div class="img">
            <span class="material-icons-personal">assignment</span>
          </div>
          <div class="card-description">
            <h2>Gestisci ordini</h2>
            <p>Controlla gli ordini dei clienti</p>
            <a href="./ordiniAdmin.jsp"></a>
          </div>
        </div>
        <div class="grid-card">
          <div class="img">
           <span class="material-icons-personal">star</span>
          </div>
          <div class="card-description">
            <h2>Recensioni</h2>
            <p>Controlla le recensioni dei clienti</p>
            <a href="./listaRecensioni.jsp"></a>
          </div>
        </div>
	   <div class="grid-card">
          <div class="img">
           <span class="material-icons-personal">dashboard</span>
          </div>
          <div class="card-description">
          	<a href="gestisciProdotti"></a>
            <h2>Gestisci prodotti</h2>
            <p>Rimuovi, aggiungi, modifica prodotti del catalogo</p>
          </div>
        </div>
        <div class="grid-card">
          <div class="img">
            <span class="material-icons-personal">build</span>
          </div>
          <div class="card-description">
            <h2>I miei dati</h2>
            <p>Controlla e/o modifica i dati admin</p>
            <a href="modificaInfo?mode=update&target=utente"></a>
          </div>
        </div>
    </div>
    <% }
     }%>
    <div class="wrapper">
    <form action="LogOutServlet" method="get">
        <button type="submit" class="learn-more">
           <span class="circle" aria-hidden="true">
           <span class="icon arrow"></span>
           </span>
           <span class="button-text">Logout</span>
         </button>
         </form>
	</div>
    <script type="text/javascript">
      $(".grid-card").click(function(){
        window.location=$(this).find("a").attr("href");
        return false;
      });
    </script>
	<jsp:include page="./footer.jsp" />
</body>
</html>