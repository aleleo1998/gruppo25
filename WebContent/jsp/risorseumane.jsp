<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AcaGreen: risorse umane</title>

<!--  CSS -->
<link rel="stylesheet" href="../css/risorseumane.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/7606041806.js" crossorigin="anonymous"></script>
<script src="../javascript/profilo.js"></script>

</head>
<body>

<div id="menu">
	<%@include file="menu.jsp"%>
</div>

<div id="container">

	<!-- Ricerca dipendenti -->
	
	<p style="margin-left: 2em;"><strong>Risorse umane:</strong> ricerca dipendenti e assegna loro un lavoro.</p>
	
	<!-- SEARCH BAR -->
	<form class="form-inline" style="margin: 1em 0em 2em 2em; width: 300px;">
  		<i class="fas fa-search" aria-hidden="true" id="searchButton" style="cursor:pointer"></i>
  		<input class="form-control form-control-sm ml-3 w-75" type="text" placeholder="Mario Rossi" aria-label="Search">
	</form>
	<!-- END SEARCH BAR -->

	<!-- Tabella dipendenti -->

  <div class="row" style="margin-left:2em; margin-right: 2em; padding-top: 1em; border: 2px ridge rgba(28,110,164,0.24);">
    <div class="col-sm"><strong style="font-size:0.8em;">Nome Cognome</strong>
    	<img src="../img/farmer.png" style="width:100px; height:100px; margin-top:1em; margin-bottom:1em;">
    </div>
    <div class="col-sm"><strong style="font-size:0.8em;">Matricola</strong>
    	<p style="margin-top: 3em; font-size: 0.8em;">0000</p>
    </div>
    <div class="col-sm"><strong style="font-size:0.8em;">Sesso</strong>
    	<p style="margin-top: 3em; font-size: 0.8em;">M</p>
    </div>
    <div class="col-sm"><strong style="font-size:0.8em;">Email</strong>
    	<p style="margin-top: 3em; font-size: 0.8em;">0000</p>
    </div>
    <div class="col-sm"><strong style="font-size:0.8em;">Telefono</strong>
    	<p style="margin-top: 3em; font-size: 0.8em;">+39 3293939393</p>
    </div>
    <div class="col-sm"><strong style="font-size:0.8em;">Seleziona campo</strong>
    	<select style="margin-top: 1.5em; font-size: 0.8em;" name="selezionacampo" id="selezionacampo">
    		<option value="ciao">campo 1</option>
    	</select>
    </div>
    <div class="col-sm"><strong style="font-size:0.8em;">Seleziona attività</strong>
    	<select style="margin-top: 3.4em; font-size: 0.8em;" name="selezionaattivita" id="selezionaattivita">
    		<option value="Semina">Semina</option>
    		<option value="Raccolto">Raccolto</option>
    		<option value="Preparazione terreno">Preparazione terreno</option>
    		<option value="Controllo campi">Controllo campi</option>
    		<option value="Coltivazione">Coltivazione</option>
    		<option value="Eliminazione erbacce">Eliminazione erbacce</option>
    		<option value="Spargimento pesticida">Spargimento pesticida</option>
    	</select>
    </div>
    <div class="col-sm"><strong style="font-size:0.8em;">Seleziona durata</strong>
    	<select style="margin-top: 1.5em; font-size: 0.8em;" name="selezionadurata" id="selezionadurata">
    		<option value="2 ore">2 ore</option>
    		<option value="4 ore">4 ore</option>
    		<option value="2 giorni">2 giorni</option>
    		<option value="3 giorni">3 giorni</option>
    		<option value="4 giorni">4 giorni</option>
    		<option value="5 giorni">5 giorni</option>
    		<option value="6 giorni">6 giorni</option>
    		<option value="1 settimana">1 settimana</option>
    		<option value="2 settimane">2 settimane</option>
    		<option value="2 settimane">3 settimane</option>
    		<option value="1 mese">1 mese</option>
    	</select>
    </div>
    <div class="col-sm"><strong style="font-size: 0.8em;">Stato</strong>
    	<img src="../img/riposo.png" style="width: 30px; height: 30px;">
    	<button style="margin-top:3em; font-size:0.6em; width: 125px;"class="myButton">Assegna lavoro </button>
    </div>
    <div style="display:none" class="col-sm"><strong style="font-size: 0.8em;">Stato</strong>
    	<img src="../img/lavoro.png" style="width: 30px; height: 30px;">
    	<button style="margin-top:1em; font-size:0.8em; width: 148px;"class="myButton2">Annulla lavoro </button>
    </div>
    <div class="col-sm"><strong style="font-size:0.8em;">Tempo rimanente</strong>
    <br>
    	<p style="margin-top: 1em; font-size: 0.8em;">3 giorni, 2 ore</p>
    </div>
  </div>
 </div>
  
  <div id="footer">
  	<%@include file="../html/footer.html"%>
  </div>

</body>
</html>