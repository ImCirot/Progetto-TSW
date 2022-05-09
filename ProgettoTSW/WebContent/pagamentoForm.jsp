<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Snackz</title>
</head>
<body>
	<% boolean logged = (boolean) request.getSession().getAttribute("logged"); 
		if(!logged){
			request.setAttribute("error", "Devi essere loggato per acquistare!");
			response.sendRedirect("./loginForm.jsp");
		}
	%>
	
	<
</body>
</html>