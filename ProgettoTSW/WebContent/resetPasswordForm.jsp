<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Password</title>
</head>
<body>
	<% if(request.getAttribute("forgot") == null){ 
		response.sendRedirect("./errorePage.jsp");
	} else {%>
		<form action="login" method="post">
		<input type="hidden" name="mode" value="resetPwdData">
		
		</form>
	<% } %>
</body>
</html>