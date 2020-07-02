<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AcaGreen: il mio profilo</title>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/7606041806.js" crossorigin="anonymous"></script>

<!--  CSS -->
<link rel="stylesheet" href="../css/profilo.css">

<%@ page import="Model.*"%>
<%@ page import="java.util.*"%>

<% Utente utente = (Utente) request.getSession().getAttribute("utente"); %>

</head>
<body>

<div id="menu">
	<%@include file="menu.jsp"%>
</div>

<div id="container">

	<div id="card">

  <!-- Card image -->
  <div class="view overlay" id="divImg" style="display:inline;">
    <img class="card-img-top" id="imgProfilo"  src="../img/farmer.png"
      alt="Card image cap">
  </div>

  <!-- Card content -->
  <div class="card-body" style="float:right; margin-right:850px; margin-top:-20px;">

    <!-- Title -->
    <h4 class="card-title"><%=utente.getNome()%> <%=utente.getCognome()%></h4>
    <!-- Text -->
    <p class="card-text"><strong>Tipo utente:</strong> <%=utente.getTipo()%></p>
    <p class="card-text"><strong>Matricola:</strong> <%=utente.getMatricola()%></p>
    <p class="card-text"><strong>Email:</strong> <%=utente.getEmail()%></p>
    <p class="card-text"><strong>Telefono:</strong> <%=utente.getTelefono()%></p>

  </div>
  
  </div>

<!-- Card -->

<br><br><br>

<h5 style="margin-left: 2em;"> Statistiche e previsioni </h2>


</div>

<div id="footer">
	<%@include file="../html/footer.html"%>
</div>

</body>
</html>