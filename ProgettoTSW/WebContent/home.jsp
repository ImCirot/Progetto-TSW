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
        <div class="main_card">
          <img src="./Images/prova.png" alt="">
        </div>
        <div class="main_card">
          <img src="./Images/prova.png" alt="">
        </div>
        <div class="main_card">
          <img src="./Images/prova.png" alt="">
        </div>
        <div class="main_card">
          <img src="./Images/prova.png" alt="">
        </div>
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

        <div class="main_card">
          <img src="./Images/prova.png" alt="">
        </div>
        <div class="main_card">
          <img src="./Images/prova.png" alt="">
        </div>
        <div class="main_card">
          <img src="./Images/prova.png" alt="">
        </div>
        <div class="main_card">
          <img src="./Images/prova.png" alt="">
        </div>
      </div>

    </div>
    
    <jsp:include page="./footer.jsp" />
  </body>
 
</html>