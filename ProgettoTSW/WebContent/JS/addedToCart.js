

function addToCart(prodotto) {
	let formData = {
			mode: "add",
			prodotto: prodotto,
			quantita: "1",
			catalogo: "catalogo",
	};
	
	$.ajax({
		type: "GET",
		url: "Carrello",
		data: formData,
		dataType: "html",
	}).done(function(data) {
		$("#added" + prodotto).slideDown();
		window.setTimeout(function() {
			$("#added" + prodotto).slideUp();
		}, "2000");
	});
}