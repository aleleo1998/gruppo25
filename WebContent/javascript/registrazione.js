/**
 * 
 */

function checkSubmit(){
	
	if(checkNome()==1 && checkCognome()==1 && checkPassword() && checkConfermaPassword()==1){
	//alert("Si può procedere alla registrazione");
		$("#form").submit();
	}	
	else{
		//alert("Errore. Non è possibile effettuare il submit");
	}
	
}



function checkNome(){
	var nome = $("#nome").val();  //ottengo valore campo nome
	var expr = /^[A-Za-z]{1,10}$/;
	if(nome.match(expr)){
		//alert("Nome corretto");
		return 1;
	}else{
		alert("Nome non corretto"); 
		return 0;
	}
}

function checkCognome(){
	var cognome = $("#cognome").val();  //ottengo valore campo nome
	var expr = /^[A-Za-z]{1,20}$/;
	if(cognome.match(expr)){
		//alert("Cognome corretto");
		return 1;
	}else{
		alert("Cognome non corretto");
		return 0;
	}
		
}

function checkPassword(){
	var password = $("#password").val();  //ottengo valore campo password
	var expr = /^[A-Za-z0-9]{1,20}$/;
	if(password.match(expr)){
		//alert("Password corretta");
		return 1;
	}else{
		alert("Password non corretta");
		return 0;
	}
		
}


function checkConfermaPassword(){
	var password = $("#password").val();  //ottengo valore campo password
	var confermaPassword = $("#confermaPassword").val();  //ottengo valore campo confermaPassword
	if(password == confermaPassword){
		//alert("Le password coincidono");
		return 1;
	}else{
		alert("Le password non corrispondono");
		return 0;
	}
}