/**
 * 
 */

var idDaMod = 0;
var idDaEliminare = 0;
$(document).ready(function(){
	  
	  $("#btnAdd").click(function(){
		  
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
						$("#successIns").click();
						//alert("Item aggiunto all'inventario");
						 $("#fineOperazione").click(function(){
							 
							 $("#refForm").submit();
						});
						
					}else{
						alert("Errore: item non aggiunto, riprova!");
						$("#refForm").submit();
					}
			
				},
				error : function(){
					alert("Error");
				}
				
			}); /*fine ajax*/
	  });
	  
	  $("#btnAnnullaElimina").click(function(){
		  $("#modalRelatedContentElimina").dialog('close');
	  });
	  
	  
	  $(".btnMin").click(function(){
		  idDaEliminare= this.id;
						
	  });
	  
	  
	  //Per eliminare un item
	  $(".myButtonConfermaElimina").click(function(){
			
			var id = idDaEliminare;
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
							//alert("Item rimosso correttamente dall'inventario");
							$("#successDel").click();
						
							 $("#fineOperazioneDel").click(function(){
								 ;
									//alert("Item eliminato all'inventario");
								 $("#refForm").submit();
							});
							
						}else{
							alert("Errore: item non rimosso, riprova!");
							$("#refForm").submit();
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
	 
	
	  
	  //Salva id item da modificare
	  $(".btnMod").click(function(){
		  
		  idDaMod= this.id;
			var nomeMod = $("#nome"+idDaMod).val();
			var tipoMod = $("#tipo"+idDaMod).val();
			var quantitaMod = $("#quantita"+idDaMod).val();
				
 
			
			$("#nomeMod").val(nomeMod);
			$("#tipoMod").val(tipoMod);
			$("#quantitaMod").val(quantitaMod)
			
	  });
	  
	  
	  
	  //Per modificare un item
	  $(".myButtonConfermaModifica").click(function(){
			alert("modifica..");
			var id = idDaMod;
			var nomeMod = $("#nomeMod").val();
			var tipoMod = $("#tipoMod").val();
			var quantitaMod = $("#quantitaMod").val();
				
			//alert("ID DA MANDARE" + id);

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
							$("#refForm").submit();
							
						}else{
							alert("Errore: item non aggiornato, riprova!");
							$("#refForm").submit();
						}
				
					},
					error : function(){
						alert("Error");
					}
					
				}); /*fine ajax*/
		
		});  /*fine funzione remove.click*/
	  
	  

  
});


