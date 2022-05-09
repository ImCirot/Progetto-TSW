<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Snackz</title>
</head>
<body>
	<jsp:include page="./header.jsp" />
	<% List<MetodoDiPagamentoBean> listaMetodi = (List<MetodoDiPagamentoBean>) request.getSession().getAttribute("metodiPagamento");
		List<IndirizzoBean> listaIndirizzi = (List<IndirizzoBean>) request.getSession().getAttribute("indirizzi");
		Iterator<MetodoDiPagamentoBean> iterMetodiPagamento = listaMetodi.iterator();
		Iterator<IndirizzoBean> iterIndirizzi = listaIndirizzi.iterator(); 
		IndirizzoBean indirizzo = new IndirizzoBean();
		MetodoDiPagamentoBean metodPagamento = new MetodoDiPagamentoBean();%>
		
		<form action="ordine" method="post">
		<input type="hidden" name="costoTot" value="<% out.print(request.getAttribute("costoTot"));%>">
		<h4>Scegli indirizzo di spedizione</h4><br>
		<fieldset>
		<%	while(iterIndirizzi.hasNext()){
			indirizzo = iterIndirizzi.next();
			if(indirizzo.getPreferito().equals("si")){ %>
				<input type="radio" name="indirizzo" id="indirizzo" value="<%out.print(indirizzo.getNumIndirizzoProgressivo());%>" checked>
				<label for="indirizzo"><% out.println(indirizzo.getVia() + " " + indirizzo.getCivico() + " " 
					+ indirizzo.getCitta() + " " + indirizzo.getCAP() + " " + indirizzo.getProvincia() + " " + indirizzo.getNazione());
					if(indirizzo.getScala() != null){
						out.print(indirizzo.getScala() + " ");
					}
					if(indirizzo.getInterno() != null){
						out.print(indirizzo.getInterno());
					}
					%></label><br><br>
			<%} else { %>
				<input type="radio" name="indirizzo" id="indirizzo" value="<%out.print(indirizzo.getNumIndirizzoProgressivo());%>">
				<label for="indirizzo"><% out.println(indirizzo.getVia() + " " + indirizzo.getCivico() + " " 
						+ indirizzo.getCitta() + " " + indirizzo.getCAP() + " " + indirizzo.getProvincia() + " " + indirizzo.getNazione());
						if(indirizzo.getScala() != null){
							out.print(indirizzo.getScala() + " ");
						}
						if(indirizzo.getInterno() != null){
							out.print(indirizzo.getInterno());
						}
						%></label><br><br>
			<% } %>
		<%}%>
		<a href="#">Aggiungi indirizzo</a>
		</fieldset>
		
		<h4>Scegli un metodo di pagamento</h4>
		<fieldset>
		<% while(iterMetodiPagamento.hasNext()){
			metodPagamento = iterMetodiPagamento.next();
			if(metodPagamento.getPreferito().equals("si")){%>
				<input type="radio" name="metodoPagamento" id="pagamento" value="<%out.print(metodPagamento.getNumPagamentoProgressivo());%>" checked>
				<label for="pagamento"><% out.println(metodPagamento.getTipo());
			if(metodPagamento.getTipo().equals("IBAN")) {
				out.println(metodPagamento.getIBAN());
			} else {
				out.println(metodPagamento.getNumCarta());
			}
						%></label><br><br>
		<% } else { %>
			<input type="radio" name="metodoPagamento" id="pagamento" value="<%out.print(metodPagamento.getNumPagamentoProgressivo());%>">
			<label for="pagamento"><% out.println(metodPagamento.getTipo());
			if(metodPagamento.getTipo().equals("IBAN")) {
				out.println(metodPagamento.getIBAN());
			} else {
				out.println(metodPagamento.getNumCarta());
			}
						%></label><br><br>
		<% }
		} %>
		<a href="#">Aggiungi metodo di pagamento</a>
		</fieldset>
		<br><br>
		<button type="submit">Acquista</button>
		<br><br>
		</form>
	<jsp:include page="./footer.jsp" />
</body>
</html>