<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./Css/modificaForm.css">
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
		
<!-- 		INIZIO DEL NUOVO FORM -->

				<div class="container_form">
  	  				<h3>Riempi i campi</h3>
				  	   <form action="modificaInfo" method="post">
							<input type="hidden" name="utente" value="<%out.print(utente);%>">
							<input type="hidden" name="target" value="indirizzo">
							<input type="hidden" name="mode" value="add">
				    <div class="row">
				      <div class="col-25">
				        <label for="via">Via</label>
				      </div>
				      <div class="col-75">
				        <input required type="text" id="via" name="via" placeholder="Via">
				      </div>
				    </div>
				    <div class="row">
				      <div class="col-25">
				        <label for="citta">Città</label>
				      </div>
				      <div class="col-75">
				        <input required type="text" id="citta" name="citta" placeholder="Città">
				      </div>
				    </div>
				     <div class="row">
				      <div class="col-25">
				        <label for="CAP">CAP</label>
				      </div>
				      <div class="col-75">
				        <input required type="text" id="CAP" name="CAP" placeholder="CAP">
				      </div>
				    </div>
				    <div class="row">
				      <div class="col-25">
				        <label for="civico">Civico</label>
				      </div>
				      <div class="col-75">
				        <input required type="text" id="civico" name="civico" placeholder="Civico">
				      </div>
				    </div>
				    <div class="row">
				      <div class="col-25">
				        <label for="provincia">Provincia</label>
				      </div>
				      <div class="col-75">
				        <input required type="text" id="provincia" name="provincia" placeholder="Provincia">
				      </div>
				    </div>
				    <div class="row">
				      <div class="col-25">
				        <label for="nazione">Nazione</label>
				      </div>
				      <div class="col-75">
				        <input required type="text" id="nazione" name="nazione" placeholder="Nazione">
				      </div>
				    </div>
				     <div class="row">
				      <div class="col-25">
				        <label for="scala">Scala</label>
				      </div>
				      <div class="col-75">
				        <input type="text" id="scala" name="scala" placeholder="Scala (opzionale)">
				      </div>
				    </div>
				     <div class="row">
				      <div class="col-25">
				        <label for="interno">Interno</label>
				      </div>
				      <div class="col-75">
				        <input type="text" id="interno" name="interno" placeholder="Interno (opzionale)">
				      </div>
				    </div>
				    <div class="row">
				      <div class="col-25">
				        <label for="preferito">Preferito</label>
				      </div>
				      <div class="col-75">
				        <select required id="preferito" name="preferito">
			 					<option value="si" selected>Si</option>
			 					<option value="no">No</option>
				        </select>
				      </div>
				    </div>
					    <div class="row">
				      		<input type="submit" value="Aggiungi Indirizzo">
				    	</div>
				    </form>
	   </div>

<!-- FINE  -->
		
		
		<% } else if (target.equals("metodoPagamento")) {%>
		
		<!-- 		INIZIO DEL NUOVO FORM PAGAMENTO -->
		
								<div class="container_form">
  	  				<h3>Riempi i campi</h3>
				  	   <form action="modificaInfo" method="post">
							<input type="hidden" name="utente" value="<%out.print(utente);%>">
							<input type="hidden" name="target" value="metodoPagamento">
							<input type="hidden" name="mode" value="add">
				    <div class="row">
				      <div class="col-25">
				        <label for="via">Via</label>
				      </div>
				      <div class="col-75">
				        <input required type="text" id="via" name="via" placeholder="Via">
				      </div>
				    </div>
				    <div class="row">
				      <div class="col-25">
				        <label for="citta">Città</label>
				      </div>
				      <div class="col-75">
				        <input required type="text" id="citta" name="citta" placeholder="Città">
				      </div>
				    </div>
				     <div class="row">
				      <div class="col-25">
				        <label for="CAP">CAP</label>
				      </div>
				      <div class="col-75">
				        <input required type="text" id="CAP" name="CAP" placeholder="CAP">
				      </div>
				    </div>
				    <div class="row">
				      <div class="col-25">
				        <label for="civico">Civico</label>
				      </div>
				      <div class="col-75">
				        <input required type="text" id="civico" name="civico" placeholder="Civico">
				      </div>
				    </div>
				    <div class="row">
				      <div class="col-25">
				        <label for="provincia">Provincia</label>
				      </div>
				      <div class="col-75">
				        <input required type="text" id="provincia" name="provincia" placeholder="Provincia">
				      </div>
				    </div>
				    <div class="row">
				      <div class="col-25">
				        <label for="nazione">Nazione</label>
				      </div>
				      <div class="col-75">
				        <input required type="text" id="nazione" name="nazione" placeholder="nazione">
				      </div>
				    </div>
				    <div class="row">
				      <div class="col-25">
				        <label for="tipo">Tipo</label>
				      </div>
				      <div class="col-75">
				        <select required id="tipo" name="tipo">
			 					<option value="IBAN" selected>IBAN</option>
			 					<option value="carta">Carta</option>
				        </select>
				      </div>
				    </div>
				    <div class="row">
				      <div class="col-25">
				        <label for="IBAN">IBAN</label>
				      </div>
				      <div class="col-75">
				        <input type="text" id="IBAN" name="IBAN" placeholder="IBAN">
				      </div>
				    </div>
				    <div class="row">
				      <div class="col-25">
				        <label for="numCarta">Numero Carta</label>
				      </div>
				      <div class="col-75">
				        <input type="text" id="numCarta" name="numCarta" placeholder="Numero Carta">
				      </div>
				    </div>
				    <div class="row">
				      <div class="col-25">
				        <label for="preferito">Preferito</label>
				      </div>
				      <div class="col-75">
				        <select required id="preferito" name="preferito">
			 					<option value="si" selected>Si</option>
			 					<option value="no">No</option>
				        </select>
				      </div>
				    </div>
					    <div class="row">
				      		<input type="submit" value="Aggiungi Metodo di Pagamento">
				    	</div>
				    </form>
				<%}%>
		 
	   </div>
		
		<!-- FINE  -->
		

		
	<jsp:include page="./footer.jsp" />
</body>
</html>