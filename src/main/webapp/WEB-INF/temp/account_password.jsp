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
<title>Account Page</title>
</script>
<!-- jQuery -->
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${contextRoot}/js/adminlte.min.js"></script>
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
                        <li class="active"><a href="${contextRoot}/">Home</a></li>
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
									<a href="${contextRoot}/logout"><span>|LogOut</span></a>
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
        <li class="breadcrumb-item active">帳戶資料</li>
    </ol>
	<!--當前位址提示 -->
	<!-- 主區塊 -->
    <div class="container border padding-10" id="login-div">
		<nav>
			<div class="nav nav-tabs justify-content-center" id="nav-tab" role="tablist">
			   <a class="nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">更改密碼</a>
		  	</div>
		</nav>
		<div class="tab-content border border-top-0" id="nav-tabContent">
		  	<div class="tab-pane fade show active padding-10" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
		  		<form name="cpw" onsubmit="return validate()" action="${contextRoot}/cpassword?id=${sessionScope.accountId}" method="Post">
				  	<div class="form-group">
					    <label>請輸入舊密碼</label>
					    <input type="password" class="form-control" name="pwd" id="pwd" placeholder="請輸入密碼" onblur="checkPW()" required="required" value="${passWord}"/>
				  		<span id="pwsp" style="font-size: 10px;"></span>
				  	</div>
				  	<div class="form-group">
					    <label>請輸入新密碼</label>
					    <input type="password" class="form-control" name="npwd" id="npwd" placeholder="請輸入密碼" onblur="checkNPW()" required="required"/>
				  		<span id="npwsp" style="font-size: 10px;"></span>
				  	</div>
				  	<div class="form-group">
					    <label>密碼再確認</label>
					    <input type="password" class="form-control" name="pwdcheck" id="pwdcheck" placeholder="請再次確認" onblur="checkPWR()" required="required"/>
				  		<span id="pwck" style="font-size: 10px;"></span>
				  	</div>
				  	<br>
  					<button type="submit" class="btn btn-primary">確認</button>
  					<a href="${contextRoot}/account?id=${sessionScope.accountId}"><button type="button" class="btn btn-primary">取消</button></a>
				</form>
		  	</div>
		</div>
	</div>
	<!-- 主區塊 -->
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

function checkNPW() {
    var pwd = document.getElementById("npwd");
    let pwdstr = pwd.value;
    let pwspstr = document.getElementById("npwsp");
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

function validate() {
    var pwd = document.getElementById("pwd");
    var npwd = document.getElementById("npwd");
    var pwdcheck = document.getElementById("pwdcheck");
    let pwdstr = pwd.value;
    let npwdstr = npwd.value;
    let pwdckstr = pwdcheck.value;
    var patternP = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
    var patternN = /^[\u4e00-\u9fa5]{2,}$/;
    var patternM = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
    let rsp = document.getElementById("rsp");
	  if (patternP.test(pwdstr) &&
		  patternN.test(npwdstr) &&
		  npwdstr === pwdckstr) {	    
	  } else {
		rsp.innerHTML = `<img style="width :10px" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource-thumbnail/aaa5ea30708aef68af78543f707fe55c.png">填入資訊有誤，請檢察。`;	  	    	
		return false;
		 }
	}

</body>
</html>