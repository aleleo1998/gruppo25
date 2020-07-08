<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Acagreen: login</title>

<link rel="stylesheet" href="../css/login.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/7606041806.js" crossorigin="anonymous"></script>

</head>
<body style="overflow-x:hidden">

<div>
	<%@include file="menuVoid.jsp"%>
</div>

<div id="container">

<div class="container mt-5">


  <!--Section: Content-->
  <section class="team-section text-center dark-grey-text">

    <!-- Section heading -->
    <h3 class="font-weight-bold mb-4 pb-2">Che agricoltore sei?</h3>
    <!-- Section description -->
    <!--  <p class="text-center w-responsive mx-auto mb-5"></p> -->

  	<!--Grid row-->
    <div class="row text-center">
    
    <!-- inizio div primo utente -->
    
    

      <!--Grid column-->
      <div class="col-md-4 mb-4">
      
      <form action="../redirectLogin" method="post">
      <input type="text" name="tipo" value="Agricoltore privato" style="display:none"></input>

        <div class="testimonial" id="first">
          <!--Avatar-->
          <div class="avatar mx-auto">
            <img src="../img/privato.jpg" style="width:300px; height: 300px; overflow:hidden;" class="rounded-circle z-depth-1 img-fluid">
          </div>
          <!--Content-->
          <h4 class="font-weight-bold dark-grey-text mt-4">Agricoltore privato</h4>
          <h6 class="font-weight-bold blue-text my-3"></h6>
          <p class="font-weight-normal dark-grey-text" style="height: 9em;">
            <i class="fas fa-quote-left pr-2"></i>È una regola d'oro coltivare il giardino per l'olfatto, e gli occhi si prenderanno cura di se stessi.</p>
          <!--Review-->
          <div class="orange-text">
            <button class="myButton">Accedi</button>
          </div>
        </div>
        
        </form>

      </div>
      <!--Grid column-->
      
      
      
      <!--  fine div primo utente -->

      <!--Grid column-->
      <div class="col-md-4 mb-4">
      
      <form action="../redirectLogin" method="post">
      <input type="text" name="tipo" value="Agricoltore aziendale" style="display:none"></input>

        <div class="testimonial" id="second">
          <!--Avatar-->
          <div class="avatar mx-auto">
            <img src="../img/aziendale.jpg" style="width:300px; height: 300px; overflow:hidden;" class="rounded-circle z-depth-1 img-fluid">
          </div>
          <!--Content-->
          <h4 class="font-weight-bold dark-grey-text mt-4">Agricoltore aziendale</h4>
          <h6 class="font-weight-bold blue-text my-3"></h6>
          <p class="font-weight-normal dark-grey-text" style="height: 9em;">
            <i class="fas fa-quote-left pr-2"></i>L’agricoltura deve essere capace di mediare tra natura e comunità umana, con impegni ed obblighi in entrambe le direzioni. Coltivare bene richiede un consapevole riguardo verso tutte le creature, animate ed inanimate.</p>
          <!--Review-->
          <div class="orange-text">
            <button class="myButton">Accedi</button>
          </div>
        </div>
        
      </form>

      </div>
      <!--Grid column-->

      <!--Grid column-->
      <div class="col-md-4 mb-4">
      
      <form action="../redirectLogin" method="post">
      <input type="text" name="tipo" value="Dirigente aziendale" style="display:none"></input>

        <div class="testimonial" id="third">
          <!--Avatar-->
          <div class="avatar mx-auto">
            <img src="../img/ceo.jpg" style="width:300px; height: 300px; overflow:hidden;" class="rounded-circle z-depth-1 img-fluid">
          </div>
          <!--Content-->
          <h4 class="font-weight-bold dark-grey-text mt-4">Dirigente aziendale</h4>
          <h6 class="font-weight-bold blue-text my-3"></h6>
          <p class="font-weight-normal dark-grey-text" style="height: 9em;">
            <i class="fas fa-quote-left pr-2"></i>Non è che un bel mare di spighe dorate sia l’ammirevole prodotto dell’ingegno superiore dei primi contadini eurasiatici. Il merito è tutto dell’orientamento dell’asse principale dei continenti. Attorno a questi assi girarono le fortune della storia.</p>
          <!--Review-->
          <div class="orange-text">
            <button class="myButton">Accedi</button>
          </div>
        </div>
            
       	</form>

      </div>
      <!--Grid column-->

    </div>
    <!--Grid row-->

  </section>
  <!--Section: Content-->


</div>

</div>


<div>
<%@include file="../html/footer.html"%>
</div>

</body>
</html>