$(document).ready(function(){
	
    let emailValidator = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
    let usernameValidator = /^[a-zA-Z0-9_.]{4,15}$/;
    
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

                        if(slideEmail == 0){
                            $("#error-email").slideDown();
                            slide = 1;
                        }

                    	$("#error-email").text("Email gia in uso");

                    } else if (data.match("disponibile")){
                        slide = 0;

                        $("#error-email").slideUp();
                    	$("#error-email").text("");
                    }
                }
            });

        } else {

            console.log("email non valida");

            if(slideEmail == 0){

                $("#error-email").slideDown();
                slide = 1;

            }

            $("#error-email").text("Inserisci un email valida");

        }

        if(email == "") {

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

                        if(slideUsername == 0) {

                            $("#error-username").slideDown();
                            slideUsername = 1;

                        }

                    	$("#error-username").text("Username non disponibile e/o gia in uso");

                    } else if (data.match("disponibile")){

                        slideUsername = 0;
                        $("#error-username").text("Username disponibile");
                        $("#error-username").slideUp();

                    }
                }
            });

    	} else {

            console.log("username non disponibile");

            if(slideUsername == 0) {

                $("#error-username").slideDown();
                slideUsername = 1;

            }

    		$("#error-username").text("Username non valido");

    	}

        if(username == ""){

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

        if(pwdCheck.match(pwd)){

            console.log("Le password corrispondono!");
            slidePwd = 0;
            $("#error-pwd").slideUp();
            $("#error-pwd").text("");

        } else {

            console.log("Le password non corrispondono");

            if(slidePwd == 0) {

                $("#error-pwd").slideDown();
                slidePwd = 1;

            }

            $("#error-pwd").text("Le password non corrispondono");

        }
    });
});