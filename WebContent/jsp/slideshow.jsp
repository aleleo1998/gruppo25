<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AcaGreen</title>

<link rel="stylesheet" href="../css/login.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/7606041806.js" crossorigin="anonymous"></script>

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
	  <p> Non hai inserito nessun campo! </p>
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