$(document).ready(function(){
	
    let emailValidator = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
    let usernameValidator = /^[a-zA-Z0-9_.]{4,15}$/;
    let nameValidator = /^[a-zA-Z]{3,}$/;
    let validEmail = true;
    let validUsername = true;
    let validPwdCheck = true;
    let validName = true;
    let validSurname = true;
    
    $("#email").keyup(function() {

        let email = $("#email").val();
        let slideEmail = 0;
        
        if (email.match(emailValidator)) {
        	console.log("email valida");
        	validEmail = true;
        	slide = 0;

            $("#error-email").slideUp();
        	$("#error-email").text("");
        } else {
            console.log("email non valida");
            validEmail = false;
            if(slideEmail == 0){
                $("#error-email").slideDown();
                slide = 1;
            }
            
            $("#error-email").text("Inserisci un email valida");
        }
    });
    
    $("#username").keyup(function (){
    	let username = $("#username").val();
        let slideUsername = 0;
        if(username.match(usernameValidator)){
    		console.log("username formattato bene");
    		validUsername = true;
    		slideUsername = 0;
    		$("#error-username").slideUp();
    		$("#error-username").text("");
            
    	} else {
            console.log("username non disponibile");
            validUsername = false;
            if(slideUsername == 0) {
                $("#error-username").slideDown();
                slideUsername = 1;
            }

    		$("#error-username").text("Username non valido");

    	}
    });
    
    $("#passwordCheck").keyup(function () {
        let slidePwd = 0;
        let pwd = $("#password").val();
        let pwdCheck = $("#passwordCheck").val();

        if(pwdCheck.match(pwd)){
            console.log("");
            validPwdCheck = true;
            slidePwd = 0;
            $("#error-pwd").slideUp();
            $("#error-pwd").text("");
        } else {
            console.log("Le password non corrispondono");
            validPwdCheck = false;
            if(slidePwd == 0) {
                $("#error-pwd").slideDown();
                slidePwd = 1;
            }

            $("#error-pwd").text("Le password non corrispondono");
        }
    });
    
    $("#nome").keyup(function () {
    	let slideNome = 0;
    	let nome = $("#nome").val();
    	
    	if(nome.match(nameValidator)){
    		console.log("Nome valido");
    		validName = true;
    		
    		if(slideNome == 1){
    			slideNome = 0;
    			$("#error-name").slideUp();
    		}
    		$("#error-name").html("");
    	} else {
    		console.log("Nome non valido");
    		validName = false;

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
    		
    		if(slideSurname == 1){
    			slideSurname = 0;
    			$("#error-surname").slideUp();
    		}
    		$("#error-surname").html("");
    	} else {
    		console.log("Cognome non valido");
    		validSurname = false;

    		if(slideSurname == 0){
    			$("#error-surname").slideDown();
    			slideSurname = 1;
    		}
    		
    		$("#error-surname").html("Cognome non valido");
    	}
    	
    	if(cognome == ""){
    		validSurname = false;
    		
    		if(slideSurname == 1){
    			slideSurname = 0;
    			$("#error-surname").slideUp();
    		}
    		
    		$("#error-surname").html("");
    	}
    });
    
    $("#modificaInfoBtn").click(function(){
    	if(validEmail && validPwdCheck && validUsername && validName && validSurname){
    		$("#modificaInfo").submit();
    	} else {
    		event.preventDefault();
    	}
    })
});