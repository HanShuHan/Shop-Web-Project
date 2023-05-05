$("#coupon").on("click", function() {
	 	
		let web_url = $("#cart-img").data("web_url")
		$.ajax({
			async:false,
	        url: web_url+"/couponck",
	        type: "post",
	        contentType: "application/json; charset=UTF-8",
	        data: {couponck:document.querySelector('#couponck').value.toString()},
	        dataType: "text",
	        success: function(result) {
			
			console.log("ok");
			$("#crs").append("優惠碼輸入成功");
			},error: function(){
				console.log("ng");
			}
		})
	})