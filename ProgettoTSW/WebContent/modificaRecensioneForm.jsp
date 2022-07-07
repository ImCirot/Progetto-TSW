<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="./Css/prodotto.css">
<title>Snackz</title>
</head>
<body>
	<jsp:include page="./header.jsp" />
	<% RecensioneBean recensione = (RecensioneBean) request.getAttribute("recensione"); %>
	<div class="container_form">
  	  				<h3>Aggiungi nuova recensione</h3>
				  	   <form action="recensione" method="post">
				  	   		<input type="hidden" name="mode" value="aggiorna">
							<input type="hidden" name="seriale" value="<% out.print(recensione.getCodiceSerialeProdotto());%>">
							<input type="hidden" name="prodotto" value="<%out.print(recensione.getProdotto());%>">
				    
				    <div class="row">
					      <div class="col-25">
					        <label for="recensione">Recensione</label>
					      </div>
					      <div class="col-75">
					        <textarea required id="recensioneTesto" name="testo" style="height:200px" placeholder="Max 250 caratteri" maxlength="250"><% out.print(recensione.getTestoRecensione()); %></textarea>
					      </div>
	    			</div>
	    			<div class="row">
				      <div class="col-25">
				        <label for="anonimo">Anonimo</label>
				      </div>
				      <div class="col-75">
				        <select required id="anonimo" name="anonimo">
				        	<% if(recensione.isAnonimo()){ %>
			 					<option value="si" selected>Si</option>
			 					<option value="no">No</option>
			 				<% } else { %>
			 					<option value="si">Si</option>
			 					<option value="no" selected>No</option>
			 				<% } %>
				        </select>
				      </div>
				       </div>
				      <div class="row">
				      <div class="col-25">
				        <label for="anonimo">Voto</label>
				      </div>
				      <div class="col-75">
				       	<div class="c4l-rating">
				       	<% if(recensione.getVoto() == 1){ %>
						    <input required class="input_prodotto" name="voto" type="radio" id="c4l-rate1" value="1" checked/>
						    <label for="c4l-rate1"></label>
						    <input class="input_prodotto" name="voto" type="radio" id="c4l-rate2" value="2" />
						    <label for="c4l-rate2"></label>
						    <input class="input_prodotto" name="voto" type="radio" id="c4l-rate3" value="3" />
						    <label for="c4l-rate3"></label>
						    <input class="input_prodotto" name="voto" type="radio" id="c4l-rate4" value="4" />
						    <label for="c4l-rate4"></label>
						    <input class="input_prodotto" name="voto" type="radio" id="c4l-rate5" value="5"  />
						    <label for="c4l-rate5"></label>
						<% } else if(recensione.getVoto() == 2) { %>
							<input required class="input_prodotto" name="voto" type="radio" id="c4l-rate1" value="1" />
						    <label for="c4l-rate1"></label>
						    <input class="input_prodotto" name="voto" type="radio" id="c4l-rate2" value="2" checked/>
						    <label for="c4l-rate2"></label>
						    <input class="input_prodotto" name="voto" type="radio" id="c4l-rate3" value="3" />
						    <label for="c4l-rate3"></label>
						    <input class="input_prodotto" name="voto" type="radio" id="c4l-rate4" value="4" />
						    <label for="c4l-rate4"></label>
						    <input class="input_prodotto" name="voto" type="radio" id="c4l-rate5" value="5"  />
						    <label for="c4l-rate5"></label>
						<% } else if(recensione.getVoto() == 3) { %>
							<input required class="input_prodotto" name="voto" type="radio" id="c4l-rate1" value="1" />
						    <label for="c4l-rate1"></label>
						    <input class="input_prodotto" name="voto" type="radio" id="c4l-rate2" value="2" />
						    <label for="c4l-rate2"></label>
						    <input class="input_prodotto" name="voto" type="radio" id="c4l-rate3" value="3" checked />
						    <label for="c4l-rate3"></label>
						    <input class="input_prodotto" name="voto" type="radio" id="c4l-rate4" value="4" />
						    <label for="c4l-rate4"></label>
						    <input class="input_prodotto" name="voto" type="radio" id="c4l-rate5" value="5"  />
						    <label for="c4l-rate5"></label>
						<% } else if(recensione.getVoto() == 4) { %>
							<input required class="input_prodotto" name="voto" type="radio" id="c4l-rate1" value="1" />
						    <label for="c4l-rate1"></label>
						    <input class="input_prodotto" name="voto" type="radio" id="c4l-rate2" value="2" />
						    <label for="c4l-rate2"></label>
						    <input class="input_prodotto" name="voto" type="radio" id="c4l-rate3" value="3"  />
						    <label for="c4l-rate3"></label>
						    <input class="input_prodotto" name="voto" type="radio" id="c4l-rate4" value="4" checked/>
						    <label for="c4l-rate4"></label>
						    <input class="input_prodotto" name="voto" type="radio" id="c4l-rate5" value="5"  />
						    <label for="c4l-rate5"></label>
						<% } else if(recensione.getVoto() == 5) { %>
							<input required class="input_prodotto" name="voto" type="radio" id="c4l-rate1" value="1" />
						    <label for="c4l-rate1"></label>
						    <input class="input_prodotto" name="voto" type="radio" id="c4l-rate2" value="2" />
						    <label for="c4l-rate2"></label>
						    <input class="input_prodotto" name="voto" type="radio" id="c4l-rate3" value="3"  />
						    <label for="c4l-rate3"></label>
						    <input class="input_prodotto" name="voto" type="radio" id="c4l-rate4" value="4" />
						    <label for="c4l-rate4"></label>
						    <input class="input_prodotto" name="voto" type="radio" id="c4l-rate5" value="5" checked/>
						    <label for="c4l-rate5"></label>
						<% } %>
						</div>
				    </div>
				      </div>
				      
					    <div class="row">
				      		<input type="submit" id="aggiungiRecensione" class="input_prodotto" value="Aggiungi Recensione">
				    	</div>
				    	
				    </form>
	   			</div>
	   			
	<jsp:include page="./footer.jsp" />
</body>
</html>