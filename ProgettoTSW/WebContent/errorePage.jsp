<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="model.*"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;500&display=swap" rel="stylesheet"> 
    <link rel="stylesheet" href="./Css/errorPage.css">
    <title>Snackz</title>
  </head>
  <body>
  	<div class="errore">
      <div class="logo">
        <img src="./Images/logopreciso.png" alt="">
      </div>
      <div class="descrizione_errore">
        <p id="grande">Oops...</p>
        <p>Qualcosa è andato storto!</p>
        <p id="piccolo">Potresti aver seguito un link non più valido o non aver digitato correttamente l'indirizzo della pagina.</p>
      </div>
      <div class="home">
        <a id="home" href="catalogo"><i class="fa fa-home" style="font-size:24px"></i></a>
      </div>
    </div>
  </body>
</html>