$(function() {
	
	function cal_total() {
		let sum = 0
		$(".quantity").each(function(index) {
			let unit_price =  parseInt($(this).parent().data("unit_price"))
			let quantity = parseInt($(this).val())
			let subtotal = unit_price * quantity

			document.getElementsByClassName("subtotal")[index].innerText = subtotal
			
			sum += subtotal
		})
		$("#total").text(sum)
	}
	cal_total()
	//
	$(".quantity").on("change", function() {
		let web_url = $("#cart-img").data("web_url")
		let id = $(this).parent().data("cart_list_id")
		let quantity = $(this).val()
		let cart_list_object = {"cart_list_id": id,
								"quantity": quantity}
		let cart_list_json_object = JSON.stringify(cart_list_object)
		$.ajax({
			url: web_url+"/updateMyCartList",
			method: "post",
			contentType: "application/json; charset=UTF-8",
			data: cart_list_json_object,
			dataType: "json",
			success: function(result) {
				console.log("newQuantity: ", result)
				cal_total()
			}
		})
		cal_total()
	})
	//
	$(".delete_one").on("click", function() {
		let product_name = $(this).data("product_name")
		swal({
			title: "已從 購物車刪除",
			text: "產品：" + product_name,
			icon: "success",
			button: "確認",
//			buttons: true,
//			dangerMode: true,
		})
//		.then((willDelete) => {
//			if(willDelete) {
				let web_url = $("#cart-img").data("web_url")
				let this_column = $(this).parent()
				let list_id = $(this).parent().data("cart_list_id")
				let user_id = $("#cart-img").data("user_id")
				let cart_list_object = {"cart_list_id": list_id,
										"user_id": user_id}
				let cart_list_json_object = JSON.stringify(cart_list_object)
				$.ajax({
					url: web_url+"/deleteOneCartList",
					method: "post",
					contentType: "application/json; charset=UTF-8",
					data: cart_list_json_object,
					dataType: "json",
					success: function(result) {
						console.log("numberInCart: ", result)
//						swal({
//							title: "已從購物車刪除 !",
//							text: "",
//							icon: "success",
//							button: "確定",
////							buttons: true,
////  							dangerMode: true,
//						})
						if(result > 0)
							$("#show-number-in-cart").text(result)
						else {
							$("#show-number-in-cart").text("")
							$("#all-column").remove()						
						}
						this_column.remove()
						cal_total()
					},
					error: function(err){
						console.log("error: ", err);
					}
				})
//			}
//		});
		
//		if(confirm("確定刪除?")) {
//			let web_url = $("#cart-img").data("web_url")
//			let this_column = $(this).parent()
//			let list_id = $(this).parent().data("cart_list_id")
//			let user_id = $("#cart-img").data("user_id")
//			let cart_list_object = {"cart_list_id": list_id,
//									"user_id": user_id}
//			let cart_list_json_object = JSON.stringify(cart_list_object)
//			$.ajax({
//				url: web_url+"/deleteOneCartList",
//				method: "post",
//				contentType: "application/json; charset=UTF-8",
//				data: cart_list_json_object,
//				dataType: "json",
//				success: function(result) {
//					console.log("numberInCart: ", result)
//					if(result > 0)
//						$("#show-number-in-cart").text(result)
//					else {
//						$("#show-number-in-cart").text("")
//						$("#all-column").remove()						
//					}
//					this_column.remove()
//					cal_total()
//				},
//				error: function(err){
//					console.log("error: ", err);
//				}
//			})
//		}
	})
})