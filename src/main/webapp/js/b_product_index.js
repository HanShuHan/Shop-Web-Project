$(function() {
	// 上下架按鈕
	$(".product-status-btn").on("click", function() {
		
		let web_url = $("body").data("web_url")
		let product_id = $(this).data("product_id")
		let product_status_id = $(this).data("product_status_id")
		let product_name = $(this).data("product_name")
		// 產品狀態
		let product_status_0 = $(this).data("product_status_0")
		let product_status_1 = $(this).data("product_status_1")

		let product_object = {"productId": product_id,
							  "product_status_id": product_status_id}
		let product_json_object = JSON.stringify(product_object)
		
		$.ajax({
	        url: web_url+"/changeProductStatus",
	        method: "post",
	        contentType: "application/json; charset=UTF-8",
	        data: product_json_object,
	        dataType: "json",
	        success: function() {
				console.log("success")
			},
			error: function() {
				console.log("error")
			}
		})
		// 更新按鈕 Style
		if($(this).hasClass("btn-outline-warning")) {
			$(this).data("product_status_id", 1)
			console.log(product_status_id)
			
			$(this).removeClass("btn-outline-warning")
			$(this).addClass("btn-warning")
			$(this).children().children().text(product_status_1)
			
			swal({
				title: "該商品 已上架。",
				text: "產品：" + product_name,
				icon: "success",
				button: "確認",
			});
		}
		else if($(this).hasClass("btn-warning")) {
			$(this).data("product_status_id", 0)
			console.log(product_status_id)
			
			$(this).removeClass("btn-warning")
			$(this).addClass("btn-outline-warning")
			$(this).children().children().text(product_status_0)
			
			swal({
				title: "該商品 已下架。",
				text: "產品：" + product_name,
				icon: "info",
				button: "確認",
			});
		}
	})
	//
//	$(".delete-btn").on("click", function() {
//		let product_id = $(this).data("product_id")
//		let this_btn = $(this)
//		if(confirm("確定刪除?")) {
//			
//			$.ajax({
//		        url: "http://localhost:8080/A-Jen/checkToDeleteProduct?productId=" + product_id,
//		        method: "get",
//		        contentType: "application/text; charset=UTF-8",
////		        data: product_json_object,
//		        dataType: "text",
//		        success: function(result) {
////					console.log("success")
////					console.log(result)
//					if(eval(result)) {
//						
//						this_btn.parent().parent().parent().remove()
////						location.href = "http://localhost:8080/A-Jen/bprindex"					
//					}
//					else
//						alert("已有消費者購買 或 加入購物車")
//				},
//				error: function(err) {
//					console.log("error")
//				}
//			})
//		}
//	})
	//
	$(".delete-btn").on("click", function() {
		let product_id = $(this).data("product_id")
		let product_name = $(this).data("product_name")
		let this_btn = $(this)
		
		swal({
			title: "確定刪除 ?",
			text: "一旦刪除後，即無法還原。",
			icon: "warning",
			buttons: true,
			dangerMode: true,
		})
		.then((willDelete) => {
			
			if (willDelete) {
				$.ajax({
			        url: "http://localhost:8080/A-Jen/checkToDeleteProduct?productId=" + product_id,
			        method: "get",
			        contentType: "application/text; charset=UTF-8",
			        dataType: "text",
			        success: function(result) {
						if(eval(result)) {
							
							swal({
								title: "該商品已遭刪除 !",
								text: "商品：" + product_name,
								icon: "success",
								button: "確認",
							});
							this_btn.parent().parent().parent().remove()
//							location.href = "http://localhost:8080/A-Jen/bprindex"
						}
						else {
							swal({
								title: "不得刪除 !",
								text: "已被 購買 或 加入購物車",
								icon: "error",
								button: "確認",
							});
						}
					},
					error: function(err) {
						console.log("error")
					}
				})
				
			} else {
				swal({
					title: "未更動。",
					text: "",
					icon: "",
					button: "確認",
				});
			}
		});
	})
})