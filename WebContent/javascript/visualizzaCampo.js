/**
 * 
 */
$(document).ready(function(){

	
	 
	  $("#maggioriInfo").click(function(){
		    
		  var idRobot = this.id;
		  
		  
			  	$.post("../interrompiAttivitaServlet",{idRobot : idRobot}, function(result) {  
	    			//FUNZIONE DA ESEGUIRE IN CASO DI SUCCESSO
	    					if(result == "0"){
	    						alert("error");
	    					}else if(result == "1"){
	    						alert("ok");
	    					
	    					}
	    				
	    				
	    			}); /*fine ajax*/
			 		
		});
	
	
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
});