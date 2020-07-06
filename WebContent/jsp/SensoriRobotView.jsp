<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/7606041806.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<link rel="stylesheet" href="../css/drago.css">
<link rel="stylesheet" href="../css/SensoriRobot.css">
<meta charset="ISO-8859-1">

<title>AcaGreen</title>
</head>
<script>
$(document).ready(function(){
	$("#tipo").hide();
	$("#proprietario").hide();
	$("#tipo2").hide();
	$("#proprietario2").hide();
	$("#nSensori").hide();
	$("#nRobot").hide();
	
	 $("#confermaRobot").click(function(){
		 var nome=$("#nomeRobot").val();
		 if(nome=="")
			 {
			 alert("Devi inserire un nome per il dispositivo");
			 }
		 else
			 {
			 $("#formRobot").submit();
			 }
	 });
	 $("#confermaSensore").click(function(){
		 var nome=$("#nomeSensore").val();
		 alert(nome)
		 if(nome=="")
			 {
			 alert("Devi inserire un nome per il dispositivo");
			 }
		 else
			 {
			 $("#formSensore").submit();
			 }
	 });
});
	 
</script>
<script>
function controllo_radio_sensore()
{
	var n=document.getElementById("nSensori").value
	var i=0
	var bool=false
	for(i=0;i<n;i++)
		{
		
		  if(document.getElementById("sensore"+i).checked==true)
		  {
			 
			  var robot=document.getElementById("sensore"+i).value
			  var array=robot.split(" ")
			  var nome=array[1]
			  bool=true
		  }
		}
	if(bool==false)
		{
		 document.getElementById("aSensore").innerHTML="Devi selezionare un sensore da eliminare"
			 ocument.getElementById("confermaSens").disabled=true;
	
		}
	else
		{
		 document.getElementById("aSensore").innerHTML="Sei sicuro di eliminare il sensore "+nome
		 document.getElementById("confermaSens").disabled=false;
	
		}
}

function controllo_radio_robot()
{
	var n=document.getElementById("nRobot").value
	var i=0
	var bool=false
	for(i=0;i<n;i++)
		{
		
		  if(document.getElementById("robot"+i).checked==true)
		  {
			  
			  var robot=document.getElementById("robot"+i).value
			  var array=robot.split(" ")
			  var nome=array[1]
			  bool=true
		  }
		}
	if(bool==false)
		{
		 document.getElementById("aRobot").innerHTML="Devi selezionare un sensore da eliminare"
			 document.getElementById("confermaRo").disabled=true;
		
		}
	else
		{
		 document.getElementById("aRobot").innerHTML="Sei sicuro di eliminare il sensore "+nome
		 document.getElementById("confermaRo").disabled=false;
			
		}
}

</script>
<body>
<%@ page import="Model.*"%>
<%@ page import ="java.util.*" %>




 <div id="container">
 
    <div id="sensori">
    
      <strong style="font-size:20px">Sensori</strong>
      <p style="margin-top:15px">
       <button  type="button" class="myButton"  data-toggle="modal" data-target="#aggSensore" >Aggiungi sensore</button>
       <button type="button" id="eliminaSensore2" class="myButton" onclick="controllo_radio_sensore()" data-toggle="modal" data-target="#elSensore">Elimina sensore</button>
      </p>
       <strong>i tuoi sensori</strong>
       <div id="tuoiSensori">
         <div class="card example-1 scrollbar-ripe-malinka">
         <div class="card-body">
         
  			
          <%
          DispositivoModel dp= new DispositivoModel();
         LinkedList<Dispositivo> list = (LinkedList<Dispositivo>) dp.getSensori("alex");
         String valDisp="";
         int i=0;
         %><form  id="eliminaSensore" action="../eliminaDispositivo" method="post"><% 
         for(Dispositivo disp:list)
         {
    	   valDisp=disp.getId()+" "+disp.getNome();
    	 %>
    	   <p>
    	    
    	    <input type="radio" style="margin-top:20px" name="radioDis" id="sensore<%=i%>" value="<%=valDisp%>"><a style="margin-left:10px"><%=disp.getNome()%></a>
    	    <%if(disp.getStato().equals("disponibile")){ %>
    	    <a style="margin-left:20px"><strong>Impiego</strong>:attualmente installato in <%=disp.getCampo() %><br>
    	    <span style="margin-left:110px" ><i style="color:green" class="fa fa-circle" aria-hidden="true"></i></span> Disponibile<br>
    	    <img style="width:70px;height:80px" src="../img/sensore2.jpg">
    	    </a>
    	    <%} else {%>
    	     <a  style="margin-left:20px"><strong>Impiego</strong>:attualmente impiegato in <%=disp.getCampo() %></a><br>
    	      <span style="margin-left:110px" ><i style="color:red" class="fa fa-circle" aria-hidden="true"></i></span> Occupato<br>
    	     <img style="width:70px;height:80px" src="../img/sensore2.jpg">
    	   </p>
    	   <br>
    	   <%}%>
    	    
    	    <%
    	    i++;
    	 }%>
    	 <input type="text" id="nSensori" value=<%=i %>>
         </form>
       </div></div><!-- scroll bar -->
       </div><!-- fine tuoi sensori -->
       
    </div> <!-- fine sensori -->
    
    <div id="robot">
   
    <strong style="font-size:20px">Robot</strong>
      <p style="margin-top:15px">
       <button  type="button" class="myButton"  data-toggle="modal" data-target="#aggRobot">Aggiungi robot</button></a>
       <button type="button" id="eliminaR" class="myButton" data-toggle="modal" data-target="#elRobot" onclick="controllo_radio_robot()" >Elimina robot</button>
      </p>
       <strong >i tuoi robot</strong>
       <div id="tuoiRobot">
         <div class="card example-1 scrollbar-ripe-malinka">
         <div class="card-body">
         <form id="eliminaRobot" action="../eliminaDispositivo" method="post" >
         <%
         //Utente u =(Utente) request.getSession().getAttribute("utente")
         LinkedList<Dispositivo> list2 = (LinkedList<Dispositivo>) dp.getRobot("alex");
         i=0;
         for(Dispositivo disp:list2)
         {
           valDisp=disp.getId()+" "+disp.getNome();
    	   %>
    	   <p>
    	    
    	    <input type="radio" style="margin-top:20px" name="radioDis" id="robot<%=i%>" value="<%=valDisp%>"><a style="margin-left:10px"><%=disp.getNome()%></a>
    	    <%if(disp.getStato().equals("disponibile")){ %>
    	    <a style="margin-left:10px"><strong style="margin-left:13px">Impiego</strong>:attualmente installato in <%=disp.getCampo() %><br>
    	    <span style="margin-left:100px" ><i style="color:green" class="fa fa-circle" aria-hidden="true"></i></span> Disponibile<br>
    	    <img style="width:50px;height:50px" src="../img/robot1.jpg">
    	    </a>
    	    <%} else {%>
    	     <a  style="margin-left:10px"><strong style="margin-left:13px">Impiego</strong>:attualmente impiegato in <%=disp.getCampo()%>
    	     <br>
    	     <span style="margin-left:100px" ><i style="color:red" class="fa fa-circle" aria-hidden="true"></i></span> Occupato
    	     </a>
    	      <br>
    	     <img style="width:50px;height:50px" src="../img/robot1.jpg">
    	   </p>
    	   <br>
    	   <%}%>
    	    
    	    <%
    	    i++;
    	 }%>
    
    	 <input type="text" id="nRobot" value=<%=i%>>
         </form>
       </div></div><!-- scroll bar -->
       </div><!-- fine tuoi robot -->
      
    </div><!-- fine robot -->
    
    
     <div class="modal fade right" id="aggRobot" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="true">
       <div class="modal-dialog modal-side modal-bottom-right modal-notify modal-info" role="document">
    <!--Content-->
         <div class="modal-content">
    

      <!--Body-->
           <div class="modal-body">

		   <!-- INIZIO PRIMA RIGA -->
           <div class="row">
             <form action="../AggiungiDispositivo" id="formRobot" method="post">
                <%CampoModel cm=new CampoModel();
                  ArrayList<Campo> campi =cm.doRetrieveByCEO("alex"); //modificare
                 
                %> <!-- Modificare -->
                <a style="margin-left:10px;background-color:#3F565A;padding:3px 1px 5px 0px;color: whitesmoke;">Nome dispositivo</a><input type="text" id="nomeRobot" name="nome"><br><br>
                <a style="margin-left:10px;background-color:#3F565A;padding:4px 78px 3px 0px;color: whitesmoke;" >campo</a>
                <select name="campo" style="height:30px;margin-left:-5px">
                <%for(Campo c:campi){ %>
                <option value=<%=c.getNome()%>  ><%=c.getNome() %></option>
                <%} %>
                </select>
                <br><br>
               
                <input type="text" id="proprietario" name="proprietario" value="alex"><!-- modificare -->
                <input type="text" id="tipo" name="tipo" value="robot"><br>
                
                <button  style="margin-left:10px;margin-top:40px" type="button" class="myButton" id="confermaRobot" >Conferma</button>
                <button  style="margin-left:30px;margin-top:40px" type="button" class="myButton" class="close" data-dismiss="modal" >Annulla</button>
               
             </form>
             
           </div>
             </div>
         
            
            

         
        </div>
        
        <!-- FINE PRIMA RIGA -->
        
        
  
        
    </div>
    </div>
    <div class="modal fade right" id="aggSensore" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="true">
       <div class="modal-dialog modal-side modal-bottom-right modal-notify modal-info" role="document">
    <!--Content-->
         <div class="modal-content">
    

      <!--Body-->
           <div class="modal-body">

		   <!-- INIZIO PRIMA RIGA -->
           <div class="row">
             <form action="../AggiungiSensore" id="formSensore" method="post">
                <%
                  ArrayList<Campo> campi2 =cm.doRetrieveByCEO("alex"); //modificare
                 
                %> <!-- Modificare -->
                <a style="margin-left:10px;background-color:#3F565A;padding:3px 1px 5px 0px;color: whitesmoke;">Nome dispositivo</a><input type="text" id="nomeSensore" name="nome"><br><br>
                <a style="margin-left:10px;background-color:#3F565A;padding:4px 78px 3px 0px;color: whitesmoke;" >campo</a>
                <select name="campo" style="height:30px;margin-left:-5px">
                <%for(Campo c:campi2){ %>
                <option value=<%=c.getNome()%>  ><%=c.getNome() %></option>
                <%} %>
                </select>
                <br><br>
               
                <input type="text" id="proprietario2" name="proprietario" value="alex"><!-- modificare -->
                <input type="text" id="tipo2" name="tipo" value="sensore">
                
                <button  style="margin-left:10px;margin-top:40px" type="button" class="myButton" id="confermaSensore" >Conferma</button>
                <button  style="margin-left:30px;margin-top:40px" type="button" class="myButton" class="close" data-dismiss="modal" >Annulla</button>
           
             </form>
             
           </div>
             </div>
         
            
            

         
        </div>
        
        <!-- FINE PRIMA RIGA -->
        
        
  
        
    </div>
    </div>
      <div class="modal fade right" id="elRobot" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="true">
       <div class="modal-dialog modal-side modal-bottom-right modal-notify modal-info" role="document">
    <!--Content-->
         <div class="modal-content">
    

      <!--Body-->
           <div class="modal-body">

		   <!-- INIZIO PRIMA RIGA -->
           <div class="row" style="margin-left:20px">
                <a id="aRobot"></a>
                <div style="margin:30px 0px 0px 20px">
                <button   type="submit" class="myButton" id="confermaRo" form="eliminaRobot">Conferma</button>
                <button  style="margin-left:20px" type="button" class="myButton" class="close" data-dismiss="modal" >Annulla</button>
                </div>
            
             
           </div>
             </div>
         
            
            

         
        </div>
        
        <!-- FINE PRIMA RIGA -->
        
        
  
        
    </div>
    </div>
    
       <div class="modal fade right" id="elSensore" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="true">
       <div class="modal-dialog modal-side modal-bottom-right modal-notify modal-info" role="document">
    <!--Content-->
         <div class="modal-content">
    

      <!--Body-->
           <div class="modal-body">

		   <!-- INIZIO PRIMA RIGA -->
           <div class="row">
           
                <div id="aSensore" style="margin-left:20px"></div>
     
          <div style="margin:30px 0px 0px 20px">           
                <button type="submit" form="eliminaSensore"  id="confermaSens" class="myButton"  >Conferma</button>
                <button style="margin-left:20px"   type="button" class="myButton" class="close" data-dismiss="modal" >Annulla</button>
    
           </div>
             
           </div>
             </div>
         
            
            

         
        </div>
        
        <!-- FINE PRIMA RIGA -->
        
        
  
        
    </div>
    </div>
    
    </div>

    
  <div id="footer">
	<%@include file="../html/footer.html"%>
 </div>

</body>
</html>