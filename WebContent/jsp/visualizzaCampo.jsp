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
	
	   
	   <div >

		<div id="datisx"> 
			  <div id="monitorDatisx">
			  
			  <table width="auto">
			  
			    <thead>
			      <tr>
			        <th bgcolor="#3F565A"><span style="color:#ffffff"> Nome Campo: </span></th>
			        <th ><span style="color:#000000"> nome campo</span></th>
			        
			      </tr>
			    </thead>
			    
			    <tr>
			      <th colspan="5" height="10em"><span style="color:#ffffff">  </span></th>
			      </tr>
			    <tbody id="myTable">
			       <tr>
			        <th bgcolor="#3F565A"><span style="color:#ffffff"> Posizione: </span></th>
			        <th ><span style="color:#000000"> posizione campo</span></th>
			       
			      </tr>
			      
			      <tr>
			      <th colspan="2" height="10em"><span style="color:#ffffff">  </span></th>
			      </tr>
			    <tbody id="myTable">
			       <tr>
			        <th bgcolor="#3F565A"><span style="color:#ffffff"> Tipo terreno: </span></th>
			        <th ><span style="color:#000000"> tipo terreno</span></th>
			       
			      </tr>
			  </tbody>
			  </table>
			  </div>
		
			
			<div id="monitorDatidx">
			  
			  <table width="auto">
			  
			    <thead>
			      <tr>
			        <th bgcolor="#3F565A"><span style="color:#ffffff"> Coltura: </span></th>
			        <th ><span style="color:#000000"> coltura</span></th>
			        
			      </tr>
			    </thead>
			    
			    <tr>
			      <th colspan="5" height="10em"><span style="color:#ffffff">  </span></th>
			      </tr>
			    <tbody id="myTable">
			       <tr>
			        <th bgcolor="#3F565A"><span style="color:#ffffff"> Temperatura </span></th>
			        <th ><span style="color:#000000"> 22</span></th>
			       
			      </tr>
			      
			      <tr>
			      <th colspan="2" height="10em"><span style="color:#ffffff">  </span></th>
			      </tr>
			    <tbody id="myTable">
			       <tr>
			   
			        <th bgcolor="#3F565A"><span style="color:#ffffff">     <i class="fa fa-check-circle" aria-hidden="true"></i> Stima produzione </span></th>
			        <th ><span style="color:#000000"> 90% </span>
			       		 <button type="button" id="btnEsamina" class="myButtonDark" style="margin-right: 2em; height: 25px; width: 150px; margin-left:2em; padding: 2px 24px;">Esamina</button>
			        </th>
			        
			      </tr>
			  </tbody>
			  </table>
			  </div>
		
		
		 <button type="button" id="btnEsamina" class="myButtonDark" style="margin-right: 2em;  width: 200px; margin-left:1em; margin-top:1em;">Maggiori Informazioni</button>
			
			
			
			
			<!--  SENSORI E ROBOT -->
			
			<div id="dispositivi">
				<div id="form-box" class="card">
		  			<div class="card-header">
		   				 Sensori e robot associati al campo<p style = "text-decoration:line-through;"> </p>
		 			 </div>
		  				<div class="card-body">
		  				 
		  				 <div id="sensori"> Sensori</div>
		  				 	
		  				 	
		  				 <div id="robot"> Robot </div>
		  				</div>
		  		
		  		
		  		
		  		</div>
			
			
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


<div id="divBtnAzioni">
		<center> 
			<a href="../jsp/preparazioneTerreno.jsp" ><button type="button" class="myButton" style="margin-right: 2em; width: 150px;">Preparazione</button></a>
	 		<a href="../jsp/semina.jsp" ><button type="button" class="myButton" style="margin-right: 2em; width: 150px;">Semina</button></a>
	 		<a href="../jsp/concima.jsp" ><button type="button" class="myButton" style="margin-right: 2em; width: 150px;">Concima</button></a>
	 		<a href="../jsp/irrigazione.jsp" ><button type="button" class="myButton" style="margin-right: 2em; width: 150px;">Irrigazione</button></a>
	 	</center>
	 </div>


<div id="footer">
	<%@include file="../html/footer.html" %>
</div>
</body>
</html>