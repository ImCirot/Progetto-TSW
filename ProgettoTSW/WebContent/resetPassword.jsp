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
	<% if(request.getAttribute("username") == null){
		response.sendRedirect("./errorePage.jsp");
	} else {
		String username = (String) request.getAttribute("username"); %>
		
		<div class="login">
      <div class="container-login">
        <h1>Reset password</h1>
          <form action="login" method="post" id="modificaPwd">         
           <input type="hidden" name="mode" value="resetPwd">
           <input type="hidden" name="username" value="<% out.print(username); %>">

			<div class= "group">
				<input required type="password" class="input" name="pwd" id="pwd">
				  <span class="highlight"></span>
				  <span class="bar"></span>
				  <label class="label-registrazione">Password</label>
				  <i id="pwdShow" class="material-icons">visibility</i>
			</div>   
            
            <div class= "group">
				<input required type="password" class="input" name="pwdCheck" id="pwdCheck">
				  <span class="highlight"></span>
				  <span class="bar"></span>
				  <label class="label-registrazione">Ripeti Password</label>
				  <i id="pwdCheckShow" class="material-icons">visibility</i>
				  
			</div> 
				<p class="error" id="error-pwd" style="font-size: .8em"></p>
            <button type="submit" id="modifcaPwdBtn" class="learn-more">
              <span class="circle" aria-hidden="true">
              <span class="icon arrow"></span>
              </span>
              <span class="button-text">Modifica</span>
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
	<script>
	$(document).ready(function(){
     $("#pwdShow").click(function(){
    	 if ($("#pwd").attr('type') == "password") {
    		 $("#pwd").attr('type','text');
    		 $("#pwdShow").text('visibility_off');
    		 } else {
    			 
    			 $("#pwd").attr('type','password');
    			 $("#pwdShow").text('visibility');
    		 }
     });
     
     $("#pwdCheckShow").click(function(){
    	 if ($("#pwdCheck").attr('type') == "password") {
    		 $("#pwdCheck").attr('type','text');
    		 $("#pwdCheckShow").text('visibility_off');
    		 } else {
    			 
    			 $("#pwdCheck").attr('type','password');
    			 $("#pwdCheckShow").text('visibility');
    		 }
     });
  	
     $("#pwdCheck").keyup(function () {

         let slidePwd = 0;
         let pwd = $("#pwd").val();
         let pwdCheck = $("#pwdCheck").val();

         if(pwdCheck.valueOf() === pwd.valueOf()){
         	
             console.log("Le password corrispondono!");
             slidePwd = 0;
             valid = true;
             $("#error-pwd").slideUp();
             $("#error-pwd").text("");

         } else {

             console.log("Le password non corrispondono");
             valid = false;
             if(slidePwd == 0) {

                 $("#error-pwd").slideDown();
                 slidePwd = 1;

             }

             $("#error-pwd").text("Le password non corrispondono");

         }
     });
     
     $("#modifcaPwdBtn").click(function(){
     	if(valid){
     		$("#modificaPwd").submit();
     	} else {
     		event.preventDefault();
     	}
     })
	});
    </script>
</body>
</html>