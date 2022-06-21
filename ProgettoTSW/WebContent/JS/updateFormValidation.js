$(document).ready(function(){
	
    let emailValidator = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
    let usernameValidator = /^[a-z0-9_.]{4,15}$/;
    
    $("#email").keyup(function() {

        let email = $("#email").val();
        let slideEmail = 0;
        
        if (email.match(emailValidator)) {
        	console.log("email valida");
        	slide = 0;

            $("#error-email").slideUp();
        	$("#error-email").text("");
        } else {
            console.log("email non valida");
            
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

    		slideUsername = 0;
            $("#error-username").text("");
            $("#error-username").slideUp();
    	} else {
            console.log("username non disponibile");
            
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