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
 <script src="${contextRoot}/js/index.js"></script>
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
	<div class="main-banner" id="home">
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
						<li><c:choose>
								<c:when test="${sessionScope.accountId == null}">
									<a href="${contextRoot}/register"> <img id="cart-img"
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
		<!--/行銷大橫軸-->
		<div class="banner-info">
			<p>阿珍體育用品</p>
			<h3 class="mb-2">提供您最實惠的選擇。</h3>
			<div class="ban-buttons">
				<a href="${contextRoot}/shop">開始購物</a> <a href="${contextRoot}/about">關於我們</a>
			</div>
		</div>
		<!--//行銷大橫軸 -->

	</div>
	<!--//置頂區塊-->
	<!--/說明橫幅 -->
	<section class="about py-md-5 py-5">
		<div class="container-fluid">
			<div class="feature-grids row px-3">
				<div class="col-lg-3 gd-bottom">
					<div class="bottom-gd row">
						<div class="icon-gd-info col-md-9">
							<h3 class="mb-2">送貨須知</h3>
							<p>完成付款後將盡快安排寄出。本店僅提供店到店服務。</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 gd-bottom">
					<div class="bottom-gd row bottom-gd2-active">
						<div class="icon-gd-info col-md-9">
							<h3 class="mb-2">七天退貨</h3>
							<p>凡使用本網路商店購買者，皆享有七天鑑賞期。</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 gd-bottom">
					<div class="bottom-gd row">
						<div class="icon-gd-info col-md-9">
							<h3 class="mb-2">會員制</h3>
							<p>本網路商店僅提供已註冊會員使用交易功能。</p>
						</div>

					</div>
				</div>
				<div class="col-lg-3 gd-bottom">
					<div class="bottom-gd row">
						<div class="icon-gd-info col-md-9">
							<h3 class="mb-2">優惠碼放送</h3>
							<p>
								凡購物輸入代碼即可享優惠。
								Code:${disc.couponName}
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- //說明橫幅 -->
	<!--/活動區塊 -->
	<section class="ab-info-main py-5">
        <div class="container py-lg-3">
            <div class="ab-info-grids">
                <div id="products" class="row view-group">
                    <div class="item col-lg-12">
                        <div class="thumbnail card">
                            <div class="caption card-body">
                            	<c:if test="${disf.fixedId != null}">
	                                <img width="1080" class="img" src='<c:url value="/showImageFixed/${disf.fixedId}"/>'>
                            	</c:if>
                            	<c:if test="${disp.percentageId != null}">
	                                <img width="1080" class="img" src='<c:url value="/showImagePercentage/${disp.percentageId}"/>'>
                            	</c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<!-- //活動區塊 -->
	<!--/新商品區塊 -->
	<section class="about py-5">
		<div class="container pb-lg-3">
			<h3 class="tittle text-center">最新到貨商品</h3>
			<div class="row">
				<c:forEach var="product" items="${products}">
					<div class="col-md-4 product-men">
						<div class="product-shoe-info shoe text-center">
							<div class="men-thumb-item">
								<a href='<c:url value="/customerProduct/${product.productId}"/>'><img src='<c:url value="/showImage1/${product.productId}"/>'
									class="img-fluid" alt=""></a>
							</div>
							<div class="item-info-product">
								<h4>
									<a href='<c:url value="/customerProduct/${product.productId}"/>'> <c:out value="${product.name}" />
									</a>
								</h4>

								<div class="product_price">
									<div class="grid-price">
										<c:out value="${product.type}" />
										<span class="money"> NT$<c:out value="${product.price}" />
										</span>
									</div>
								</div>
								<a href="#" class="add-to-cart" data-product_id="${product.productId}"><span>加入購物車</span></a>
		                            <c:choose>
                        		<c:when test="${sessionScope.accountId == null}">
	                        		<a href="${contextRoot}/register?goToCart=true&productID=${product.productId}"><span>直接購買</span></a>
                        		</c:when>
                        		<c:otherwise>
                        			<a href="#" class="go-to-cart" data-product_id="${product.productId}">
										<span id="cart-go" data-user_id="${sessionScope.accountId}" data-web_url="${pageContext.request.contextPath}">
										直接購買
										</span>
									</a>
                        		</c:otherwise>
                        	</c:choose>
                        	</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!-- //新商品區塊 -->
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