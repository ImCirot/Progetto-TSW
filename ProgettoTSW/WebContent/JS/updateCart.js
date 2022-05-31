function updateCart(input,prodotto) {
	let formData = {
		prodotto: prodotto,
		mode: "update",
		quantita: $(input).val(),
	}
	
	$.ajax({
		type: "GET",
		url: "Carrello",
		data: formData,
		dataType: "html",
		success: function(data){
			console.log("aggiornato");
		}
	});
}