/**
 * 
 */



$(document).ready(function(){
	  
	  $("#btnAdd").click(function(){
		  alert("OO");
			var nome = $("#nome").val();
			var tipo = $("#tipo").val();
			var quantita = $("#quantita").val();
		
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
	  


	  //Per eliminare un item
	  $(".myButton").click(function(){
			
			var id = this.id;
			alert(id);		
			

			  $.ajax({            //AJAX CON JQUERY
					type : 'Post',   //TIPO DI CHIAMATA
					data : {id : id},  //COPPIE NOME-VALORE DA PASSARE ALLA SERVLET
					async: false,
					cache: false,
					url : '../rimuoviItemServlet',  //SERVLET DA RICHIAMARE IN MANIERA ASINCRONA
					success : function(result) {  //FUNZIONE DA ESEGUIRE IN CASO DI SUCCESSO
						
						alert(result);
						if(result == "1"){
							alert("Item rimosso correttamente dall'inventario");
							$("#tablelist").load(" #tablelist");
							
						}else{
							alert("Errore: item non rimosso, riprova!");
							$("#tablelist").load(" #tablelist");
						}
				
					},
					error : function(){
						alert("Error");
					}
					
				}); /*fine ajax*/
		
		});  /*fine funzione remove.click*/
  
});



