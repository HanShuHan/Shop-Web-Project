$(function() {	
	setTimeout(function(){
		location.href="#h"
	}, -1000)
	
    $(".check-type").on("change", function() {
        console.log($(this).next().text())
    })
	
	$(".add-to-cart").on("click", function() {
		let user_id = $("#cart-img").data("user_id")
		let web_url = $("#cart-img").data("web_url")
		if(user_id == null){
			location.href="register";
		}
		if(user_id != null) {
			let product_id = $(this).data("product_id")
			let product_object = {"productId": product_id,
								  "userId": user_id}
			let product_json_object = JSON.stringify(product_object)
			$.ajax({
		        url: web_url+"/addToCart",
		        method: "post",
		        contentType: "application/json; charset=UTF-8",
		        data: product_json_object,
		        dataType: "json",
		        success: function(result) {
					if(result >= 0) {
						// 購物車網頁數量，顯示更新
						$("#show-number-in-cart").text(result)
					}
				}
			})
		}
//		console.log(user_id)
	})
	
	let type1 = ""
	let type2 = ""
	let type3 = ""
	let type4 = ""
	// 清除產品類型 Check Box
	$("#clear-types").on("click", function() {
		$(".types").each(function(index, value) {
			value.checked = false
		})
		$(this).css("visibility", "hidden")
	})
	// 清除按鈕的顯示或消失
	$(".types").on("click", function() {
		let a = false
		$(".types").each(function(index, value) {
			a = a || value.checked
		})
		if(a == false)
			$("#clear-types").css("visibility", "hidden")
		else
			$("#clear-types").css("visibility", "visible")
	})
	// 全選產品類型 Check Box
	$("#check-all-types").on("click", function() {
		$(".types").each(function(index, value) {
			value.checked = true
		})
		$("#clear-types").css("visibility", "visible")
	})
	// 名稱搜尋按鈕點選
	$("#search-products-btt").on("click", function() {
		let query_str = "/A-Jen/shop?"
		$(".types").each(function(index, value) {
			type = value.nextElementSibling.innerText
			if(value.checked)
				query_str += "type" + (index + 1) + "=" + type + "&"
		})
		// 加入 nameLike
		let nameLike = document.getElementsByName("nameLike")[0].value
		query_str += "nameLike=" + nameLike
		// 查詢
		location.href = query_str
	})
	
		$(".go-to-cart").on("click", function() {
		let user_id = $("#cart-img").data("user_id")
		let web_url = $("#cart-img").data("web_url")
		if(user_id == null){
			location.href="register";
		}
		if(user_id != null) {
			let product_id = $(this).data("product_id")
			let product_object = {"productId": product_id,
								  "userId": user_id}
			let product_json_object = JSON.stringify(product_object)
			$.ajax({
		        url: web_url+"/addToCart",
		        method: "post",
		        contentType: "application/json; charset=UTF-8",
		        data: product_json_object,
		        dataType: "json",
		        success: function(result) {					
						location.href=web_url+"/myCartList/accountId/"+user_id;					
				}
			})
		}
//		console.log(user_id)
	})
})