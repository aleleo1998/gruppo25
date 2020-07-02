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
<%! ArrayList<Inventario> inventarioList; %>
<% if(utente!=null){%>
<%
	Model.InventarioModel im = new InventarioModel();
	inventarioList = (ArrayList<Inventario>) im.getInventario(utente.getId());
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
        <td><center><%=inv.getNome() %></center></td>
        <td><center><%=inv.getTipo() %></center></td>
        <td><center><%=inv.getQuantita() %></center></td>
        <td><center><button id="<%=inv.getIdItem() %>" class="myButton"><i class="fa fa-plus-circle" aria-hidden="true"></i></button></center></td>
        <td><center><button id="<%=inv.getIdItem() %>" class="myButton"><i id="<%=inv.getIdItem() %>" class="fa fa-minus-circle" aria-hidden="true"></i></button></center></td>
      	<%System.out.println(""+inv.getIdItem()); %>
      </tr>
      <% } %> 
    </tbody>
  </table>
	</div>



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
	                  <th width=80%><input type="text" form="formInsert" width="100%" name="nome" id="nome" class="white-text form-control" placeholder="Item" style="background: transparent; color: black"></th>
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
	                  <th bgcolor="#3F565A" width="100px" style="margin-left: 2em"><span style="color:#ffffff"> Tipo</span></th>
	                  <th width=80% ><input type="number" form="formInsert" name="quantita" id="quantita" class="white-text form-control" placeholder="Quantità" style="background: transparent; color: black"></th>
	                  </tr>
	                  </table>
                </div>
                
                <div id="divBtnAdd">
                  <p id="btnAdd" class="myButton" style="margin-right: 2em; width: 150px;" >Aggiungi Item </p>                          
                </div>
               </form>
           </div>
             
		</div>


</div>
	
 
	
	
<div id="footer">
	<%@include file="../html/footer.html"%>
</div>	
	


</body>
</html>