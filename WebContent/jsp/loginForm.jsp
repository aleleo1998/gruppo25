<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AcaGreen: effettua l'accesso</title>

<link rel="stylesheet" href="../css/loginForm.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/7606041806.js" crossorigin="anonymous"></script>
<script src="../javascript/login.js" type="text/javascript"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!--  JAVASCRIPT -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript">google.load('jquery', '1.6.4');</script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>

<% String tipo = request.getSession().getAttribute("ruolo_agricoltore").toString(); %>

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
            <h1 class="h1-responsive font-weight-bold wow fadeInLeft" data-wow-delay="0.3s">Registrati adesso! </h1>
            <hr class="hr-light wow fadeInLeft" data-wow-delay="0.3s">
            <h6 class="mb-3 wow fadeInLeft" data-wow-delay="0.3s">Se non hai ancora effettuato la registrazione clicca sul pulsante "Registrati" per inserire 
            le tue credenziali ed iniziare ad usare AcaGreen!</h6>
            <button class="myButton"><a href="registrazioneForm.jsp" style="color:black">Registrati</a></button>
          </div>
          <!--Grid column-->
          <!--Grid column-->
          <div class="col-md-6 col-xl-5 mb-4">
            <!--Form-->
            <form method="post" action="../loginServlet" id="form">
            <div class="card wow fadeInRight" data-wow-delay="0.3s" style="background:transparent">
              <div class="card-body">
                <!--Header-->
                <div class="text-center" style="margin-bottom: 2em">
                  <h3 class="white-text font-weight-bold">
                    <i class="fa fa-user white-text"></i>  <%= tipo %></h3>
                    
                    <a href="login.jsp" style="color: whitesmoke"> Non sei un <%= tipo %>? </a>
                    
                  <hr class="hr-light">
                  
                </div>
                <!--Body-->
                <div class="md-form" style="margin-bottom: 2em">
                
                  <i class="fa fa-user prefix white-text active"></i>
                  <input type="text" name="email" id="email" class="white-text form-control" placeholder="Email" style="background: transparent; color: white">
                  
                </div>
                <div class="md-form" style="margin-bottom: 2em">
                  <i class="fa fa-lock prefix white-text active"></i>
                  <input type="password" name="password" id="password" class="white-text form-control" placeholder="Password" style="background: transparent; color: white">
                  
                </div>
                <div class="text-center mt-4" style="margin-bottom: 2em">
                  <a class="myButton" id="accedi" style="color:black">Accedi</a>
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
  
  <form action="profilo.jsp" id="profile" style="display:none"> </form>

</div>

<div id="footer">
	<%@include file="../html/footer.html"%>
</div>

</body>
</html>