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
<title>Mall Page</title>
<!-- Style-CSS -->
<link rel="stylesheet" href="${contextRoot}/css/style.css"
	type="text/css" media="all" />
<!-- font-awesome-icons -->
<link href="${contextRoot}/css/font-awesome.css" rel="stylesheet">
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link
	href="//fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700"
	rel="stylesheet">
<link
	href="//fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900"
	rel="stylesheet">
<!-- Font Awesome Icons -->
<link rel="stylesheet" href="${contextRoot}/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${contextRoot}/css/adminlte.min.css">
<script>
	addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);

	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>
<!-- jQuery -->
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${contextRoot}/js/adminlte.min.js"></script>
<script src="${contextRoot}/js/shop.js"></script>
<script src="${contextRoot}/js/cart-pages/myCart.js"></script>
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
						<h1>
							<a href="${contextRoot}/">A-Jen Sport</a>
						</h1>
					</div>
					<label for="drop" class="toggle">Menu</label> <input
						type="checkbox" id="drop" />
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
						<li class="active"><c:choose>
								<c:when test="${sessionScope.accountId == null}">
									<a href="#"> <img id="cart-img"
										src="${contextRoot}/css/images/cart2.svg">
									</a>
								</c:when>
								<c:otherwise>
									<a
										href="<c:url value='/myCartList/accountId/${sessionScope.accountId}'/>">
										<img id="cart-img" src="${contextRoot}/css/images/cart2.svg"
										data-user_id="${sessionScope.accountId}"
										data-web_url="${pageContext.request.contextPath}">
									</a>
									<span id="show-number-in-cart" style="color: yellow;"> <c:if
											test="${sessionScope.numberInCart > 0}">
											<b><c:out value="${sessionScope.numberInCart}" /></b>
										</c:if>
									</span>
								</c:otherwise>
							</c:choose></li>
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
		<li class="breadcrumb-item"><a href="${contextRoot}/">Home</a></li>
		<li class="breadcrumb-item active">商城</li>
	</ol>
	<!--當前位址提示-->
	<!-- 商店主區塊 -->
	<section class="ab-info-main py-md-5 py-4">
		<h3 class="tittle text-center">商品詳述</h3>
		<div class="border container py-md-3"
			style="width: 800px; padding: 20px;">
			${detail}
		</div>
		<a href='<c:url value="/customerProduct/${productId}"/>'
			style="position: fixed; bottom: 0; right: 0px;"
			class="btn btn-primary">
		回上頁</a>

	</section>
	<!-- //contact -->
	<!-- 標底 -->
	<footer>
		<div class="container">
			<div class="row footer-top">
				<div class="col-lg-4 footer-grid_section_w3layouts">
					<p class="col-md-10">
						© 2022 A-Jen Sport. All rights reserved | Design by <a
							href="https://www.ispan.com.tw/longterm/JJEEITT">資展國際
							EEIT138.</a>
					</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- //標底 -->


</body>
</html>