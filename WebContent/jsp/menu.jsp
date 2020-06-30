<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="../css/menu.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/7606041806.js" crossorigin="anonymous"></script>

</head>
<body>




<!--Navbar -->
<nav class="mb-1 navbar navbar-expand-lg navbar-dark info-color" style="background-color:#3F565A;">
  <a class="navbar-brand" href="#">AcaGreen</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent-4"
    aria-controls="navbarSupportedContent-4" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent-4">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item active">
       	<a class="nav-link" href="#"> I miei campi </a>
      </li>
      <li class="nav-item active">
       	<a class="nav-link" href="#"> Inventario </a>
      </li>
      <li class="nav-item active">
       	<a class="nav-link" href="#"> Sensori e Robot </a>
      </li>
      <li class="nav-item active">
       	<a class="nav-link" href="#"> Risorse umane </a>
      </li>
      
       <li class="nav-item active" id="profilotext" style="display: none">
       	<a class="nav-link" href="#"> Profilo </a>
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
          <a class="dropdown-item" href="#">My account</a>
          <a class="dropdown-item" href="#">Log out</a>
        </div>
      </li>
    </ul>
  </div>
</nav>
<!--/.Navbar -->

</body>
</html>