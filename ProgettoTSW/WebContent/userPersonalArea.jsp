<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Snackz</title>
<link rel="stylesheet" href="./Css/userArea.css">
</head>
<body>
	<% boolean logged = (boolean) request.getSession().getAttribute("logged");
		if(!logged){
			response.sendRedirect("./loginForm.jsp");
		}
	%>
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
  
  <div class="container-info">
  	<h4>I tuoi indirizzi di spedizione</h4>
  	<% List<IndirizzoBean> indirizzi = (List<IndirizzoBean>) request.getSession().getAttribute("indirizzi"); 
  		Iterator<IndirizzoBean> iterIndirizzi = indirizzi.iterator();
  		int i = 0;
  		IndirizzoBean indirizzo = new IndirizzoBean();
  		
  		while(iterIndirizzi.hasNext()){
  			indirizzo = iterIndirizzi.next();%>
  			i += 1;
  			<div class="info">
  			<h4>Indirizzo <%out.print(i);%></h4>
  			<p class="indirizzo">
  				<% out.print(indirizzo.getVia() + " " + indirizzo.getCivico() + " ");
  					if(indirizzo.getScala() != "null") {
  						out.print(indirizzo.getScala() + " ");
  					}
  					
  					if(indirizzo.getInterno() != "null") {
  						out.print(indirizzo.getInterno() + "  ");
  					}
  					
  					out.print("\n");
  					out.println(indirizzo.getCitta() + "," + indirizzo.getProvincia() + " " + indirizzo.getCAP());
  					out.println(indirizzo.getNazione());
  				%>
  			</p>
  			</div>
  		<%}%>
  	
  </div>
  
	<jsp:include page="./footer.jsp" />
</body>
</html>
