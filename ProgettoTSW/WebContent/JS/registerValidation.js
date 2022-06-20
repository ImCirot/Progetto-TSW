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
                    email: $("#email").val()
                },
                dataType: "html",
                success: function(data) {
                    if(data == "non disponibile") {
                        $("#error-email").html("Email gia in uso");
                    } else if (data == "disponibile"){
                        $("#error-email").html("");
                    }
                }
            });
        } else {
            console.log("email non valida");
            $("#error-email").html("Inserisci un email valida");
        }
    });
});