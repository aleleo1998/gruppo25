/**
 * 
 */

$(document).ready(function(){

   $("#accedi").click(function(){
	
	var email = $("#email").val();
	var password = $("#password").val();
	
	alert("oo");
	
	$.ajax({            //AJAX CON JQUERY
			type : 'Post',   //TIPO DI CHIAMATA
			data : {email : email, password : password},  //COPPIE NOME-VALORE DA PASSARE ALLA SERVLET
			async: false,
			url : 'loginServlet',  //SERVLET DA RICHIAMARE IN MANIERA ASINCRONA
			success : function(result) {  //FUNZIONE DA ESEGUIRE IN CASO DI SUCCESSO
				
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
			}
			
		}); /*fine ajax*/

   });
   
});