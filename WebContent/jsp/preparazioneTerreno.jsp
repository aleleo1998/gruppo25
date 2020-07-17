<%@page import="Model.*"%>
<%@page import="java.sql.*"%>
<%@page import ="java.util.*"%>
<%@page import="Model.Inventario" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/myStyle.css">
<meta charset="ISO-8859-1">

<%! Dispositivo robotSelezionato =  new Dispositivo();
 	Item itemSelezionato = new Item();

 %> 
 

 <%
  request.getSession().setAttribute("robot_selezionato", null);
 request.getSession().setAttribute("item_selezionato", null);
 %>
 <%
 	robotSelezionato = (Dispositivo) request.getSession().getAttribute("robot_selezionato");
 	itemSelezionato = (Item) request.getSession().getAttribute("item_selezionato");
 %>


<% Model.Campo campo = (Campo) request.getSession().getAttribute("campo_selezionato"); %>
<% Model.Utente utente = (Utente) request.getSession().getAttribute("utente"); %>
<%! ArrayList<Inventario> inventarioList; %>
<%! ArrayList<Inventario> altreColtureList; %>
<% if(utente!=null){%>
<%
	Model.InventarioModel im = new InventarioModel();
	inventarioList = (ArrayList<Inventario>) im.getInventario(utente.getId());
	altreColtureList = (ArrayList<Inventario>) im.getAltreColture(utente.getId());
}
%>


<%! ArrayList<Dispositivo> dispositiviList; %>
<% if(utente!=null){%>
<%
	Model.DispositivoModel dm = new DispositivoModel();
    dispositiviList = (ArrayList<Dispositivo>) dm.doRetrieveByNomeCampo(campo.getNome());
}
%>

<%!ArrayList<String> attivitaList = new ArrayList<String>();
%>
<%attivitaList.add("Attività 1: Aratura del terreno");
  attivitaList.add("Attività 2: Fresatura del terreno");
  attivitaList.add("Attività 3: Concimazione del terreno");
  attivitaList.add("Attività 4: Irrigazione del terreno");
  attivitaList.add("Attività 5: Eliminare piante infestanti");

%>
<%!int mod=0; %>
<%!int numRobot=0; %>
<title>Preparazione Terreno</title>
</head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="../css/preparazioneTerreno.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/7606041806.js" crossorigin="anonymous"></script>
<script src="../javascript/preparazioneTerreno.js"></script>

<body>
<div id="menu">
	<%@include file="menu.jsp"%>
</div>

<div id="container">
<div id="form-box" class="card">
	  <div class="card-header">
	    Preparazione Terreno <p style = "text-decoration:line-through;"> </p>
	  </div>
	  <div class="card-body">
	    <h5 class="card-title">Attività da effettuare per preparare il terreno</h5> <hr>
	   
	   <div class="container my-5">

<!-- FORM -->
<form action="../preparazioneTerrenoServlet" name="form" id="form">
</form>

  <!--Row ATTIVITA-->
  <%!int i = 0;
  %>
    <% for(i=0;i<attivitaList.size();i++){ %> 
    	 
  	<div id="row" class="rowInventario">
    
	    <div class="media mb-4">
			<input form="form" id="radio" type="radio" name="colture" value="<%=i%>">  
			
	      	<span><strong> <%=attivitaList.get(i) %> </strong></span>
         
		      </div>
	    </div>
   

	<% }  %>

	</div>

	   
	  </div>
	 
	  <!--  ROBOT -->
	  
	   <div class="card-body">
	    <h5 class="card-title">Assegna attività - Lista dei robot associati al campo <%=campo.getNome() %> inattivi</h5> <hr>
	   
	   <div class="container my-5">


  <!--Row Robot-->

  
  
  <% numRobot=0;
  for(Dispositivo disp : dispositiviList){ %> 
    	<%if(disp.getTipo().equals("robot") && disp.getStato().equals("disponibile")){ 
    		numRobot++;
    		
    	%>
  	<div id="row" >
    
	    <div class="media mb-4">
	    	<input type="checkbox" form="form" class="checkbox"  id="checkbox<%=numRobot%>" name="robot" value="<%=disp.getId()%>">
			
			
	      	<img class="rounded" src="../img/robot1.jpg" alt="Generic placeholder image">
		    
		      <div class="media-body">
		        <a>
		          <h5 class="user-name font-weight-bold"><%=disp.getNome() %></h5>
		        </a>
		      
		      	
		        <p class="dark-grey-text article"> <strong>Impiego: </strong>  Attualmente installato su campo <%=campo.getNome() %> </p>
		          <i class="fa fa-circle" style="color:green;" aria-hidden="true"></i>
		          <strong>Disponibile</strong> <br>
		           
		      </div>
	    </div>
   
	</div>
	
	
	<%}
    }%>
	
	
	
	

</div>

	 <input type="text" id="nRobot" class="nRobot" value=<%=numRobot%>>
	
	  </div>
	  
	</div>
	
	<div id="btnConferma">
		<center> 
			<button type="button" class="myButton" id="form" style="margin-right: 2em; width: 150px;">Conferma</button>
	 		<button form="form" type="reset" class="myButton" style="margin-right: 2em; width: 150px;">Annulla</button> 
	 	</center>
	 </div>
	 
	
</div>







</div>

<div id="menu">
	<%@include file="../html/footer.html"%>
</div>
</body>
</html>