$(document).ready(function(){
	
    let emailValidator = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
    let usernameValidator = /^[a-zA-Z0-9_.]{4,15}$/;
    let nameValidator = /^[a-zA-Z]{3,}$/;
    let validEmail= false;
    let validUsername = false;
    let validName = false;
    let validSurname = false;
    
    $("#email").keyup(function() {

        let email = $("#email").val();
        let slideEmail = 0;
        
        if (email.match(emailValidator)) {

            console.log("email valida");
                    	validEmail = true;
                    	console.log(validEmail);
                        if(slideEmail == 1){
                            $("#error-email").slideUp();
                            slide = 0;
                        } else {
                        	$("#error-email").html("");
                        }
                    } else {
                        validEmail = false;
                        console.log(validEmail);
                        if(slideEmail == 0){
                            $("#error-email").slideDown();
                            slide = 1;
                        }
                        
                        $("#error-email").html("Email non valida");
                    }
        if(email == "") {
        	validEmail = false;
        	console.log(validEmail);
            if(slideEmail == 1) {
            	
                slideEmail = 0;
                $("#error-email").slideUp();

            }

            $("#error-email").text("");

        }
                });
    
    $("#username").keyup(function (){

    	let username = $("#username").val();
        let slideUsername = 0;

        if(username.match(usernameValidator)){

    		console.log("username formattato bene");
    		validUsername = true;
    		console.log(validUsername);
    		
    		if(slideUsername == 1){
    			slideUsername = 0;
    			$("#error-username").slideUp();
    			
    		}
    		$("#error-username").html("");

    	} else {

            console.log("Username non valido");
            validUsername = false;
            console.log(validUsername);
            if(slideUsername == 0) {

                $("#error-username").slideDown();
                slideUsername = 1;

            }

    		$("#error-username").text("Username non valido");

    	}

        if(username == ""){
        	validUsername = false;
        	console.log(validUsername);
            if(slideUsername == 1) {
                
                slideUsername = 0;
                $("#error-username").slideUp();
        
            }

            $("#error-username").text("");

        }
    });
    
    $("#nome").keyup(function () {
    	let slideNome = 0;
    	let nome = $("#nome").val();
    	
    	if(nome.match(nameValidator)){
    		console.log("Nome valido");
    		validName = true;
    		console.log(validName);
    		
    		if(slideNome == 1){
    			slideNome = 0;
    			$("#error-name").slideUp();
    		}
    		$("#error-name").html("");
    	} else {
    		console.log("Nome non valido");
    		validName = false;
    		console.log(validName);

    		if(slideNome == 0){
    			$("#error-name").slideDown();
    			slideNome = 1;
    		}
    		
    		$("#error-name").html("Nome non valido");
    	}
    	
    	if(nome == ""){
    		validName = false;
    		
    		if(slideNome == 1){
    			slideNome = 0;
    			$("#error-name").slideUp();
    		}
    		
    		$("#error-name").html("");
    	}
    });
    
    $("#cognome").keyup(function () {
    	let slideSurname = 0;
    	let cognome = $("#cognome").val();
    	
    	if(cognome.match(nameValidator)){
    		console.log("Cognome valido");
    		validSurname = true;
    		console.log(validSurname);
    		
    		if(slideSurname == 1){
    			slideSurname = 0;
    			$("#error-surname").slideUp();
    		}
    		$("#error-surname").html("");
    	} else {
    		console.log("Cognome non valido");
    		validSurname = false;
    		console.log(validSurname);
    		if(slideSurname == 0){
    			$("#error-surname").slideDown();
    			slideSurname = 1;
    		}
    		
    		$("#error-surname").html("Cognome non valido");
    	}
    	
    	if(cognome == ""){
    		validSurname = false;
    		console.log(validSurname);
    		if(slideSurname == 1){
    			slideSurname = 0;
    			$("#error-surname").slideUp();
    		}
    		
    		$("#error-surname").html("");
    	}
    });
    
    $("#inviaDatiBtn").click(function(){
    	if(validUsername && validName && validSurname && validEmail){
    		$("#inviaDati").submit();
    	} else {
    		event.preventDefault();
    	}
    })
});