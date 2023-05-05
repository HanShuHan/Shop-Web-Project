$(function() {
	$(".add-to-cart").on("click", function() {
//		console.log($(this).data("product_id"))
		let product_id = $(this).data("product_id")
		let product_object = {"productId": product_id}
		let product_json_object = JSON.stringify(product_object)
		$.ajax({
	        url: "http://localhost:8080/addToCart",
	        method: "post",
	        contentType: "application/json; charset=UTF-8",
	        data: product_json_object,
	        dataType: "json",
	        success: function() {
		
			}
		})
	})
	
	$("select").on("change", function() {
		$(".product_div").remove()
		let selected_type = $("select").val()
		let product_object = {"productId": product_id}
		let product_json_object = JSON.stringify(product_object)
		$.ajax({
	        url: "http://localhost:8080/addToCart",
	        method: "post",
	        contentType: "application/json; charset=UTF-8",
	        data: product_json_object,
	        dataType: "json",
	        success: function() {
		
			}
		})
	})
})