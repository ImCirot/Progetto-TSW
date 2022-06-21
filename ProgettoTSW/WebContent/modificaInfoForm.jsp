<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*" import="java.util.Base64.Decoder" import="java.util.Base64"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./Css/modificaForm.css">
<title>Snackz</title>
</head>
<body>
	<jsp:include page="./header.jsp" />
	<% Boolean logged = (Boolean) request.getSession().getAttribute("logged");
	
	if(logged == null){
		response.sendRedirect("./loginForm.jsp");
	} else {
	
	String target = (String) request.getAttribute("target"); 
		String error = (String) request.getSession().getAttribute("error");
		if (target.equals("utente")) {
			UtenteBean utente = (UtenteBean) request.getAttribute("utente");
			Decoder decoder = Base64.getDecoder();	
			String decodedPwd = new String(decoder.decode(utente.getPassword()));
		%>


<!-- 		NUOVO FORM DELLE INFO -->

	  <div class="container_form">
  	  <h3>Riempi i campi che vuoi cambiare</h3>
	  	   <form action="modificaInfo" method="post">
			<input type="hidden" name="utente" value="<% out.print(utente.getUsername());%>">
			<input type="hidden" name="target" value="utente">
			<input type="hidden" name="mode" value="update">
	    <div class="row">
	      <div class="col-25">
	        <label for="username">Username</label>
	        <input type="hidden" name="oldUsername" id="oldUsername" value="<%out.print(utente.getUsername());%>">
	      </div>
	      <div class="col-75">
	        <input required type="text" id="username" name="username" placeholder="Username" value="<%out.print(utente.getUsername());%>">
	        <span class="errors" id="error-username"></span>
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-25">
	        <label for="password">Password</label>
	        <input type="hidden" name="oldPassword" id="oldPassword" value="<%out.print(decodedPwd);%>">
	      </div>
	      <div class="col-75">
	        <input required type="password" id="password" name="password" placeholder="Password" value="<%out.print(decodedPwd);%>" >
	      </div>
	    </div>
	     <div class="row">
	      <div class="col-25">
	        <label for="passwordCheck">Ripeti Password</label>
	      </div>
	      <div class="col-75">
	        <input required type="password" id="passwordCheck" name="passwordCheck" placeholder="Ripeti Password" value="<%out.print(decodedPwd);%>" >
	      	<span class="errors" id="error-pwd"></span>
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-25">
	        <label for="email">Email</label>
	        <input type="hidden" name="oldEmail" id="oldEmail" value="<% out.print(utente.getEmail());%>">
	      </div>
	      <div class="col-75">
	        <input required type="text" id="email" name="email" placeholder="Email" value="<%out.print(utente.getEmail());%>">
	        <span class="errors" id="error-email"></span>
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-25">
	        <label for="nome">Nome</label>
	      </div>
	      <div class="col-75">
	        <input required type="text" id="nome" name="nome" placeholder="Nome" value="<%out.print(utente.getNome());%>">
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-25">
	        <label for="cognome">Cognome</label>
	      </div>
	      <div class="col-75">
	        <input required type="text" id="cognome" name="cognome" placeholder="Cognome" value="<%out.print(utente.getCognome());%>">
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-25">
	        <label for="sesso">Sesso</label>
	      </div>
	      <div class="col-75">
	        <select required id="sesso" name="sesso">
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
 					<%}%>
	        </select>
	      </div>
	    </div>
		    <div class="row">
	      		<input type="submit" value="Modifica dati">
	    	</div>
	    </form>

	    <% if(error != null) { %>
			<p> <% out.println(error); %> </p>
			<% request.getSession().removeAttribute("error");}%>
	   </div>
		<% } else if (target.equals("indirizzo")) {
			IndirizzoBean indirizzo = (IndirizzoBean) request.getAttribute("indirizzo");%>	
				<div class="container_form">
  	  				<h3>Riempi i campi che vuoi cambiare</h3>
				  	   <form action="modificaInfo" method="post">
						<input type="hidden" name="indirizzoID" value="<%out.print(indirizzo.getNumIndirizzoProgressivo());%>">
							<input type="hidden" name="utente" value="<%out.print(indirizzo.getUtente());%>">
							<input type="hidden" name="target" value="indirizzo">
							<input type="hidden" name="mode" value="update">
				    <div class="row">
				      <div class="col-25">
				        <label for="via">Via</label>
				      </div>
				      <div class="col-75">
				        <input required type="text" id="via" name="via" placeholder="Via" value="<%out.print(indirizzo.getVia());%>">
				      </div>
				    </div>
				    <div class="row">
				      <div class="col-25">
				        <label for="citta">Città</label>
				      </div>
				      <div class="col-75">
				        <input required type="text" id="citta" name="citta" placeholder="Città" value="<%out.print(indirizzo.getCitta());%>" >
				      </div>
				    </div>
				     <div class="row">
				      <div class="col-25">
				        <label for="CAP">CAP</label>
				      </div>
				      <div class="col-75">
				        <input required type="text" id="CAP" name="CAP" placeholder="CAP" value="<%out.print(indirizzo.getCAP());%>" >
				      </div>
				    </div>
				    <div class="row">
				      <div class="col-25">
				        <label for="civico">Civico</label>
				      </div>
				      <div class="col-75">
				        <input required type="text" id="civico" name="civico" placeholder="Civico" value="<%out.print(indirizzo.getCivico());%>">
				      </div>
				    </div>
				    <div class="row">
				      <div class="col-25">
				        <label for="provincia">Provincia</label>
				      </div>
				      <div class="col-75">
				        <input required type="text" id="provincia" name="provincia" placeholder="Provincia" value="<%out.print(indirizzo.getProvincia());%>">
				      </div>
				    </div>
				    <div class="row">
				      <div class="col-25">
				        <label for="nazione">Nazione</label>
				      </div>
				      <div class="col-75">
				        <input required type="text" id="nazione" name="nazione" placeholder="nazione" value="<%out.print(indirizzo.getNazione());%>">
				      </div>
				    </div>
				     <div class="row">
				      <div class="col-25">
				        <label for="scala">Scala</label>
				      </div>
				      <div class="col-75">
				        <input required type="text" id="scala" name="scala" placeholder="Scala" value="<%out.print(indirizzo.getScala());%>">
				      </div>
				    </div>
				     <div class="row">
				      <div class="col-25">
				        <label for="interno">Interno</label>
				      </div>
				      <div class="col-75">
				        <input required type="text" id="interno" name="interno" placeholder="Interno" value="<%out.print(indirizzo.getInterno());%>">
				      </div>
				    </div>
				    <div class="row">
				      <div class="col-25">
				        <label for="preferito">Preferito</label>
				      </div>
				      <div class="col-75">
				        <select required id="preferito" name="preferito">
				         <% if (indirizzo.getPreferito().equalsIgnoreCase("si")) {%>
			 						<option value="si" selected>Si</option>
			 						<option value="no">No</option>
			 			<%} else {%>
			 						<option value="si">Si</option>
			 						<option value="no" selected>No</option>
			 			<% } %>
				        </select>
				      </div>
				    </div>
					    <div class="row">
				      		<input type="submit" value="Modifica dati">
				    	</div>
				    </form>

	    <% if(error != null) { %>
			<p> <% out.println(error); %> </p>
			<% request.getSession().removeAttribute("error");}%>
	   </div>

		
		<% } else if (target.equals("metodoPagamento")) {
				MetodoDiPagamentoBean metodoPagamento = (MetodoDiPagamentoBean) request.getAttribute("metodoPagamento");%>
		
						<div class="container_form">
  	  				<h3>Riempi i campi che vuoi cambiare</h3>
				  	   <form action="modificaInfo" method="post">
						<input type="hidden" name="metodoPagamentoID" value="<%out.print(metodoPagamento.getNumPagamentoProgressivo());%>">
						<input type="hidden" name="utente" value="<%out.print(metodoPagamento.getUtente());%>">
						<input type="hidden" name="target" value="metodoPagamento">
						<input type="hidden" name="mode" value="update">
				    <div class="row">
				      <div class="col-25">
				        <label for="via">Via</label>
				      </div>
				      <div class="col-75">
				        <input required type="text" id="via" name="via" placeholder="Via" value="<%out.print(metodoPagamento.getVia());%>">
				      </div>
				    </div>
				    <div class="row">
				      <div class="col-25">
				        <label for="citta">Città</label>
				      </div>
				      <div class="col-75">
				        <input required type="text" id="citta" name="citta" placeholder="Città" value="<%out.print(metodoPagamento.getCitta());%>" >
				      </div>
				    </div>
				     <div class="row">
				      <div class="col-25">
				        <label for="CAP">CAP</label>
				      </div>
				      <div class="col-75">
				        <input required type="text" id="CAP" name="CAP" placeholder="CAP" value="<%out.print(metodoPagamento.getCAP());%>" >
				      </div>
				    </div>
				    <div class="row">
				      <div class="col-25">
				        <label for="civico">Civico</label>
				      </div>
				      <div class="col-75">
				        <input required type="text" id="civico" name="civico" placeholder="Civico" value="<%out.print(metodoPagamento.getCivico());%>">
				      </div>
				    </div>
				    <div class="row">
				      <div class="col-25">
				        <label for="provincia">Provincia</label>
				      </div>
				      <div class="col-75">
				        <input required type="text" id="provincia" name="provincia" placeholder="Provincia" value="<%out.print(metodoPagamento.getProvincia());%>">
				      </div>
				    </div>
				    <div class="row">
				      <div class="col-25">
				        <label for="nazione">Nazione</label>
				      </div>
				      <div class="col-75">
				        <input required type="text" id="nazione" name="nazione" placeholder="nazione" value="<%out.print(metodoPagamento.getNazione());%>">
				      </div>
				    </div>
				    <div class="row">
				      <div class="col-25">
				        <label for="tipo">Tipo</label>
				      </div>
				      <div class="col-75">
				        <select required id="tipo" name="tipo">
				         <% if (metodoPagamento.getTipo().equals("IBAN")) {%>
			 						<option value="IBAN" selected>IBAN</option>
			 						<option value="carta">Carta</option>
			 			<%} else {%>
			 						<option value="IBAN">IBAN</option>
			 						<option value="carta" selected>Carta</option>
			 			<% } %>
				        </select>
				      </div>
				    </div>
				    <div class="row">
				      <div class="col-25">
				        <label for="IBAN">IBAN</label>
				      </div>
				      <div class="col-75">
				        <input required type="text" id="IBAN" name="IBAN" placeholder="IBAN" value="<%out.print(metodoPagamento.getIBAN());%>">
				      </div>
				    </div>
				    <div class="row">
				      <div class="col-25">
				        <label for="numCarta">Numero Carta</label>
				      </div>
				      <div class="col-75">
				        <input required type="text" id="numCarta" name="numCarta" placeholder="Numero Carta" value="<%out.print(metodoPagamento.getNumCarta());%>">
				      </div>
				    </div>
				    <div class="row">
				      <div class="col-25">
				        <label for="preferito">Preferito</label>
				      </div>
				      <div class="col-75">
				        <select required id="preferito" name="preferito">
				         <% if (metodoPagamento.getPreferito().equalsIgnoreCase("si")) {%>
			 						<option value="si" selected>Si</option>
			 						<option value="no">No</option>
			 			<%} else {%>
			 						<option value="si">Si</option>
			 						<option value="no" selected>No</option>
			 			<% } %>
				        </select>
				      </div>
				    </div>
					    <div class="row">
				      		<input type="submit" value="Modifica dati">
				    	</div>
				    </form>

	    <% if(error != null) { %>
			<p> <% out.println(error); %> </p>
			<%request.getSession().removeAttribute("error");} %>
			<%}
		 }%>
	   </div>
	<jsp:include page="./footer.jsp" />
	<script src="./JS/updateFormValidation.js"></script>
</body>
</html>