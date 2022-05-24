$(document).ready(function() {
	$("form").submit(function(event) {
		let formData = {
				mode: $("#mode").val(),
				prodotto: $("#prodotto").val(),
				quantita: $("#quantita").val(),
				catalogo: $("#catalogo").val(),
		};
		
		$.ajax({
			type: "GET",
			url: "Carrello",
			data: formData,
			dataType: "html"
		}).done(function(data) {
			$("#added").slideDown();
			window.setTimeout(added, "2000");
			
		});
		
		event.preventDefault();
	});
});

function added(){
	$("#added").slideUp();
}