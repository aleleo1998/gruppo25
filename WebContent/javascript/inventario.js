/**
 * 
 */



$(document).ready(function(){
	  alert("oo");

	  $("#btnAdd").click(function(){
		  alert("OO");
			var nome = $("#nome").val();
			var tipo = $("#tipo").val();
			var quantita = $("#quantita").val();
		alert(nome);
		alert(tipo);
		alert(quantita);
		  $.ajax({            //AJAX CON JQUERY
				type : 'Post',   //TIPO DI CHIAMATA
				data : {nome : nome, tipo : tipo, quantita : quantita},  //COPPIE NOME-VALORE DA PASSARE ALLA SERVLET
				async: false,
				cache: false,
				url : '../inserisciItemServlet',  //SERVLET DA RICHIAMARE IN MANIERA ASINCRONA
				success : function(result) {  //FUNZIONE DA ESEGUIRE IN CASO DI SUCCESSO
					
					alert(result);
			
				},
				error : function(){
					alert("Err");
				}
				
			}); /*fine ajax*/
	  });
	  
	  
  alert("oo");
 
  
});



