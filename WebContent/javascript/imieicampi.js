/**
 * 
 */



$(document).ready(function(){
	
	$("#conferma").click(function(){
		
		var x = $(this).attr("name");
		var tot = x.length+1;
		var nomecampo = x.substr(6,tot); // estrae il nome del campo dall'id del bottone "id: buttonNOMECAMPO"
		
		alert(nomecampo);
		
		$.post("../rimuoviCampoServlet",{nomecampo : nomecampo}, function(result) {  
			
			alert(result);
			//FUNZIONE DA ESEGUIRE IN CASO DI SUCCESSO
					if(result == "1"){
						
					}
			}); /*fine ajax*/
	});
	
	$(".annulla").click(function(){
		$(".close").click();
	})

	
	
});




