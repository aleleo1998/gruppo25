<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AcaGreen: accessibilità</title>

<link rel="stylesheet" href="../css/profilo.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/7606041806.js" crossorigin="anonymous"></script>
<script src="../javascript/accessibilita.js" defer></script>

</head>
<body>

<div>
	<%@include file="menuVoid.jsp"%>
</div>

<div id="container">

	<img src="../img/access.jpg" style="height:30%; width: 30%; margin: 1em 0em 1em 1em">

	<h4 style="margin: 0em 0em 1em 1em">Dichiarazione di accessibilità</h4>
	
	<div id="dichiarazione" style="margin: 1em 1.5em 1em 1.5em; height: auto;">
	
		<p>
			Pensiamo che l’accessibilità delle informazioni sia un valore fondamentale per la società. Per questo abbiamo fatto del nostro meglio per 
			garantire la piena fruibilità dei contenuti di questo sito internet a prescindere dalle capacità fisiche e sensoriali degli utenti che lo visitano.
		</p>
		
		<p>Questo sito è stato realizzato seguendo le linee guida <strong>WCAG 2.0</strong> sull’accessibilità per lo sviluppo dei siti web.
	                In particolare, sono stati utilizzati dei validatori automatici per verificare il rispetto delle linee guida sull’accessibilità ed è stato 
	                inoltre creato un gruppo di lavoro costituito da persone con disabilità (visiva, uditiva e con ridotta mobilità agli arti superiori) che ha segnalato agli sviluppatori le migliorie da apportare.
	    </p>
	
	    <p> La verifica di accessibilità è stata condotta da Yeah , cooperativa sociale specializzata in servizi per l’accessibilità e l’inclusione, che ha rilasciato la dichiarazione di accessibilità qui riportata.
			In aggiunta a quanto previsto dalle linee guida sull’accessibilità, si è scelto di creare un’apposita sezione informativa dedicata agli utenti con disabilità, che contiene indicazioni specifiche sulle modalità di accesso al servizio e sulle facilitazioni esistenti. Infine, è stata resa disponibile agli utenti ipovedenti e con dislessia una barra laterale per modificare la grandezza del testo e il contrasto di colore delle pagine.
		</p>
	
	</div>
	
	<form id="form" name="form" style="margin:2em 30em 1em 1em">
		<table class="table table-hover">
		  <thead style="background-color: #3F565A; color: whitesmoke">
		    <tr>
		      <th scope="col">Sezione 1</th>
		      <th scope="col">Font</th>
		      <th scope="col"></th>
		    </tr>
		  </thead>
		  <tbody>
		  	<tr>
		      <th scope="row">1</th>
		      <td>Font</td>
		      	<td>
		      		<select class="mdb-select md-form" name="font_family">
					  <option value="Arial" disabled selected></option>
					  <option value="Arial">Arial</option>
					  <option value="Verdana">Verdana</option>
					  <option value="Georgia">Georgia</option>
					  <option value="Courier New">Courier New</option>
					  <option value="Times New Roman">Times New Roman</option>
					</select>
		      	</td>
		    </tr>
		    <tr>
		      <th scope="row">2</th>
		      <td>Dimensione font</td>
		      	<td>
		      		<select class="mdb-select md-form" name="font_size">
					  <option value="100%" disabled selected>Default</option>
					  <option value="10px">10</option>
					  <option value="12px">12</option>
					  <option value="14px">14</option>
					  <option value="16px">16</option>
					  <option value="18px">18</option>
					  <option value="20px">20</option>
					  <option value="22px">22</option>
					  <option value="24px">24</option>
					  <option value="26px">26</option>
					  <option value="28px">28</option>
					  <option value="30px">30</option>
					  <option value="32px">32</option>
					  <option value="34px">34</option>
					  <option value="36px">36</option>
					  <option value="38px">38</option>
					  <option value="40px">40</option>
					  <option value="42px">42</option>
					  <option value="44px">44</option>
					  <option value="46px">46</option>
					  <option value="48px">48</option>
					  <option value="50px">50</option>
					</select>
		      	</td>
		    </tr>
		    <tr>
		      <th scope="row">3</th>
		      <td>Colore del testo</td>
		      	<td>
		      		<input type="color" name="coloreTesto">
		      	</td>
		    </tr>
		    <thead style="background-color: #3F565A; color: whitesmoke">
			    <tr>
			      <th scope="col">Sezione 2</th>
			      <th scope="col">Colori e sfondo..</th>
			      <th scope="col"></th>
			    </tr>
		  	</thead>
		    <tr>
		      <th scope="row">1</th>
		      <td>Colore principale menù</td>
		      	<td>
		      		<input type="color" name="menuColor">
		      	</td>
		    </tr>
		    <tr>
		      <th scope="row">2</th>
		      <td>Colore principale footer</td>
		      	<td>
		      		<input type="color" name="footerColor">
		      	</td>
		    </tr>
		    <tr>
		      <th scope="row">3</th>
		      <td>Background della pagina</td>
		      <td>
		      	<input type="color" name="sfondoPagina">
		      </td>
		    </tr>
		   </tbody>
		 </table>
		 <div style="text-align:right">
		   	<p class="myButton" id="button" style="text-align:right; margin-top:3em">Conferma</p>
		 </div>
	</form>

</div>

<div>
<%@include file="../html/footer.html"%>
</div>

</body>
</html>