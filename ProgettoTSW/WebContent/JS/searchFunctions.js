function showSearch() {
	$("#search-zone").toggle("slide",{direction: "right"},500);
	$("#search-bar").val("");
	$("#search-result").html("");
}

$(document).ready(function() {
	$("#search-bar").keyup(function(){
		var search = $("#search-bar").val();
		
		if(search == "") {
			$("#search-result").html("nessun prodotto");
		} else {
			$.ajax({
				type: "GET",
				url: "search",
				data: {
					search: search,
				},
				dataType: "html",
				success: function(data) {
					$("#search-result").html(data);
				},
			});
		}
	});
});