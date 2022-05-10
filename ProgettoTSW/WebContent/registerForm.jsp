<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Snackz</title>
</head>
<body>	
	<jsp:include page="./header.jsp" />
	<form action="login" method="post">
		<input type="hidden" name="mode" value="register">
		<label for="username">Username</label><br>
		<input type="text" name="username" placeholder="username"><br><br>
		<label for="password">Password</label><br>
		<input type="password" name="password" placeholder="password"><br><br>
		<label for="passwordCheck">Ripeti password</label><br>
		<input type="password" name="passwordCheck" placeholder="ripeti password"><br><br>
		<label for="email">Email</label><br>
		<input type="text" name="email" placeholder="email"><br><br>
		<label for="nome">Nome</label><br>
		<input type="text" name="nome" placeholder="nome"><br><br>
		<label for="cognome">Cognome</label><br>
		<input type="text" name="cognome" placeholder="cognome"><br><br>
		<label for="sesso">Sesso</label><br>
		<select name="sesso">
			<option value="M">M</option>
			<option value="F">F</option>
			<option value="X">Altro</option>
		</select><br><br>
		<button type="submit">Registrati</button>
	</form>
	<jsp:include page="./footer.jsp" />
</body>	
</html>