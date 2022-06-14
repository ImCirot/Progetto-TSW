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
			console.log(data);
			if(data == "reload"){
				location.reload();
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
				$("#prezzoTot").html(data + " &euro;");
			}
		});
}