$(document).ready( function() {
	updatePrice();
});

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
			if(data == "reload"){
				location.replace("./carrello.jsp");
			} else {
				updatePrice();
			}
		}
	});
}

function updatePrice(){
	let formData = {
			mode: "getTotal",
		}
		
		$.ajax({
			type: "GET",
			url: "Carrello",
			data: formData,
			dataType: "html",
			success: function(data){
				$("#prezzoTot").html(data);
			}
		});
}

function proseguiOrdine() {
	let formData = {
			costoTot: $("#prezzoTot").html(),
	}
	
	$.ajax({
		type: "GET",
		url: "ordine",
		data: formData,
		dataType: "html",
		success: function(data){
			console.log($("#prezzoTot").html());
			console.log(data);
			window.location.replace(data);
		}
	});
}