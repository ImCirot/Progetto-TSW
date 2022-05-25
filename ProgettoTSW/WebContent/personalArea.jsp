<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./Css/personalArea.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="./header.jsp" />
	
	
	<div class="titolo">
      <h1>Il mio account</h1>
    </div>
    <div class="container">

        <div class="card">
          <a href="index.html"></a>
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



    <script type="text/javascript">
      $(".card").click(function(){
        window.location=$(this).find("a").attr("href");
        return false;
      });
    </script>
	
	
	
	
	<jsp:include page="./footer.jsp" />
</body>
</html>