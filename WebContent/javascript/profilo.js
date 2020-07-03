/**
 * 
 */


$(document).ready(function(){
	


	$(".myButton").click(function(){
		
		var x = $(this).attr("id");
		var tot = x.length+1;
		var nomecampo = x.substr(6,tot); // estrae il nome del campo dall'id del bottone "id: buttonNOMECAMPO"
		
		$.post("../visualizzaCampoServlet",{nomecampo : nomecampo}, function(result) {  
			//FUNZIONE DA ESEGUIRE IN CASO DI SUCCESSO
					if(result == "1"){
						$("#visualizzaCampo").submit();
					}
			}); /*fine ajax*/
	});
	   
		
});

