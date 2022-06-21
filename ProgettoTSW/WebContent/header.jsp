<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="model.*"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
     <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;500&display=swap" rel="stylesheet"> 
	<link rel="stylesheet" href="./Css/header.css">
	
	<link rel="apple-touch-icon" sizes="57x57" href="./Images/fav-icon/apple-icon-57x57.png">
	<link rel="apple-touch-icon" sizes="60x60" href="./Images/fav-icon/apple-icon-60x60.png">
	<link rel="apple-touch-icon" sizes="72x72" href="./Images/fav-icon/apple-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="76x76" href="./Images/fav-icon/apple-icon-76x76.png">
	<link rel="apple-touch-icon" sizes="114x114" href="./Images/fav-icon/apple-icon-114x114.png">
	<link rel="apple-touch-icon" sizes="120x120" href="./Images/fav-icon/apple-icon-120x120.png">
	<link rel="apple-touch-icon" sizes="144x144" href="./Images/fav-icon/apple-icon-144x144.png">
	<link rel="apple-touch-icon" sizes="152x152" href="./Images/fav-icon/apple-icon-152x152.png">
	<link rel="apple-touch-icon" sizes="180x180" href="./Images/fav-icon/apple-icon-180x180.png">
	<link rel="icon" type="image/png" sizes="192x192"  href="./Images/fav-icon/android-icon-192x192.png">
	<link rel="icon" type="image/png" sizes="32x32" href="./Images/fav-icon/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="96x96" href="./Images/fav-icon/favicon-96x96.png">
	<link rel="icon" type="image/png" sizes="16x16" href="./Images/fav-icon/favicon-16x16.png">
	<link rel="manifest" href="./Images/manifest.json">
	<meta name="msapplication-TileColor" content="#ffffff">
	<meta name="msapplication-TileImage" content="./Images/fav-icon/ms-icon-144x144.png">
	<meta name="theme-color" content="#ffffff">
	
    <title>Snackz</title>
  </head>
  <body>
  <script src="./JS/searchFunctions.js"></script>
    <div class="header">
      <div class="header_filter">
      </div>
      
       <div class="logo">
       <a href="catalogo"></a>
       		<img width="70%" alt="" src="./Images/logopreciso.png">
      	</div>
      
    </div>
    <div class="navbar">
      <div class="catalogo">
        <ul>
          <li><a class="links" href="catalogo">Home</a></li>
          <li><a class="links" href="catalogo?filter=catalogo">Catalogo</a></li>
          <li><a class="links" href="catalogo?filter=edLimitata">Ed. Limitata</a></li>
          <li><a class="links" href="catalogo?filter=offerta">Offerte</a></li>
          <li><a class="links" href="catalogo?filter=snack">Snack</a></li>
          <li><a class="links" href="catalogo?filter=drink">Bibite</a></li>
        </ul>
      </div>
      <div class="icon nav-icon-5">
	    <span></span>
	    <span></span>
	    <span></span>
  	  </div>
      <div class="menu">
        <ul>
          <li>
          	<div id="search-zone">
          	<input type="text" id="search-bar" autocomplete="off" name="search" placeholder="Cerca prodotto">
          	<div id="search-result">
	          	<div id="search-type-result"></div>
	          	<div id="search-product-result"></div>
	          	<div id="search-brand-result"></div>
          	</div>
          	</div>
          </li>
          <li><a class="links" href="#" onclick="showSearch()"><span class="material-icons md-36">search</span></a></li>
          <li><a class="links"  href="#" id="carrello" onclick="showCart()"><span class="material-icons md-36">local_grocery_store</span></a></li>
          <li><a class="links" href="./loginForm.jsp"><span class="material-icons md-36">person</span></a></li>
        </ul>
      </div>
    </div>
    <script>
    	document.querySelector('.nav-icon-5').addEventListener("click", function() {
    		  document.body.classList.toggle('open');
    		});
    </script>
    <script type="text/javascript">
      $(".logo").click(function(){
        window.location=$(this).find("a").attr("href");
        return false;
      });
    </script>
  </body>
</html>
