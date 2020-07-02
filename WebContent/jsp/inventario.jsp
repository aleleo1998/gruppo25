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
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/7606041806.js" crossorigin="anonymous"></script>
<script src="../javascript/inventario.js"></script>


<% Model.Utente utente = (Utente) request.getSession().getAttribute("utente"); %>
<%! ArrayList<Inventario> inventarioList; %>
<% if(utente!=null){%>
<%
	Model.InventarioModel im = new InventarioModel();
	inventarioList = (ArrayList<Inventario>) im.doInventario(utente.getId());
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
		<input class="form-control mb-4" id="tableSearch" type="text"
    placeholder="Type something to search list items">

  <table class="table table-bordered table-striped">
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
        <td><center><%=inv.getNome() %></center></td>
        <td><center><%=inv.getTipo() %></center></td>
        <td><center><%=inv.getQuantita() %></center></td>
        <td><center><i class="fa fa-plus-circle" aria-hidden="true"></i> </center></td>
        <td><center><i class="fa fa-minus-circle" aria-hidden="true"></i></center></td>
      </tr>
      <% } %> 
    </tbody>
  </table>
	</div>



	<div id="divInserisciItem">
		<div id="form-box" class="card">
	  
	 		<div class="card-body">
	    	<h5 class="card-title">Aggiungi item</h5> <hr>
	    	
			   	<form action="../inserisciItemServlet" method="post">
          
                  
                </div>
                <!--Body-->
                <div class="md-form" style="margin-bottom: 2em; margin-left:2em; margin-right:2em;">
                <table>
   				<thead>
     			  <tr>
                  <th bgcolor="#3F565A" width="100px" style="margin-left: 2em"><span style="color:#ffffff"> Nome Item</span></th>
                  <th width=80%><input type="text" width="100%" name="nomeitem" id="form" class="white-text form-control" placeholder="Item" style="background: transparent; color: black"></th>
                  </tr>
                  </table>
                </div>
                
                <div class="md-form" style="margin-bottom: 2em; margin-left:2em; margin-right:2em;">
                  <table>
   				<thead>
     			  <tr>
                  <th bgcolor="#3F565A" width="100px" style="margin-left: 2em"><span style="color:#ffffff"> Tipo</span></th>
                  <th width=80%>
                  <select class="white-text form-control"  width="100%" name="tipo" id="form">
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
                  <th bgcolor="#3F565A" width="100px" style="margin-left: 2em"><span style="color:#ffffff"> Tipo</span></th>
                  <th width=80% ><input type="number" name="quantita" id="form" class="white-text form-control" placeholder="Quantità" style="background: transparent; color: black"></th>
                  </tr>
                  </table>
                </div>
                
                <div id="divBtnAdd"">
                  <button id="btnAdd" class="myButton" style="margin-right: 2em; width: 150px;" >Aggiungi Item</button>                           
                </div>
                 </form>
             </div>
             
		</div>


</div>
	
 
	
	
		
	</div>






</div>





<div id="footer">
	<%@include file="../html/footer.html" %>
</div>
</body>
</html>