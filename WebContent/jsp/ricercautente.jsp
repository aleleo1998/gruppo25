<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--  CSS -->
<link rel="stylesheet" href="../css/risorseumane.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/7606041806.js" crossorigin="anonymous"></script>
<script src="../javascript/risorseumane.js"></script>
<link rel="stylesheet" href="../css/myStyle.css">
<%@ page import="Model.*"%>
<%@ page import="java.util.*"%>

<% 
	Utente user = new Utente();
	user = (Utente) request.getSession().getAttribute("utente");
	
	UtenteModel utenteModel = new UtenteModel();
	
	ArrayList<Utente> utenti = (ArrayList<Utente>) request.getSession().getAttribute("ricerca_dipendenti");
	System.out.println("\n\n\n\n"+utenti.size());
	
	CampoModel campoModel = new CampoModel();
	
	ArrayList<Campo> campi = campoModel.doRetrieveByCEO(user.getId());
%>

</head>
<body>


<div id="menu">
	<%@include file="menu.jsp"%>
</div>

<div id="container">

<input id="size" type="text" value="<%= utenti.size() %>" style="display:none">

	<!-- Ricerca dipendenti -->
	
	<p style="margin-left: 2em;"><strong>Risorse umane:</strong> ricerca dipendenti e assegna loro un lavoro.</p>
	
	<div style="margin: 1em 0em 2em 2em; width: 300px;">
  		<button id="button"><a href="risorseumane.jsp" style="color: black">Annulla ricerca</a></button>
	</div>


		<!-- Tabella dipendenti -->
	<div id="tabelladipendenti" style="margin: 1em; border: 2px ridge rgba(28,110,164,0.24);">
	
	<% 
		int i = 0;
	for(Utente utente : utenti){ 
		System.out.println("Stato utente "+i+"-esimo: "+utente.getStato()); %>

  <div class="row" style="margin-left:1em; margin-right: 1em; padding-top: 1em;">
 
  <!-- INFO STATO -->
  <p id="info<%=i%>" style="display:none"><%=utente.getStato()%></p>
  <p id="id<%=i%>" style="display:none"><%=utente.getId()%></p>
  
  	<%
			String path = "";
			if(i%4 == 0)
				path = "../img/farm.jpg";
			if(i%4 == 1)
				path = "../img/farm2.jpg";
			if(i%3 == 2)
				path = "../img/farm3.jpg";
			if(i%4 == 3)
				path = "../img/farm4.jpg";
  	%>
  
  	
    <div class="col-sm"><strong style="font-size:0.8em;"><%= utente.getNome() %> <%= utente.getCognome() %></strong>
    	<img src="<%=path%>" style="width:100px; height:100px; margin-top:1em; margin-bottom:1em;">
    </div>
    <div class="col-sm"><strong style="font-size:0.8em; width:100px;">Matricola</strong>
    	<p style="margin-top: 3em; font-size: 0.8em; width:100px;"><%= utente.getMatricola()%></p>
    </div>
    <div class="col-sm"><strong style="font-size:0.8em; width:5px;">Sesso</strong>
    	<p style="margin-top: 3em; font-size: 0.8em; width:5px;"><%= utente.getSesso() %></p>
    </div>
    <div class="col-sm"><strong style="font-size:0.8em; width:140px;">Email</strong>
    	<p style="margin-top: 3em; font-size: 0.8em; width:140px; overflow:scroll"><%= utente.getEmail() %></p>
    </div>
    <div class="col-sm"><strong style="font-size:0.8em; width:100px;">Telefono</strong>
    	<p style="margin-top: 3em; font-size: 0.8em; width:100px;"><%=utente.getTelefono() %></p>
    </div>
    <div class="col-sm"><strong style="font-size:0.8em;">Seleziona campo</strong>
    	<select style="margin-top: 3em; font-size: 0.8em; width: 120px;" name="selezionacampo<%=i%>" id="selezionacampo<%=i%>">
    		<% for(Campo campo : campi) { %>
    		<option value="<%=campo.getNome()%>" selected><%= campo.getNome() %></option>
    		<% } %>
    	</select>
    </div>
    <div class="col-sm"><strong style="font-size:0.8em;">Seleziona attività</strong>
    	<select style="margin-top: 3em; font-size: 0.8em; width: 120px" name="selezionaattivita<%=i%>" id="selezionaattivita<%=i%>">
    		<option value="Semina" selected>Semina</option>
    		<option value="Raccolto">Raccolto</option>
    		<option value="Preparazione terreno">Preparazione terreno</option>
    		<option value="Controllo campi">Controllo campi</option>
    		<option value="Coltivazione">Coltivazione</option>
    		<option value="Eliminazione erbacce">Eliminazione erbacce</option>
    		<option value="Spargimento pesticida">Spargimento pesticida</option>
    	</select>
    </div>
    <div class="col-sm"><strong style="font-size:0.8em;">Seleziona durata</strong>
    	<select style="margin-top: 3em; font-size: 0.8em; width: 120px" name="selezionadurata<%=i%>" id="selezionadurata<%=i%>">
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
    		<option value="1 mese" selected>1 mese</option>
    	</select>
    </div>
    <div class="col-sm" id="libero<%=i%>"><strong style="font-size: 0.8em;">Stato</strong>
    	<img src="../img/riposo.png" style="width: 30px; height: 30px;">	
    		<input type="text" value="<%=utente.getId()%>" style="display:none"></input>
    		<button type="button" style="margin-top:3em; font-size:0.6em; width: 125px;" class="buttonAssegna" name="<%=i%>" data-toggle="modal" data-target="#assegna" id="libero<%=i%>">Assegna lavoro</button>
			
			<!--Modal: modalRelatedContent-->
					<div class="modal fade right" id="assegna" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden=true data-backdrop="false">
					  <div class="modal-dialog modal-side modal-bottom-right modal-notify modal-info" role="document">
					    <!--Content-->
					    <div class="modal-content">
					      <!--Header-->
					      <div class="modal-header">
					        	<h5 class="heading">Conferma lavoro</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true" class="white-text">&times;</span>
					        </button>
					      </div>
					
					      <!--Body-->
					      <div class="modal-body">
					
							<!-- INIZIO PRIMA RIGA -->
							
					        <div class="row">
					        
					          <div class="col-7">
					            <p>Vuoi confermare l'assegnazione del lavoro?</p>
					            <p><strong>Matricola:</strong> <%=utente.getMatricola()%></p>
					            <p id="camposelezionato<%=i%>"><strong>Lavoro su:</strong> xxx </p>
					            <p id="attivitaselezionata<%=i%>"><strong>Attività di:</strong> xxx </p>
					            <p id="durataselezionata<%=i%>"><strong>Durata attività:</strong> xxx </p>
					          </div>
					        </div>
					        
					        <!-- FINE PRIMA RIGA -->
					        	<button class="myButton" id="<%=i%>" style="margin-right: 2em">Conferma assegna</button>
					            <button type="button" id="annulla" class="annulla">Annulla</button>
					      </div>
					    </div>
					    <!--/.Content-->
					  </div>
					</div>
			<!--Modal: modalRelatedContent--> 		
    </div>
    <div style="display:none" id="occupato<%=i%>" class="col-sm"><strong style="font-size: 0.8em;">Stato</strong>
    	<img src="../img/lavoro.png" style="width: 30px; height: 30px;">
    	<input type="text" value="<%=utente.getId()%>" style="display:none"></input>
    		<button style="margin-top:3em; font-size:0.6em; width: 125px;" class="buttonAnnulla" name="<%=i%>" data-toggle="modal" data-target="#modalAnnulla" id="occupato<%=i%>">Annulla lavoro</button>
	<!--Modal: modalRelatedContent-->
					<div class="modal fade right" id="modalAnnulla" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden=true data-backdrop="false">
					  <div class="modal-dialog modal-side modal-bottom-right modal-notify modal-info" role="document">
					    <!--Content-->
					    <div class="modal-content">
					      <!--Header-->
					      <div class="modal-header">
								<h5 class="heading">Annulla lavoro</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true" class="white-text">&times;</span>
					        </button>
					      </div>
					
					      <!--Body-->
					      <div class="modal-body">
					
							<!-- INIZIO PRIMA RIGA -->
							
					        <div class="row">
					        
					          <div class="col-7">
					            <p>Sei sicuro di voler interrompere l'attività corrente?</p>
					            <p><strong>Matricola:</strong> <%=utente.getMatricola()%></p>
					            <p id="camposelezionato_annulla<%=i%>"><strong>Lavoro su:</strong> xxx </p>
					            <p id="attivitaselezionata_annulla<%=i%>"><strong>Attività di:</strong> xxx </p>
					            <p id="durataselezionata_annulla<%=i%>" style="margin-bottom: 2em"><strong>Durata attività:</strong> xxx </p>
					          </div>
					        </div>
					        
					        <!-- FINE PRIMA RIGA -->
					        	<button class="buttonConfermaAnnulla" id="<%=i%>" style="margin-right: 2em">Interrompi attività</button>
					            <button type="button" id="annulla" class="annulla">Annulla</button>
					        
					      </div>
					    </div>
					    <!--/.Content-->
					  </div>
					</div>
			<!--Modal: modalRelatedContent--> 
    </div>
    <div class="col-sm"><strong style="font-size:0.8em;">Tempo rimanente</strong>
    <br>
    	<p style="margin-top: 1em; font-size: 0.8em;"><%=utente.getDurata()%></p>
    </div>
    <!--  END FORM -->
    </div>
  <% i = i+1; } %>
  
    </div> <!--  Chiusura tabella dipendenti -->
 </div>
  
  <div id="footer">
  	<%@include file="../html/footer.html"%>
  </div>

</body>
</html>