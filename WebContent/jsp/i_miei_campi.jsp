<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AcaGreen: i miei campi</title>

<link rel="stylesheet" href="../css/imieicampi.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/7606041806.js" crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="../javascript/imieicampi.js"></script>

</head>
<body>

<div id="menu">
	<%@include file="menu.jsp"%>
</div>

<div id="container">

 	<%@include file="slideshow.jsp"%>
 	
 	
 	<br><br><br><br>
 	<a href="AggiungiCampo.jsp"><p class="myButton" style="margin-left: 3em;">Inserisci campo</p></a>
 	
 	<table style="margin-left: 2.5em;">
 	<% int i=0;
		for(Campo campo : campi){
			String path = "";
			if(i%4 == 0)
				path = "../img/campo1.jpg";
			if(i%4 == 1)
				path = "../img/campo2.jpeg";
			if (i%3 == 2)
				path = "../img/campo3.jpg";
			if (i%4 == 3)
				path = "../img/campo4.jpeg";
	%>
	<tr style="border: 2px ridge rgba(28,110,164,0.24);">
		<th style="margin-right:2em;">
			<p style="margin-left:1em; margin-top:1em;"> <%=campo.getNome()%> </p>
    		<p class="mb-0"><img src="<%=path%>" style="height:120px; width:200px; margin: 0em 2em 1em 1em;"></p>
    	</th>
    	<th style="width: 300px;">
    		<p style="margin-top:1.5em; margin-bottom:0.5em;">Temperatura: <%= campo.getTemperatura() %>° </p>
    		<p style="margin-bottom:0.5em;">Umidità: <%= campo.getUmidita() %>%</p>
    		<p style="margin-bottom:0.5em;">Tipo di terreno: <%= campo.getTipo_terreno() %> </p>
    		<p >Coltura: <%=campo.getColtura() %></p>
    	</th>
    	<th>
    		<form id="<%=campo.getNome()%>" method="get" action="../visualizzaCampoServlet">
    			<input type="text" name="nomecampo" value="<%=campo.getNome()%>" style="display:none"></input>
    			<button style="margin-top:8em; margin-right: 8em;" class="myButton" id="button<%=campo.getNome()%>">Vai al campo</button>
    		</form>
    	</th>
    	<th>
    		<form id="<%=campo.getNome()%>" method="post">
    			<input type="text" value="<%=campo.getNome()%>" style="display:none"></input>
    			
    			<!-- ALERT RIMUOVI TRIGGER  -->
    			
<!--  ALERT DIALOG -->
<!-- Button trigger modal-->
<button type="button" class="myButton" data-toggle="modal" data-target="#modalRelatedContent" style="margin-top:8em; margin-right: 1em">Eimina</button>

		<!--Modal: modalRelatedContent-->
		<div class="modal fade right" id="modalRelatedContent" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="true">
		  	<div class="modal-dialog modal-side modal-bottom-right modal-notify modal-info" role="document">
		    	<!--Content-->
		    		<div class="modal-content">
		      	<!--Header-->
		      		<div class="modal-header">
			        	<h5 class="heading">Conferma eliminazione campo</h5>
			
			        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          	<span aria-hidden="true" class="white-text">&times;</span>
			        	</button>
		      		</div>
		      <!--Body-->
		      <div class="modal-body">
				<!-- INIZIO PRIMA RIGA -->
		        	<div class="row">
		       			<div class="col-7">
		            		<p>Sei sicuro di voler rimuovere il campo "<%=campo.getNome()%>" ?</p>
		           		</div>
		        	</div>
		      <!-- FINE PRIMA RIGA -->  
		        	<button class="myButton" id="conferma" name="button<%=campo.getNome()%>" style="margin-right: 2em">Conferma</button>
		            <button type="button" id="annulla" class="annulla">Annulla</button>
		      </div>
		    </div>
		    <!--/.Content-->
		  </div>
		</div>
<!--Modal: modalRelatedContent--> 
    			
    		</form>
    	</th>
	</tr>
<% i++; } %>
</table>

<div>
<form method="post" id="ref" action="i_miei_campi.jsp"></form>
</div>
 	
</div>


<div id="footer">
	<%@include file="../html/footer.html"%>
</div>


</body>
</html>