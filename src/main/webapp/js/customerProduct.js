$(function() {
    let slideNum=0;
    let slideCount=$(".slides li").length;
    let lastIndex=slideCount-1;
//    console.log(slideCount);

    $(".dot li").eq(0).css("background-color", "white");
    $(".dot li").mouseenter(function() {

        slideNum = $(this).index();

        // $(".dot li").eq(slideNum).css("background-color", "white")
        // .siblings().css("background-color", "transparent");

        // $("ul.slides").css("left",-800*slideNum);
        show();
    });
    
    function show() {
        
        // console.log(num);
        $(".dot li").eq(slideNum).css("background-color", "white")
        .siblings().css("background-color", "transparent");

        $("ul.slides").css("left",-300*slideNum);
    };

    $("#prevSlide").click(function() {
        slideNum--;
        if(slideNum < 0)
            slideNum = lastIndex;
        show();
    });
    $("#nextSlide").click(function() {
        slideNum++;
        if(slideNum > lastIndex)
            slideNum = 0;
        show();
    });
	$(".sub-img").eq(0).click(function() {
		slideNum = 0
		show()
	})
	$(".sub-img").eq(1).click(function() {
		slideNum = 1
		show()
	})
	$(".sub-img").eq(2).click(function() {
		slideNum = 2
		show()
	})
	
	// 加入購物車
	$("#add-to-cart-btn").on("click", function() {
		let user_id = $(this).data("user_id")
		let web_url = $(this).data("web_url")
		let product_id = $(this).data("product_id")
		if(user_id == ""){
			location.href=web_url+"/register?pageLocation=productPage&productID=" + product_id;
		}
		if(user_id != null) {
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
	
	// 直接購買
	$(".go-to-cart").on("click", function() {
		let user_id = $(this).data("user_id")
		let web_url = $(this).data("web_url")
		if(user_id == ""){
			location.href=web_url+"/register";
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