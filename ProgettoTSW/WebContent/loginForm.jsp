<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Snackz</title>
<link rel="stylesheet" href="./Css/userArea.css">
</head>
<body>
	<jsp:include page="./header.jsp" />
	<% Boolean logged = (Boolean) request.getSession().getAttribute("logged");
		if(logged != null && logged) {
			String utente = (String) request.getSession().getAttribute("utente");
			String redirect = "login?utente=" + utente;
			response.sendRedirect(redirect);
		}%>
  <div class="login">
    <h1>Accedi all'area personale:</h1>
  	<form action="login" method="post" id="login">
  		<label for="username">Username: </label><br />
  		<input type="text" id="username" name="username" /><br /><br />
  		<label for="password">Password: </label><br />
  		<input type="password" name="password" id="password" /><br /><br />
  		<input type="submit" value="Login" />
  	</form>
  	<% String error = (String) request.getSession().getAttribute("error");
  		if(error != null) {%>
  		<p class="error"><%out.println(error);%></p>
  		<%
  		request.getSession().removeAttribute("error");
  		}%>
  </div>
	<br />
	
		<footer class="sticky-footer">
	<a href="https://it-it.facebook.com/" target="_blank" class="links"><img alt="fb-logo" src="./Images/facebook-icon.png" class="socialLogo" /></a>
      <a href="https://www.instagram.com/" target="_blank" class="links"><img src="./Images/instagram-icon.png" alt="insta-logo" class="socialLogo" /></a>
        <p> © Snackz &copy; 2022. All rights reserved.</p>
    </footer>
	
</body>
</html>
