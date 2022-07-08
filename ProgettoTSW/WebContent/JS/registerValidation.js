$(document).ready(function(){
	
    let emailValidator = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
    let usernameValidator = /^[a-zA-Z0-9_.]{4,15}$/;
    let nameValidator = /^[a-zA-Z]{3,}$/;
    let valid = false;
    
    $("#email").keyup(function() {

        let email = $("#email").val();
        let slideEmail = 0;
        
        if (email.match(emailValidator)) {

            console.log("email valida");
            $.ajax({
                type: "POST",
                url: "login",
                data: {
                	mode: "checkEmail",
                    email: email,
                },
                dataType: "html",
                success: function(data) {
                	console.log(data);

                    if(data.match("non disponibile")) {
                    	
                    	valid = false;
                        if(slideEmail == 0){
                            $("#error-email").slideDown();
                            slide = 1;
                        }

                    	$("#error-email").text("Email gia in uso");

                    } else if (data.match("disponibile")){
                        slide = 0;
                        valid = true;
                        $("#error-email").slideUp();
                    	$("#error-email").text("");
                    }
                }
            });

        } else {

            console.log("email non valida");
            valid = false;
            if(slideEmail == 0){

                $("#error-email").slideDown();
                slide = 1;

            }

            $("#error-email").text("Inserisci un email valida");

        }

        if(email == "") {
        	valid = false;
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
    		
    		$.ajax({
                type: "POST",
                url: "login",
                data: {
                	mode: "checkUsername",
                    username: username,
                },
                dataType: "html",
                success: function(data) {
                	console.log(data);
                    if(data.match("non disponibile")) {
                    	valid = false;
                        if(slideUsername == 0) {

                            $("#error-username").slideDown();
                            slideUsername = 1;

                        }

                    	$("#error-username").text("Username non disponibile e/o gia in uso");

                    } else if (data.match("disponibile")){
                    	valid = true;
                        slideUsername = 0;
                        $("#error-username").text("Username disponibile");
                        $("#error-username").slideUp();

                    }
                }
            });

    	} else {

            console.log("username non disponibile");
            valid = false;
            if(slideUsername == 0) {

                $("#error-username").slideDown();
                slideUsername = 1;

            }

    		$("#error-username").text("Username non valido");

    	}

        if(username == ""){
        	valid = false;
            if(slideUsername == 1) {
                
                slideUsername = 0;
                $("#error-username").slideUp();
        
            }

            $("#error-username").text("");

        }
    });
    
    
    $("#passwordCheck").keyup(function () {

        let slidePwd = 0;
        let pwd = $("#password").val();
        let pwdCheck = $("#passwordCheck").val();

        if(pwdCheck.valueOf() === pwd.valueOf()){
        	
            console.log("Le password corrispondono!");
            slidePwd = 0;
            valid = true;
            $("#error-pwd").slideUp();
            $("#error-pwd").text("");

        } else {

            console.log("Le password non corrispondono");
            valid = false;
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
    		valid = true;
    		
    		if(slideNome == 1){
    			slideNome = 0;
    			$("#error-name").slideUp();
    		}
    		$("#error-name").html("");
    	} else {
    		console.log("Nome non valido");
    		valid = false;

    		if(slideNome == 0){
    			$("#error-name").slideDown();
    			slideNome = 1;
    		}
    		
    		$("#error-name").html("Nome non valido");
    	}
    	
    	if(nome == ""){
    		valid = false;
    		
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
    		valid = true;
    		
    		if(slideSurname == 1){
    			slideSurname = 0;
    			$("#error-surname").slideUp();
    		}
    		$("#error-surname").html("");
    	} else {
    		console.log("Cognome non valido");
    		valid = false;

    		if(slideSurname == 0){
    			$("#error-surname").slideDown();
    			slideSurname = 1;
    		}
    		
    		$("#error-surname").html("Cognome non valido");
    	}
    	
    	if(cognome == ""){
    		valid = false;
    		
    		if(slideSurname == 1){
    			slideSurname = 0;
    			$("#error-surname").slideUp();
    		}
    		
    		$("#error-surname").html("");
    	}
    });
    
    $("#registrati").click(function(){
    	if(valid){
    		$("#registrazione").submit();
    	} else {
    		event.preventDefault();
    	}
    })
});