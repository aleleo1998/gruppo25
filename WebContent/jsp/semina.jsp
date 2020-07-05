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


<% Model.Campo campo = (Campo) request.getSession().getAttribute("campo_selezionato"); %>
<% Model.Utente utente = (Utente) request.getSession().getAttribute("utente"); %>
<%! ArrayList<Inventario> inventarioList; %>
<% if(utente!=null){%>
<%
	Model.InventarioModel im = new InventarioModel();
	inventarioList = (ArrayList<Inventario>) im.getInventario(utente.getId());
}
%>


<%! ArrayList<Dispositivo> dispositiviList; %>
<% if(utente!=null){%>
<%
	Model.DispositivoModel dm = new DispositivoModel();
    dispositiviList = (ArrayList<Dispositivo>) dm.doRetrieveByNomeCampo(campo.getNome());
}
%>
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
<form name="formSemina" id="formSemina">
</form>

  <!--Row-->
    <% for(Inventario inv : inventarioList){ %> 
    	<%if(inv.getTipo().equals("coltura")){ %>
  	<div id="row" >
    
	    <div class="media mb-4">
			<input required form="formSemina" id="radio" type="radio" id="male" name="gender" value="<%=inv.getIdItem()%>">  
			
	      	<img class="rounded" src="../img/coltura1.jpg" alt="Generic placeholder image">
		    
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

	
	<div id="divButtonAnalizza">
	<button type="button" id="btnAnalizza" class="myButton" style="margin-right: 2em; width: 180px;">Analizza terreno</button>
	
	</div>

</div>
	   
	  </div>
	 
	  <!--  ROBOT -->
	  
	   <div class="card-body">
	    <h5 class="card-title">Assegna attività - Lista dei robot associati al campo <%=campo.getNome() %> inattivi</h5> <hr>
	   
	   <div class="container my-5">


  <!--Row Robot-->
  
  <% for(Dispositivo disp : dispositiviList){ %> 
    	<%if(disp.getTipo().equals("robot") && disp.getStato().equals("disponibile")){ %>
  	<div id="row" >
    
	    <div class="media mb-4">
	    	<input required form="formSemina"  type="checkbox" id="checkbox" name="robot1" value="<%=disp.getId()%>">
			
			
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
	 
	
	  </div>
	  
	</div>
	
	<div id="btnConferma">
		<center> 
			<button form="formSemina" type="button" class="myButton" style="margin-right: 2em; width: 150px;">Conferma</button>
	 		<button form="formSemina" type="reset" class="myButton" style="margin-right: 2em; width: 150px;">Reset</button> 
	 	</center>
	 </div>
</div>

<div id="footer">
	<%@include file="../html/footer.html" %>
</div>
</body>
</html>