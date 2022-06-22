<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Snackz</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="./Css/login.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<% Boolean logged = (Boolean) request.getSession().getAttribute("logged");
		if(logged != null && logged.booleanValue()) {
			String utente = (String) request.getSession().getAttribute("utente");
			String redirect = "login?mode=getInfo";
			response.sendRedirect(redirect);
		}%>
  <div class="login">
      <div class="container-login">
        <h1>Accedi all'area personale</h1>
          <form action="login" method="post" id="login">         
           <input type="hidden" name="mode" value="login">

            
			<div class= "group">
				<input required type="text" class="input" name="username">
				  <span class="highlight"></span>
				  <span class="bar"></span>
				  <label class="label-registrazione">Username</label>
			</div>  
            
            <div class= "group">
				<input required type="password" class="input" name="password" id="password">
				  <span class="highlight"></span>
				  <span class="bar"></span>
				  <label class="label-registrazione">Password</label>
				  <i class="material-icons">visibility</i>
			</div> 
          
            <button type="submit" class="learn-more">
              <span class="circle" aria-hidden="true">
              <span class="icon arrow"></span>
              </span>
              <span class="button-text">Login</span>
          	</button>
          </form>

          <br>
          <br>
          
          <div >
            <a href="./registerForm.jsp">Registrati</a>
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

<script>
	 
     $(".material-icons").click(function(){
    	 if ($("#password").attr('type') == "password") {
    		 $("#password").attr('type','text');
    		 $(".material-icons").text('visibility_off');
    		 } else {
    			 
    			 $("#password").attr('type','password');
    			 $(".material-icons").text('visibility');
    		 }
     });
  
    </script>
</body>
</html>
