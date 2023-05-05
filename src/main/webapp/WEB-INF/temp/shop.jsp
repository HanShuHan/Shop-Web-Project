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
<link rel="stylesheet" href="${contextRoot}/css/shop.css">
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
</head>
<body data-page="${pagE}" data-current_page="${currentPage}">
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
						<li><a href="${contextRoot}/shop"><span style="color: #ff4c4c;">Products</span></a>
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
						<li><c:choose>
								<c:when test="${sessionScope.accountId == null}">
									<a href="${contextRoot}/register"> Register/Login </a>
								</c:when>
								<c:otherwise>
									<a href="${contextRoot}/account?id=${sessionScope.accountId}"> <img id="cart-img"
										src="${contextRoot}/css/images/member.png" width="9"
										data-user_id="${sessionScope.accountId}"
										data-web_url="${pageContext.request.contextPath}"> <span><c:out
												value="${sessionScope.ac}" /></span>
									</a>
									<a href="${contextRoot}/logout"><span>|LogOut</span></a>
								</c:otherwise>
							</c:choose></li>
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
		<div class="container py-md-3">
			<!-- top Products -->
			<div class="row">
				<!-- 搜尋 -->
				<div class="side-bar col-lg-4">

					<div class="search-bar w3layouts-newsletter">
						<h3 class="sear-head">搜尋名稱</h3>
						<form method="get" class="d-flex">
							<input type="search" name="nameLike" value="${nameLike}"
								placeholder="Product name..." class="form-control"
								autocomplete="on">
							<button id="search-products-btt" type="button" class="btn btn-success">Search</button>
						</form>
					</div>
					<!--類別-->
					<div class="left-side my-4">
						<h3 class="sear-head">商品類別</h3>
						<ul id="product-types-motherul" class="w3layouts-box-list">
							<li><span id="check-all-types" class="span">全選</span>&nbsp;&nbsp;&nbsp;
								<span id="clear-types" class="span">清除</span></li>
							<c:set var="pageURL" value=""></c:set>
							<c:forEach var="category" items="${categoriesList}" varStatus="s">
								<li><c:choose>
										<c:when test='${types.get(s.count - 1) != ""}'>
											<c:set var="pageURL"
												value="${pageURL}&type${s.count}=${types.get(s.count - 1)}"></c:set>
											<input id="type${s.count}" name="type${s.count}"
												type="checkbox" class="checked types" checked>
										</c:when>
										<c:otherwise>
											<input id="type${s.count}" name="type${s.count}"
												type="checkbox" class="checked types">
										</c:otherwise>
									</c:choose> <label for="type${s.count}" class="span">${category.type}</label>
								</li>
							</c:forEach>
						</ul>
					</div>
					
					<div class="left-side">
						<h3 class="sear-head">排序</h3>
						<c:choose>
							<c:when test='${priceOrder != ""}'>
								<input id="price-order-checkbox" type="checkbox" class="checked" checked>
							</c:when>
							<c:otherwise>
								<input id="price-order-checkbox" type="checkbox" class="checked">
							</c:otherwise>
						</c:choose>
						<label for="price-order-checkbox" class="span">價格</label>
						<select id="price-order">
							<c:choose>
								<c:when test='${priceOrder == "高至低"}'>
									<option selected>高至低</option>
								</c:when>
								<c:otherwise>
									<option>高至低</option>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test='${priceOrder == "低至高"}'>
									<option selected>低至高</option>
								</c:when>
								<c:otherwise>
									<option>低至高</option>
								</c:otherwise>
							</c:choose>
						</select>
					</div>
					<br>
					
					<!-- //類別 -->
					<!-- 價格 -->
					<div class="left-side">
                        <h3 class="sear-head">價格</h3>
                        <input type="number" id="price_lower_bound" class="price-input" value="${priceLowerBound}"> -
                        <input type="number" id="price_upper_bound" class="price-input" value="${priceUpperBound}">
                        &nbsp;&nbsp;&nbsp;&nbsp;<span
							id="clear-price-boundaries" class="span">清除</span><br>
					</div>
					<!-- //價格 -->
					<!-- AD -->
					<br>
					<div class="deal-leftmk left-side">
						<h3 class="sear-head">最新上架商品</h3>
						<c:forEach var="adproduct" items="${adproducts}">
							<div class="special-sec1 row mb-3">
								<div class="img-deals col-md-4">
									<a href='<c:url value="/customerProduct/${adproduct.productId}"/>'>
										<img src='<c:url value="/showImage1/${adproduct.productId}"/>'class="img-fluid" alt="">
									</a>
								</div>
								<div class="img-deal1 col-md-4">
									<a href='<c:url value="/customerProduct/${adproduct.productId}"/>'>
										<b><c:out value="${adproduct.name}" /></b>
									</a><br>
									<span class="money"> NT$<c:out
											value="${adproduct.price}" />
									</span><br> <a href="#" class="add-to-cart"
										data-product_id="${adproduct.productId}"><span>加入購物車</span></a>
									<br>
									<c:choose>
										<c:when test="${sessionScope.accountId == null}">
											
											<a class="go-to-cart" href="${contextRoot}/register?goToCart=true&productID=${adproduct.productId}"><span>直接購買</span></a>
										</c:when>
										<c:otherwise>
											<a href="#" class="go-to-cart"
												data-product_id="${adproduct.productId}"> <span
												id="cart-go" data-user_id="${sessionScope.accountId}"
												data-web_url="${pageContext.request.contextPath}">
													直接購買 </span>
											</a>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</c:forEach>
					</div>
					<!-- //deals -->

				</div>
				<!-- //product left -->
				<!-- product right -->
				<div class="left-ads-display col-lg-8">
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
											<a href='<c:url value="/customerProduct/${product.productId}"/>'> <c:out
													value="${product.name}" />
											</a>
										</h4>

										<div class="product_price">
											<div class="grid-price">
												<span class="money"> NT$<c:out
														value="${product.price}" />
												</span>
											</div>
										</div>
										<a href="#" class="add-to-cart"
											data-product_id="${product.productId}"><span>加入購物車</span></a>
										<c:choose>
											<c:when test="${sessionScope.accountId == null}">
												<a class="go-to-cart" href="${contextRoot}/register?goToCart=true&productID=${product.productId}"><span>直接購買</span></a>
											</c:when>
											<c:otherwise>
												<a href="#" class="go-to-cart"
													data-product_id="${product.productId}"> <span
													id="cart-go" data-user_id="${sessionScope.accountId}"
													data-web_url="${pageContext.request.contextPath}">
														直接購買 </span>
												</a>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</c:forEach>
<!-- 						分頁 -->
						<div class="left-ads-display col-lg-12 text-center">
							<c:if test="${currentPage != 1}">
								<a
									href='<c:url value="shop?page=${currentPage - 1}&productType=${productType}&currentPage=${currentPage - 1}&nameLike=${nameLike}${pageURL}&eachPageNum=${eachPageNum}&priceLowerBound=${priceLowerBound}&priceUpperBound=${priceUpperBound}&priceOrder=${priceOrder}"/>'>上一頁&nbsp;&nbsp;&nbsp;</a>
							</c:if>
							<c:forEach var="page" begin="1" end="${pages}" step="1">
								<c:choose>
									<c:when test="${page == currentPage}">
										<c:out value="${page}"></c:out>
									</c:when>
									<c:otherwise>
										<a
											href='<c:url value="shop?page=${page}&productType=${productType}&currentPage=${page}&nameLike=${nameLike}${pageURL}&eachPageNum=${eachPageNum}&priceLowerBound=${priceLowerBound}&priceUpperBound=${priceUpperBound}&priceOrder=${priceOrder}"/>'>
											<c:out value="${page}"></c:out>
										</a>
									</c:otherwise>
								</c:choose>
								<c:if test="${page < pages}">
									&nbsp;
								</c:if>
							</c:forEach>
							<c:if test="${currentPage < pages}">
								<a
									href='<c:url value="shop?page=${currentPage + 1}&productType=${productType}&currentPage=${currentPage + 1}&nameLike=${nameLike}${pageURL}&eachPageNum=${eachPageNum}&priceLowerBound=${priceLowerBound}&priceUpperBound=${priceUpperBound}&priceOrder=${priceOrder}"/>'>&nbsp;&nbsp;下一頁</a>
							</c:if>
						</div>
						<div class="left-ads-display col-lg-12 text-center">單頁筆數
							<c:set value="999999" var="maxPageNum"/>
							<select id="each-page-controller">
								<c:forEach begin="3" end="15" step="3" var="pageNum">
									<c:choose>
										<c:when test="${eachPageNum == pageNum}">
											<option value="${pageNum}" selected><c:out value="${pageNum}"/></option>
										</c:when>
										<c:otherwise>
											<option value="${pageNum}"><c:out value="${pageNum}"/></option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:choose>
									<c:when test="${eachPageNum == maxPageNum}">
										<option value="${999999}" selected>全部</option>
									</c:when>
									<c:otherwise>
										<option value="${999999}">全部</option>
									</c:otherwise>
								</c:choose>
							</select>
						</div>
					</div>
				</div>
			</div>
		</div>
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