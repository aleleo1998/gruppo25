<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.no-icons.min.css" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
<title>Aca green</title>

<script>
function controllo_form_aggiungi()
{
	inizio=document.getElementById("ora-inizio").value
	fine=document.getElementById("ora-fine").value
	giorno=document.getElementById("giorno").value
	if(inizio<fine)
	{
		if (giorno!="")
			{
			document.getElementById("form-aggiungi").submit();
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
</script>
</head>
<body>
<%@ page import="Model.*"%>
<%@ page import ="java.util.*" %>
 <div id="container">
  <p style="margin:50px 0px 0px 40px">Aggiungi irrigazione</p> 
  <div id="AggiungiIrrigazione" style="border-style: ridge;padding:20px 0px 0px 50px;margin:0px 40px 0px 40px">
  <form class="scelta-form" id="form_aggiungi" action="../AggiungiIrrigazioneServlet">
   <table class="table">
   <tr>
   <td style="text-align:center">
      Giorno
      <select id="giorno" name="giorno" id="giorno" >
       <option value="Lunedì">Lunedì</option>
       <option value="Martedì">Martedì</option>
       <option value="Mercoledì">Mercoledì</option>
       <option value="Giovedì">Giovedì</option>
       <option value="Venerdì">Venerdì</option>
       <option value="Sabato">Sabato</option>
       <option value="Domenica">Domenica</option>
      </select>
   </td>
   <td style="text-align:center">
      orario di inizio<input type="time" name="ora-inizio" id="ora-inizio">
   </td>
   <td style="text-align:center"> 
      orario di fine<input type="time" name="ora-fine" id="ora-fine" >
   </td>
   </tr>
   <tr>
   </table>
   <table class="table">
   <tr>
   <td style="text-align:center">
   <input type="button" value="Conferma" onclick="controllo_form_aggiungi()">
   </td>
   <td style="text-align:center">
   <input type="button" value="Annulla">
   </td>
   </tr>  
   </table>
   
     </form>
  </div>
  <div id="visualizza-irrigazioni">
  <%
  IrrigazioneModel i = new IrrigazioneModel();
  LinkedList<Irrigazione> list = (LinkedList<Irrigazione>) i.doRetrieveAllByCampo("campo1");  
  %>
  </div>
  
  
</div>
</body>
</html>