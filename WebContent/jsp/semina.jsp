<%@page import="Model.*"%>
<%@page import="java.sql.*"%>
<%@page import ="java.util.*"%>
<%@page import="Model.Inventario" %>
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
<script src="../javascript/semina.js"></script>


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



<%!int mod=0; %>
<%!int numRobot=0; %>
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

<!-- FORM -->
<form action="../seminaServlet" name="formSemina" id="formSemina">
</form>

  <!--Row COLTURE-->
  <%!int j = 0;
  	String path="";
  %>
    <% for(Inventario inv : inventarioList){ %> 
    	<%if(inv.getTipo().equals("coltura")){ 
    		ArrayList<Inventario> coltureList = new ArrayList<Inventario>(); 
    		coltureList.add(inv);
    		
    		if(j%4 == 0)
				path = "../img/coltura1.jpg";
			if(j%4 == 1)
				path = "../img/coltura2.jpg";
			if (j%3 == 2)
				path = "../img/coltura3.jpg";
			if (j%4 == 3)
				path = "../img/coltura4.jpg";
			
			j++;
    	%>
  	<div id="row" class="rowInventario">
    
	    <div class="media mb-4">
			<input form="formSemina" id="radio" type="radio" name="colture" value="<%=inv.getIdItem()%>">  
			
	      	<img class="rounded" src="<%=path %>" alt="Generic placeholder image">
		    
		      <div class="media-body">
		        <a>
		          <h5 class="user-name font-weight-bold"><%=inv.getNome()%></h5>
		        </a>
		      
		        <p class="dark-grey-text article"><%=inv.getNome() %> <span> è una coltura disponibile nell'inventario.
		        <span> Hai a disposizione </span> <%=inv.getQuantita() %>
		        <span>Kg di </span>
		        <%=inv.getNome() %><span></span></p>
		          
		          <%
						Random rand = new Random();
						int n = rand.nextInt(10000) + 1;
						System.out.println(n);
				  %>
		          
		          <strong>Quantità necessaria per la semina del campo: <%=n %>kg</strong> <br>
		          <%if(Integer.parseInt(inv.getQuantita()) >= n){ %>
		           	<strong><font color="green">Quantità sufficiente per la semina del campo: <%=inv.getQuantita() %></font></strong>
		           <%} %>
		           <%if(Integer.parseInt(inv.getQuantita()) < n){ %>
		           	<strong><font color="red">Quantità insufficiente per la semina del campo: <%=inv.getQuantita() %></font></strong>
		           <%} %>
		      </div>
	    </div>
   
	</div>
	<%}
    }
     %>



	<!--Row COLTURE CONSIGLIATE DOPO ANALIZZA TERRENO (Da visualizzare dopo analisi terreno)-->
	
    <% 
    ArrayList<Inventario> coltureList = new ArrayList<Inventario>(); 
    for(Inventario inv : inventarioList){ 
	if(inv.getTipo().equals("coltura")){ 
		
		coltureList.add(inv);
	}
	}
    Random r = new Random();
	mod = 0;
	 System.out.println("Lista dim:" + coltureList.size());
    mod = (coltureList.size()/2);
    System.out.println("MOD" + mod);
    for(int i = 0;i<mod;i++){
    	Inventario inv = coltureList.get(r.nextInt(coltureList.size()));
    	
    	if(j%4 == 0)
			path = "../img/coltura1.jpg";
		if(j%4 == 1)
			path = "../img/coltura2.jpg";
		if (j%3 == 2)
			path = "../img/coltura3.jpg";
		if (j%4 == 3)
			path = "../img/coltura4.jpg";
		
		j++;
    	
     %> 
    	
  	<div id="rowConsigliate" >
    
	    <div class="media mb-4">
			<input form="formSemina" id="radio" type="radio"  name="colture" value="<%=inv.getIdItem()%>">  
			
	      	<img class="rounded" src="<%=path %>" alt="Generic placeholder image">
		    
		      <div class="media-body">
		        <a>
		          <h5 class="user-name font-weight-bold"><%=inv.getNome()%></h5>
		        </a>
		      
		        <p class="dark-grey-text article"><%=inv.getNome() %> <span> è una coltura disponibile nell'inventario.
		        <span> Hai a disposizione </span> <%=inv.getQuantita() %>
		        <span>Kg di </span>
		        <%=inv.getNome() %><span></span></p>
		          
		          <%
						Random rand = new Random();
						int n = rand.nextInt(10000) + 1;
						System.out.println(n);
				  %>
		          
		          <strong>Quantità necessaria per la semina del campo: <%=n %>kg</strong> <br>
		          <%if(Integer.parseInt(inv.getQuantita()) >= n){ %>
		           	<strong><font color="green">Quantità sufficiente per la semina del campo: <%=inv.getQuantita() %></font></strong>
		           <%} %>
		           <%if(Integer.parseInt(inv.getQuantita()) < n){ %>
		           	<strong><font color="red">Quantità insufficiente per la semina del campo: <%=inv.getQuantita() %></font></strong>
		           <%} %>
		      </div>
	    </div>
   
	</div>
	<%}
    %>





	
	<div id="divButtonAnalizza">
	<button type="button" data-toggle="modal" data-target="#modalAnalizzaTerreno" id="btnAnalizza" class="myButton" style="margin-right: 2em; width: 180px;">Analizza terreno</button>
	
	</div>

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
	    	<input type="checkbox" form="formSemina" class="checkbox"  id="checkbox<%=numRobot%>" name="robot" value="<%=disp.getId()%>">
			
			
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
			<button form="formSemina" id="confermaSemina" type="button" class="myButton" style="margin-right: 2em; width: 150px;">Conferma</button>
	 		<button form="formSemina" type="reset" class="myButton" style="margin-right: 2em; width: 150px;">Annulla</button> 
	 	</center>
	 </div>
	 
	 
	 
	 
	 
	 
	 
	 
	 
	   <!-- ALTRE COLTURE --> 
    
    <div id="altreColture">
  		<div id="form-box" class="card">
	  
	  <div class="card-body">
	    <h5 class="card-title">Altre colture consigliate non presenti nell'inventario</h5> <hr>
	   
	   <div class="container my-5">



  <!--Row ALTRE COLTURE-->
  <%!int i = 0; 
  
  %>
    <% 
    for(Inventario inv : altreColtureList){ %> 
    	<%if(inv.getTipo().equals("coltura")){ 
    		ArrayList<Inventario> altreColtureConsigliate = new ArrayList<Inventario>(); 
    		altreColtureConsigliate.add(inv);
    		
    		if(i%4 == 0)
				path = "../img/coltura1.jpg";
			if(i%4 == 1)
				path = "../img/coltura2.jpg";
			if (i%3 == 2)
				path = "../img/coltura3.jpg";
			if (i%4 == 3)
				path = "../img/coltura4.jpg";
			
			i++;
    	%>
  	<div id="rowAltreColture" class="rowInventario">
    
	    <div class="media mb-4">
			 

			
	      	<img class="rounded" src="<%=path%>" alt="Generic placeholder image">
		    
		      <div class="media-body">
		        <a>
		          <h5 class="user-name font-weight-bold"><%=inv.getNome()%></h5>
		        </a>
		      
		        <p class="dark-grey-text article"><%=inv.getNome() %> <span> è una coltura consigliate per il campo <%=campo.getNome() %> non presente nel tuo inventario.
		        <span> Ti consigliamo di prendere in considerazione l'acquisto di questa coltura per ottenere il meglio dal tuo terreno! </span> 
		        
		        <span></span></p>
		          
		          <%
						Random rand = new Random();
						int n = rand.nextInt(10000) + 1;
						int costo = rand.nextInt(100) + 1;
						System.out.println(n);
				  %>
		          
		          <strong>Quantità necessaria per la semina del campo <%=campo.getNome() %>: <%=n %>kg</strong> <br>
		           <strong>Costo previsto: <%=costo %>&euro;</strong> <br>
		        
		      </div>
	    </div>
   
	</div>
	<%}
    }
     %>
     </div>
     </div>
     </div>
    </div>
	 
	 
	 
</div>










<!-- ANALIZZA TERRENO Modal: modalRelatedContent-->
<div class="modal fade right" id="modalAnalizzaTerreno" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="true">
  <div class="modal-dialog modal-side modal-bottom-right modal-notify modal-info" role="document">
    <!--Content-->
    <div class="modal-content">
    

      <!--Body-->
      <div class="modal-body">
	        <h5 class="heading">Analisi Terreno</h5><hr>
		<!-- INIZIO PRIMA RIGA -->
		
        <div class="row">
          <div id="bar" class="col-7">
            <div id="myProgress" style=" width: 170%; background-color: grey;">
             <div id="myBar" style=" width: 1%;height: 30px;background-color: green;color:whitesmoke">0%</div>
             
            </div>
            <button type="button" id="btnConfermaAnalisi" class="myButton" data-dismiss="modal" style="margin-top:30px">Conferma</button>
             </div>
       
            

         
        </div>
        
        <!-- FINE PRIMA RIGA -->
        
        
  
        
      </div>
    </div>
    </div>
    
  
    
</div>
    <!--/.Content-->
<!--Modal: modalRelatedContent-->






<!--  ALERT BASE CONTROLLO COLTURA SELEZIONATA -->
<button id="colturaError" type="button" class="myButton" data-toggle="modal" data-target="#errColtura"></button>

<!--Modal: modalRelatedContent-->
<div class="modal fade right" id="errColtura" tabindex="-1" role="dialog"
  aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
  <div class="modal-dialog modal-side modal-bottom-right modal-notify modal-info" role="document">
    <!--Content-->
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header">
        <h5 class="heading">Seleziona Coltura</h5>

        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" class="white-text">&times; </span>
        </button>
      </div>
		 <div class="modal-body">

		<!-- INIZIO PRIMA RIGA -->
		
        <div class="row">

          <div class="col-7">
            <p><strong>Seleziona una coltura per poter proseguire nell'operazione di Semina</strong></p>
            

          </div>
       <!-- FINE PRIMA RIGA -->
     
        
        <hr>
        
        <hr>
        
        	<button data-dismiss="modal" aria-label="Close" type="button" class="myButton" style="margin-left:43%">Ok</button>

      </div>
    </div>
    <!--/.Content-->
  </div>
</div>
</div>
<!--Modal: modalRelatedContent-->


<!--  ALERT BASE CONTROLLO ROBOT SELEZIONATA -->
<button id="robotError" type="button" class="myButton" data-toggle="modal" data-target="#errRobot"></button>

<!--Modal: modalRelatedContent-->
<div class="modal fade right" id="errRobot" tabindex="-1" role="dialog"
  aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
  <div class="modal-dialog modal-side modal-bottom-right modal-notify modal-info" role="document">
    <!--Content-->
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header">
        <h5 class="heading">Seleziona Robot</h5>

        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" class="white-text">&times; </span>
        </button>
      </div>
		 <div class="modal-body">

		<!-- INIZIO PRIMA RIGA -->
		
        <div class="row">

          <div class="col-7">
            <p><strong>Seleziona un robot per poter proseguire nell'operazione di Semina</strong></p>
            

          </div>
       <!-- FINE PRIMA RIGA -->
     
        
        <hr>
        
        <hr>
        
        	<button data-dismiss="modal" aria-label="Close" type="button" class="myButton" style="margin-left:43%">Ok</button>

      </div>
    </div>
    <!--/.Content-->
  </div>
</div>
</div>
<!--Modal: modalRelatedContent-->

<div id="footer">
	<%@include file="../html/footer.html" %>
</div>
</body>
</html>