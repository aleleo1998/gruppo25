/**
 * 
 */



$(document).ready(function(){
	  
	  $("#btnAdd").click(function(){
		  alert("OO");
			var nome = $("#nome").val();
			var tipo = $("#tipo").val();
			var quantita = $("#quantita").val();
		 ;
		  $.ajax({            //AJAX CON JQUERY
				type : 'Post',   //TIPO DI CHIAMATA
				data : {nome : nome, tipo : tipo, quantita : quantita},  //COPPIE NOME-VALORE DA PASSARE ALLA SERVLET
				async: false,
				cache: false,
				url : '../inserisciItemServlet',  //SERVLET DA RICHIAMARE IN MANIERA ASINCRONA
				success : function(result) {  //FUNZIONE DA ESEGUIRE IN CASO DI SUCCESSO
					
					alert(result);
					if(result == "1"){
						alert("Item aggiunto all'inventario");
						$("#tablelist").load(" #tablelist");
						
					}else{
						alert("Errore: item non aggiunto, riprova!");
						$("#tablelist").load(" #tablelist");
					}
			
				},
				error : function(){
					alert("Error");
				}
				
			}); /*fine ajax*/
	  });
	  
	  
 
  
});



