<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8" import="model.*" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="./Css/personalArea.css">
	<title>Snackz</title>
</head>
<body>
	<jsp:include page="./header.jsp" />
	     <div class="section">
		
		<div class="grid-card" id="img-aggiungi">
          <div class="img">
            <span class="material-icons-personal">assignment</span>
          </div>
          <div class="card-description">
            <h2>Storico ordini</h2>
            <p>Visualizza lo storico ordini</p>
            <a href="./listaOrdini.jsp"></a>
          </div>
        </div>
		<% 	List<String> usernameList = (List<String>) request.getSession().getAttribute("usernameList"); 
			Iterator<String> iterUsername = usernameList.iterator();
			String username = null;
			
			while(iterUsername.hasNext()){
				username = iterUsername.next();%>
        <div class="grid-card">
          <div class="img">
            <span class="material-icons-personal">assignment</span>
          </div>
          <div class="card-description">
            <h2>Storico ordini cliente "<% out.print(username); %>"</h2>
            <p>Visualizza storico ordini del cliente "<%out.print(username);%>"</p>
            <a href="gestisciOrdine?mode=admin&target=<%out.print(username);%>"></a>
          </div>
        </div>
        <% } %>
    </div>
	<jsp:include page="./footer.jsp" />
	<script type="text/javascript">
      $(".grid-card").click(function(){
        window.location=$(this).find("a").attr("href");
        return false;
      });
    </script>
</body>
</html>