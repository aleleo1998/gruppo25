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
			alert("ew"); 
			$("formSemina").submit();
		})
});

