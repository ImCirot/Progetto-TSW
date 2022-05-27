<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="./Css/catalogo.css">
	<title>Snackz</title>
</head>
<body>

	<jsp:include page="./header.jsp" />
	  <div class="section">

        <div class="grid-card">
          <div class="img">
            <img src="./Images/prova.png" alt="">
          </div>
          <div class="nome_prodotto">
            <h2>Dr. Pepper</h2>
          </div>
          <div class="prezzo">
            <p>5</p>
          </div>
          <div class="acquista">
            <button type="button" name="button">Acquista</button>
          </div>
          <div class="inside">
      				<div class="icon"><i class="material-icons">info_outline</i></div>
      				<div class="contents">
        					<p></p>
      				</div>
    					</div>
        </div>
      
        
        
      </div>
	<jsp:include page="./footer.jsp" />
</body>
</html>