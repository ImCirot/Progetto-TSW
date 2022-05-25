<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./Css/registerForm.css">
<title>Snackz</title>
</head>
<body>	
	<jsp:include page="./header.jsp" />
	
	<div class="container">
		<form action="login" method="post">
				
<!-- 			<input type="hidden" name="mode" value="register"> -->
<!-- 			<label for="username">Username</label><br> -->
<!-- 			<input type="text" name="username" placeholder="username"><br><br> -->
			<div class= "group">
				<input required="" type="text" class="input" name="username">
				  <span class="highlight"></span>
				  <span class="bar"></span>
				  <label>Username</label>
			</div>  
			
				<div class="group">
				  <input required="" type="text" class="input" name="email">
				  <span class="highlight"></span>
				  <span class="bar"></span>
				  <label>E-mail</label>
				</div>  
				
				<div class="group">
				  <input required="" type="password" class="input" name="password">
				  <span class="highlight"></span>
				  <span class="bar"></span>
				  <label>Password</label>
				</div>  
				
				<div class="group">
				  <input required="" type="password" class="input" name="passwordCheck">
				  <span class="highlight"></span>
				  <span class="bar"></span>
				  <label>Ripeti Password</label>
				</div>
				
				<div class="group">
				  <input required="" type="text" class="input" name="nome">
				  <span class="highlight"></span>
				  <span class="bar"></span>
				  <label>Nome</label>
				</div>
				
				<div class="group">
				  <input required="" type="text" class="input" name="cognome">
				  <span class="highlight"></span>
				  <span class="bar"></span>
				  <label>Cognome</label>
				</div>
				
				<label for="sesso">Sesso</label>
					<select name="sesso">
						<option value="M">M</option>
						<option value="F">F</option>
						<option value="X">Altro</option>
					</select><br><br>
					
				<button type="submit" class="learn-more">
					  <span class="circle" aria-hidden="true">
					  <span class="icon arrow"></span>
					  </span>
					  <span class="button-text">Registrati</span>
				</button>
				
<!-- 			<label for="password">Password</label><br> -->
<!-- 			<input type="password" name="password" placeholder="password"><br><br> -->
<!-- 			<label for="passwordCheck">Ripeti password</label><br> -->
<!-- 			<input type="password" name="passwordCheck" placeholder="ripeti password"><br><br> -->
<!-- 			<label for="email">Email</label><br> -->
<!-- 			<input type="text" name="email" placeholder="email"><br><br> -->
<!-- 			<label for="nome">Nome</label><br> -->
<!-- 			<input type="text" name="nome" placeholder="nome"><br><br> -->
<!-- 			<label for="cognome">Cognome</label><br> -->
<!-- 			<input type="text" name="cognome" placeholder="cognome"><br><br> -->
<!-- 			<label for="sesso">Sesso</label><br> -->
<!-- 			<select name="sesso"> -->
<!-- 				<option value="M">M</option> -->
<!-- 				<option value="F">F</option> -->
<!-- 				<option value="X">Altro</option> -->
<!-- 			</select><br><br> -->
<!-- 			<button type="submit">Registrati</button> -->
		</form>
	</div>
	
	<jsp:include page="./footer.jsp" />
</body>	
</html>