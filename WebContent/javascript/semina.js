/**
 * 
 */
$(document).ready(function(){
	
	$("#btnConfermaAnalisi").click(function(){
		 
		$(".rowInventario").css({display:'none'});
		$("#rowConsigliate").css({display:'block'});
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
		  alert("ookokkkko");
		  controlloRadioButton();
		  controlloCheckBox();
		  
		  
			alert("ew"); 
			$("formSemina").submit();
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
            break;
        }
    }
    if(okay)alert("OK");
    else alert("Nessun coltura selezionato. Seleziona un robot per proseguire");
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
            break;
        }
    }
    if(okay)alert("OK");
    else alert("Nessun robot selezionato. Seleziona un robot per proseguire");
}

