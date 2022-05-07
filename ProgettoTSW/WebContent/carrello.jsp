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
			
			Integer quantita;
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
				}%>
				<h4>Prodotto</h4>
				<p>
					<% out.println(prodotto.getCodiceSeriale()); 
						out.println(quantita);
						out.println(dettagli.getCostoUnitario());
					%>
				</p>
				<br><br><br>
			<%}
			} else {%>
			<p>Carrello vuoto! Aggiungi prima qualche prodotto!</p>
			<%}%>
	<jsp:include page="./footer.jsp" />
</body>
</html>