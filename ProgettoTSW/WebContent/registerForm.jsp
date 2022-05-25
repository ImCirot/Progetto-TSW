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
				
<!-- 				<label for="sesso">Sesso</label> -->
<!-- 					<select name="sesso"> -->
<!-- 						<option value="M">M</option> -->
<!-- 						<option value="F">F</option> -->
<!-- 						<option value="X">Altro</option> -->
<!-- 					</select><br><br> -->
					
							<span class="dropdown-el">
							    <input type="radio" name="sortType" value="Relevance" checked="checked" id="sort-relevance"><label for="sort-relevance">Relevance</label>
							    <input type="radio" name="sortType" value="Popularity" id="sort-best"><label for="sort-best">Product Popularity</label>
							    <input type="radio" name="sortType" value="PriceIncreasing" id="sort-low"><label for="sort-low">Price Low to High</label>
							    <input type="radio" name="sortType" value="PriceDecreasing" id="sort-high"><label for="sort-high">Price High to Low</label>
							    <input type="radio" name="sortType" value="ProductBrand" id="sort-brand"><label for="sort-brand">Product Brand</label>
							    <input type="radio" name="sortType" value="ProductName" id="sort-name"><label for="sort-name">Product Name</label>
  							</span>
					
					
					
					
				<button type="submit" class="learn-more">
					  <span class="circle" aria-hidden="true">
					  <span class="icon arrow"></span>
					  </span>
					  <span class="button-text">Registrati</span>
				</button>
		</form>
	</div>
	
	<jsp:include page="./footer.jsp" />
	
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