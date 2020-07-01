<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AcaGreen: registrazione</title>

<link rel="stylesheet" href="../css/loginForm.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/7606041806.js" crossorigin="anonymous"></script>

</head>
<body>

<div id="menu">
	<%@include file="menuVoid.jsp"%>
</div>

<div id="container">

<!-- Full Page Intro -->
  <div class="view" style="background-image: url(../img/drone1.jpg;" alt="Non disp">
    <!-- Mask & flexbox options-->
    <div class="mask rgba-gradient d-flex justify-content-center align-items-center">
      <!-- Content -->
      <div class="container">
        <!--Grid row-->
        <div class="row mt-5">
          <!--Grid column-->
          <div class="col-md-6 mb-5 mt-md-0 mt-5 white-text text-center text-md-left">
            <h1 class="h1-responsive font-weight-bold wow fadeInLeft" data-wow-delay="0.3s">Sei già registrato? </h1>
            <hr class="hr-light wow fadeInLeft" data-wow-delay="0.3s">
            <h6 class="mb-3 wow fadeInLeft" data-wow-delay="0.3s">Se hai già un account inserisci le tue credenziali per iniziare ad usare AcaGreen!</h6>
            <button class="myButton"><a href="loginForm.jsp" style="color:black">Accedi</a></button>
          </div>
          <!--Grid column-->
          <!--Grid column-->
          <div class="col-md-6 col-xl-5 mb-4">
            <!--Form-->
            <form action="../registrazioneServlet" method="post">
            <div class="card wow fadeInRight" data-wow-delay="0.3s" style="background:transparent">
              <div class="card-body">
                <!--Header-->
                <div class="text-center" style="margin-bottom: 2em">
                  <h3 class="white-text font-weight-bold">
                    <i class="fa fa-user white-text"></i>  Registrati</h3>
                    
                  <hr class="hr-light">
                  
                </div>
                <!--Body-->
                <!-- Nome -->
                <div class="md-form" style="margin-bottom: 1em"> 
                  <i class="fa fa-user prefix white-text active"></i> Nome:
                  <input type="text" name="nome" id="form3" class="white-text form-control" placeholder="Nome" style="background: transparent; color: white">
                </div>
                <!--  Cognome -->
                <div class="md-form" style="margin-bottom: 1em">
                  <i class="fa fa-user prefix white-text active"></i> Cognome:
                  <input type="text" name="cognome" id="form3" class="white-text form-control" placeholder="Cognome" style="background: transparent; color: white">
                </div>
                 <!--  Sesso -->
                 <div class="md-form" style="margin-bottom: 1em">
                  <i class="fa fa-user prefix white-text active"></i> Sesso:
                  <select name="sesso" id="form3" class="white-text form-control" style="background: transparent; margin-bottom:2em; color: white;">
                  	<option value="M">M</option>
                  	<option value="F">F</option>
                  	</select>
                </div>
                <!-- Email  -->
                <div class="md-form" style="margin-bottom: 1em">
                  <i class="fa fa-user prefix white-text active"></i> Email:
                  <input type="email" name="email" id="form3" class="white-text form-control" placeholder="Email" style="background: transparent; color: white">
                </div>
                <!-- Telefono  -->
                <div class="md-form" style="margin-bottom: 1em">
                  <i class="fa fa-user prefix white-text active"></i> Telefono:
                  <input type="input" name="telefono" id="form3" class="white-text form-control" placeholder="Telefono" style="background: transparent; color: white">
                </div>
                <!-- Codice fiscale -->
                <div class="md-form" style="margin-bottom: 1em">
                  <i class="fa fa-user prefix white-text active"></i> Codice fiscale:
                  <input type="text" name="codiceFiscale" id="form3" class="white-text form-control" placeholder="Codice fiscale" style="background: transparent; color: white">
                </div>
                <!--  Ruolo-->
                 <div class="md-form" style="margin-bottom: 1em">
                  <i class="fa fa-user prefix white-text active"></i> Ruolo:
                  <select name="tipo" id="form3" class="white-text form-control" style="background: transparent; margin-bottom:2em; color: white;">
                  	<option value="Agricoltore privato">Agricoltore privato</option>
                  	<option value="Agricoltore aziendale">Agricoltore aziendale</option>
                  	<option value="Dirigente aziendale">Dirigente aziendale</option>
                  </select>
                </div>
                <!-- Password -->
                <div class="md-form" style="margin-bottom: 1em">
                  <i class="fa fa-lock prefix white-text active"></i> Password:
                  <input type="password" name="password" id="form4" class="white-text form-control" placeholder="******" style="background: transparent; color: white">
                </div>
                <!-- Conferma Password -->
                <div class="md-form" style="margin-bottom: 1em">
                  <i class="fa fa-lock prefix white-text active"></i> Conferma Password:
                  <input type="password" name="confermaPassword" id="form4" class="white-text form-control" placeholder="******" style="background: transparent; color: white">
                </div>
                <div class="text-center mt-4" style="margin-bottom: 2em">
                  <button class="myButton">Registrati</button>
                  <hr class="hr-light mb-3 mt-4">
                  <div class="inline-ul text-center d-flex justify-content-center">
                    <a class="p-2 m-2 tw-ic">
                      <i class="fab fa-twitter white-text"></i>
                    </a>
                    <a class="p-2 m-2 li-ic">
                      <i class="fab fa-facebook white-text"> </i>
                    </a>
                    <a class="p-2 m-2 ins-ic">
                      <i class="fab fa-instagram white-text"> </i>
                    </a>
                  </div>
                </div>
              </div>
              </form>
            </div>
            <!--/.Form-->
          </div>
          <!--Grid column-->
        </div>
        <!--Grid row-->
      </div>
      <!-- Content -->
    </div>
    <!-- Mask & flexbox options-->
  </div>
  <!-- Full Page Intro -->

</div>

<div id="footer">
	<%@include file="../html/footer.html"%>
</div>



</body>
</html>