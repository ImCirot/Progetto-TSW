<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*" import="java.util.Base64.Decoder" import="java.util.Base64"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Snackz</title>
</head>
<body>
	<jsp:include page="./header.jsp" />
	<% String target = (String) request.getAttribute("target"); 
		if (target.equals("utente")) {
			UtenteBean utente = (UtenteBean) request.getAttribute("utente");
			Decoder decoder = Base64.getDecoder();
		%>
			<form action="modificaInfo" method="post">
				<input type="hidden" name="utente" value="<% out.print(utente.getUsername());%>">
 				<label for="username">Username</label><br>
 				<input type="text" name="username" value="<% out.print(utente.getUsername());%>"><br><br>
 				<label for="password">Password</label>
 				<input type="password" name="password" value="<% out.print(decoder.decode(utente.getPassword()).toString());%>">
			</form>
		<% } %>
	<jsp:include page="./footer.jsp" />
</body>
</html>