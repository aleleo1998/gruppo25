<%@page import="Model.*"%>
<%@page import="java.sql.*"%>
<%@page import ="java.util.*"%>
<%@page import="Model.Inventario" %>

<%@page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">



<link rel="stylesheet" href="../css/inventario.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/7606041806.js" crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="../javascript/inventario.js"></script>



 


<% Model.Utente utente = (Utente) request.getSession().getAttribute("utente"); %>
<% String search = (String) request.getSession().getAttribute("nomeitem_ricercato"); %>
<%! ArrayList<Inventario> inventarioList = new ArrayList<Inventario>(); %>
<% if(utente!=null){%>
<%
	Model.InventarioModel im = new InventarioModel();
	inventarioList = (ArrayList<Inventario>) request.getSession().getAttribute("ricerca_item");
}
%>



<title>Inventario</title>
</head>
<body>
 
<div id="menu">
	<%@include file="menu.jsp"%>
</div>

<div id="container">

	<div id="lista">
	 
 
	
	
<!--
		<input class="form-control mb-4" id="tableSearch" type="text"
    placeholder="Type something to search list items">
  -->	
  
  <!-- SEARCH BAR -->
		<div style="margin: 1em 0em 2em 2em; width: 300px;">
  		<button id="button"><a href="inventario.jsp" style="color: black">Annulla ricerca</a></button>
	</div>

	<!-- END SEARCH BAR -->
  
  <table id="tablelist" class="table table-bordered table-striped">
    <thead>
      <tr>
        <th bgcolor="#3F565A"><span style="color:#ffffff"> Items</span></th>
        <th bgcolor="#3F565A"><span style="color:#ffffff"> Tipo</span></th>
        <th bgcolor="#3F565A"><span style="color:#ffffff"> Quantità</span></th>
        <th bgcolor="#3F565A"><span style="color:#ffffff"> Modifica</span></th>
        <th bgcolor="#3F565A"><span style="color:#ffffff"> Rimuovi</span></th>
      </tr>
    </thead>
    <tbody id="myTable">
    <% for(Inventario inv : inventarioList){ %> 
      <tr>
        <td><center><%=inv.getNome() %>   <input type="hidden" id="nome<%=inv.getIdItem() %>"  value="<%=inv.getNome()%>" >  </center></td>
        <td><center><%=inv.getTipo() %>   <input type="hidden" id="tipo<%=inv.getIdItem() %>"  value="<%=inv.getTipo()%>" >  </center></td>
        <td><center><%=inv.getQuantita() %> <input type="hidden" id="quantita<%=inv.getIdItem() %>"  value="<%=inv.getQuantita()%>" >  </center></td>
        <td><center><button data-toggle="modal" data-target="#modalRelatedContent" id="<%=inv.getIdItem() %>" class="btnMod"><i class="fa fa-plus-circle" aria-hidden="true"></i></button></center></td>
        <td><center><button data-toggle="modal" data-target="#modalRelatedContentElimina" id="<%=inv.getIdItem() %>" class="btnMin"><i id="<%=inv.getIdItem() %>" class="fa fa-minus-circle" aria-hidden="true"></i></button></center></td>
      	<%System.out.println(""+inv.getIdItem()); %>
      </tr>
      <% } %> 
    </tbody>
  </table>
	</div>



<!-- MODIFICA ITEM Modal: modalRelatedContent-->

<div class="modal fade right" id="modalRelatedContent" tabindex="-1" role="dialog"
  aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="true">
  <div class="modal-dialog modal-side modal-bottom-right modal-notify modal-info" role="document">
    <!--Content-->
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header">
        <h5 class="heading">Aggiorna Item</h5>

        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" class="white-text">&times;</span>
        </button>
      </div>

      <!--Body-->
      <div class="modal-body">

		<!-- INIZIO PRIMA RIGA -->
		
        <div class="row">

          <div class="col-7">
            
            

          </div>
        </div>
      
        
        <!-- INIZIO RIGA -->
		
        <div class="row">

           <form name="formMod" id="formMod" method="post">
	 		<div class="card-body">
	    	
	    	
			 
          
                  
                </div>
	                <!--Body-->
	                <div class="md-form" style="margin-bottom: 2em; margin-left:2em; margin-right:2em;">
	                <table>
	   				<thead>
	     			  <tr>
	                  <th bgcolor="#3F565A" width="200px" style="margin-left: 2em"><span style="color:#ffffff"> Nome Item</span></th>
	                  <th width=75%><input type="text" form="formMod" width="100%" name="nomeMod" id="nomeMod" placeholder="item" class="white-text form-control" style="background: transparent; color: black"></th>
	                  </tr>
	                  </table>
                </div>
                
                <div class="md-form" style="margin-bottom: 2em; margin-left:2em; margin-right:2em;">
	                  <table>
	   				<thead>
	     			  <tr>
	                  <th bgcolor="#3F565A" width="200px" style="margin-left: 2em"><span style="color:#ffffff"> Tipo</span></th>
	                  <th width=75%>
	                  <select class="white-text form-control"  form="formMod" width="100%" name="tipoMod" id="tipoMod">
	                 
						  <option value="concime">Concime</option>
						 
						  <option value="coltura">Coltura</option>
						
						  <option value="pesticida">Pesticida</option>
						  
						 	
						</select>
	                  </th>
	                  </tr>
	                  </table>
                </div>
                
                
                 <div class="md-form" style="margin-bottom: 2em; margin-left:2em; margin-right:2em;">
	                  <table>
	   				<thead>
	     			  <tr>
	                  <th bgcolor="#3F565A" width="200px" style="margin-left: 2em"><span style="color:#ffffff"> Quantità</span></th>
	                  <th width=75% ><input type="number" form="formMod" name="quantitaMod" id="quantitaMod" placeholder="quantità" class="white-text form-control"  style="background: transparent; color: black"></th>
	                  </tr>
	                  </table>
                </div>
                
                
               </form>
        </div>
        
        <!-- FINE RIGA -->
        
        <hr>
        
        <div id="btnConferma">
			<center> 
				<button type="button" class="myButtonConfermaModifica" style="margin-right: 2em; width: 150px;">Conferma</button>
	 			<button type="reset" form="formMod" class="myButtonAnnulla" style="margin-right: 2em; width: 150px;">Annulla</button>
	 			
	 		</center>
	 	</div>
        
      </div>
    </div>
    <!--/.Content-->
  </div>
</div>

<!--FINE MODIFICA ITEM Modal: modalRelatedContent-->




<!--ELIMINA ITEM Modal: modalRelatedContent-->
<div class="modal fade right" id="modalRelatedContentElimina" tabindex="-1" role="dialog"
  aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="true">
  <div class="modal-dialog modal-side modal-bottom-right modal-notify modal-info" role="document">
    <!--Content-->
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header">
        <h5 class="heading">Conferma Cancellazione</h5>

        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" class="white-text">&times;</span>
        </button>
      </div>

      <!--Body-->
      <div class="modal-body">

		<!-- INIZIO PRIMA RIGA -->
		
        <div class="row">

          <div class="col-7">
            <p><strong>Sei sicuro di voler eliminare questo item?</strong></p>
            

          </div>
        </div>
        
        <!-- FINE PRIMA RIGA -->
        
        
        <hr>
        
        <div id="btnConferma">
			<center> 
				<button type="button" data-dismiss="modal" id="btnConfermaElimina" class="myButtonConfermaElimina" style="margin-right: 2em; width: 150px;">Conferma</button>
	 			<button type="reset" data-dismiss="modal" form="formMod"  id="btnAnnullaElimina" class="myButtonAnnulla" style="margin-right: 2em; width: 150px;">Annulla</button>
	 			
	 		</center>
	 	</div>
        
            
        
      </div>
    </div>
    <!--/.Content-->
  </div>
</div>
<!--FINE ELIMINA ITEM Modal: modalRelatedContent-->












<!-- Aggiungi Item -->
	<div id="divInserisciItem">
		<div id="form-box" class="card">
	  	 <form name="formInsert" id="formInsert" method="post">
	 		<div class="card-body">
	    	<h5 class="card-title">Aggiungi item</h5> <hr>
	    	
			 
          
                  
                </div>
	                <!--Body-->
	                <div class="md-form" style="margin-bottom: 2em; margin-left:2em; margin-right:2em;">
	                <table>
	   				<thead>
	     			  <tr>
	                  <th bgcolor="#3F565A" width="100px" style="margin-left: 2em"><span style="color:#ffffff"> Nome Item</span></th>
	                  <th width=80%><input type="text" form="formInsert" width="100%" name="nome" id="nome" class="white-text form-control" placeholder="item" style="background: transparent; color: black"></th>
	                  </tr>
	                  </table>
                </div>
                
                <div class="md-form" style="margin-bottom: 2em; margin-left:2em; margin-right:2em;">
	                  <table>
	   				<thead>
	     			  <tr>
	                  <th bgcolor="#3F565A" width="100px" style="margin-left: 2em"><span style="color:#ffffff"> Tipo</span></th>
	                  <th width=80%>
	                  <select class="white-text form-control"  form="formInsert" width="100%" name="tipo" id="tipo">
						  <option value="concime">Concime</option>
						  <option value="coltura">Coltura</option>
						  <option value="pesticida">Pesticida</option>  	
						</select>
	                  </th>
	                  </tr>
	                  </table>
                </div>
                
                
                 <div class="md-form" style="margin-bottom: 2em; margin-left:2em; margin-right:2em;">
	                  <table>
	   				<thead>
	     			  <tr>
	                  <th bgcolor="#3F565A" width="100px" style="margin-left: 2em"><span style="color:#ffffff"> Quantità</span></th>
	                  <th width=80% ><input type="number" min=0 form="formInsert" name="quantita" id="quantita" class="white-text form-control" placeholder="Quantità" style="background: transparent; color: black"></th>
	                  </tr>
	                  </table>
                </div>
                
                <div id="divBtnAdd">
                  <p id="btnAdd" class="myButton"  style="margin-right: 2em; width: 150px;" >Aggiungi Item </p>                          
                </div>
               </form>
           </div>
             
		</div>


</div>
	
 
 <div id="ref"> 
 	<form id="refForm" action="../jsp/inventario.jsp"></form>
 </div>
	

<button id="successIns" type="button" class="myButton" data-toggle="modal" data-target="#successInsert"> </button>
	<!--Modal: modalRelatedContent-->
<div class="modal fade right" id="successInsert" tabindex="-1" role="dialog"
  aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="true">
  <div class="modal-dialog modal-side modal-bottom-right modal-notify modal-info" role="document">
    <!--Content-->
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header">
        <h5 class="heading">Item aggiunto all'inventario</h5>

        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" class="white-text">&times; </span>
        </button>
      </div>
		 <div class="modal-body">

		<!-- INIZIO PRIMA RIGA -->
		
        <div class="row">

          <div class="col-7">
            <p><strong>Premi "Ok" per continuare e consultare il tuo inventario!</strong></p>
            
  			 
          </div>
       <!-- FINE PRIMA RIGA -->
     
        
        <hr>
        
        <hr>
        
        	<button data-dismiss="modal" id="fineOperazione" aria-label="Close" type="button" class="myButton" style="margin-left:43%">Ok</button>

      </div>
    </div>
    <!--/.Content-->
  </div>
</div>
</div>
<!--Modal: modalRelatedContent-->
	
	
	
	
<!-- ELIMINA ITEM MODAL -->
<button id="successDel" type="button" class="myButton" data-toggle="modal" data-target="#successDelete"> </button>
	<!--Modal: modalRelatedContent-->
<div class="modal fade right" id="successDelete" tabindex="-1" role="dialog"
  aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="true">
  <div class="modal-dialog modal-side modal-bottom-right modal-notify modal-info" role="document">
    <!--Content-->
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header">
        <h5 class="heading">Item Eliminato dall'inventario</h5>

        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" class="white-text">&times; </span>
        </button>
      </div>
		 <div class="modal-body">

		<!-- INIZIO PRIMA RIGA -->
		
        <div class="row">

          <div class="col-7">
            <p><strong>Item eliminato correttamente, Clicca "Ok" per continuare e consultare il tuo inventario!</strong></p>
            
  			 
          </div>
       <!-- FINE PRIMA RIGA -->
     
        
        <hr>
        
        <hr>
        
        	<button data-dismiss="modal" id="fineOperazioneDel" aria-label="Close" type="button" class="myButton" style="margin-left:43%">Ok</button>

      </div>
    </div>
    <!--/.Content-->
  </div>
</div>
</div>
<!--Modal: modalRelatedContent-->
	
	
	
<div id="footer">
	<%@include file="../html/footer.html"%>
</div>	
	


</body>
</html>