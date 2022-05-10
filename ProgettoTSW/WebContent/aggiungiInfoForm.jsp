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
	
	<% String target = (String) request.getAttribute("target"); 
		String utente = (String) request.getAttribute("utente");
		String error = (String) request.getSession().getAttribute("error");
		
		if(error != null){%> 
			<p><%out.println(error); %>
		<% request.getSession().removeAttribute("error");
		}
		if (target.equals("indirizzo")) {%>
			<form action="modificaInfo" method="post">
				<input type="hidden" name="utente" value="<%out.print(utente);%>">
				<input type="hidden" name="target" value="indirizzo">
				<input type="hidden" name="mode" value="add">
				<label for="via">Via</label><br>
				<input type="text" name="via" placeholder="Via"><br><br>
				<label for="citta">Citta</label><br>
				<input type="text" name="citta" placeholder="Citta"><br><br>
				<label for="CAP">CAP</label><br>
				<input type="text" name="CAP" placeholder="CAP"><br><br>
				<label for="civico">Civico</label><br>
				<input type="text" name="civico" placeholder="Civico"><br><br>
				<label for="provincia">Provincia</label><br>
				<input type="text" name="provincia" placeholder="Provincia"><br><br>
				<label for="nazione">Nazione</label><br>
				<input type="text" name="nazione" placeholder="Nazione"><br><br>
				<label for="scala">Scala</label><br>
				<input type="text" name="scala" placeholder="Scala (opzionale)"><br><br>
				<label for="interno">Interno</label><br>
				<input type="text" name="interno" placeholder="Interno (opzionale)"><br><br>
				<label for="preferito">Preferito</label><br>
				<select name="preferito">
						<option value="si" selected>Si</option>
						<option value="no">No</option>
				</select><br><br>
				<button type="submit">Aggiungi indirizzo</button>
			</form>
		<% } else if (target.equals("metodoPagamento")) {%>
			<form action="modificaInfo" method="post">
				<input type="hidden" name="utente" value="<%out.print(utente);%>">
				<input type="hidden" name="target" value="metodoPagamento">
				<input type="hidden" name="mode" value="add">
				<label for="via">Via</label><br>
				<input type="text" name="via" placeholder="Via"><br><br>
				<label for="citta">Citta</label><br>
				<input type="text" name="citta" placeholder="Citta"><br><br>
				<label for="CAP">CAP</label><br>
				<input type="text" name="CAP" placeholder="CAP"><br><br>
				<label for="civico">Civico</label><br>
				<input type="text" name="civico" placeholder="Civico"><br><br>
				<label for="provincia">Provincia</label><br>
				<input type="text" name="provincia" placeholder="Provincia"><br><br>
				<label for="nazione">Nazione</label><br>
				<input type="text" name="nazione" placeholder="Nazione"><br><br>
				<label for="tipo">Tipo</label><br>
				<select name="tipo">
					<option value="IBAN">IBAN</option>
					<option value="carta">Carta</option>
				</select><br><br>
				<label for="IBAN">IBAN</label><br>
				<input type="text" name="IBAN" placeholder="Riempire solo se scelto in precedenza"><br><br>
				<label for="numCarta">Numero carta</label><br>
				<input type="text" name="numCarta" placeholder="riempire solo se scelto in predecenza"><br><br>
				<label for="preferito">Preferito</label><br>
				<select name="preferito">
						<option value="si" selected>Si</option>
						<option value="no">No</option>
				</select><br><br>
				<button type="submit">Aggiungi metodo di pagamento</button>
			</form>
		<% } %>
	<jsp:include page="./footer.jsp" />
</body>
</html>