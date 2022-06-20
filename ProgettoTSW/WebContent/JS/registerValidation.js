$(document).ready(function(){
    let emailValidator = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;

    $("#email").keyup(function() {
        let email = $("#email").val();

        if(email.match(emailValidator)) {
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
                    if(data == "non disponibile") {
                    	$("#error-email").show();
                    	$("#error-email").text("Email gia in uso");
                    } else if (data == "disponibile"){
                    	$("#error-email").text("");
                    	$("#error-email").hide();
                    }
                }
            });
        } else {
            console.log("email non valida");
            $("#error-email").show();
            $("#error-email").text("Inserisci un email valida");
        }
    });
});