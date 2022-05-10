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
		String error = (String) request.getSession().getAttribute("error");
		if (target.equals("utente")) {
			UtenteBean utente = (UtenteBean) request.getAttribute("utente");
			Decoder decoder = Base64.getDecoder();	
			String decodedPwd = new String(decoder.decode(utente.getPassword()));
		%>
			<form action="modificaInfo" method="post">
				<input type="hidden" name="utente" value="<% out.print(utente.getUsername());%>">
				<input type="hidden" name="target" value="utente">
				<input type="hidden" name="mode" value="update">
 				<label for="username">Username</label><br>
 				<input type="text" name="username" value="<% out.print(utente.getUsername());%>"><br><br>
 				<label for="password">Password</label><br>
 				<input type="password" name="password" value="<% out.print(decodedPwd);%>"><br><br>
 				<label for="passwordCheck">Ripeti password</label><br>
 				<input type="password" name="passwordCheck" value="<% out.print(decodedPwd);%>"><br><br>
 				<label for="email">Email</label><br>
				<input type="text" name="email" value="<%out.print(utente.getEmail());%>"><br><br>
				<label for="nome">Nome</label><br>
				<input type="text" name="nome" value="<%out.print(utente.getNome());%>"><br><br>
				<label for="cognome">Cognome</label><br>
				<input type="text" name="cognome" value="<%out.print(utente.getCognome());%>"><br><br>
				<label for="sesso">Sesso</label><br>
				<select name="sesso">
					<% if (utente.getSesso().equalsIgnoreCase("M")) {%>
						<option value="M" selected>M</option>
						<option value="F">F</option>
						<option value="X">Altro</option>
					<% } else if (utente.getSesso().equalsIgnoreCase("F")) {%> 
						<option value="M">M</option>
						<option value="F" selected>F</option>
						<option value="X">Altro</option>
					<% } else if (utente.getSesso().equalsIgnoreCase("X")) {%>
						<option value="M">M</option>
						<option value="F">F</option>
						<option value="X" selected>Altro</option>
					<% } %>
				</select><br><br>
				<button type="submit">Modifica dati</button>
			</form>
			<% if(error != null) { %>
				<p> <% out.println(error); %> </p>
			<% request.getSession().removeAttribute("error"); }%>
		<% } else if (target.equals("indirizzo")) {
			IndirizzoBean indirizzo = (IndirizzoBean) request.getAttribute("indirizzo");%>
			<form action="modificaInfo" method="post">
				<input type="hidden" name="indirizzoID" value="<%out.print(indirizzo.getNumIndirizzoProgressivo());%>">
				<input type="hidden" name="utente" value="<%out.print(indirizzo.getUtente());%>">
				<input type="hidden" name="target" value="indirizzo">
				<input type="hidden" name="mode" value="update">
				<label for="via">Via</label><br>
				<input type="text" name="via" value="<%out.print(indirizzo.getVia());%>"><br><br>
				<label for="citta">Citta</label><br>
				<input type="text" name="citta" value="<% out.print(indirizzo.getCitta());%>"><br><br>
				<label for="CAP">CAP</label><br>
				<input type="text" name="CAP" value="<% out.print(indirizzo.getCAP()); %>"><br><br>
				<label for="civico">Civico</label><br>
				<input type="text" name="civico" value="<% out.print(indirizzo.getCivico()); %>"><br><br>
				<label for="provincia">Provincia</label><br>
				<input type="text" name="provincia" value="<% out.print(indirizzo.getProvincia()); %>"><br><br>
				<label for="nazione">Nazione</label><br>
				<input type="text" name="nazione" value="<% out.print(indirizzo.getNazione()); %>"><br><br>
				<label for="scala">Scala</label><br>
				<input type="text" name="scala" value="<% out.print(indirizzo.getScala()); %>"><br><br>
				<label for="interno">Interno</label><br>
				<input type="text" name="interno" value="<% out.print(indirizzo.getInterno()); %>"><br><br>
				<label for="preferito">Preferito</label><br>
				<select name="preferito">
					<% if(indirizzo.getPreferito().equalsIgnoreCase("si")){ %>
						<option value="si" selected>Si</option>
						<option value="no">No</option>
					<% } else {%>
						<option value="si">Si</option>
						<option value="no" selected>No</option>
					<% } %>
				</select><br><br>
				<button type="submit">Modifica dati</button>
			</form>	
			<% if(error != null) { %>
				<p> <% out.println(error); %> </p>
			<% request.getSession().removeAttribute("error"); }%>
		<% } else if (target.equals("metodoPagamento")) {
			MetodoDiPagamentoBean metodoPagamento = (MetodoDiPagamentoBean) request.getAttribute("metodoPagamento");%>
			<form action="modificaInfo" method="post">
				<input type="hidden" name="metodoPagamentoID" value="<%out.print(metodoPagamento.getNumPagamentoProgressivo());%>">
				<input type="hidden" name="utente" value="<%out.print(metodoPagamento.getUtente());%>">
				<input type="hidden" name="target" value="metodoPagamento">
				<input type="hidden" name="mode" value="update">
				<label for="via">Via</label><br>
				<input type="text" name="via" value="<%out.print(metodoPagamento.getVia());%>"><br><br>
				<label for="citta">Citta</label><br>
				<input type="text" name="citta" value="<% out.print(metodoPagamento.getCitta());%>"><br><br>
				<label for="CAP">CAP</label><br>
				<input type="text" name="CAP" value="<% out.print(metodoPagamento.getCAP()); %>"><br><br>
				<label for="civico">Civico</label><br>
				<input type="text" name="civico" value="<% out.print(metodoPagamento.getCivico()); %>"><br><br>
				<label for="provincia">Provincia</label><br>
				<input type="text" name="provincia" value="<% out.print(metodoPagamento.getProvincia()); %>"><br><br>
				<label for="nazione">Nazione</label><br>
				<input type="text" name="nazione" value="<% out.print(metodoPagamento.getNazione()); %>"><br><br>
				<label for="tipo">Tipo</label><br>
				<select name="tipo">
					<% if(metodoPagamento.getTipo().equals("IBAN")) { %>
					<option value="IBAN" selected>IBAN</option>
					<option value="carta">Carta</option>
					<% } else { %>
					<option value="IBAN">IBAN</option>
					<option value="carta" selected>Carta</option>
					<% } %>
				</select><br><br>
				<label for="IBAN">IBAN</label><br>
				<input type="text" name="IBAN" value="<% out.print(metodoPagamento.getIBAN()); %>"><br><br>
				<label for="numCarta">Numero carta</label><br>
				<input type="text" name="numCarta" value="<% out.print(metodoPagamento.getNumCarta()); %>"><br><br>
				<label for="preferito">Preferito</label><br>
				<select name="preferito">
					<% if(metodoPagamento.getPreferito().equalsIgnoreCase("si")){ %>
						<option value="si" selected>Si</option>
						<option value="no">No</option>
					<% } else {%>
						<option value="si">Si</option>
						<option value="no" selected>No</option>
					<% } %>
				</select><br><br>
				<button type="submit">Modifica dati</button>
			</form>	
			<% if(error != null) { %>
				<p> <% out.println(error); %> </p>
			<% request.getSession().removeAttribute("error"); }%>
		<% } %>
	<jsp:include page="./footer.jsp" />
</body>
</html>