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
				let prezzo = parseFloat(data);
				if(data < 45) {
					$("#netto").html(data);
					$("#spedizione").html("5 &euro;");
					prezzo += 5;
					$("#prezzoTot").html(prezzo);
				} else {
				$("#netto").html(data);
				$("#spedizione").html("gratuita");
				$("#prezzoTot").html(data);
				}
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
			window.location.replace(data);
		}
	});
}