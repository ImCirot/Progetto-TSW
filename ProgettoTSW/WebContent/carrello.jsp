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
	
	<p>
		<% Map<String,Integer> carrello = (Map<String,Integer>) request.getSession().getAttribute("carrello");
			Iterator<String> iterKeys = carrello.keySet().iterator();
			List<ProdottoBean> prodotti = (List<ProdottoBean>) request.getSession().getAttribute("prodotti");
			List<DettaglioProdottoBean> dettagliProdotti = (List<DettaglioProdottoBean>) request.getSession().getAttribute("dettagliProdotti");
			
			Integer quantita;
			ProdottoBean prodotto = new ProdottoBean();
			DettaglioProdottoBean dettagli = new DettaglioProdottoBean();
			Iterator<ProdottoBean> iterProdotti = prodotti.iterator();
			Iterator<DettaglioProdottoBean> iterDettagli;
			String key;
			
			while(iterKeys.hasNext()){
				key = iterKeys.next();
				quantita = carrello.get(key);
				
			}
		%>
	</p>
	
	<jsp:include page="./footer.jsp" />
</body>
</html>