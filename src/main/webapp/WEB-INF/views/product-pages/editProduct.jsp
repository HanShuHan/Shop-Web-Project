<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<jsp:include page="${contextRoot}/WEB-INF/views/include-page/bootstrapLinks.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Product Page</title>
<link rel="stylesheet" href="${contextRoot}/css/editProduct.css" />
<script src="${contextRoot}/js/editProduct.js"></script>
</head>
<body>
	<div class="container border">
		<form:form method="POST" modelAttribute="product" enctype="multipart/form-data">
			<form:input type="hidden" path="productId"/><br>
			<form:input type="hidden" path="addedTime"/><br>
			<label for="name">產品名稱:</label>
			<form:input type="text" id="name" path="name" placeholder="產品名稱" required="required" autocomplete="off"/>
			<label for="productStatusId">上架狀態:</label>
			<form:select id="productStatusId" path="productStatusId">
				<form:options items="${productStatuses}"/>
			</form:select><br>
			<label for="price">產品價錢:</label>
			<form:input type="number" id="price" path="price" placeholder="產品價錢" required="required" min="1" max="99999" autocomplete="off"/><br>
			<label for="categoryId">產品類型:</label>
			<form:select id="categoryId" path="categoryId">
				<form:options items="${categories}" />
			</form:select><br>	
			<label for="detail1">產品敘述 1:</label>
			<form:textarea type="text" name="detail1" id="detail1" path="detail1" placeholder="產品敘述 1" required="required" autocomplete="off"/><br>
			<label for="detail2">產品敘述 2:</label>
			<form:textarea type="text" name="detail2" id="detail2" path="detail2" placeholder="產品敘述 2" required="required" autocomplete="off"/><br>
			<label for="image1">封頁圖片1:</label>
        	<form:input type="file" name="image1" id="image1" path="image1" accept="image/*"/><br>
        	<label for="image2">封頁圖片2:</label>
        	<form:input type="file" name="image2" id="image2" path="image2" accept="image/*"/><br>
        	<label for="image3">封頁圖片3:</label>
        	<form:input type="file" name="image3" id="image3" path="image3" accept="image/*"/><br>
			<div class="pics-row-6 border">
		    	<c:if test="${product.coverImage1 != null}">
			    	<img id="img-image1" class="image1" alt="" src='<c:url value="/showImage1/${product.productId}"/>'>
		    	</c:if>
		    	<c:if test="${product.coverImage2 != null}">
			    	<img id="img-image2" class="image2" alt="" src='<c:url value="/showImage2/${product.productId}"/>'>
		    	</c:if>
		    	<c:if test="${product.coverImage3 != null}">
			    	<img id="img-image3" class="image3" alt="" src='<c:url value="/showImage3/${product.productId}"/>'>
		    	</c:if>
        	</div>
        	<div id="big-image-container" class="border">
            	<img src='<c:url value="/showImage1/${product.productId}"/>' alt="" id="big-image">
        	</div><br>
			<input type="submit" value="修改">
		</form:form>
			<a href="${contextRoot}/onePR?id=${products.productId}">
        		<button>取消</button>
        	</a>
	</div>
</body>
</html>