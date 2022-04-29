<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./Css/style.css">
<title>Snackz</title>
</head>
<body>
	<% boolean admin = (boolean) request.getSession().getAttribute("admin");
		if(!admin){
			response.sendError(401);
		}
	%>
	<jsp:include page="./header.jsp" />
  <div class="gestisciProdotti">
    <table class="tableProdotti" border="1">
    <tr>
      <th>Codice Seriale</th>
      <th>Nome</th>
      <th>Marca</th>
      <th>Opzioni</th>
    <% List<ProdottoBean> prodotti = (List<ProdottoBean>) request.getAttribute("prodotti");
    	Iterator<ProdottoBean> iter = prodotti.iterator();
    	ProdottoBean prodotto = new ProdottoBean();
    	while(iter.hasNext()){
    		prodotto = iter.next();
    %>
     <tr>
    	<td><%out.println(prodotto.getCodiceSeriale());%></td>
      <td><%out.println(prodotto.getNome());%></td>
      <td><%out.println(prodotto.getMarca());%></td>
      <td>
        <a href="modificaProdotto">Modifica</a><br>
        <a href="eliminaProdotto">Elimina</a>
      </td>
     </tr>
    	<%}%>
    </table>
    </div>
    <br><br><br><br><br>
    <div class="aggiungiProdotto">
	    <h3>Aggiungi un prodotto</h3>
	    <form action="aggiungiProdotto" method="post">
	      <label for="codiceSeriale">Codice Seriale</label><br>
	      <input type="text" name="codiceSeriale" placeholder="Codice seriale"><br><br>
	      <label for="nome">Nome</label><br>
	      <input type="text" name="nome" placeholder="Nome"><br><br>
	      <label for="marca">Marca</label><br>
	      <input type="text" name="marca" placeholder="Marca"><br><br>
	      <label for="desc">Descrizione</label><br>
	      <textarea name="desc" rows="8" cols="80"></textarea><br><br>
	      <label for="edLimitata">Edizione Limitata</label><br>
	      <select name="edLimitata">
	        <option value="si">Si</option>
	        <option value="no">No</option>
	      </select><br><br>
	      <label for="tipo">Tipo prodotto</label><br>
	      <input type="text" name="tipo" placeholder="Snack o drink"><br><br>
	      <label for="costo">Costo</label><br>
	      <input type="text" name="costo" placeholder="Costo unitario"><br><br>
	      <label for="IVA">IVA</label><br>
	      <input type="text" name="IVA" placeholder="IVA"><br><br>
	      <label for="quantita">Quantita'</label><br>
	      <input type="text" name="quantita" placeholder="Quantita'"><br><br>
	      <label for="origine">Origine</label><br>
	      <input type="text" name="origine" placeholder="Origine"><br><br>
	      <label for="scadenza">Data scadenza</label><br>
	      <input type="date" name="scadenza"><br><br>
	      <label for="peso">Peso</label><br>
	      <input type="text" name="peso" placeholder="Lascia vuoto e usa volume per i drink"><br><br>
	      <label for="volume">Volume</label><br>
	      <input type="text" name="volume" placeholder="Lascia vuoto e usa peso per gli snack"><br><br>
	      <label for="img">Link immagine</label><br>
	      <input type="text" name="img" placeholder="Vai su gdurl, genera link e incollalo qui"><br><br>
	      <input type="submit" value="Aggiungi Prodotto">
	    </form>
    </div>
    <br><br><br>
  <jsp:include page="./footer.jsp" />
</body>
</html>
