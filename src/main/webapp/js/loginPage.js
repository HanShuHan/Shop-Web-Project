$(function() {
	if($("body").data("entry_false") == "wrong") {
		$("#loginUserPassword").val("")
		alert("帳號或密碼錯誤!")
	}
	
//    $("#nav-home-tab").on("click", function() {
//        setTimeout(function() {
//            document.getElementById("loginUserName").focus()
//        }, 200)
//    })
//    $("#nav-profile-tab").on("click", function() {
//        setTimeout(function() {
//            document.getElementById("registerUserName").focus()
//        }, 200)
//    })
    
    $("#registerUserName").on("keyup", function() {
        let usr_name = $("#registerUserName").val()
        const regex = /\W/
        if(regex.test(usr_name) == true) {
            $("#registerUserNameHelp1").css("color", "red")
            $("#registerUserName").addClass("is-invalid")
        }
        else if(regex.test(usr_name) == false && usr_name.length >= 8) {
            $("#registerUserNameHelp1").css("color", "green")
            $("#registerUserName").removeClass("is-invalid")
        }
        else {
            $("#registerUserNameHelp1").css("color", "black")
            $("#registerUserName").removeClass("is-invalid")
        }
        
        if(usr_name.length >= 8)
            $("#registerUserNameHelp2").css("color", "green")
        else
            $("#registerUserNameHelp2").css("color", "red")
    })
    $("#registerUserName").on("blur", function() {
        let usr_name = $("#registerUserName").val()
        const regex = /\W/
        if(usr_name == 0)
            $("#registerUserNameHelp1").css("color", "red")
        
        if(usr_name.length < 8)
            $("#registerUserNameHelp2").css("color", "red")

        if(usr_name == 0 || usr_name.length < 8)
            $("#registerUserName").addClass("is-invalid")
    
        if(usr_name.length >= 8 && regex.test(usr_name) == false) {
            console.log("Good")
        }
    })
//	 一件登入
	$("#auto-log-in-btn").on("click", function() {
			
		let web_url = "http://localhost:8080/A-Jen/autoLoginRequest"
//		let id = $(this).parent().data("cart_list_id")
//		let quantity = $(this).val()
//		let cart_list_object = {"cart_list_id": id,
//								"quantity": quantity}
//		let cart_list_json_object = JSON.stringify(cart_list_object)
		$.ajax({
			url: web_url,
			method: "get",
			contentType: "application/text; charset=UTF-8",
//			data: cart_list_json_object,
//			dataType: "json",
			success: function(result) {
//				console.log("newQuantity: ", result)
				$("#accountL").val(result.name)
				$("#loginUserPassword").val(result.password)
				document.getElementById("log-in-form").submit()
			}
		})
	})
	//
	function getRandomInt(max) {
		return Math.floor(Math.random() * max);
	}
	//
	$("#auto-register-btn").on("click", function() {
		let randomNum = getRandomInt(999999)
		console.log(randomNum)
		$("#accountR").val("new" + randomNum)
		$("#pwd").val("new123456!")
		$("#pwdcheck").val("new123456")
		$("#aname").val("王旺旺")
		$("#mail").val(randomNum + "@gamil.com")
		document.getElementById("register-form").submit()
	})
	//
	$(".auto-login-btns-admin").on("click", function() {
		
		let num = $(this).data("num")
		let web_url = "http://localhost:8080/A-Jen/adminAutoLoginRequest?num=" + num
		$.ajax({
			url: web_url,
			method: "get",
			contentType: "application/text; charset=UTF-8",
			success: function(result) {
				$("#accountA").val(result.name)
				$("#loginUserPassword_2").val(result.password)
				document.getElementById("admin-log-in-form").submit()
			}
		})
	})
	//
	$("#newest-member-btn").on("click", function() {
		
//		let num = $(this).data("num")
		let web_url = "http://localhost:8080/A-Jen/findNewestMember"
		$.ajax({
			url: web_url,
			method: "get",
			contentType: "application/text; charset=UTF-8",
			success: function(result) {
				$("#accountL").val(result.name)
//				$("#loginUserPassword_2").val(result.password)
//				document.getElementById("admin-log-in-form").submit()
			}
		})
	})
})