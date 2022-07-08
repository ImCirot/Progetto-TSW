<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Snackz</title>
</head>
<body>
	<% if(request.getAttribute("username") == null){
		response.sendRedirect("./errorePage.jsp");
	} else {
		String username = (String) request.getAttribute("username"); %>
		
		<form action="login" method="post">
		<input type="hidden" name="mode" value="resetPwd">
		<input type="hidden" name="username" value="<% out.print(username); %>">
		</form>
	<% } %>
</body>
</html>