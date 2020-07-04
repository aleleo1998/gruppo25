<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AcaGreen</title>


<%@ page import="Model.*"%>
<%@ page import="java.util.*"%>
<%

	Utente utente = (Utente) request.getSession().getAttribute("utente");
	CampoModel campoModel = new CampoModel();
	ArrayList<Campo> campi = campoModel.doRetrieveByCEO(utente.getId());
	int size = campi.size();
%>

</head>
<body>

<div id="container">

<!--Carousel Wrapper-->
<div id="carousel-example-2" class="carousel slide carousel-fade" data-ride="carousel">
  <!--Indicators-->
  <ol class="carousel-indicators">
  	<% for(int i=0; i<size; i++) { %>
    <li data-target="#carousel-example-2" data-slide-to="<%=i%>" class="active"></li>
    <% } %>
  </ol>
  <!--/.Indicators-->
  <% if(size == 0){ %>
	  <p style="margin-left:2.55em; margin-top:3em;"><strong> Non hai ancora inserito nessun campo.</strong> Clicca sulla voce "Inserisci campo" per inserire un nuovo campo.</p>
  <% } else { %>
  
  <!--Slides-->
  <div class="carousel-inner" role="listbox" style="margin-left:3em; width:92.5%;">
  
  <% 
  int i = 0;
  for(Campo campo : campi) { 
	  String path = "";
		if(i%4 == 0)
			path = "../img/campo1.jpg";
		if(i%4 == 1)
			path = "../img/campo2.jpeg";
		if (i%3 == 2)
			path = "../img/campo3.jpg";
		if (i%4 == 3)
			path = "../img/campo4.jpeg";
  	if(i==0){
  %>
  
    <div class="carousel-item active">
    <% } else { %>
    <div class="carousel-item">
    <%} %>
      <div class="view">
        <img class="d-block w-100" style="width: 800px; height: 600px;" src="<%= path %>"
          alt="First slide">
        <div class="mask rgba-black-light"></div>
      </div>
      <div class="carousel-caption">
      	<form name="form" id="<%=campo.getNome()%>" action="../visualizzaCampoServlet" method="get">
        <p class="myButton"><%= campo.getNome()%></p>
        </form>
        <p></p>
      </div>
     </div>
     
    <% i++; } %>
     
  </div>
  <!--/.Slides-->
  <!--Controls-->
  <a class="carousel-control-prev" href="#carousel-example-2" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carousel-example-2" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
  <!--/.Controls-->
</div>
<!--/.Carousel Wrapper-->

</div>

<% } %>

</body>
</html>