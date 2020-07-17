<%@page import="Model.*"%>
<%@page import="java.sql.*"%>
<%@page import ="java.util.*"%>


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
<script src="../javascript/visualizzaCampo.js"></script>
<link rel="stylesheet" href="../css/myStyle.css">
<% Model.Campo campo = (Campo) request.getSession().getAttribute("campo_selezionato"); %>
<%! ArrayList<Dispositivo> dispositiviList; %>
<% dispositiviList = (ArrayList<Dispositivo>) request.getSession().getAttribute("lista_dispositivi"); %>

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
			        <th ><span style="color:#000000"><%=campo.getNome() %></span></th>
			        
			      </tr>
			    </thead>
			    
			    <tr>
			      <th colspan="5" height="10em"><span style="color:#ffffff">  </span></th>
			      </tr>
			    <tbody id="myTable">
			       <tr>
			        <th bgcolor="#3F565A"><span style="color:#ffffff"> Posizione: </span></th>
			        <th ><span style="color:#000000"><%=campo.getPosizione() %> </span></th>
			       
			      </tr>
			      
			      <tr>
			      <th colspan="2" height="10em"><span style="color:#ffffff">  </span></th>
			      </tr>
			    <tbody id="myTable">
			       <tr>
			        <th bgcolor="#3F565A"><span style="color:#ffffff"> Tipo terreno: </span></th>
			        <th ><span style="color:#000000"><%=campo.getTipo_terreno() %></span></th>
			       
			      </tr>
			  </tbody>
			  </table>
			  </div>
		
			
			<div id="monitorDatidx">
			  
			  <table width="auto">
			  
			    <thead>
			      <tr>
			        <th bgcolor="#3F565A"><span style="color:#ffffff"> Coltura: </span></th>
			        <th ><span style="color:#000000"> <%=campo.getColtura() %></span></th>
			        
			      </tr>
			    </thead>
			    
			    <tr>
			      <th colspan="5" height="10em"><span style="color:#ffffff">  </span></th>
			      </tr>
			    <tbody id="myTable">
			       <tr>
			        <th bgcolor="#3F565A"><span style="color:#ffffff"> Temperatura </span></th>
			        <th ><span style="color:#000000"><%=campo.getTemperatura() %></span></th>
			       
			      </tr>
			      
			      <tr>
			      <th colspan="2" height="10em"><span style="color:#ffffff">  </span></th>
			      </tr>
			    <tbody id="myTable">
			       <tr>
			   
			        <th bgcolor="#3F565A"><span style="color:#ffffff">     <i class="fa fa-check-circle" aria-hidden="true"></i> Stima produzione </span></th>
			        <th ><span style="color:#000000"> 90% </span>
			       		 <button type="button" id="btnEsamina" class="myButtonDark" data-toggle="modal" data-target="#esamina" style="margin-right: 2em; height: 25px; width: 150px; margin-left:2em; padding: 2px 24px;">Esamina</button>
			        </th>
			        
			      </tr>
			  </tbody>
			  </table>
			  </div>
		
		
		 <button data-toggle="modal" data-target="#maggioriInfo" type="button" id="btnEsamina" class="myButtonDark" style="margin-right: 2em;  width: 200px; margin-left:1em; margin-top:1em;">Maggiori Informazioni</button>
			
			
			
			
			<!--  SENSORI E ROBOT -->
			
			<div id="dispositivi">
				<div id="form-box" class="card">
		  			<div class="card-header">
		   				 Sensori e robot associati al campo<p style = "text-decoration:line-through;"> </p>
		 			 </div>
		  				<div class="card-body">
		  				 
		  				 
		  				 
		  				 <div id="sensori"> Sensori
		  				<div class="card example-1 scrollbar-ripe-malinka">
      					<div class="card-body">
      					<%if(dispositiviList.size()==0){ %>
      					<span style="color:#000000">Nessun sensore associato.</span>
      					<%} %>
      					<% for(Dispositivo disp : dispositiviList){ 
      						if(disp.getTipo().equals("sensore")){%> 
      						<div class="sensorDiv">
        				<h6 class="section1" id="section1"><strong><%=disp.getNome() %></strong></h6>
        				
        				 <table id="tableSensori" class="tableSensori" width="auto">
			  
							    <thead>
							      <tr>
							        <th ><span> Dati: </span></th>
							        <th ><span style="color:#000000"> <%=disp.getId() %></span></th>
							        
							      </tr>
							    </thead>
			    
							    <tr>
							      <th colspan="5" height="10em"><span style="color:#ffffff">  </span></th>
							      </tr>
							    <tbody id="myTable">
							       <tr>
							    
							        <th >
							        <%if(disp.getStato().equals("disponibile")){ %>
							        	<span ><i style="color:green" class="fa fa-circle" aria-hidden="true"></i></span>
							        <%} %>
							         <%if(disp.getStato().equals("occupato")){ %>
							        	<span ><i style="color:red" class="fa fa-circle" aria-hidden="true"></i></span>
							        <%} %>
							        
							        </th>
							        <th ><span style="color:#000000"><%=disp.getStato() %></span></th>
							       
							      </tr>
							      </tbody>
			     		 </table>
        				</div>
        			<%}} %>
        				
        				
      </div>
    </div>
		  				 
		  				 </div>
		  				 	
		  				 	
		  				 <div id="robot"> Robot 
		  				 
		  				 
		  				 <div class="card example-1 scrollbar-ripe-malinka">
      					<div class="card-body">
      					<%if(dispositiviList.size()==0){ %>
      					<span style="color:#000000">Nessun robot associato.</span>
      					<%} %>
      					<% for(Dispositivo disp : dispositiviList){ 
      						if(disp.getTipo().equals("robot")){%> 
      						<div class="sensorDiv">
        				<h6 class="section1" id="section1"><strong><%=disp.getNome() %></strong></h6>
        				
        				 <table id="tableSensori" class="tableSensori" width="auto">
			  
							    <thead>
							      <tr>
							        <th ><span> Dati: </span></th>
							        <th ><span style="color:#000000"> <%=disp.getId() %></span></th>
							        
							      </tr>
							    </thead>
			    
							    <tr>
							      <th colspan="5" height="10em"><span style="color:#ffffff">  </span></th>
							      </tr>
							    <tbody id="myTable">
							       <tr>
							        <th>
							        <%if(disp.getStato().equals("disponibile")){ %>
							        	<span ><i style="color:green" class="fa fa-circle" aria-hidden="true"></i></span>
							        <%} %>
							         <%if(disp.getStato().equals("occupato")){ %>
							        	<span ><i style="color:red" class="fa fa-circle" aria-hidden="true"></i></span>
							        <%} %>
							        </th>
							        <th ><span style="color:#000000"><%=disp.getStato() %></span></th>
							       
							      </tr>
							      </tbody>
			     		 </table>
        				</div>
        			<%}} %>
        				
        				
      </div>
    </div>
		  		</div>
		  		
		  		
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
	 		<a href="../jsp/IrrigazioneView.jsp" ><button type="button" class="myButton" style="margin-right: 2em; width: 150px;">Irrigazione</button></a>
	 	</center>
	 </div>


<%!int esaminaInput; %>
	      		<%
						Random rand = new Random();
						esaminaInput = rand.nextInt()%2;
						 
				  %>

<!-- FORM -->
<form action="../esaminaServlet" name="formEsamina" id="formEsamina">
<input form="formEsamina" id="esaminaInput" type="hidden" name="esaminaInput" value="<%=esaminaInput%>">
</form>

<!-- ESAMINA Modal: modalRelatedContent-->
<div class="modal fade right" id="esamina" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="true">
  <div class="modal-dialog modal-side modal-bottom-right modal-notify modal-info" role="document">
    <!--Content-->
    <div class="modal-content">
    

      <!--Body-->
      <div class="modal-body">
	        <h5 class="heading">Analisi terreno</h5><hr>
		<!-- INIZIO PRIMA RIGA -->
		
        <div class="row">
          <div id="bar" class="col-7">
            <div id="myProgress" style=" width: 170%; background-color: grey;">
             <div id="myBar" style=" width: 1%;height: 30px;background-color: green;color:whitesmoke">0%</div>
             
             
            </div>
            <button type="submit" form="formEsamina" id="btnConfermaAnalisi" class="myButton" style="margin-top:30px">Conferma</button>
             </div>
       
            

         
        </div>
        
        <!-- FINE PRIMA RIGA -->
        
        
  
        
      </div>
    </div>
    </div>
    
  
    
</div>
    <!--/.Content-->
<!--ESAMINA-->



<!--Modal: MAGGIORI INFO-->
<div class="modal fade right" id="maggioriInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="true">
  <div class="modal-dialog modal-side modal-bottom-right modal-notify modal-info" role="document">
    <!--Content-->
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header">
        <h5 class="heading">Attività in corso</h5>

        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" class="white-text">&times;</span>
        </button>
      </div>

      <!--Body-->
      <div class="modal-body">

		<!-- INIZIO PRIMA RIGA -->
		 <% for(Dispositivo disp : dispositiviList){ 
		 	if(disp.getStato().equals("occupato") && disp.getCampo().equals(campo.getNome())){
		 %> 
        <div class="row">

          <div>
            <p>ATTIVITA': <strong><%=disp.getAttivita() %></strong> </p>
            
            <%!String pathfoto ="";
            %>
            
            <% if(disp.getAttivita().equals("concima")){
            	pathfoto="../img/concime1.jpg";
            }
            	else{
            		pathfoto="../img/coltura1.jpg";
            	}
            	%>
             <p>   <img src="<%=pathfoto %>" style="width:50px;height:50px;">  è in svolgimento l'attività di <%=disp.getAttivita() %> sul campo <%=campo.getNome() %> </p>
             
            
			
			
			 <p> <img src="../img/robot1.jpg" style="width:50px;height:50px;">  <%= disp.getNome() %> </p>
			  
			</p>
			
			<center>
			<button class="myButtonInterrompi" id="<%=disp.getId()%>"> Interrompi Attività </button>
			</center>
          </div>
        </div>
        
         <hr>
        <%}
		 }%>
        <!-- FINE PRIMA RIGA -->
     
        
        <hr>
        
        	<button data-dismiss="modal" type="button" class="myButton" style="margin-left:43%">Ok</button>
            
        
      </div>
    </div>
    <!--/.Content-->
  </div>
</div>
<!--Modal: MAGGIORI INFO-->

<div id="footer">
	<%@include file="../html/footer.html" %>
</div>
</body>
</html>