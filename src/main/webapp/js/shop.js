$(function() {	
	//
	setTimeout(function(){
		location.href="#h"
	}, -1000)
	
	// 設定 request query String
	function go_register() {
		// 設定 request string 預設路徑
		let query_str = "register?pageLocation=shop"
		// 加入 nameLike
		nameLike = document.getElementsByName("nameLike")[0].value
		query_str += "&nameLike=" + nameLike
		// 加入 types
		$(".types").each(function(index, value) {
			type = value.nextElementSibling.innerText
			if(value.checked)
				query_str += "&type" + (index + 1) + "=" + type
		})
		// 判斷是否加入 priceOrder
		let order_by_price = document.getElementById("price-order-checkbox").checked
		if(order_by_price == true)
			query_str += "&priceOrder=" + $("#price-order").val()
		// 加入 Price Boundaries
		priceLowerBound = $("#price_lower_bound").val()
		priceUpperBound = $("#price_upper_bound").val()
		query_str += "&priceLowerBound=" + priceLowerBound
		query_str += "&priceUpperBound=" + priceUpperBound
		// 加入分頁 數目
		query_str += "&eachPageNum=" + $("#each-page-controller").val()
		// 
		query_str += "&page=" + $("body").data("page")
		// 
		query_str += "&currentPage=" + $("body").data("current_page")
		// 執行查詢
		location.href = query_str
	}
	// 加入購物車
	$(".add-to-cart").on("click", function() {
		let user_id = $("#cart-img").data("user_id")
		let web_url = $("#cart-img").data("web_url")
		if(user_id == null){
			go_register()
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
	})
	
	// 清除產品類型 Check Box
	$("#clear-types").on("click", function() {
		$(".types").each(function(index, value) {
			value.checked = false
		})
		$(this).css("visibility", "hidden")
	})
	
	// 初始檢查、設定，產品類型 Check Box 的清除鍵
	function initial_clear_types_anchor() {
		let if_checked = false
		$(".types").each(function(index, value) {
			if_checked = if_checked || value.checked
		})
		if(if_checked == false)
			$("#clear-types").css("visibility", "hidden")
		else
			$("#clear-types").css("visibility", "visible")
	}
	
	// 載入頁面時，執行
	initial_clear_types_anchor()
	
	// 清除按鈕的顯示或消失
	$(".types").on("click", function() {
		initial_clear_types_anchor()
	})
	
	// 全選產品類型 Check Box
	$("#check-all-types").on("click", function() {
		$(".types").each(function(index, value) {
			value.checked = true
		})
		$("#clear-types").css("visibility", "visible")
	})
	
	// 設定 request query String
	function go_search() {
		// 設定 request string 預設路徑
		let query_str = "http://localhost:8080/A-Jen/shop?"
		// 加入 nameLike
		nameLike = document.getElementsByName("nameLike")[0].value
		query_str += "nameLike=" + nameLike
		// 加入 types
		$(".types").each(function(index, value) {
			type = value.nextElementSibling.innerText
			if(value.checked)
				query_str += "&type" + (index + 1) + "=" + type
		})
		// 判斷是否加入 priceOrder
		let order_by_price = document.getElementById("price-order-checkbox").checked
		if(order_by_price == true)
			query_str += "&priceOrder=" + $("#price-order").val()
		// 加入 Price Boundaries
		priceLowerBound = $("#price_lower_bound").val()
		priceUpperBound = $("#price_upper_bound").val()
		query_str += "&priceLowerBound=" + priceLowerBound
		query_str += "&priceUpperBound=" + priceUpperBound
		// 加入分頁 數目
		query_str += "&eachPageNum=" + $("#each-page-controller").val()
		// 執行查詢
		location.href = query_str
	}
	
	// 名稱搜尋按鈕點選
	$("#search-products-btt").on("click", function() {
		go_search()
	})
	
	// 清除價錢搜尋內文字
	$("#clear-price-boundaries").on("click", function() {
		$("#price_lower_bound").val("")
		$("#price_upper_bound").val("")
	})
	
	// 分頁的單頁數量改變時，
	$("#each-page-controller").on("change", function() {
		go_search()
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
	})
})