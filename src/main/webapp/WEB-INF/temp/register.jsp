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
<title>Register Page</title>
<!-- Style-CSS -->
<link rel="stylesheet" href="${contextRoot}/css/style.css" type="text/css" media="all" />  
<!-- font-awesome-icons -->
<link href="${contextRoot}/css/font-awesome.css" rel="stylesheet">
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link href="//fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900" rel="stylesheet">
<!-- Font Awesome Icons -->
<link rel="stylesheet" href="${contextRoot}/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${contextRoot}/css/adminlte.min.css">
<link rel="stylesheet" href="${contextRoot}/css/loginPage.css" />
<!-- jQuery -->
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${contextRoot}/js/adminlte.min.js"></script>
<script src="${contextRoot}/js/loginPage.js"></script>
 <script>
      addEventListener("load", function() {
          setTimeout(hideURLbar, 0);
      }, false);

      function hideURLbar() {
          window.scrollTo(0, 1);
      }
  </script>
  <style>
	.menu {
		font-size: 20px;
	}
		#big-head, #cart-img {
		width: 20px;
		height: 20px;
	}
</style>
</head>
<body data-entry_false="${entryFalse}">
<%-- ${entryFalse} --%>
   <!-- 置頂區塊 -->
    <div class="main-banner inner" id="home">
         <!-- 上標 -->
        <header class="header">
            <div class="container-fluid px-lg-5">
                <!-- 導航 -->
                <nav class="py-4">
                    <div id="logo">
                        <h1> <a href="${contextRoot}/">A-Jen Sport</a></h1>
                    </div>
                    <label for="drop" class="toggle">Menu</label>
                    <input type="checkbox" id="drop" />
                    <ul class="menu mt-2">
                        <li><a href="${contextRoot}/">Home</a></li>
                       <li><a href="${contextRoot}/about">About</a></li>
                        <li><a href="${contextRoot}/blog">Blog</a></li>
						<li><a href="${contextRoot}/shop">Products</a>
                            <label for="drop-2" class="toggle">Products</label>
                            <input type="checkbox" id="drop-2" />
                            <ul>
                                <li><a href="${contextRoot}/shop">All</a></li>
                            	<c:forEach var="category" items="${categoriesList}" varStatus="status">
	                                <li>
	                                	<a href="${contextRoot}/shop?type${status.count}=${category.type}">
	                                		<c:out value="${category.type}"/>
	                                	</a>
	                                </li>
                            	</c:forEach>
                            </ul>
						</li>
						<li><a href="${contextRoot}/contact">Contact</a></li>
                        <li class="active">
						<c:choose>
								<c:when test="${sessionScope.accountId == null}">
									<a href="${contextRoot}/register"> Register/Login </a>
								</c:when>
								<c:otherwise>
									<a href="#">										
										<img id="cart-img" src="${contextRoot}/css/images/member.png"
										width="9"
										data-user_id="${sessionScope.accountId}"
										data-web_url="${pageContext.request.contextPath}">
										<span><c:out value="${sessionScope.ac}" /></span>
									</a>
									<a href="#"><span>|LogOut</span></a>
								</c:otherwise>
							</c:choose>
						</li>
                        <li>
                        	<c:choose>
                        		<c:when test="${sessionScope.accountId == null}">
	                        		<a href="${contextRoot}/register">
										<img id="cart-img" src="${contextRoot}/css/images/cart2.svg">
									</a>
                        		</c:when>
                        		<c:otherwise>
                        			<a href="<c:url value='/myCartList/accountId/${sessionScope.accountId}'/>">
										<img id="cart-img" src="${contextRoot}/css/images/cart2.svg" data-user_id="${sessionScope.accountId}">
									</a>
									<span id="show-number-in-cart"  style="color: yellow;">
										<c:if test="${sessionScope.numberInCart > 0}">
											<c:out value="${sessionScope.numberInCart}"/>
										</c:if>
									</span>
                        		</c:otherwise>
                        	</c:choose>
                        </li>
					</ul>
                </nav>
                <!-- //導航 -->
            </div>
        </header>
        <!-- //上標 -->

    </div>
    <!--//置頂區塊-->
    <!--當前位址提示-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="${contextRoot}/">Home</a>
        </li>
        <li class="breadcrumb-item active">會員登入|註冊</li>
    </ol>
	<!--當前位址提示 -->
	<!-- 註冊主區塊 -->
		<div class="container border padding-10" id="login-div">
		<nav>
			<div class="nav nav-tabs justify-content-center" id="nav-tab" role="tablist">
			    <a class="nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home"  role="tab" aria-controls="nav-home" aria-selected="true">使用者登入</a>
			    <a class="nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">新用戶註冊</a>
			    <a class="nav-link" id="nav-admin-tab" data-toggle="tab" href="#nav-admin" role="tab" aria-controls="nav-admin" aria-selected="false">店家專區</a>
		  	</div>
		</nav>
		<div class="tab-content border border-top-0" id="nav-tabContent">
		    <div class="tab-pane fade show active padding-10" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
		    	<form:form id="log-in-form" modelAttribute="accountBean" name="login"  onsubmit="return validatelogin()" action="login" method="Post">
					<div class="form-group">
					    <label for="loginUserName">使用者帳號</label>
					    <form:input path="ac" type="text" class="form-control" name="accountL" id="accountL" autofocus="autofocus" placeholder="請輸入帳號名稱" required="required"
					    	value="${nameForLogin}"/>
				  	</div>
				  	<div class="form-group">
					    <label for="loginUserPassword">密碼</label>
					    <form:input  path="pw" type="password" class="form-control" id="loginUserPassword" name="loginUserPassword" placeholder="請輸入帳號密碼"  required="required"
					    	value="${passwordForLogin}"/>
				  	</div>
				  	<span id="acsp" style="font-size: 10px;"></span>
				  	<br>
					<button type="submit" class="btn btn-primary">登入</button>
					<button type="button" id="auto-log-in-btn" class="btn btn-outline-danger">一鍵登入</button><br><br>
					<button type="button" id="newest-member-btn" class="btn btn-warning">最新會員</button>
				</form:form>
		    </div>
		  	<div class="tab-pane fade padding-10" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
		  		<form:form id="register-form" modelAttribute="accountBean" name="Register" onsubmit="return validateRegister()" action="${contextRoot}/register" method="Post">
					<div class="form-group">
					    <label>使用者帳號</label>
					    <form:input type="text" class="form-control" path="ac" name="accountR" id="accountR" autocomplete="off" placeholder="請輸入帳號名稱" onblur="checkAC()"/>
						<span id="acr" style="font-size: 10px;"></span>
					</div>
				  	<div class="form-group">
					    <label>使用者密碼</label>
					    <form:input type="password" class="form-control" path="pw"  name="pwd" id="pwd" placeholder="請輸入密碼" onblur="checkPW()"/>
				  		<span id="pwsp" style="font-size: 10px;"></span>
				  	</div>
				  	<div class="form-group">
					    <label>密碼再確認</label>
					    <form:input type="password" class="form-control" path=""  name="pwdcheck" id="pwdcheck" placeholder="請再次確認" onblur="checkPWR()"/>
				  		<span id="pwck" style="font-size: 10px;"></span>
				  	</div>
				  	<div class="form-group">
					    <label>真實姓名</label>
					    <form:input type="text" class="form-control" path="aname"  name="aname" id="aname" placeholder="請輸入用戶姓名" onblur="checkNM()"/>
				  		<span id="nmsp" style="font-size: 10px;"></span>
				  	</div>
				  	<div class="form-group">
					    <label>電子郵件</label>
					    <form:input type="text" class="form-control" path="mail"  name="mail" id="mail" placeholder="請輸入電子郵件" onblur="checkMail()"/>
				  		<span id="mailsp" style="font-size: 10px;"></span>
				  	</div>
				  	<span id="rsp" style="font-size: 10px;"></span>
				  	<br>
  					<button type="submit" class="btn btn-primary">註冊</button>
  					<button type="button" id="auto-register-btn" class="btn btn-outline-warning">一鍵註冊</button>
				</form:form>
		  	</div>
		  	<div class="tab-pane fade padding-10" id="nav-admin" role="tabpanel" aria-labelledby="nav-admin-tab">
		    	<form:form id="admin-log-in-form" modelAttribute="accountBean" name="admin"  onsubmit="return validateAdmin()" action="admin" method="Post">
					<div class="form-group">
					    <label for="loginUserName">使用者帳號</label>
					    <form:input path="ac" type="text" class="form-control" name="accountA" id="accountA" autofocus="autofocus" placeholder="請輸入帳號名稱"/>
				  	</div>
				  	<div class="form-group">
					    <label for="loginUserPassword_2">密碼</label>
					    <form:input  path="pw" type="password" class="form-control" name="loginUserPassword_2" id="loginUserPassword_2" placeholder="請輸入帳號密碼"/>
				  	</div>
				  	<span id="adsp" style="font-size: 10px;"></span>
				  	<br>
					<button type="submit" class="btn btn-primary">登入</button>
					<br><br>
					<button type="button" id="" class="btn btn-outline-danger auto-login-btns-admin" data-num="0">超級帳號</button>
					<button type="button" id="" class="btn btn-outline-danger auto-login-btns-admin" data-num="1">店長</button>
					<button type="button" id="" class="btn btn-outline-danger auto-login-btns-admin" data-num="2">店員</button>
					<button type="button" id="" class="btn btn-outline-danger auto-login-btns-admin" data-num="3">小編</button>
				</form:form>
		    </div>
		</div>
	</div>
	<br>
	<!-- 註冊主區塊 -->
    <!-- 標底 -->
    <footer>
        <div class="container">
            <div class="row footer-top">
                <div class="col-lg-4 footer-grid_section_w3layouts">
                    <p class="col-md-10">© 2022 A-Jen Sport. All rights reserved | Design by
                            <a href="https://www.ispan.com.tw/longterm/JJEEITT">資展國際 EEIT138.</a>
                        </p>                   
                </div>
            </div>
        </div>
    </footer>
    <!-- //標底 -->
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

function checkAC() {
    var account = document.getElementById("accountR");
    let accountstr = account.value;
    let acspstr = document.getElementById("acr");
    if (/^(?=.*[a-zA-Z])(?=.*\d)[A-Za-z\d]{8,}$/.test(accountstr)&& /^[^\s]*$/.test(accountstr)) {
        acspstr.innerHTML = ``;
    } else {
        acspstr.innerHTML = `<img style="width :10px" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource-thumbnail/aaa5ea30708aef68af78543f707fe55c.png">請輸入至少有一個英數字，八碼以上帳號`;
    }
}

function checkPW() {
    var pwd = document.getElementById("pwd");
    let pwdstr = pwd.value;
    let pwspstr = document.getElementById("pwsp");
    if (/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/.test(pwdstr)) {
    	pwspstr.innerHTML = ``;
    } else {
        pwspstr.innerHTML = `<img style="width :10px" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource-thumbnail/aaa5ea30708aef68af78543f707fe55c.png">請輸入至少一個英文數字特殊字元，八碼以上密碼。`;
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
        pwcspstr.innerHTML = `<img style="width :10px" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource-thumbnail/aaa5ea30708aef68af78543f707fe55c.png">密碼不符。`;
    }
}

function checkNM() {
    var name = document.getElementById("aname");
    let nmstr = name.value;
    let nmspstr = document.getElementById("nmsp");
    if (/^[\u4e00-\u9fa5]{2,}$/.test(nmstr)) {
    	nmspstr.innerHTML = ``;
    } else {
        nmspstr.innerHTML = `<img style="width :10px" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource-thumbnail/aaa5ea30708aef68af78543f707fe55c.png">請輸入兩個字以上的中文字`;
    }
}

function checkMail() {
    var mail = document.getElementById("mail");
    let mailstr = mail.value;
    let mailpstr = document.getElementById("mailsp");
    var pattern = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
    if (pattern.test(mailstr)) {
    	mailpstr.innerHTML = ``;
    } else {
    	mailpstr.innerHTML = `<img style="width :10px" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource-thumbnail/aaa5ea30708aef68af78543f707fe55c.png">請輸入合法郵件`;
    }
}

function validateRegister() {
	var account = document.getElementById("accountR");
    let accountstr = account.value;
    var pwd = document.getElementById("pwd");
    var pwdcheck = document.getElementById("pwdcheck");
    let pwdstr = pwd.value;
    let pwdckstr = pwdcheck.value;
    var name = document.getElementById("aname");
    let nmstr = name.value;
    var mail = document.getElementById("mail");
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
		  patternN.test(nmstr) &&
		  patternM.test(mailstr) &&
		  pwdstr === pwdckstr) {	    
	  } else {
		rsp.innerHTML = `<img style="width :10px" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource-thumbnail/aaa5ea30708aef68af78543f707fe55c.png">註冊資訊有誤，請檢察。`;	  	    	
		return false;
		 }
	}
</script>

</body>
</html>