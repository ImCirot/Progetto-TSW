<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./Css/registerForm.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<title>Snackz</title>
</head>
<body>	
	
	
<!-- 	<div class="login"> -->
		
<!-- 	<div class="container"> -->
<!-- 	<h1>Registrazione</h1> -->
<!-- 		<form action="login" method="post"> -->
<!--  			<input type="hidden" name="mode" value="register"> -->
<!-- 			<div class= "group"> -->
<!-- 				<input required type="text" class="input" name="username"> -->
<!-- 				  <span class="highlight"></span> -->
<!-- 				  <span class="bar"></span> -->
<!-- 				  <label class="label-registrazione">Username</label> -->
<!-- 				  <p class="errors" id="username-error"></p> -->
<!-- 			</div>   -->
<!-- 				<div class="group"> -->
<!-- 				  <input required type="text" class="input" name="email" id="email"> -->
<!-- 				  <span class="highlight"></span> -->
<!-- 				  <span class="bar"></span> -->
<!-- 				  <label class="label-registrazione">E-mail</label>	   -->
<!-- 				</div>   -->
<!-- 				<div class="group"> -->
<!-- 				  <input required type="password" class="input" id="password" name="password"> -->
<!-- 				  <span class="highlight"></span> -->
<!-- 				  <span class="bar"></span> -->
<!-- 				  <label class="label-registrazione">Password</label> -->
<!-- 				</div>   -->
<!-- 				<div class="group"> -->
<!-- 				  <input required type="password" class="input" id="passwordCheck" name="passwordCheck"> -->
<!-- 				  <span class="highlight"></span> -->
<!-- 				  <span class="bar"></span> -->
<!-- 				  <label class="label-registrazione">Ripeti Password</label> -->
<!-- 				  <p class="errors" id="pwd-check-error"></p> -->
<!-- 				</div> -->
<!-- 				<div class="group"> -->
<!-- 				  <input required type="text" class="input" name="nome"> -->
<!-- 				  <span class="highlight"></span> -->
<!-- 				  <span class="bar"></span> -->
<!-- 				  <label class="label-registrazione">Nome</label> -->
<!-- 				</div> -->
<!-- 				<div class="group"> -->
<!-- 				  <input required type="text" class="input" name="cognome"> -->
<!-- 				  <span class="highlight"></span> -->
<!-- 				  <span class="bar"></span> -->
<!-- 				  <label class="label-registrazione">Cognome</label> -->
<!-- 				</div> -->
<!-- 					<label>Sesso</label> -->
<!-- 					<br> -->
<!-- 							<span class="dropdown-el">  -->
<!-- 								    <input type="radio" name="sesso" value="M" id="sort-best" checked><label for="sort-best">Uomo</label> -->
<!-- 								    <input type="radio" name="sesso" value="F" id="sort-low"><label for="sort-low">Donna</label> -->
<!-- 								    <input type="radio" name="sesso" value="X" id="sort-low2"><label for="sort-low2">Altro</label> -->
<!--   							</span> -->
<!-- 					<br><br> -->
<!-- 				<button type="submit" class="learn-more"> -->
<!-- 					  <span class="circle" aria-hidden="true"> -->
<!-- 					  <span class="icon arrow"></span> -->
<!-- 					  </span> -->
<!-- 					  <span class="button-text">Registrati</span> -->
<!-- 				</button> -->
<!-- 				<a id="home" href="catalogo"><i class="fa fa-home" style="font-size:24px"></i></a> -->
<!-- 		</form> -->
<!-- 		</div> -->
<!-- 	</div> -->
	
	
	
	<div class="container">
  <div class="title">Registrazione</div>
  <form action="login" method="post">
  <input type="hidden" name="mode" value="register">
    <div class="user__details">
      <div class="input__box">
        <span class="details">Username</span>
        <input type="text" placeholder="E.g: John Smith" name="username" id="username" required>
        <p class="error" id="error-username"></p>
      </div>
      <div class="input__box">
      
        <span class="details">Email</span>
        
        <input type="text" placeholder="johnsmith@hotmail.com" name="email" id="email" required>
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
      <input type="radio" name="sesso" id="dot-1" value="M">
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
</div>
	<script>
		$('.dropdown-el').click(function(e) {
		  	e.preventDefault();
		  e.stopPropagation();
		  $(this).toggleClass('expanded');
		  $('#'+$(e.target).attr('for')).prop('checked',true);
		});
		$(document).click(function() {
		  $('.dropdown-el').removeClass('expanded');
		});
	</script>
	<script src="./JS/registerValidation.js"></script>
</body>	
</html>