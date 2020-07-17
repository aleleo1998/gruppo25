<%@ page language="java"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet" href="../css/AggiungiCampo.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/7606041806.js" crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<link rel="stylesheet" href="../css/drago.css">
<link rel="stylesheet" href="../css/myStyle.css">
<meta charset="ISO-8859-1">
<title>Acagreen</title>

<script>
$(document).ready(function(){
	$(".nsensori").hide();
	$("#nrobot").hide();
	$("#proprietario").hide();


		   $("#conferma").click(function(){
			
			var nome = $("#nome").val();
			var cord = $("#cord").val();
			var ettari = $("#km").val();
			var tipo=$("#tipo").val();
			var proprietario=$("#proprietario").val();
			
			if(nome!="")
			{
			 if((cord!="")&&(ettari!="")&&(tipo!="")){
				 $.post("../CheckNomeCampo",{nome:nome,ettari:ettari,cord:cord,tipo:tipo,proprietario:proprietario}, function(result) {  
						//FUNZIONE DA ESEGUIRE IN CASO DI SUCCESSO
								alert(result)
				  });
			 }
			 else
				 {
				 alert("Devi eseguire la rilevazione")
				 }
			}
			else
				{
				alert("Devi inserire un nome per il campo")
				}
		 
		   
		});
	
});

var i = 0;
var bool=false
var bool2=false
function controllo_check()
{
	
	nsensori=document.getElementById("nsensori").value
	
	for(j=0;j<nsensori;j++)
		{
		 if(document.getElementById("sensore"+j).checked==true)
			 {
			 bool=true
			 }
		}
    nrobot=document.getElementById("nrobot").value
	
	for(j=0;j<nrobot;j++)
		{
		 if(document.getElementById("robot"+j).checked==true)
			 {
			 bool2=true
			 }
		}
	
}
function move() {
  
	controllo_check()
	if((bool)&&(bool2))
		{
		document.getElementById("bar").style.display="block"
		document.getElementById("errore").style.display="none"
			document.getElementById("errore2").style.display="none"
	if(i==0){
	  document.getElementById("pulsante").style.display="none";
	  var elem = document.getElementById("myBar");   
	  var width = 20;
	  var id = setInterval(frame, 30);
	  function frame() {
	    if (width >= 100) {
	      clearInterval(id);
	      document.getElementById("pulsante").style.display="block";
	    } else {
	      width++; 
	      elem.style.width = width +'%'; 
	      elem.innerHTML = width*1+'%';
	    }
	  }
	  
	  i=1
	}else
		{
		document.getElementById("errore2").style.display="block"
		document.getElementById("bar").style.display="none"
		document.getElementById("pulsante").style.display="block";
		}
	   
	}
	else
		{
		document.getElementById("errore2").style.display="none"
		document.getElementById("pulsante").style.display="none";
		document.getElementById("errore").style.display="block"
		document.getElementById("bar").style.display="none"
		}
	}
	
   function generate_random()
   {
	   
	  if(i==1)
	  {
       terreno=new Array("argilloso","ferroso","limoso","ghiaioso","sabbioso")
       negativo=new Array("-"," ")
	   var ettari=Math.floor(Math.random() * (10000-3000) + 3000)
	   var tipo=Math.floor(Math.random() * 5)

	   document.getElementById("km").value=ettari+" km"
	   document.getElementById("tipo").value=terreno[tipo]
       var latitudine=negativo[Math.floor(Math.random() * 2)]+Math.floor(Math.random() * 91)+"°"+Math.floor(Math.random() * 61)+"'"+Math.floor(Math.random() * 61)+"''"
       var longitudine=negativo[Math.floor(Math.random() * 2)]+Math.floor(Math.random() * 181)+"°"+Math.floor(Math.random() * 61)+"'"+Math.floor(Math.random() * 61)+"''"
       document.getElementById("cord").value=latitudine+" , "+longitudine
       i++
	  }
	  
   }

   function refresh()
   {
	   location.reload();
   }
</script>
</head>
<body>
<%@ page import="Model.*"%>
<%@ page import ="java.util.*" %>

<div id="menu">
	<%@include file="menu.jsp"%>
</div>
<div style="border:ridge;margin:0px 40px 0px 40px">
   <p style="margin:50px 0px 0px 40px">Inserisci dati del terreno</p> 
   <div id="aggiungiCampo" style="border-style: ridge;margin:0px 40px 0px 40px;padding-bottom:30px;padding-top:20px;width:30%;float:left">
     <form action="../AggiungiCampoServlet" id="form" method="post">
     <a style="margin-left:10px;background-color:#3F565A;padding:3px 3px 5px 0px;color: whitesmoke;">Nome campo</a><input type="text" id="nome" name="nome"><br><br>
     <a style="margin-left:10px;background-color:#3F565A;padding:3px 32px 5px 0px;color: whitesmoke;" >Posizione</a><input type="text" name="posizione" id="cord"><br><br>
     <a style="margin-left:10px;background-color:#3F565A;padding:3px 61px 5px 0px;color: whitesmoke;"> Ettari</a><input type="text" id="km" name="ettari"><br><br>
     <a style="margin-left:10px;background-color:#3F565A;padding:3px 10px 5px 0px;color: whitesmoke;">Tipo terreno</a><input type="text" id="tipo" name="tipo">
     <input type="text" id="proprietario" value="alex"><!-- modificare -->
     <button  style="margin-left:10px;margin-top:40px" type="button" class="myButton" id="conferma" >Conferma</button>
     <button onclick="refresh()" style="margin-left:30px;margin-top:40px" type="button" class="myButton" >Annulla</button>
    
   </form>
   </div>
 
   
   <form>
   
    
     <div id="sensori" style="border-style: ridge;width: 24% ;float:left;margin-left:90px;">
     <div class="card example-1 scrollbar-ripe-malinka">
      					<div class="card-body">
     Sensori<br>
     <%DispositivoModel dp= new DispositivoModel();
       Utente u =(Utente) request.getSession().getAttribute("utente");
       LinkedList<Dispositivo> list = (LinkedList<Dispositivo>) dp.getSensori(u.getId());
       int i=0;
       for(Dispositivo disp:list)
       {
    	  %>
    	  <img style="width:30px ;height:30px" src="../img/sensore.jpg">
    	  <input type="checkbox" style="margin-top:40px" id="sensore<%=i%>"><a style="margin-left:8px"><%=disp.getNome()%></a><br>
    	  <span><i style="color:green;margin-left:33px" class="fa fa-circle" aria-hidden="true"></i></span> Disponibile<br>
    	  
   
     <%i++;} %>
     <input type="text" id="nsensori" class="nsensori" value=<%=i %>>
     </div></div> </div>
     </form>
    
  
    
     <div id="robot"   style="border-style: ridge; clear:right;width: 24%;float:left;margin-left:40px;padding-bottom:0%">
       				
     <div class="card example-1 scrollbar-ripe-malinka">
      					<div class="card-body">
     Robot<br>
     <%
     
       LinkedList<Dispositivo> list2 = (LinkedList<Dispositivo>) dp.getRobot(u.getId());
       int j=0;
       for(Dispositivo disp:list2)
       {
    	  %>
    	  <a >
    	  <img style="width:30px ;height:30px" src="../img/robot1.jpg">
    	  <input type="checkbox" style="margin-top:40px" id="robot<%=j%>"><a style="margin-left:8px"><%=disp.getNome()%></a><br>
    	  <span ><i style="color:green;margin-left:33px" class="fa fa-circle" aria-hidden="true"></i></span> Disponibile<br>
          </a>
          
     <%j++;} %>
     <input type="text" id="nrobot" value=<%=j %>>
     </div>
       				
      </div>
    </div>
     <button  style="margin:26% 0px 0% -29%;" type="button" class="myButton"  data-toggle="modal" 
      data-target="#progress_bar" onclick="move()">Rileva</button>
     
     </form><br>
     
   </div>
    
    <div class="modal fade right" id="progress_bar" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="true">
  <div class="modal-dialog modal-side modal-bottom-right modal-notify modal-info" role="document">
    <!--Content-->
    <div class="modal-content">
    

      <!--Body-->
      <div class="modal-body">

		<!-- INIZIO PRIMA RIGA -->
		
        <div class="row">
          <div id="bar" class="col-7">
            <div id="myProgress" style=" width: 170%; background-color: grey;">
             <div id="myBar" style=" width: 1%;height: 30px;background-color: green;color:whitesmoke">0%</div>
             
            </div>
            <button type="button" id="pulsante" class="myButton" onclick="generate_random()" data-dismiss="modal" style="margin-top:30px">Conferma</button>
             </div>
          <div id="errore" style="margin-left:50px">Non hai selezionato nessun Robot o nessun sensore</div>
          <div id="errore2" style="margin-left:70px">Rilevazione già effettuata</div>
            
            

         
        </div>
        
        <!-- FINE PRIMA RIGA -->
        
        
  
        
      </div>
    </div>
    </div>
</div>
    <!--/.Content-->
     
      
   

 <div id="footer">
	<%@include file="../html/footer.html"%>
</div>
</body>
</html>