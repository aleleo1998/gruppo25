<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="../css/menu.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/7606041806.js" crossorigin="anonymous"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<link rel="stylesheet" href="../css/myStyle.css">

<% String tipo2 = request.getSession().getAttribute("ruolo_agricoltore").toString(); %>

</head>
<body>




<!--Navbar -->
<nav class="mb-1 navbar navbar-expand-lg navbar-dark info-color" style="background-color:#3F565A;">
  <a class="navbar-brand" href="profilo.jsp">AcaGreen</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent-4"
    aria-controls="navbarSupportedContent-4" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent-4">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item active">
       	<a class="nav-link" href="i_miei_campi.jsp"> I miei campi </a>
      </li>
      <li class="nav-item active">
       	<a class="nav-link" href="inventario.jsp"> Inventario </a>
      </li>
      <li class="nav-item active">
       	<a class="nav-link" href="SensoriRobotView.jsp"> Sensori e Robot </a>
      </li>
      <% if(tipo2.equals("Dirigente aziendale")){ %>
      <li class="nav-item active">
       	<a class="nav-link" href="risorseumane.jsp"> Risorse umane </a>
      </li>
      <% } %>
      <% if(!tipo2.equals("Dirigente aziendale")){ %>
      <li class="nav-item active" style="display:contents">
       	<a class="nav-link"> </a>
      </li>
      <% } %>
       <li class="nav-item active" id="profilotext" style="display: none">
       	<a class="nav-link" href="profilo.jsp"> Profilo </a>
      </li>
      <li class="nav-item active" id="profilotext" style="display: none">
       	<a class="nav-link" href="#"> Accessibilità </a>
      </li>
      <li class="nav-item active" id="profilotext" style="display: none">
       	<a class="nav-link" href="../logoutServlet"> Esci </a>
      </li>
      <li class="nav-item active" id="instagram">
        <a class="nav-link" href="#"> <i class="fab fa-instagram"></i> </a>
      </li>
      <li class="nav-item active" id="twitter">
        <a class="nav-link" href="#"> <i class="fab fa-twitter"></i> </a>
      </li>
      <li class="nav-item active" id="facebook">
        <a class="nav-link" href="#"> <i class="fab fa-facebook-f"></i> </a>
      </li>
      <li class="nav-item dropdown" id="profilo">
        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-4" data-toggle="dropdown"
          aria-haspopup="true" aria-expanded="false">
        	
        	<!--  profilo -->  
          <i class="fas fa-user" style="color: whitesmoke"></i></a>
        
        <div class="dropdown-menu dropdown-menu-right dropdown-info" aria-labelledby="navbarDropdownMenuLink-4">
          <a class="dropdown-item" href="profilo.jsp"><i class="fas fa-house-user"></i></i> Profilo</a>
          <a class="dropdown-item" href="accessibilitaForm.jsp"><i class="fas fa-low-vision"></i> Accessibilità</a>
          <a class="dropdown-item" href="../logoutServlet"><i class="fas fa-sign-out-alt"></i> Esci</a>
          
        </div>
      </li>
    </ul>
  </div>
</nav>
<!--/.Navbar -->

</body>
</html>