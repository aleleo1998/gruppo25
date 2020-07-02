/**
 * 
 */


$(document).ready(function(){
	


	$(".myButton").click(function(){
		
		alert("fra");
		var x = $(this).attr("id");
		var tot = x.length+1;
		var nomecampo = x.substr(6,tot); // estrae il nome del campo dall'id del bottone "id: buttonNOMECAMPO"
		
		alert(nomecampo);
		
		$.post("../visualizzaCampoServlet",{nomecampo : nomecampo}, function(result) {  
			//FUNZIONE DA ESEGUIRE IN CASO DI SUCCESSO
					
					alert(result);
					if(result == "0"){
						alert("Verifica le tue credenziali e riprova.");
						
					}else if(result == "1"){
						alert("yo");
						$("#profile").submit();
					}
					else{
						alert("Errore ajax login.js");
					}
				
			}); /*fine ajax*/

	});
	   
		
});

