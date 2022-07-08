<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Password</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="./Css/login.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<% if(request.getAttribute("forgot") == null){ 
		response.sendRedirect("./errorePage.jsp");
	} else {%>
		<div class="login">
      <div class="container-login">
        <h1>Reset password</h1>
          <form action="login" autocomplete="off" method="post" id="inviaDati">         
           <input type="hidden" name="mode" value="resetPwdData">

            
			<div class= "group">
				<input required type="text" class="input" id="username" name="username">
				  <span class="highlight"></span>
				  <span class="bar"></span>
				  <label class="label-registrazione">Username</label>
				  <p class="error" id="error-username"></p>
			</div>  
            
            <div class= "group">
				<input required type="text" class="input" name="email" id="email">
				  <span class="highlight"></span>
				  <span class="bar"></span>
				  <label class="label-registrazione">Email</label>
				  <p class="error" id="error-email"></p>
			</div>
			<div class= "group">
				<input required type="text" class="input" name="nome" id="nome">
				  <span class="highlight"></span>
				  <span class="bar"></span>
				  <label class="label-registrazione">Nome</label>
				  <p class="error" id="error-name"></p>
			</div>
			<div class= "group">
				<input required type="text" class="input" name="cognome" id="cognome">
				  <span class="highlight"></span>
				  <span class="bar"></span>
				  <label class="label-registrazione">Cognome</label>
				  <p class="error" id="error-surname"></p>
			</div>
            <button type="submit" id="inviaDatiBtn" class="learn-more">
              <span class="circle" aria-hidden="true">
              <span class="icon arrow"></span>
              </span>
              <span class="button-text">Invia dati</span>
          	</button>
          </form>

          <br>
          <br>
          <div>
          <br>
          <a id="home" href="catalogo"><i class="fa fa-home" style="font-size:24px"></i></a>
      </div>
  	<% String error = (String) request.getSession().getAttribute("error");
  		String result = (String) request.getSession().getAttribute("result");
  		if(error != null) {%>
  		<p class="error"><%out.println(error);%></p>
  		<% request.getSession().removeAttribute("error"); }
  		if(result != null) {%>
  		<p><% out.println(result); %></p>
  		<% request.getSession().removeAttribute("result"); }%>
  </div>
</div>
	<% } %>
	<script src="./JS/resetPwdValidation.js"></script>
</body>
</html>