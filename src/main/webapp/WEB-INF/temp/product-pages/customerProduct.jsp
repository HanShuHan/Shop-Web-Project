<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<%-- <jsp:include page="${contextRoot}/WEB-INF/views/include-page/bootstrapLinks.jsp" /> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Page</title>
<!-- Style-CSS -->
<link rel="stylesheet" href="${contextRoot}/css/style.css" type="text/css" media="all" />
<!-- font-awesome-icons -->
<link rel="stylesheet" href="${contextRoot}/css/font-awesome.css">
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700">
<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900">
<!-- Font Awesome Icons -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="${contextRoot}/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${contextRoot}/css/adminlte.min.css">
<link rel="stylesheet" href="${contextRoot}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${contextRoot}/css/customerProduct.css" />
<link rel="stylesheet" href="${contextRoot}/css/fontawesome-free-5.15.4-web/css/all.min.css">
<link rel="stylesheet" href="${contextRoot}/css/fontawesome-free-5.15.4-web/css/v4-shims.min.css">
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<script src="${contextRoot}/js/customerProduct.js"></script>
<!-- AdminLTE App -->
<script src="${contextRoot}/js/adminlte.min.js"></script>
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
										<img id="big-head" src="${contextRoot}/css/images/member.png"
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
		<li class="breadcrumb-item"><a href="${contextRoot}/">Home</a></li>
		<li class="breadcrumb-item active">商城</li>
	</ol>
	<!--當前位址提示-->
	
	<!--主區塊-->
	<br>
	<h3 class="tittle text-center">商品</h3>
	<div class="container main-container">
		<div class="wrapper">
	        <ul class="slides slide">
	            <li class="slide"><img src='<c:url value="/showImage1/${product.productId}"/>' alt=""></li>
	            <li class="slide"><img src='<c:url value="/showImage2/${product.productId}"/>' alt=""></li>
	            <li class="slide"><img src='<c:url value="/showImage3/${product.productId}"/>' alt=""></li>
	        </ul>
	        <div id="prevSlide" class="slide_btn">
	            <img width="30" alt="" src="${contextRoot}/css/images/left-arrow.png">
	        </div>
	        <div  id="nextSlide" class="slide_btn">
	            <img width="30" alt="" src="${contextRoot}/css/images/right-arrow.png">
	        </div>
    	</div>
		
		<div class="content">
		<p>
			<span class="items-title">名稱</span>
			<span style="color: blue;"><b>&nbsp;${product.name}</b></span>
		</p>
		<p>
			<span class="items-title">價錢</span>
			<b><span class="item-price-style">&nbsp;NT$&nbsp;${product.price}</span></b>
		</p>
		<p>
			<span class="items-title">類別</span>
			<b><span class="item-type-style">&nbsp;${product.category.type}</span></b>
		</p>

		<span class="items-title">商品特色</span><br><br>
		<ul>
			<c:if test="${product.detail1 != null}">
				<li class="product-detail-content" style="color: olive;"><b>${product.detail1}</b></li>
			</c:if>
			<c:if test="${product.detail2 != null}">
				<br><li class="product-detail-content">
					<a href='<c:url value="/productDetail?productId=${product.productId}"/>' id="detail-link" >&lt;詳細內容&gt;</a>
				</li>
			</c:if>
		</ul>
		</div>
			<div class="sub-imgs">
		        <img class="sub-img" alt="" src='<c:url value="/showImage1/${product.productId}"/>'>
		        <img class="sub-img" alt="" src='<c:url value="/showImage2/${product.productId}"/>'>
		        <img class="sub-img" alt="" src='<c:url value="/showImage3/${product.productId}"/>'>
			</div>
			<div class="btts-container">
				<a href="#">
					<button id="add-to-cart-btn" class="btn btn-success"
						data-user_id="${sessionScope.accountId}" data-web_url="${pageContext.request.contextPath}" data-product_id="${product.productId}">
						<img id="click-cart-img" src="${contextRoot}/css/images/cart4.svg"> 加入購物車
					</button>&nbsp;&nbsp;&nbsp;
				</a>
				<c:choose>
					<c:when test="${sessionScope.accountId == null}">
						<a href="${contextRoot}/register?goToCart=true&productID=${product.productId}">
							<button class="btn btn-warning">立即購買</button>
						</a>
					</c:when>
					<c:otherwise>
						<button class="btn btn-warning go-to-cart"
							data-product_id="${product.productId}"
							data-user_id="${sessionScope.accountId}"
							data-web_url="${pageContext.request.contextPath}">立即購買
						</button>
					</c:otherwise>
				</c:choose>
			</div>
	</div><br><br>
	<!--主區塊-->
	
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