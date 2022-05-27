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
          <li><a class="links" href="#" onclick="showSearch()"><span class="material-icons md-36">search</span></a></li>
          <li><a class="links" href="carrello.jsp"><span class="material-icons md-36">local_grocery_store</span></a></li>
          <li><a class="links" href="./loginForm.jsp"><span class="material-icons md-36">person</span></a></li>
        </ul>
      </div>
    </div>
  </body>
</html>
