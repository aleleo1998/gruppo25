/**
 * 
 */

$(document).ready(function(){

   $("#accedi").click(function(){
	
	var email = $("#email").val();
	var password = $("#password").val();
	var tipo = $("#tipo").val();
	
	//alert("oo");
	
	$.post("../loginServlet",{email : email, password : password, tipo : tipo}, function(result) {  
		//FUNZIONE DA ESEGUIRE IN CASO DI SUCCESSO
				if(result == "0"){
					alert("Verifica le tue credenziali e riprova.");
					
				}else if(result == "1"){
					//alert("yo");
					$("#profile").submit();
				}
				else{
					alert("Errore ajax login.js");
				}
			
		}); /*fine ajax*/

   });
   
});