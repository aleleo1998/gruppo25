/**
 * 
 */

$(document).ready(function(){

	var button = document.getElementById('button');
	console.log(button);
	var form = document.querySelector('#form');
	console.log(form);
	
	button.addEventListener('click',function(){
		
		let fontFamily = form.font_family.value; 
		let fontSize = form.font_size.value;
		let color = form.coloreTesto.value;
		let menuColor = form.menuColor.value;
		let footerColor = form.footerColor.value;
		let background = form.sfondoPagina.value;
		
		alert('ue');
		
		$.post("../richiestaStylesheet",
		   {fontFamily : fontFamily,
		 	fontSize : fontSize,
			color : color,
			menuColor : menuColor,
			footerColor : footerColor,
			background : background }, function(result) {  
				
				if(result == 1){
					alert("ok");
				}else{
					alert("Si è verificato un errore. Le modifiche non sono state effettuate!");
				}
				
		}); /*fine ajax*/
		
		
	
	});  //event
	
	
});
	

