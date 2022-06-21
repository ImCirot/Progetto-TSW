function addIndirizzo(){
	$.ajax({
		type: "POST",
		url: "modificaInfo",
		data: {
			mode: "add",
			target: "indirizzo",
		},
		dataType: "html",
		success: function(data) {
			window.location.replace(data);
		}
	});
}