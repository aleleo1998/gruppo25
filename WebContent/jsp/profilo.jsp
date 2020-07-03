<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AcaGreen: il mio profilo</title>

<%@ page import="Model.*"%>
<%@ page import="java.util.*"%>

<% Utente utente = (Utente) request.getSession().getAttribute("utente"); 
	CampoModel c = new CampoModel();
	ArrayList<Campo> campi = c.doRetrieveByCEO(utente.getId());	
%>

<!--  CSS -->
<link rel="stylesheet" href="../css/profilo.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/7606041806.js" crossorigin="anonymous"></script>
<script src="../javascript/profilo.js"></script>

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

<h5 style="margin-left: 2em;"> Statistiche e previsioni </h5>

<div class="list-group-flush">
<table style="margin-left: 2em;">

<% if(campi.size() == 0){ %>

	<p style="margin-left:2.55em; margin-top:3em;"><strong> Non hai ancora inserito nessun campo.</strong> Clicca sulla voce "Inserisci campo" per inserire un nuovo campo.</p>
	
	<button style="margin-left:2.55em"; class="myButton"> Inserisci campo </button>


<% } else { 
		int i=0;
		for(Campo campo : campi){
			String path = "";
			if(i%4 == 0)
				path = "../img/campo1.jpg";
			if(i%4 == 1)
				path = "../img/campo2.jpg";
			if (i%3 == 2)
				path = "../img/campo3.jpeg";
			if (i%4 == 3)
				path = "../img/campo4.jpeg";
%>
	<tr style="border: 2px ridge rgba(28,110,164,0.24);">
		<th style="margin-right:2em;">
			<p style="margin-left:1em; margin-top:1em;"> <%=campo.getNome()%> </p>
    		<p class="mb-0"><img src="<%=path%>" style="height:120px; width:200px; margin: 0em 2em 1em 1em;"></p>
    	</th>
    	<th style="width: 300px;">
    		<p style="margin-top:1.5em; margin-bottom:0.5em;">Temperatura: <%= campo.getTemperatura() %>° </p>
    		<p style="margin-bottom:0.5em;">Umidità: <%= campo.getUmidita() %>%</p>
    		<p style="margin-bottom:0.5em;">Tipo di terreno: <%= campo.getTipo_terreno() %> </p>
    		<p >Coltura: <%=campo.getColtura() %></p>
    	</th>
    	<th>
    		<form id="<%=campo.getNome()%>" method="post">
    			<button style="margin-top:8em; margin-right: 8em;" class="myButton" id="button<%=campo.getNome()%>">Vai al campo</button>
    		</form>
    	</th>
	</tr>
<% i++; } 
		} %>

</table>
</div>

<form id="visualizzaCampo" method="post" action="visualizzaCampo.jsp"></form>


</div>

<div id="footer">
	<%@include file="../html/footer.html"%>
</div>

</body>
</html>