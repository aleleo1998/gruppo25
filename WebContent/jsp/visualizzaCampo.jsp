<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="../css/visualizzaCampo.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/7606041806.js" crossorigin="anonymous"></script>

<title>Visualizza Campo</title>
</head>
<body>

<div id="menu">
	<%@include file="menu.jsp"%>
</div>

<div id="container">
	<div id="form-box" class="card">
	  <div class="card-header">
	    Dati Terreno<p style = "text-decoration:line-through;"> </p>
	  </div>
	  <div class="card-body">
	
	   
	   <div class="container my-5">

		<div id="datisx"> 
			  <div id="monitorDati">
			  
			  <table width="100%">
			  
			    <thead>
			      <tr>
			        <th bgcolor="#3F565A"><span style="color:#ffffff"> Nome Campo: </span></th>
			        <th ><span style="color:#000000"> nome campo</span></th>
			        <th width="70em"><span style="color:#ffffff">  </span></th>
			        <th bgcolor="#3F565A"><span style="color:#ffffff"> Coltura: </span></th>
			        <th  ><span style="color:#000000"> tipo coltura</span></th>
			      </tr>
			    </thead>
			    
			    <tr>
			      <th colspan="5" height="10em"><span style="color:#ffffff">  </span></th>
			      </tr>
			    <tbody id="myTable">
			       <tr>
			        <th bgcolor="#3F565A"><span style="color:#ffffff"> Posizione: </span></th>
			        <th ><span style="color:#000000"> posizione campo</span></th>
			        <th width="70em"><span style="color:#ffffff">  </span></th>
			        <th bgcolor="#3F565A"><span style="color:#ffffff"> Temperatura: </span></th>
			        <th  ><span style="color:#000000"> 22°</span></th>
			      </tr>
			      
			      <tr>
			      <th colspan="5" height="10em"><span style="color:#ffffff">  </span></th>
			      </tr>
			    <tbody id="myTable">
			       <tr>
			        <th bgcolor="#3F565A"><span style="color:#ffffff"> Tipo terreno: </span></th>
			        <th ><span style="color:#000000"> tipo terreno</span></th>
			        <th width="70em"><span style="color:#ffffff">  </span></th>
			        <th bgcolor="#3F565A"><span style="color:#ffffff"></i>
			        Stima produzione: </span></th>
			        <th  ><span style="color:#000000"> 98%</span></th>
			      </tr>
			  </tbody>
			  </table>
			  </div>
		
		 
			  <div id="sensoriRobot">
			     <h6 class="card-title">Sensori e robot associati al terreno</h6> <hr>
			  nome campo : nome campo <br>
			  das dsa
			  <br>
			  </div>
		</div>
		
			<div id="mappa">
			  <img src="../img/visualizzaCampo1.jpg"> 
		  <br>
		  </div>
		</div>
	   
	</div>
	</div>
</div>
<div id="footer">
	<%@include file="../html/footer.html" %>
</div>
</body>
</html>