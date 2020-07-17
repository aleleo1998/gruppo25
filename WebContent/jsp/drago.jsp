<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I miei campi</title>
 

<link rel="stylesheet" href="../css/drago.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/7606041806.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../css/myStyle.css">


</head>
<body>

<div id="menu">
	<%@include file="menu.jsp"%>
</div>

<div id="container">
 	<%@include file="../html/slideshow.html"%>
 	
 	
 	<br><br><br><br>
 	<p class="myButton">button</p>
 	
 	
 	
 	
 	<!--  ALERT DIALOG -->
 	<!-- Button trigger modal-->
<button type="button" class="myButton" data-toggle="modal" data-target="#modalRelatedContent">Alert button
  modal</button>

<!--Modal: modalRelatedContent-->
<div class="modal fade right" id="modalRelatedContent" tabindex="-1" role="dialog"
  aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
  <div class="modal-dialog modal-side modal-bottom-right modal-notify modal-info" role="document">
    <!--Content-->
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header">
        <h5 class="heading">Riepilogo selezione</h5>

        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" class="white-text">&times;</span>
        </button>
      </div>

      <!--Body-->
      <div class="modal-body">

		<!-- INIZIO PRIMA RIGA -->
		
        <div class="row">
          <div class="col-5">
            <img class="immagine" src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(55).jpg"
              class="img-fluid" alt="">
          </div>

          <div class="col-7">
            <p><strong>Prodotto</strong></p>
            

          </div>
        </div>
        
        <!-- FINE PRIMA RIGA -->
        
        <hr>
        
        <!-- INIZIO SECONDA RIGA -->
		
        <div class="row">
          <div class="col-5">
            <img class="immagine" src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(55).jpg"
              class="img-fluid" alt="">
          </div>

          <div class="col-7">
            <p><strong>Robot</strong></p>
            

          </div>
        </div>
        
        <!-- FINE SECONDA RIGA -->
        
        <hr>
        
        <!-- INIZIO TERZA RIGA -->
		
        <div class="row">
          <div class="col-5">
            <img class="immagine" src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(55).jpg"
              class="img-fluid" alt="">
          </div>

          <div class="col-7">
            <p><strong>Campo</strong></p>
            

          </div>
        </div>
        
        <!-- FINE TERZA RIGA -->
        
        <hr>
        
        	<button type="button" class="myButton" style="margin-right: 2em">Conferma</button>
            <button type="button" class="myButton">Annulla</button>
        
      </div>
    </div>
    <!--/.Content-->
  </div>
</div>
<!--Modal: modalRelatedContent-->


 	<br>
 	<br><br><br><br><br>
 	
 	<iframe src="https://giphy.com/embed/tqLmOziFnB5nO" width="480" height="240" frameBorder="0" class="giphy-embed" allowFullScreen></iframe><p><a href="https://giphy.com/gifs/drone-tqLmOziFnB5nO">via GIPHY</a></p>
</div>



<div id="footer">
	<%@include file="../html/footer.html"%>
</div>



</body>
</html>