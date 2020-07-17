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
		let fontWeight = form.weight.value;
		//let footerColor = form.footerColor.value;
		let background = form.sfondoPagina.value;
		
		console.log('sono nell\'evento click di button');
		
		$.post("../richiestaStylesheet",
		   {fontFamily : fontFamily,
		 	fontSize : fontSize,
			color : color,
			fontWeight : fontWeight,
			//footerColor : footerColor,
			background : background }, function(result) {  
				
				if(result == 0){
					alert("Si è verificato un errore. Le modifiche non sono state effettuate!");
				}else{
					alert("Le modifiche sono state effettuate");
					
					let body = document.querySelector('body');
					console.log(body);
					body.style.fontFamily = fontFamily;
					body.style.fontSize = fontSize;
					body.css('color','blue');
					body.style.backgroundColor = background;
					let menu = document.querySelector('#menu');
					console.log(menu);
					//menu.backgroundColor = menuColor; 
					
					//window.location.href=window.location.href;
				}
				
		}); /*fine ajax*/
		
	});  //event conferma
	
	var button2 = document.getElementById('button2');
	console.log(button);
		
	button2.addEventListener('click',function(){
		
		console.log('sono nell\'evento click di button2');
		
			
			$.post("../removeStylesheet", {} , function(result) {  
					
					if(result == 0){
						alert("Si è verificato un errore. Riprova.");
					}else{
						alert("Stylesheet ripristinato");
						
						window.location.href=window.location.href;
					}
					
			}); /*fine ajax*/
			
	});  //event ripristina
	
	
	
	
});
	

