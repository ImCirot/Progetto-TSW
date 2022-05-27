<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="model.*"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,800" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<link rel="stylesheet" href="./Css/header.css">
    <title>Snackz</title>
  </head>
  <body>
  <script src="./JS/searchFunctions.js"></script>
    <div class="header">
      <div class="header_filter">
      </div>
      
       <div class="logo">
       		<img alt="" src="./Images/logopreciso.png">
      	</div>
      
    </div>
    <div class="navbar">
      <div class="catalogo">
        <ul>
          <li><a class="links" href="catalogo">Home</a></li>
          <li><a class="links" href="catalogo?filter=edLimitata">Ed. Limitata</a></li>
          <li><a class="links" href="catalogo?filter=snack">Snack</a></li>
          <li><a class="links" href="catalogo?filter=drink">Bibite</a></li>
        </ul>
      </div>
      <div class="menu">
        <ul>
          <li>
          	<div id="search-zone">
          	<input type="text" id="search-bar" name="search" placeholder="Cerca prodotto">
          	<div id="search-result">
	          	<div id="search-type-result"></div>
	          	<div id="search-product-result"></div>
	          	<div id="search-brand-result"></div>
          	</div>
          	</div>
          </li>
          <li><a class="links" href="#" onclick="showSearch()"><img src="./Images/search-icon.png" alt="search" class="icons"/></a></li>
          <li><a class="links" href="carrello.jsp"><img src="./Images/shopping-cart.png" alt="cart" class="icons" /></a></li>
          <li><a class="links" href="./loginForm.jsp"><img src="./Images/user.png" alt="user" class="icons" /></a></li>
        </ul>
      </div>
    </div>
  </body>
</html>
