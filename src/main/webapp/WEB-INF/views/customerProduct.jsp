<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<jsp:include
	page="${contextRoot}/WEB-INF/views/include-page/bootstrapLinks.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Page</title>
<link rel="stylesheet" href="${contextRoot}/css/customerProduct.css" />
<link rel="stylesheet" href="${contextRoot}/css/fontawesome-free-5.15.4-web/css/all.min.css">
<link rel="stylesheet" href="${contextRoot}/css/fontawesome-free-5.15.4-web/css/v4-shims.min.css">
<script src="${contextRoot}/js/customerProduct.js"></script>
</head>
<body>

	<div class="container main-container border">
		
		<div class="wrapper">
	        <ul class="slides slide">
	            <li class="slide"><img src='<c:url value="/showImage1/${product.productId}"/>' alt=""></li>
	            <li class="slide"><img src='<c:url value="/showImage2/${product.productId}"/>' alt=""></li>
	            <li class="slide"><img src='<c:url value="/showImage3/${product.productId}"/>' alt=""></li>
	        </ul>
	        <div id="prevSlide" class="slide_btn">
	            <i class="fas fa-caret-left"></i>
	        </div>
	        <div  id="nextSlide" class="slide_btn">
	            <i class="fas fa-caret-right"></i>
	        </div>
    	</div>
		
		<div class="content border">
		<p>
			<span class="items-title">名稱</span>
			<b>&nbsp;${product.name}</b>
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
				<li class="product-detail-content">${product.detail1}</li>
			</c:if>
			<c:if test="${product.detail2 != null}">
				<li class="product-detail-content">${product.detail2}</li>
			</c:if>
		</ul>
		</div>
			<div class="sub-imgs">
		        <img class="sub-img" alt="" src='<c:url value="/showImage1/${product.productId}"/>'>
		        <img class="sub-img" alt="" src='<c:url value="/showImage2/${product.productId}"/>'>
		        <img class="sub-img" alt="" src='<c:url value="/showImage3/${product.productId}"/>'>
			</div>
			<div class="btts-container">
				<a href="">
					<button class="btn btn-success">
						<img id="click-cart-img" src="${contextRoot}/css/images/cart4.svg"> 加入購物車
					</button>&nbsp;&nbsp;&nbsp;
				</a>
				<a href="">
					<button class="btn btn-warning">立即購買</button>
				</a>
			</div>
	</div>
</body>
</html>