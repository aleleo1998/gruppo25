/**
 * 
 */

var risColture = 0;
var risRobot = 0;
$(document).ready(function(){
	 
	$("#btnConfermaAnalisi").click(function(){
		 
		$(".rowInventario").css({display:'none'});
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
			  $("#formSemina").submit();
		  }
		  
			
			
		})
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
       
           okay=true;
         
        }
    }
    
    
   alert("okay "+ okay);
    if(okay){
    	risRobot=1;
    }
    else{
    	$("#robotError").click();
    }
    
    
 
    
}

