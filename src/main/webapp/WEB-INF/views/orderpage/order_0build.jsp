<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form:form method="POST" modelAttribute="receipt">
		<c:forEach items="${cartLists}" var="cartList" varStatus="s">
			<div class="container border" data-cart_list_id="${cartList.listId}" data-unit_price="${cartList.product.price}">
				<p>產品名稱: ${cartList.product.name}</p>
				<p>產品價錢: ${cartList.product.price}</p>
				<p>產品數量: ${cartList.quantity}</p>
			</div><br>
	       	<form:input type="hidden" path="productId${s.count}" value="${cartList.product.productId}"/>
	       	<form:input type="hidden" path="productName${s.count}" value="${cartList.product.name}"/>
	       	<form:input type="hidden" path="productPrice${s.count}" value="${cartList.product.price}"/>
	       	<form:input type="hidden" path="productQuantity${s.count}" value="${cartList.quantity}"/>
	       	<form:input type="hidden" path="subtotal${s.count}" value="${cartList.quantity * cartList.product.price}"/>
		</c:forEach>
	<input type="submit" value="結帳"/><br>
</form:form>
<!-- jQuery -->
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${contextRoot}/js/adminlte.min.js"></script>
</body>
</html>