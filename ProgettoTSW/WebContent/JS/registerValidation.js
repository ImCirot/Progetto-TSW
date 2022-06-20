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
                    	$(this).find("#error-email").text("Email gia in uso");
                    } else if (data == "disponibile"){
                    	$(this).find("#error-email").text("");
                    }
                }
            });
        } else {
            console.log("email non valida");
            $(this).find("#error-email").text("Inserisci un email valida");
        }
    });

    $("#passwordCheck").keyup(function () {
        let pwd = $("#password").val();
        let pwdCheck = $("#passwordCheck").val();

        if(pwdCheck.match(pwd)){
            console.log("Le password corrispondo!");
        } else {
            console.log("Le password non corrispondono");
        }
    });
});