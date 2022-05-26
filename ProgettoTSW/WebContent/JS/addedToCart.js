function added(){
	$("#added").slideUp();
}

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
		console.log(prodotto);
		window.setTimeout(added, "2000");
	});
}