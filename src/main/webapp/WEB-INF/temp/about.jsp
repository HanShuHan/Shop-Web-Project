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
<title>About Page</title>
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
<body>
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
                        <li class="active"><a href="${contextRoot}/about">About</a></li>
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
                        <li>
						<c:choose>
								<c:when test="${sessionScope.accountId == null}">
									<a href="${contextRoot}/register"> Register/Login </a>
								</c:when>
								<c:otherwise>
									<a href="${contextRoot}/account?id=${sessionScope.accountId}">										
										<img id="cart-img" src="${contextRoot}/css/images/member.png"
										width="9"
										data-user_id="${sessionScope.accountId}"
										data-web_url="${pageContext.request.contextPath}">
										<span><c:out value="${sessionScope.ac}" /></span>
									</a>
									<a href="${contextRoot}/logout#"><span>|LogOut</span></a>
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
									<span id="show-number-in-cart" style="color: yellow;">
										<c:if test="${sessionScope.numberInCart > 0}">
											<b><c:out value="${sessionScope.numberInCart}"/></b>
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
        <li class="breadcrumb-item active">關於我們</li>
    </ol>
	<!--當前位址提示 -->
	<!-- 關於我主區塊 -->
    <!--/ab -->
    <section class="hand-crafted py-5">
        <div class="container">
            <div class="inner-sec py-md-5 px-lg-5">
                <h3 class="tittle text-center"><span class="sub-tittle">About.</span>歡迎來到我們的商店</h3>
                <p class="mb-4 text-center px-lg-4"> 你也熱愛運動嗎？讓大家同懷運動願望，一起享受做運動帶來的樂趣，便是創立阿珍簡單的理由。阿珍是從大安附近的一個商業大樓發跡的，創辦人MajorSubject-Ho希望所有熱愛運動的人，不論是從大眾到小眾運動、從初階到專業的產品，讓所有熱愛運動的人們都能輕易享受到運動帶來的樂趣。也因為和每一位運動者共享運動快樂，是我們一直秉持的宗旨，價格不應該成為限制我們運動熱情的原因，因此我們一直以來秉持著重視體驗更勝賣商品！，讓更多運動愛好者能夠更輕易接觸並體驗到不同運動。</p>
            </div>
        </div>
    </section>
    <!-- //ab -->
    <!-- /hand-crafted -->
    <section class="hand-crafted py-5">
        <div class="container py-md-3">
            <div class="row banner-grids">
                <div class="col-md-6 banner-image">
                    <div class="effect-w3">
                        <img src="images/504584.jpg" alt="" class="img-fluid image1">

                    </div>

                </div>
                <div class="col-md-6 last-img pl-lg-5 p-3">
                    <h3 class="tittle mb-lg-5 mb-3"><span class="sub-tittle">阿珍體育用品創辦人</span>MajorSubject-HO 曾說：</h3>
                    <p class="mb-4"> 關於運動，思想開朗，情緒輕松愉快，是健康的根本。體腦並用，鍛煉第一，是我多年的體會。隨著網絡時代的來臨，許多傳統的體育項目煥發了第二春，參與也更方便，比如潛水，現在人們甚至不需要氧氣瓶就能參加這項運動。也因此：</p>
                    <ul class="tic-info list-unstyled">
                        <li>要將運動帶往親民</li>
                        <li>要將運動帶往簡易</li>
                        <li>要將運動帶往數位</li>
                        <li>要將運動帶往阿珍</li>
                    </ul>

                </div>
            </div>
        </div>
    </section>
    <!-- //hand-crafted -->

	
	<!-- 關於我主區塊 -->
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
<!-- jQuery -->
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${contextRoot}/js/adminlte.min.js"></script>
</body>
</html>