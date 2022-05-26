<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./Css/personalArea.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Il mio account</title>
</head>
<body>

		<% boolean logged = (boolean) request.getSession().getAttribute("logged");
		if(!logged){
			response.sendRedirect("./loginForm.jsp");
		}
		
		boolean admin = (boolean) request.getSession().getAttribute("admin");
	%>
	<jsp:include page="./header.jsp" />
	
	<div class="titolo">
      <h1>Bentornato <% out.println(request.getSession().getAttribute("nome")); %></h1>
    </div>
     <% if (!admin) { %>
     <div class="container-grande">
    <div class="container">
		
		<div class="card">
          <div class="img">
            <img src="./Images/sicurezza.png" alt="ciao">
          </div>
          <div class="card-description">
            <h2>Accesso e impostizioni di sicurezza</h2>
            <p>Modifica credenziali: username, password, nome, email.</p>
          </div>
        </div>
		
        <div class="card">
          <div class="img">
            <img src="./Images/ordini.png" alt="ciao">
          </div>
          <div class="card-description">
            <h2>I miei ordini</h2>
            <p>Controlla i tuoi ordini</p>
          </div>
        </div>

        <div class="card">
          <div class="img">
            <img src="./Images/indirizzi.png" alt="ciao">
          </div>
          <div class="card-description">
            <h2>I miei indirizzi</h2>
            <p>Controlla e/o modifica i tuoi indirizzi</p>
          </div>
        </div>

        <div class="card">
          <div class="img">
            <img src="./Images/pagamenti.png" alt="ciao">
          </div>
          <div class="card-description">
            <h2>I miei metodi di pagamento</h2>
            <p>Controlla e/o modifica i tuoi metodi di pagamento</p>
          </div>
        </div>

    </div>
    </div>
	<% } else { %>
		 <div class="container-grande">
		<div class="container">

        <div class="card">
          <a href="index.html"></a>
          <div class="img">
            <img src="./Images/ordini.png" alt="ciao">
          </div>
          <div class="card-description">
            <h2>Storico ordini</h2>
            <p>Controlla gli ordini effettuati sul sito</p>
          </div>
        </div>

        <div class="card">
          <div class="img">
            <img src="./Images/indirizzi.png" alt="ciao">
          </div>
          <div class="card-description">
            <h2>Gestione prodotti</h2>
            <p>Controlla e/o modifica il catalogo dei prodotti</p>
          </div>
        </div>

        <div class="card">
          <div class="img">
            <img src="./Images/sicurezza.png" alt="ciao">
          </div>
          <div class="card-description">
            <h2>Accesso e impostizioni di sicurezza</h2>
            <p>Modifica credenziali: username, password.</p>
          </div>
        </div>
    </div>
      </div>
    <% } %>
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
      $(".card").click(function(){
        window.location=$(this).find("a").attr("href");
        return false;
      });
    </script>
	
	
	<jsp:include page="./footer.jsp" />
</body>
</html>