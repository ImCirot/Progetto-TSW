<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="./Css/registerForm.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<title>Snackz</title>
</head>
<body>	
	
	
	<div class="container">
  <div class="title">Registrazione</div>
  <form action="login" method="post" autocomplete="off">
  <input type="hidden" name="mode" value="register">
    <div class="user__details">
      <div class="input__box">
        <span class="details">Username</span>
        <input type="text" placeholder="E.g: marioRossi" name="username" id="username" required>
        <p class="error" id="error-username"></p>
      </div>
      <div class="input__box">
      
        <span class="details">Email</span>
        
        <input type="text" placeholder="mariorossi12@hotmail.com" name="email" id="email" required>
        <p class="errors" id="error-email"></p>
      </div>
      <div class="input__box">
        <span class="details">Password</span>
        <input type="password" placeholder="********" name="password" id="password" required>
        
      </div>
      <div class="input__box">
        <span class="details">Ripeti Password</span>
        <input type="password" placeholder="********" name="passwordCheck" id="passwordCheck" required>
       
        <p class="error" id="error-pwd"></p>
      </div>
      <div class="input__box">
        <span class="details">Nome</span>
        <input type="text" placeholder="Mario" name="nome" id="nome" required>
      </div>
      <div class="input__box">
        <span class="details">Cognome</span>
        <input type="text" placeholder="Rossi" name="cognome" id="cognome" required>
      </div>
    </div>
    <div class="gender__details">
      <input type="radio" name="sesso" id="dot-1" value="M" required>
      <input type="radio" name="sesso" id="dot-2" value="F">
      <input type="radio" name="sesso" id="dot-3" value="X">
      <span class="gender__title">Sesso</span>
      <div class="category">
        <label for="dot-1">
          <span class="dot one"></span>
          <span>Male</span>
        </label>
        <label for="dot-2">
          <span class="dot two"></span>
          <span>Female</span>
        </label>
        <label for="dot-3">
          <span class="dot three"></span>
          <span>Altro</span>
        </label>
      </div>
    </div>
    <div class="button">
      <input type="submit" value="Registrati">
    </div>
  </form>
  <a id="home" href="catalogo"><i class="fa fa-home" style="font-size:24px"></i></a>
</div>
	  
	<script src="./JS/registerValidation.js"></script>
	
</body>	
</html>