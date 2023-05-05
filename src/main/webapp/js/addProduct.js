$(function() {
    // 上傳預覽
	let w = 48
	let h = 48
    $("#image1").on("change", function() {
        
        const file = this.files[0];
        const objectURL = URL.createObjectURL(file);

        $("#img-image1").css({width: w,
                            height: h,
                            // "text-align": "center"
                        })
                        .attr('src', objectURL)
		$("#big-image").css({width: 200,
                            height: 200,
                            // "text-align": "center"
                        })
                        .attr('src', objectURL)
    });
	$("#image2").on("change", function() {
        
        const file = this.files[0];
        const objectURL = URL.createObjectURL(file);

        $("#img-image2").css({width: w,
                            height: h,
                            // "text-align": "center"
                        })
                        .attr('src', objectURL)

		$("#big-image").attr('src', objectURL)
    });
	$("#image3").on("change", function() {
        
        const file = this.files[0];
        const objectURL = URL.createObjectURL(file);

        $("#img-image3").css({width: w,
                            height: h,
                            // "text-align": "center"
                        })
                        .attr('src', objectURL)

		$("#big-image").attr('src', objectURL)
    });
//	$("#image4").on("change", function() {
//        
//        const file = this.files[0];
//        const objectURL = URL.createObjectURL(file);
//
//        $("#img-image4").css({width: w,
//                            height: h,
//                            // "text-align": "center"
//                        })
//                        .attr('src', objectURL);
//    });
//	$("#image5").on("change", function() {
//        
//        const file = this.files[0];
//        const objectURL = URL.createObjectURL(file);
//
//        $("#img-image5").css({width: w,
//                            height: h,
//                            // "text-align": "center"
//                        })
//                        .attr('src', objectURL);
//    });
//	$("#image6").on("change", function() {
//        
//        const file = this.files[0];
//        const objectURL = URL.createObjectURL(file);
//
//        $("#img-image6").css({width: w,
//                            height: h,
//                            // "text-align": "center"
//                        })
//                        .attr('src', objectURL);
//    });

	$("#img-image1").on("mouseenter", function() {

        const file = document.getElementById("image1").files[0];
        const objectURL = URL.createObjectURL(file);

		$("#big-image").attr('src', objectURL);
    });
	$("#img-image2").on("mouseenter", function() {
        
        const file = document.getElementById("image2").files[0];
        const objectURL = URL.createObjectURL(file);

		$("#big-image").attr('src', objectURL);
    });
	$("#img-image3").on("mouseenter", function() {
        
        const file = document.getElementById("image3").files[0];
        const objectURL = URL.createObjectURL(file);

		$("#big-image").attr('src', objectURL);
    });
//	$("#img-image4").on("mouseenter", function() {
//        
//        const file = document.getElementById("image4").files[0];
//        const objectURL = URL.createObjectURL(file);
//
//		$("#big-image").attr('src', objectURL);
//    });
//	$("#img-image5").on("mouseenter", function() {
//        
//        const file = document.getElementById("image5").files[0];
//        const objectURL = URL.createObjectURL(file);
//
//		$("#big-image").attr('src', objectURL);
//    });
//	$("#img-image6").on("mouseenter", function() {
//        
//        const file = document.getElementById("image6").files[0];
//        const objectURL = URL.createObjectURL(file);
//
//		$("#big-image").attr('src', objectURL);
//    });
	
	//
	$("#auto-insert-data-btn").on("click", function() {

		$("#name").val("Air Jordan XII")
		$("#productStatusId").val(1)
		$("#price").val(6700)
		$("#categoryId").val(1)
		$("#detail1").val("顯示顏色： 白/Metallic Gold/Taxi/黑")
		$("#detail2").val('123')
		document.getElementById("image").files[0] = "C:\Users\Student\Downloads";
	})
})