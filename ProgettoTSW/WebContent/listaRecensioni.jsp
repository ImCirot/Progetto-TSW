<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8" import="model.*" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="./Css/indirizzi.css">
	<title>I miei ordini</title>
</head>
<body>
	<jsp:include page="./header.jsp" />
	 <div class="sezione">
    	<% if(request.getSession().getAttribute("logged") == null) {
    		response.sendRedirect("./loginForm.jsp");
    	} else {%>
      <% List<RecensioneBean> recensioni = (List<RecensioneBean>) request.getSession().getAttribute("recensioni"); 
  		Iterator<RecensioneBean> iterRecensioni = recensioni.iterator();
  		boolean admin = (boolean) request.getSession().getAttribute("admin");
  		RecensioneBean recensione = new RecensioneBean(); 
  		while (iterRecensioni.hasNext()){
  			recensione = iterRecensioni.next();%>
  		<div class="carte">
  		<h3>Recensione del <% out.print(recensione.getData());%></h3>
  		<%  if(admin) {%>
  			<p style="font-size:1.2em;">
  			<strong>Cliente:</strong> <% out.print(recensione.getCliente()); %>
  		</p>
  		<% } %>
  		<p style="font-size:1.2em;">
  			<strong>Prodotto:</strong> <% out.print(recensione.getProdotto()); %>
  		</p>
  		<p style="font-size:1.2em;">
  			<strong>Data recensione:</strong> <% out.print(recensione.getData()); %>
  		</p>
   		<p style="font-size:1.2em;">
  			<strong>Valutazione:</strong> <% out.print(recensione.getVoto());%>/5 stelle
  		</p>
  		<p style="font-size:1.2em;">
  		<strong>Anonimo:</strong>
  			<% if(recensione.isAnonimo()){ %>
  			si
  			<% } else { %>
  			no
  			<% } %>
  		</p><br><br>
  		<%
  			if(!admin) {
  		%>
  			<form action="recensione" method="post">
  				<input type="hidden" name="prodotto" value="<%out.print(recensione.getProdotto());%>">
  				<input type="hidden" name="cliente" value="<% out.print(recensione.getCliente()); %>">
  				<input type="hidden" name="mode" value="modifica">
  				<button class="cta">
					  <span>Modifica recensione</span>
					  <svg viewBox="0 0 13 10" height="10px" width="15px">
					    <path d="M1,5 L11,5"></path>
					    <polyline points="8 1 12 5 8 9"></polyline>
					  </svg>
				</button>
  			</form>
  		<% } else {%>
  			<!-- da fare dopo TODO -->
  		<% } %>
  		</div>
  		<%}
  		}%>
      </div>
	<jsp:include page="./footer.jsp" />
</body>
</html>