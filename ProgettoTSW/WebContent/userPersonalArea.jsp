<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Snackz</title>
<link rel="stylesheet" href="./Css/style.css">
</head>
<body>
	<jsp:include page="./header.jsp" />
	<div class="dati">
    <p>
    Ciao <% out.println(request.getSession().getAttribute("nome") + " " + request.getSession().getAttribute("cognome")); %>
    </p>
    <br />
    <form action="LogOutServlet" method="get">
		<input type="submit" value="logout" />
	</form>
  </div>
	<jsp:include page="./footer.jsp" />
</body>
</html>
