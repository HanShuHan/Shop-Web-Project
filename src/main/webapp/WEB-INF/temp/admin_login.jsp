<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home Page</title>
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome Icons -->
<link rel="stylesheet" href="${contextRoot}/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${contextRoot}/css/adminlte.min.css">

<script src="${contextRoot}/js/admin_login.js" defer></script>
</head>

<body data-entry_false="${entryFalse}">
	<div class="container">


		<!-- 內容 -->
		<!-- 標頭 -->
		<div class="content-header mt-4">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1 class="m-0">管理員平台登入</h1>
					</div>
				</div>
			</div>
		</div>
		<!-- 標頭結束 -->

		<!-- 主頁內容 -->
		<div class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">

								<div class="tab-pane fade show active padding-10" id="nav-home"
									role="tabpanel" aria-labelledby="nav-home-tab">
									<form:form id="admin-log-in-form" action="${contextRoot}/admin"
										modelAttribute="adminBean" name="admin" method="Post">
										<div class="form-group">
											<label for="loginUserName">使用者帳號</label>
											<form:input path="ac" type="text" class="form-control"
												required="required" name="accountA" id="accountA"
												autofocus="autofocus" placeholder="請輸入帳號名稱" />
										</div>
										<div class="form-group">
											<label for="loginUserPassword_2">密碼</label>
											<form:input path="pw" type="password" class="form-control"
												required="required" name="loginUserPassword_2"
												id="loginUserPassword_2" placeholder="請輸入帳號密碼" />
										</div>
										<span id="adsp" style="font-size: 10px;"></span>
										<br>
										<button type="submit" class="btn btn-primary">登入</button>
										<br>
										<br>
										<button type="button" id=""
											class="btn btn-outline-danger auto-login-btns-admin"
											data-num="0">超級帳號</button>
										<button type="button" id=""
											class="btn btn-outline-danger auto-login-btns-admin"
											data-num="2">店長</button>
										<button type="button" id=""
											class="btn btn-outline-danger auto-login-btns-admin"
											data-num="1">店員</button>
										<button type="button" id=""
											class="btn btn-outline-danger auto-login-btns-admin"
											data-num="3">小編</button>
									</form:form>

								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 內容結束 -->

		<!-- 尾標 -->
		<footer class="main-footer">
			<!-- 內容 -->
			<strong>Copyright &copy; 2021-2022 <a href="#">EEIT38
					Group 3</a>.
			</strong> All rights reserved.
		</footer>
	</div>
	<!-- 結束 -->

	<!-- jQuery -->
	<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${contextRoot}/js/adminlte.min.js"></script>

	<script>
function validatelogin() {
	var account = document.getElementById("accountL");
	let acspstr = document.getElementById("acsp");
    let x = account.value;
	  if (/^(?=.*[a-zA-Z])(?=.*\d)[A-Za-z\d]{8,}$/.test(x)&& /^[^\s]*$/.test(x)) {	    
	  } else {
		acspstr.innerHTML = `<img style="width :10px" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource-thumbnail/aaa5ea30708aef68af78543f707fe55c.png">無效用戶名`;	  	    	
		return false;
		 }
	}
	
function validateAdmin() {
	var account = document.getElementById("accountA");
	let acspstr = document.getElementById("adsp");
    let x = account.value;
	  if (/^(?=.*[a-zA-Z])(?=.*\d)[A-Za-z\d]{8,}$/.test(x)&& /^[^\s]*$/.test(x)) {	    
	  } else {
		acspstr.innerHTML = `<img style="width :10px" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource-thumbnail/aaa5ea30708aef68af78543f707fe55c.png">無效用戶名`;	  	    	
		return false;
		}
}

function isAccValid() {
    var account = document.getElementById("accountR");
    let accountstr = account.value;
    let acspstr = document.getElementById("acr");
    
    if (/^(?=.*[a-zA-Z])(?=.*\d)[A-Za-z\d]{8,}$/.test(accountstr)&& /^[^\s]*$/.test(accountstr)) {
        return true;
    } else {
        return false;
    }
}
function checkAC() {
	let acspstr = document.getElementById("acr");
	if (isAccValid()) {
		acspstr.innerHTML = ``;
    } else {
        acspstr.innerHTML = `
        <span style="color :red; font-size: 16px">
        	<img style="width :16px" class="me-2" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource-thumbnail/aaa5ea30708aef68af78543f707fe55c.png">須含一個英文字、一個數字；且8碼以上
        </span>
        `;
    }
}

function checkPW() {
    var pwd = document.getElementById("pwd");
    let pwdstr = pwd.value;
    let pwspstr = document.getElementById("pwsp");
    if (/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/.test(pwdstr)) {
    	pwspstr.innerHTML = ``;
    } else {
        pwspstr.innerHTML = `
        <span style="color :red; font-size: 16px">
        	<img style="width :16px" class="me-2" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource-thumbnail/aaa5ea30708aef68af78543f707fe55c.png">須含一個英文字、一個特殊字元、一個數字；且8碼以上
        </span>
        `;
    }
}

function checkPWR() {
	var pwd = document.getElementById("pwd");
    var pwdcheck = document.getElementById("pwdcheck");
    let pwdstr = pwd.value;
    let pwdckstr = pwdcheck.value;
    let pwcspstr = document.getElementById("pwck");
    if (pwdstr === pwdckstr) {
    	pwcspstr.innerHTML = ``;
    } else {
        pwcspstr.innerHTML = `
        <span style="color :red; font-size: 16px">
        	<img style="width :16px" class="me-2" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource-thumbnail/aaa5ea30708aef68af78543f707fe55c.png">密碼不一致
        </span>
        `;
    }
}

function checkNM() {
	
    var name = document.getElementById("aname");
    let nmstr = name.value;
    let nmspstr = document.getElementById("nmsp");
    
    if(!nmstr || nmstr.trim() === '') {
    	nmspstr.innerHTML = `
	        <span style="color :red; font-size: 16px">
	        	<img style="width :16px" class="me-2" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource-thumbnail/aaa5ea30708aef68af78543f707fe55c.png">不可空白
	        </span>
	        `;
    } else {
    	nmspstr.innerHTML = ``;
    }
    /*
    if (/^[\u4e00-\u9fa5]{2,}$/.test(nmstr)) {
    	nmspstr.innerHTML = ``;
    } else {
        nmspstr.innerHTML = 
        	`<img style="width :10px" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource-thumbnail/aaa5ea30708aef68af78543f707fe55c.png">請輸入兩個字以上的中文字`;
    }
    */
}

function checkMail() {
    var mail = document.getElementById("mail");
    let mailstr = mail.value;
    let mailpstr = document.getElementById("mailsp");
    
    var pattern = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
    if (pattern.test(mailstr)) {
    	mailpstr.innerHTML = ``;
    } else {
    	mailpstr.innerHTML = `
	        <span style="color :red; font-size: 16px">
        	<img style="width :16px" class="me-2" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource-thumbnail/aaa5ea30708aef68af78543f707fe55c.png">請輸入郵件地址
        </span>
        `;
    }
}

function validateRegister() {
	var account = document.getElementById("accountR");
    var pwd = document.getElementById("pwd");
    var pwdcheck = document.getElementById("pwdcheck");
    var name = document.getElementById("aname");
    var mail = document.getElementById("mail");
    
    let accountstr = account.value;
    let pwdstr = pwd.value;
    let pwdckstr = pwdcheck.value;
    let nmstr = name.value;
    let mailstr = mail.value;
    
    var patternA1 = /^(?=.*[a-zA-Z])(?=.*\d)[A-Za-z\d]{8,}$/;
    var patternA2 = /^[^\s]*$/;
    var patternP = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
    var patternN = /^[\u4e00-\u9fa5]{2,}$/;
    var patternM = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
    
    let rsp = document.getElementById("rsp");
	  if (patternA1.test(accountstr) &&
		  patternA2.test(accountstr) &&
		  patternP.test(pwdstr) &&
		  (nmstr && nmstr.trim() !== '') &&
		  patternM.test(mailstr) &&
		  pwdstr === pwdckstr) {	
		  
		  return true;
	  } else {
		rsp.innerHTML = `
	        <span style="color :red; font-size: 16px">
        	<img style="width :16px" class="me-2" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource-thumbnail/aaa5ea30708aef68af78543f707fe55c.png">格式不符合
        </span>
        ` 	    	
		return false;
		 }
}
	
	//
	$("#ckeck-account-duplicate").on("click", function() {
		let accountName = document.getElementById("accountR");
		let web_url = "http://localhost:8080/A-Jen/checkAccountDuplicate?accName=" + accountName.value
		
		$.ajax({
			url: web_url,
			method: "get",
			contentType: "application/text; charset=UTF-8",
			success: function(result) {
				let accountNonDuplicate = document.getElementById("account-non-duplicate");
				let accountHasDuplicate = document.getElementById("account-has-duplicate");
				console.log(result)	
				
				if (result) {
					accountHasDuplicate.style.display = "block";
					accountNonDuplicate.style.display = "none";
				} else {
					accountNonDuplicate.style.display = "block";
					accountHasDuplicate.style.display = "none";
				};
			}
		})
	})
	
	// checkAC
	$("#accountR").on("input", function() {
		checkAC();
		if (isAccValid()) {
			$("#ckeck-account-duplicate").prop('disabled', false);
		} else {
			$("#ckeck-account-duplicate").prop('disabled', true);
		}
	})
	// checkPWD
	$("#pwd").on("input", function() {
		checkPW();
	})
	// checkPWR
		$("#pwdcheck").on("input", function() {
		checkPWR();
	})
	// checkNM
		$("#aname").on("input", function() {
			checkNM();
	})
	// checkMail
		$("#mail").on("input", function() {
		checkMail();
	})
</script>
</body>
</html>