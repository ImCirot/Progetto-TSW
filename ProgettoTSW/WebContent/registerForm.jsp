<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./Css/registerForm.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<title>Snackz</title>
</head>
<body>	
	
	
	<div class="login">
		
	<div class="container">
	<h1>Welcome to my life</h1>
		<div class="center-login">
		<form action="login" method="post">
				
 			<input type="hidden" name="mode" value="register">
			<div class= "group">
				<input required="" type="text" class="input" name="username">
				  <span class="highlight"></span>
				  <span class="bar"></span>
				  <label class="label-registrazione">Username</label>
			</div>  
			
				<div class="group">
				  <input required="" type="text" class="input" name="email">
				  <span class="highlight"></span>
				  <span class="bar"></span>
				  <label class="label-registrazione">E-mail</label>
				</div>  
				
				<div class="group">
				  <input required="" type="password" class="input" name="password">
				  <span class="highlight"></span>
				  <span class="bar"></span>
				  <label class="label-registrazione">Password</label>
				</div>  
				
				<div class="group">
				  <input required="" type="password" class="input" name="passwordCheck">
				  <span class="highlight"></span>
				  <span class="bar"></span>
				  <label class="label-registrazione">Ripeti Password</label>
				</div>
				
				<div class="group">
				  <input required="" type="text" class="input" name="nome">
				  <span class="highlight"></span>
				  <span class="bar"></span>
				  <label class="label-registrazione">Nome</label>
				</div>
				
				<div class="group">
				  <input required="" type="text" class="input" name="cognome">
				  <span class="highlight"></span>
				  <span class="bar"></span>
				  <label class="label-registrazione">Cognome</label>
				</div>
				
					<label>Sesso</label>
					<br>
							<span class="dropdown-el"> 
								    <input type="radio" name="sesso" value="M" id="sort-best" checked><label for="sort-best">Uomo</label>
								    <input type="radio" name="sesso" value="F" id="sort-low"><label for="sort-low">Donna</label>
								    <input type="radio" name="sesso" value="X" id="sort-low2"><label for="sort-low2">Altro</label>
  							</span>
					
					<br><br>
					
					
				<button type="submit" class="learn-more">
					  <span class="circle" aria-hidden="true">
					  <span class="icon arrow"></span>
					  </span>
					  <span class="button-text">Registrati</span>
				</button>
				
		</form>
		
		</div>
		
		</div>
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
</body>	
</html>