<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<jsp:include page="${contextRoot}/WEB-INF/views/include-page/bootstrapLinks.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Cart Page</title>
<link rel="stylesheet" href="${contextRoot}/css/myCart.css" />
<script src="${contextRoot}/js/cart-pages/myCart.js"></script>
</head>
<body>
	<form:form method="POST" modelAttribute="receipt">
		<c:forEach items="${cartLists}" var="cartList" varStatus="s">
			<div class="container border" data-cart_list_id="${cartList.listId}" data-unit_price="${cartList.product.price}">
	        	<div id="big-image-container" class="border">
	            	<img src='<c:url value="/showImage1/${cartList.product.productId}"/>' alt="" id="big-image">
	        	</div>
				<p>產品名稱: ${cartList.product.name}</p>
				<p>產品價錢: ${cartList.product.price}</p>
				<label for="">產品數量:</label>
				<select class="quantity">
					<c:forEach var="optNum" begin="1" end="9">
						<c:choose>
							<c:when test="${cartList.quantity == optNum}">
								<option value="${optNum}" selected>${optNum}</option>
							</c:when>
							<c:otherwise>
								<option value="${optNum}">${optNum}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
				<button class="delete_one">刪除</button><br>
			</div><br>
	       	<form:input type="hidden" path="productId${s.count}" value="${cartList.product.productId}"/>
	       	<form:input type="hidden" path="productName${s.count}" value="${cartList.product.name}"/>
	       	<form:input type="hidden" path="productPrice${s.count}" value="${cartList.product.price}"/>
	       	<form:input type="hidden" path="productQuantity${s.count}" value="${cartList.quantity}"/>
	       	<form:input type="hidden" path="subtotal${s.count}" value="${cartList.quantity * cartList.product.price}"/>
		</c:forEach>
		<input type="submit" value="結帳"/><br>
	</form:form>
	<div class="container border">
		<span>總價: </span><h3 id="total"></h3>
	</div>
</body>
</html>