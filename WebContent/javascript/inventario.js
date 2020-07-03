/**
 * 
 */

var idDaMod = 0;

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
	  $(".btnMin").click(function(){
			
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
							$("#refForm").submit();
							
						}else{
							alert("Errore: item non rimosso, riprova!");
							$("#tablelist").replace(" #tablelist");
						}
				
					},
					error : function(){
						alert("Error");
					}
					
				}); /*fine ajax*/
		
		});  /*fine funzione remove.click*/
  
	  
	  //Per modificare un item
	/*  $(".btnMod").click(function(){
		  
			var id = this.id;
			alert(id);		
			
			  $.ajax({            //AJAX CON JQUERY
					type : 'Post',   //TIPO DI CHIAMATA
					data : {id : id, nome : nomeMod, tipo : tipoMod, quantita : quantitaMod},  //COPPIE NOME-VALORE DA PASSARE ALLA SERVLET
					async: false,
					cache: false,
					url : '../richiestaModificaItemServlet',  //SERVLET DA RICHIAMARE IN MANIERA ASINCRONA
					success : function(result) {  //FUNZIONE DA ESEGUIRE IN CASO DI SUCCESSO
						
						alert(result);
						if(result == "1"){
							alert("Ora puoi modificar l'item");
							
							
						}else{
							alert("Errore: item non rimosso, riprova!");
							
						}
				
					},
					error : function(){
						alert("Error");
					}
					
				}); /*fine ajax*/
		
	//	});   /  /*fine funzione remove.click*/
	 
	
	  
	  
	  $(".btnMod").click(function(){
		  
		  idDaMod= this.id;
					
			
	  });
	  
	  
	  
	  //Per modificare un item
	  $(".myButtonConfermaModifica").click(function(){
			alert("modifica..");
			var id = idDaMod;
			var nomeMod = $("#nomeMod").val();
			var tipoMod = $("#tipoMod").val();
			var quantitaMod = $("#quantitaMod").val();
				
			alert("ID DA MANDARE" + id);

			  $.ajax({            //AJAX CON JQUERY
					type : 'Post',   //TIPO DI CHIAMATA
					data : {id : id, nomeMod : nomeMod, tipoMod : tipoMod, quantitaMod : quantitaMod},  //COPPIE NOME-VALORE DA PASSARE ALLA SERVLET
					async: false,
					cache: false,
					url : '../modificaItemServlet',  //SERVLET DA RICHIAMARE IN MANIERA ASINCRONA
					success : function(result) {  //FUNZIONE DA ESEGUIRE IN CASO DI SUCCESSO
						
						alert(result);
						if(result == "1"){
							alert("Item aggiornato correttamente dall'inventario");
							$("#tablelist").load(" #tablelist");
							
						}else{
							alert("Errore: item non aggiornato, riprova!");
							$("#tablelist").load(" #tablelist");
						}
				
					},
					error : function(){
						alert("Error");
					}
					
				}); /*fine ajax*/
		
		});  /*fine funzione remove.click*/
	  
	  

  
});



