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
		<% Map<String,Integer> carrello = (Map<String,Integer>) request.getSession().getAttribute("carrello");
		if(carrello != null){
			Iterator<String> iterKeys = carrello.keySet().iterator();
			List<ProdottoBean> prodotti = (List<ProdottoBean>) request.getSession().getAttribute("prodotti");
			List<DettaglioProdottoBean> dettagliProdotti = (List<DettaglioProdottoBean>) request.getSession().getAttribute("dettagliProdotti");
			Double costoTot = 0.0;
			
			Integer quantita = 0;
			ProdottoBean prodotto = new ProdottoBean();
			DettaglioProdottoBean dettagli = new DettaglioProdottoBean();
			Iterator<ProdottoBean> iterProdotti;
			Iterator<DettaglioProdottoBean> iterDettagli;
			String key;
			
			while(iterKeys.hasNext()){
				key = iterKeys.next();
				quantita = carrello.get(key);
				iterProdotti = prodotti.iterator();
				while(iterProdotti.hasNext()){
					prodotto = iterProdotti.next();
					if(prodotto.getCodiceSeriale().equals(key)) break;
				}
				
				iterDettagli = dettagliProdotti.iterator();
				while(iterDettagli.hasNext()){
					dettagli = iterDettagli.next();
					if(dettagli.getProdotto().equals(key)) break;
				}
				
				costoTot += dettagli.getCostoUnitario().doubleValue() * quantita;
				%>
				<h4>Prodotto</h4>
				<p>
					<% out.println(prodotto.getCodiceSeriale()); 
						out.println(dettagli.getCostoUnitario());
					%>
				</p>
				<form action="Carrello" method="get"> 
					<input type="number" name="quantita" value="<%out.print(quantita);%>">
					<input type="hidden" name="prodotto" value="<%out.print(prodotto.getCodiceSeriale());%>">
					<input type="hidden" name="mode" value="update">
					<button type="submit">Aggiorna</button>
				</form>
				<form action="Carrello" method="get">
					<input type="hidden" name="prodotto" value="<%out.print(prodotto.getCodiceSeriale());%>">
					<input type="hidden" name="mode" value="remove">
					<button type="submit">Rimuovi</button>
				</form>
				<br><br><br>
			<%}%>
				<p>Prezzo totale<br>
					<% out.println(costoTot);%>
				</p>
				<form action="Carrello" method="post">
					<input type="hidden" name="costoTot" value="<%out.print(costoTot);%>">
					<button type="submit">Procedi all'acquisto</button>
				</form>
			<%} else {%>
			<p>Carrello vuoto! Aggiungi prima qualche prodotto!</p>
			<%}%>
	<jsp:include page="./footer.jsp" />
</body>
</html>