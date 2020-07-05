/**
 * 
 */

$(document).ready(function(){
	
	var size = $("#size").val();
	
	for(var i=0; i<size; i++){
		var stato = $("#info"+i).text();
		if(stato != "Occupato"){  //Se l'utente è libero
			$("#occupato"+i).css("display","none");
			$("#libero"+i).css("display","visible");
			$("#selezionacampo"+i).removeAttr("disabled");
			$("#selezionaattivita"+i).removeAttr("disabled");
			$("#selezionadurata"+i).removeAttr("disabled");
		}else{  //Se l'utente è occupato in un lavoro
			
			$("#occupato"+i).css("display","visible");
			$("#libero"+i).css("display","none");
			$("#selezionacampo"+i).attr("disabled","disabled");
			$("#selezionaattivita"+i).attr("disabled","disabled");
			$("#selezionadurata"+i).attr("disabled","disabled");
		}
	}
	
	
	$(".myButton").click(function(){
		
		var i = this.id;
		var id = $("#id"+i).text();
		
		var campo_selezionato = $("#selezionacampo"+i+" :selected").text();
		var attivita_selezionata = $("#selezionaattivita"+i+" :selected").text();
		var durata_selezionata = $("#selezionadurata"+i+" :selected").text();
		
		$.ajax({            //AJAX CON JQUERY
			type : 'Post',   //TIPO DI CHIAMATA
			data : {id : id, campo_selezionato : campo_selezionato, attivita_selezionata : attivita_selezionata, durata_selezionata : durata_selezionata},  //COPPIE NOME-VALORE DA PASSARE ALLA SERVLET
			async: false,
			url : '../assegnaLavoroServlet',  //SERVLET DA RICHIAMARE IN MANIERA ASINCRONA
			success : function resultServelt(result) {  //FUNZIONE DA ESEGUIRE IN CASO DI SUCCESSO
				//alert("result servlet: "+result)
				if(result == "0"){
					alert("Si è verificato un errore. Riprova più tardi.");
				}
				if(result == "1"){
					location.reload();  //refresh pagina
				}
			}
			
		}); /*fine ajax*/
		
	});
	
	
$(".myButton2").click(function(){
		
		var i = this.id;
		var id = $("#id"+i).text();
		
		$.ajax({            //AJAX CON JQUERY
			type : 'Post',   //TIPO DI CHIAMATA
			data : {id : id},  //COPPIE NOME-VALORE DA PASSARE ALLA SERVLET
			async: false,
			url : '../annullaLavoroServlet',  //SERVLET DA RICHIAMARE IN MANIERA ASINCRONA
			success : function resultServelt(result) {  //FUNZIONE DA ESEGUIRE IN CASO DI SUCCESSO
				//alert("result servlet: "+result)
				if(result == "0"){
					alert("Si è verificato un errore. Riprova più tardi.");
				}
				if(result == "1"){
					location.reload();  //refresh pagina
				}
			}
			
		}); /*fine ajax*/
		
	});


	$("#searchButton").click(function(){
		
		$("#searchForm").submit();
	
	});


/*
	
	$("#searchButton").click(function(){
		
		alert($("#searchInput").val());
		
		var search = $("#searchInput").val();
		
		alert(search);
		
		$.ajax({            //AJAX CON JQUERY
			type : 'Get',   //TIPO DI CHIAMATA
			data : {search : search},  //COPPIE NOME-VALORE DA PASSARE ALLA SERVLET
			async: false,
			url : '../ricercaRUServlet',  //SERVLET DA RICHIAMARE IN MANIERA ASINCRONA
			success : function resultServelt(result) {  //FUNZIONE DA ESEGUIRE IN CASO DI SUCCESSO
				
				alert(result);
				
			}
			
		}); /*fine ajax*/
		
	//});
	
	
	
});