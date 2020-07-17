/**
 * 
 */

var risColture = 0;
var risRobot = 0;
var colturaId;
var robotId;
$(document).ready(function(){
	 $("#riconfermaSemina2").click(function(){
			
		 // alert(colturaId);
		//  alert(robotId);
		 alert("sto qua")
		 /* $.post("../seminaServlet",{colture : colturaId, robot : robotId}, function(result) {  
				//FUNZIONE DA ESEGUIRE IN CASO DI SUCCESSO
						if(result == "0"){
							$("#error").click();
							
						}else if(result == "1"){
					
							$("#success").click();
						
						}
					
					
				}); /*fine ajax*/

		  
		 // $("#formSemina").submit();
	});
	 
	$("#btnConfermaAnalisi").click(function(){
		 
		$(".rowInventario").css({display:'none'});
		$("#divscroll").css({display:'none'});
		$("#rowConsigliate").css({display:'block'});
		$("#altreColture").css({display:'block'});
		$("#rowAltreColture").css({display:'block'});
	})
	
	var elem = document.getElementById("myBar");   
	  var width = 20;
	  var id = setInterval(frame, 30);
	  function frame() {
	    if (width >= 100) {
	      clearInterval(id);
	     
	    } else {
	      width++; 
	      elem.style.width = width + '%'; 
	      elem.innerHTML = width * 1  + '%';
	    }
	  }
	  
	  
	  
	  $("#confermaSemina").click(function(){
		   
		
		  controlloRadioButton();
		  
		  controlloCheckBox();
		  
		   
		  if(risColture == 1 && risRobot == 1){
			  	$.post("../richiestaSeminaServlet",{colture : colturaId, robot : robotId}, function(result) {  
	    			//FUNZIONE DA ESEGUIRE IN CASO DI SUCCESSO
	    					if(result == "0"){
	    						$("#error").click();
	    						
	    					}else if(result == "1"){
	    						alert("Oxx K richiesta");
	    						//$("#datiRiepilogo ").load();
	    						$("#datiRiepilogo").load(location.href + " #datiRiepilogo");
	    						$("#modalRiepilogo").click();
	    					
	    					}
	    				
	    				
	    			}); /*fine ajax*/
			  //$("#modalRiepilogo").click();
			  
		  }  
			
			
		});
	  
		
		$("#fineOperazione").click(function(){
			window.location.reload();
		});




});


/*controllo radio button colture*/
function controlloRadioButton(){
	 
    var radiobutton=document.getElementsByName("colture");
    var okay=false;

    for(var i=0;i<radiobutton.length;i++)
    {
        if(radiobutton[i].checked)
        {
            okay=true;
         
            colturaId=radiobutton[i].value;
          //  alert("coltura selezionata id : "+colturaId);
            risColture=1;
           
        }
    }

    if(risColture==0){
    	$("#colturaError").click();
    }
}


/* Controllo checkbox robot*/
function controlloCheckBox(){
	 
	
	var numRobot = document.getElementById("nRobot").value;
    alert("numRobot " + numRobot);
   
    var okay=false;

    alert("prima for");
    for(var j=1;j<=numRobot;j++)
    {    	
    
        if(document.getElementById("checkbox"+j).checked===true)
        {
        	robotId= document.getElementById("checkbox"+j).value;
            //alert("robot selezionata id : "+robotId);

           okay=true;
         
        }
    }
    
    
  // alert("okay "+ okay);
    if(okay){
    	risRobot=1;
    }
    else{
    	$("#robotError").click();
    }
    
    

    
    
}

