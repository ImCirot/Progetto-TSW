<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Snackz</title>
<link rel="stylesheet" href="./Css/login.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
	<jsp:include page="./header.jsp" />
	<% Boolean logged = (Boolean) request.getSession().getAttribute("logged");
		if(logged != null && logged) {
			String utente = (String) request.getSession().getAttribute("utente");
			String redirect = "login?utente=" + utente +"&mode=getInfo";
			response.sendRedirect(redirect);
		}%>
		
  <div class="login">
    <h1>Accedi all'area personale:</h1>
  	<form action="login" method="post" id="login">
  		<input type="hidden" name="mode" value="login">
  		<label for="username">Username: </label><br />
  		<input type="text" id="username" name="username" /><br /><br />
  		<label for="password">Password: </label><br />
  		<input type="password" name="password" id="password" /><br /><br />
  		<button type="submit">Login</button>
  	</form>
  	<br>
  	<form action="login" method="get">
  		<input type="hidden" name="mode" value="register">
  		<button type="submit">Registrati</button>
  	</form>
  	
  	
  	<% String error = (String) request.getSession().getAttribute("error");
  		String result = (String) request.getSession().getAttribute("result");
  		if(error != null) {%>
  		<p class="error"><%out.println(error);%></p>
  		<% request.getSession().removeAttribute("error"); }
  		if(result != null) {%>
  		<p><% out.println(result); %></p>
  		<% request.getSession().removeAttribute("result"); }%>
  </div>
	<jsp:include page="./footer.jsp" /> 
</body>
</html>
