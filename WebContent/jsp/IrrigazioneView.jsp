<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/7606041806.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../css/drago.css">
<link rel="stylesheet" href="../css/myStyle.css">
<title>Aca green</title>

<script>
$(document).ready(function(){
	$(".id").hide();

	
});
function controllo_form_aggiungi()
{
	inizio=document.getElementById("ora-inizio").value
	fine=document.getElementById("ora-fine").value
	giorno=document.getElementById("giorno").value
    if((inizio!="")&&(fine!=""))
    {
	    if(inizio<fine)
	    {
	 	    if (giorno!="")
			{
			  document.getElementById("form_aggiungi").submit();
			}
		    else
			{
			alert("Devi selezionare un giorno")
			}
	    }
	    else
	    {
		 alert("L'orario di fine precede l'orario di inzio")
	    }
    }
    else
	  {
		alert("Devi selezionare un orario di inizio e uno di fine")
	  }
	
}

function controllo_form_cambia()
{

	inizio=document.getElementById("ora-inizio2").value
	fine=document.getElementById("ora-fine2").value
	giorno=document.getElementById("giorno2").value
    if((inizio!="")&&(fine!=""))
    {
	    if(inizio<fine)
	    {
	 	    if (giorno!="")
			{
			  document.getElementById("form_cambia").submit();
			}
		    else
			{
			alert("Devi selezionare un giorno")
			}
	    }
	    else
	    {
		 alert("L'orario di fine precede l'orario di inzio")
	    }
    }
    else
	  {
		alert("Devi selezionare un orario di inizio e uno di fine")
	  }
	
}
</script>
</head>
<body>
<%@ page import="Model.*"%>
<%@ page import ="java.util.*" %>
<div id="menu">
	<%@include file="menu.jsp"%>
</div>
 <div id="container">
  <p style="margin:50px 0px 0px 40px">Aggiungi irrigazione</p> 
  <div id="AggiungiIrrigazione" style="border-style: ridge;padding:20px 0px 20px 0px;margin:0px 40px 0px 40px">
  <form class="scelta-form" id="form_aggiungi" action="../AggiungiIrrigazioneServlet">
   <table class="table">
   <tr>
   <td>
      <div style="margin-left:40px">
      Giorno
      <select  name="giorno" id="giorno" style="font-size:12px; height:24px;margin-left:10px" >
       <option value="Lunedì" >Lunedì</option>
       <option value="Martedì">Martedì</option>
       <option value="Mercoledì">Mercoledì</option>
       <option value="Giovedì">Giovedì</option>
       <option value="Venerdì">Venerdì</option>
       <option value="Sabato">Sabato</option>
       <option value="Domenica">Domenica</option>
      </select>
    </div> 
   </td>
   <td>
      orario di inizio<input type="time" name="ora-inizio" id="ora-inizio" style="margin:0px 0px 0px 10px">
   </td>
   <td > 
      orario di fine<input type="time" name="ora-fine" id="ora-fine" style="margin:0px 0px 0px 10px" >
   </td>
   </tr>
   <tr>
   </table>
   </form>
   
   <div id="pulsanti" style="margin-left:48px">
   <button class="myButton" data-toggle="modal" data-target="#modal_aggiungi">Conferma</button>
   <input type="button" class="myButton" value="Annulla" style="margin-left:20px">
   </div>
   
  </div>
  <p style="margin:50px 0px 0px 40px">Irrigazioni programmate</p>
  <div id="visualizza-irrigazioni" style="border-style: ridge;padding:20px 0px 20px 50px;margin:0px 40px 0px 40px">
  <%
  int i=0;
  IrrigazioneModel im = new IrrigazioneModel();
  Campo c1=(Campo) request.getSession().getAttribute("campo_selezionato");
  LinkedList<Irrigazione> list = (LinkedList<Irrigazione>) im.doRetrieveAllByCampo(c1.getNome());
  for(Irrigazione c: list)
  {
	  %>
	   <form id=<%=c.getId() %> method="get" action="../RimuoviIrrigazioneServlet">
	   <input type="text" name="id_irrigazione" class="id" value=<%=c.getId()%>>
	   </form>
	   <div style="margin-top:20px">
	   <%=c.getGiorno()+" "+c.getOra_inizio()+"-"+c.getOra_fine()%>
	   <%if(c.getGiorno().equals("Lunedì")){ %>
	   <input type="button" class="myButton" value="Cambia" style="margin-left:35px" data-toggle="modal" data-target="#modal_cambia<%=i%>">
	   <button type="button" class="myButton" data-toggle="modal" style="margin-left:20px" data-target="#modalRelatedContent<%=i%>">Rimuovi</button>
	   <% }%>
	   <%if(c.getGiorno().equals("Martedì")){ %>
	   <input type="button" class="myButton" value="Cambia" style="margin-left:28px" data-toggle="modal" data-target="#modal_cambia<%=i%>">
	   <button type="button" class="myButton" data-toggle="modal" style="margin-left:20px" data-target="#modalRelatedContent<%=i%>">Rimuovi</button>
	   <% }%>
	    <%if(c.getGiorno().equals("Mercoledì")){ %>
	   <input type="button" class="myButton" value="Cambia" style="margin-left:11px" data-toggle="modal" data-target="#modal_cambia<%=i%>">
	   <button type="button" class="myButton" data-toggle="modal" style="margin-left:20px" data-target="#modalRelatedContent<%=i%>">Rimuovi</button>
	   <% }%>
	    <%if(c.getGiorno().equals("Giovedì")){ %>
	   <input type="button" class="myButton" value="Cambia" style="margin-left:28px" data-toggle="modal" data-target="#modal_cambia<%=i%>">
	   <button type="button" class="myButton" data-toggle="modal" style="margin-left:20px" data-target="#modalRelatedContent<%=i%>">Rimuovi</button>
	   <% }%>
	   <%if(c.getGiorno().equals("Venerdì")){ %>
	   <input type="button" class="myButton" value="Cambia" style="margin-left:28px" data-toggle="modal" data-target="#modal_cambia<%=i%>"> 
	   <button type="button" class="myButton" data-toggle="modal" style="margin-left:20px" data-target="#modalRelatedContent<%=i%>">Rimuovi</button>
	   <% }%>
	   <%if(c.getGiorno().equals("Sabato")){ %>
	   <input type="button" class="myButton" value="Cambia" style="margin-left:33px" data-toggle="modal" data-target="#modal_cambia<%=i%>">
	   <button type="button" class="myButton" data-toggle="modal" style="margin-left:20px" data-target="#modalRelatedContent<%=i%>">Rimuovi</button>
	   <% }%>
	   <%if(c.getGiorno().equals("Domenica")){ %>
	   <input type="button" class="myButton" value="Cambia" style="margin-left:11px" data-toggle="modal" data-target="#modal_cambia<%=i%>">
	   <button type="button" class="myButton" data-toggle="modal" style="margin-left:20px" data-target="#modalRelatedContent<%=i%>">Rimuovi</button>
	   <% }%>
	  
	  </div>
	 <div class="modal fade right" id="modalRelatedContent<%=i%>" tabindex="-1" role="dialog"
  aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="true">
  <div class="modal-dialog modal-side modal-bottom-right modal-notify modal-info" role="document">
    <!--Content-->
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header">
        <h5 class="heading">Riepilogo di rimozione</h5>

        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" class="white-text">&times;</span>
        </button>
      </div>

      <!--Body-->
      <div class="modal-body">

		<!-- INIZIO PRIMA RIGA -->
		
        <div class="row">
          <div class="col-7">
            <p><strong>Sei sicuro di voler eliminare l'irrigazione programmata per 
             <%=c.getGiorno()+" "+c.getOra_inizio()+"-"+c.getOra_fine()%>?</strong></p>
            

          </div>
        </div>
        
        <!-- FINE PRIMA RIGA -->
        
        
        
        <hr>
        
        	<button type="submit" class="myButton" form=<%=c.getId() %> style="margin-right: 2em">Conferma</button>
            <button type="button" class="myButton" data-dismiss="modal" >Annulla</button>
        
      </div>
    </div>
    </div>
</div>




    <!--/.Content-->
    
    
    
    <div class="modal fade right" id="modal_cambia<%=i %>" tabindex="-1" role="dialog"
  aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="true">
  <div class="modal-dialog modal-side modal-bottom-right modal-notify modal-info" role="document">
    <!--Content-->
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header">
        <h5 class="heading">Cambia irrigazione</h5>

        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" class="white-text">&times;</span>
        </button>
      </div>

      <!--Body-->
      <div class="modal-body">

		<!-- INIZIO PRIMA RIGA -->
		
        <div class="row">
          <div class="col-7">
   
    <form class="scelta-form" id="form_cambia" action="../CambiaIrrigazioneServlet">
     <p>
      <a style="background-color:#3F565A;padding:4px 68px 6px 0px;color: whitesmoke;">Giorno</a>
      <select name="giorno2" id="giorno2" style="font-size:12px; height:32px;margin-left:-10px" >
       <option value="Lunedì" >Lunedì</option>
       <option value="Martedì">Martedì</option>
       <option value="Mercoledì">Mercoledì</option>
       <option value="Giovedì">Giovedì</option>
       <option value="Venerdì">Venerdì</option>
       <option value="Sabato">Sabato</option>
       <option value="Domenica">Domenica</option>
      </select>
    </p>
   
      <p> <a style="background-color:#3F565A;padding:3.5px 10px 4px 0px;color: whitesmoke;">orario di inizio</a><input type="time" name="ora-inizio2" id="ora-inizio2" style="margin:15px 0px 0px 0px"></p>
   
      <p> <a style="background-color:#3F565A;padding:3.5px 22px 4px 0px;color: whitesmoke;">orario di fine</a><input type="time" name="ora-fine2" id="ora-fine2" style="margin:15px 0px 0px 0px" ></p>
            
        <hr>
        
        	<button type="button" onclick="controllo_form_cambia()" class="myButton" 
        	style="margin-right: 2em">Conferma</button>
            <button type="button" class="myButton" data-dismiss="modal" >Annulla</button>
            <input type="text" name="id" style="display:none" value="<%=c.getId() %>">
            </form>

          </div>
        </div>
	  <% 
  i++;}
  
  %>
  </div>
   <div class="modal fade right" id="modal_aggiungi" tabindex="-1" role="dialog"
  aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="true">
  <div class="modal-dialog modal-side modal-bottom-right modal-notify modal-info" role="document">
    <!--Content-->
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header">
        <h5 class="heading">Riepilogo</h5>

        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" class="white-text">&times;</span>
        </button>
      </div>

      <!--Body-->
      <div class="modal-body">

		<!-- INIZIO PRIMA RIGA -->
		
        <div class="row">
          <div class="col-7">
            <p><strong>Sei sicuro di inserire questa nuova irrigazione programmata</strong></p>
            

          </div>
        </div>
        
        <!-- FINE PRIMA RIGA -->
        
        
        
        <hr>
        
        	<button type="button" onclick="controllo_form_aggiungi()" class="myButton" 
        	style="margin-right: 2em">Conferma</button>
            <button type="button" class="myButton" data-dismiss="modal" >Annulla</button>
        
      </div>
    </div>
    </div>
</div>
    <!--/.Content-->
    

        
        <!-- FINE PRIMA RIGA -->
        
        
  
        
      </div>
    </div>
</div>




  </div>
  </div>

  <div id="footer">
	<%@include file="../html/footer.html"%>
 </div>
  
</body>
</html>