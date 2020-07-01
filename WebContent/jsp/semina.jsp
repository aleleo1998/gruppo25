<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="../css/semina.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/7606041806.js" crossorigin="anonymous"></script>


<title>Semina</title>
</head>
<body>

<div id="menu">
	<%@include file="menu.jsp"%>
</div>

<div id="container">
	<div id="form-box" class="card">
	  <div class="card-header">
	    Seleziona la coltura da seminare <p style = "text-decoration:line-through;"> </p>
	  </div>
	  <div class="card-body">
	    <h5 class="card-title">Prodotti presenti nell'inventario</h5> <hr>
	   
	   <div class="container my-5">


  <!--Row-->
  	<div id="row" >
    
	    <div class="media mb-4">
			<input id="radio" type="radio" id="male" name="gender" value="male">  
			
	      	<img class="rounded" src="../img/coltura1.jpg" alt="Generic placeholder image">
		    
		      <div class="media-body">
		        <a>
		          <h5 class="user-name font-weight-bold">Peperoncino</h5>
		        </a>
		      
		        <p class="dark-grey-text article">Il peperoncino, quis nostrud exercitation ullamco laboris nisi ut
		          aliquip ex ea commodo
		          consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat
		          nulla pariatur. Excepteur sint occaecat cupidatat non proident.</p>
		          
		          <strong>Quantità necessaria per la semina del campo: 200kg</strong> <br>
		           <strong><font color="green">Quantità sufficiente per la semina del campo</font></strong>
		      </div>
	    </div>
   
	</div>
	
	
	<!--Row-->
  	<div id="row" >
  

  
	    <div class="media mb-4">
			<input id="radio" type="radio" id="male" name="gender" value="male">  
			
	      	<img class="rounded" src="../img/coltura1.jpg" alt="Generic placeholder image">
		    
		      <div class="media-body">
		        <a>
		          <h5 class="user-name font-weight-bold">Peperoncino</h5>
		        </a>
		      
		        <p class="dark-grey-text article">Il peperoncino, quis nostrud exercitation ullamco laboris nisi ut
		          aliquip ex ea commodo
		          consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat
		          nulla pariatur. Excepteur sint occaecat cupidatat non proident.</p>
		          
		          <strong>Quantità necessaria per la semina del campo: 200kg</strong> <br>
		           <strong><font color="green">Quantità sufficiente per la semina del campo</font></strong>
		      </div>
	    </div>
   
	</div>
	
	<div id="divButtonAnalizza">
	<button type="button" id="btnAnalizza" class="myButton" style="margin-right: 2em; width: 180px;">Analizza terreno</button>
	
	</div>

</div>
	   
	  </div>
	 
	  <!--  ROBOT -->
	  
	   <div class="card-body">
	    <h5 class="card-title">Assegna attività - Lista dei robot associati al campo xxx inattivi</h5> <hr>
	   
	   <div class="container my-5">


  <!--Row Robot-->
  	<div id="row" >
    
	    <div class="media mb-4">
	    	<input type="checkbox" id="checkbox" name="robot1" value="robot1">
			
			
	      	<img class="rounded" src="../img/robot1.jpg" alt="Generic placeholder image">
		    
		      <div class="media-body">
		        <a>
		          <h5 class="user-name font-weight-bold">Robot 1</h5>
		        </a>
		      
		      	
		        <p class="dark-grey-text article"> <strong>Impiego: </strong>  Attualmente installato su campo xxx </p>
		          <i class="fa fa-circle" style="color:green;" aria-hidden="true"></i>
		          <strong>Disponibile</strong> <br>
		           
		      </div>
	    </div>
   
	</div>
	
	

	
	
	

</div>
	 
	
	  </div>
	  
	</div>
	
	<div id="btnConferma">
		<center> 
			<button type="button" class="myButton" style="margin-right: 2em; width: 150px;">Conferma</button>
	 		<button type="button" class="myButton" style="margin-right: 2em; width: 150px;">Reset</button> 
	 	</center>
	 </div>
</div>

<div id="footer">
	<%@include file="../html/footer.html" %>
</div>
</body>
</html>