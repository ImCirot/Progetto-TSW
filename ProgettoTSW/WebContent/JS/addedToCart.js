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
		$("#done" + prodotto).css("transform" ,"translate(0px)");
		window.setTimeout(function() {
			$("#done" + prodotto).css("transform" ,"translate(-130px)");
		}, "1500");
	});
}

function addToCartN(prodotto) {
	let formData = {
			mode: "add",
			prodotto: prodotto,
			quantita: $("#quantita").val(),
			catalogo: "catalogo",
};

	$.ajax({
		type: "GET",
		url: "Carrello",
		data: formData,
		dataType: "html",
	}).done(function(data) {
		$("#done" + prodotto).css("transform" ,"translate(0px)");
		window.setTimeout(function() {
			$("#done" + prodotto).css("transform" ,"translate(-130px)");
		}, "1500");
	});
}