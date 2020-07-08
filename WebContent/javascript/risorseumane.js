/**
 * 
 */

var global = 0;
var global_annulla = 0;
var flag = 0;

$(document).ready(function(){
	
	var size = $("#size").val();

	for(var i=0; i<size; i++){
		var stato = $("#info"+i).text();
		//alert(stato);
		if(stato === 'Occupato'){  //Se l'utente è libero
			$("#occupato"+i).css("display","visible");
			$("#libero"+i).css("display","none");
			$("#selezionacampo"+i).attr("disabled","disabled");
			$("#selezionaattivita"+i).attr("disabled","disabled");
			$("#selezionadurata"+i).attr("disabled","disabled");
		}else{  //Se l'utente è occupato in un lavoro
			$("#occupato"+i).css("display","none");
			$("#libero"+i).css("display","visible");
			$("#selezionacampo"+i).removeAttr("disabled");
			$("#selezionaattivita"+i).removeAttr("disabled");
			$("#selezionadurata"+i).removeAttr("disabled");
		}
		
	}

	/***check counter int i***/
	$(".buttonAssegna").click(function(){
		
		global = this.name;       //alert("global: "+global);
		
		/*MODIFICA DIALOG*/
		var campo_selezionato = $("#selezionacampo"+global+" :selected").text();
		var attivita_selezionata = $("#selezionaattivita"+global+" :selected").text();
		var durata_selezionata = $("#selezionadurata"+global+" :selected").text();
		
		//alert(campo_selezionato);        alert(attivita_selezionata);         alert(durata_selezionata);
		
		/*Costruzione messaggio di riepilogo*/
		document.getElementById("camposelezionato"+global).innerHTML = "<p id='camposelezionato<%=i%>'><strong>Lavoro su:</strong> "+campo_selezionato+" </p>";
		document.getElementById("attivitaselezionata"+global).innerHTML = "<p id='attivitaselezionata<%=i%>'><strong>Attività di:</strong> "+attivita_selezionata+" </p>";
		document.getElementById("durataselezionata"+global).innerHTML = "<p id='durataselezionata<%=i%>' style='margin-bottom: 2em'><strong>Durata attività:</strong> "+durata_selezionata+" </p>";
		/**/
		
		
		
		
		
	})
	/******/
	
		/***check counter int i***/
	$(".buttonAnnulla").click(function(){
		
		global_annulla = this.name;      //alert("global_annulla: "+global_annulla);
	
		/*MODIFICA DIALOG*/
		var campo_selezionato = $("#selezionacampo"+global_annulla+" :selected").text();
		var attivita_selezionata = $("#selezionaattivita"+global_annulla+" :selected").text();
		var durata_selezionata = $("#selezionadurata"+global_annulla+" :selected").text();
		
//		alert(campo_selezionato);        alert(attivita_selezionata);         alert(durata_selezionata);
		
		/*Costruzione messaggio di riepilogo*/
		document.getElementById("camposelezionato_annulla"+global).innerHTML = "<p id='camposelezionato_annulla<%=i%>'><strong>Lavoro su:</strong> "+campo_selezionato+" </p>";
		document.getElementById("attivitaselezionata_annulla"+global).innerHTML = "<p id='attivitaselezionata_annulla<%=i%>'><strong>Attività di:</strong> "+attivita_selezionata+" </p>";
		document.getElementById("durataselezionata_annulla"+global).innerHTML = "<p id='durataselezionata_annulla<%=i%>' style='margin-bottom: 2em'><strong>Durata attività:</strong> "+durata_selezionata+" </p>";
		/**/
		
		
		
	})
	/******/
	
	
	
	
	/*CONFERMA ASSEGNA LAVORO*/
	$(".myButton").click(function(){
		
		var i = global;
		//alert("indice cliccato: "+i);
		var id = $("#id"+i).text();  //lettura <p id="#id[1|2|3|...">utente.getId()</p>
		//alert("id cliccato: "+id);
		
		
		var campo_selezionato = $("#selezionacampo"+i+" :selected").text();
		var attivita_selezionata = $("#selezionaattivita"+i+" :selected").text();
		var durata_selezionata = $("#selezionadurata"+i+" :selected").text();
		
		$.ajax({            //AJAX CON JQUERY
			type : 'Post',   //TIPO DI CHIAMATA
			data : {id : id, campo_selezionato : campo_selezionato, attivita_selezionata : attivita_selezionata, durata_selezionata : durata_selezionata},  //COPPIE NOME-VALORE DA PASSARE ALLA SERVLET
			async: false,
			url : '../assegnaLavoroServlet',  //SERVLET DA RICHIAMARE IN MANIERA ASINCRONA
			success : function resultServelt(result) {  //FUNZIONE DA ESEGUIRE IN CASO DI SUCCESSO
				if(result == "0"){
					alert("Si è verificato un errore. Riprova più tardi.");
				}
				if(result == "1"){
					location.reload();  //refresh pagina
				}
			}
			
		}); /*fine ajax*/
		
	});
	
	/*CONFERMA ANNULLA LAVORO*/
$(".buttonConfermaAnnulla").click(function(){
		
		var i = global_annulla;
		
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
	
	
	$(".annulla").click(function(){
		$(".close").click();
		
	})
	
	
	
	
	
});



