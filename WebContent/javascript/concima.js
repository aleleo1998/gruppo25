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
			  $("formSemina").submit();
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
    if(okay){
    	risColture=1;
    }
    else {
    	risColture=0;
    	$("#colturaError").click();
    }
}





/* Controllo checkbox robot*/
function controlloCheckBox(){
    var checkboxs=document.getElementsByName("robot");
    var okay=false;
    for(var i=0;i<checkboxs.length;i++)
    {
        if(checkboxs[i].checked)
        {
            okay=true;
           
            
        }
    }
    if(okay){
    	 risRobot=1;
    }
    else {
    	risRobot=0;
    	$("#robotError").click();
    }
}

