function showSearch() {
	$("#search-zone").toggle("slide",{direction: "right"},500);
	$("#search-bar").val("");
	$("#search-product-result").html("");
	$("#search-type-result").html("");
	$("#search-brand-result").html("");
}

$(document).ready(function() {
	$("#search-bar").keyup(function(){
		var search = $("#search-bar").val();
			if(search == "") {
				$("#search-product-result").html("");
				$("#search-type-result").html("");
				$("#search-brand-result").html("");
			} else {
				$.ajax({
					type: "GET",
					url: "search",
					data: {
						search: search,
						target: "search-bar",
						type: "product",
					},
					dataType: "html",
					success: function(data) {
						$("#search-product-result").html(data).show();
					},
				});
				$.ajax({
					type: "GET",
					url: "search",
					data: {
						search: search,
						target: "search-bar",
						type: "type",
					},
					dataType: "html",
					success: function(data) {
						$("#search-type-result").html(data).show();
					},
				});
				$.ajax({
					type: "GET",
					url: "search",
					data: {
						search: search,
						target: "search-bar",
						type: "brand",
					},
					dataType: "html",
					success: function(data) {
						$("#search-brand-result").html(data).show();
					},
				});
		}
	});
	
	$("#search-bar").keypress(function(e) {
		var keycode = (e.keyCode ? e.keyCode : e.which);
		var search = $("#search-bar").val(); 
        if(keycode == '13'){
        	$.ajax({
        		type: "GET",
				url: "search",
				data: {
					search: search,
					target: "search-enter",
				},
				dataType: "html",
				success: function(data) {
					window.location.replace(data);
				}
        	});
        }
	});
});