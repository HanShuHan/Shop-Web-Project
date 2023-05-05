<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<jsp:include page="${contextRoot}/WEB-INF/views/include-page/bootstrapLinks.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product Page</title>
<link rel="stylesheet" href="${contextRoot}/css/addProduct.css" />
<script src="${contextRoot}/js/addProduct.js"></script>
</head>
<body>
	<div class="container border">

		<form:form method="POST" modelAttribute="productBean" enctype="multipart/form-data">
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
				<form:options items="${categories}"/>
			</form:select><br>
<!-- 			<label for="type">產品種類:</label> -->
<%-- 			<form:input type="text" name="type" id="type" path="type" placeholder="產品種類" required="required" autocomplete="off"/><br> --%>
<!-- 			<label for="color">產品顏色:</label> -->
<%-- 			<form:input type="text" name="color" id="color" path="color" placeholder="產品顏色" required="required" autocomplete="off"/><br> --%>
<!-- 			<label for="size">產品大小:</label> -->
<%-- 			<form:input type="text" name="size" id="size" path="size" placeholder="產品尺寸" required="required" autocomplete="off"/><br> --%>
<!-- 			<label for="length">產品長度:</label> -->
<%-- 			<form:input type="text" name="length" id="length" path="length" placeholder="產品長度" required="required" autocomplete="off"/><br> --%>
<!-- 			<label for="width">產品寬度:</label> -->
<%-- 			<form:input type="text" name="width" id="width" path="width" placeholder="產品寬度" required="required" autocomplete="off"/><br> --%>
<!-- 			<label for="heigth">產品高度:</label> -->
<%-- 			<form:input type="text" name="heigth" id="heigth" path="heigth" placeholder="產品高度" required="required" autocomplete="off"/><br> --%>
<!-- 			<label for="weigth">產品重量:</label> -->
<%-- 			<form:input type="text" name="weigth" id="weigth" path="weigth" placeholder="產品重量" required="required" autocomplete="off"/><br> --%>
			
			<label for="detail1">產品敘述 1:</label>
			<form:textarea type="text" name="detail1" id="detail1" path="detail1" placeholder="產品敘述 1" required="required" autocomplete="off"/><br>
			<label for="detail2">產品敘述 2:</label>
			<form:textarea type="text" name="detail2" id="detail2" path="detail2" placeholder="產品敘述 2" required="required" autocomplete="off"/><br>
<!-- 			<label for="detail3">產品敘述 3:</label> -->
<%-- 			<form:textarea type="text" name="detail3" id="detail3" path="detail3" placeholder="產品敘述 3" required="required" autocomplete="off"/><br> --%>
<!-- 			<label for="detail4">產品敘述 4:</label> -->
<%-- 			<form:textarea type="text" name="detail4" id="detail4" path="detail4" placeholder="產品敘述 4" required="required" autocomplete="off"/><br> --%>
<!-- 			<label for="detail5">產品敘述 5:</label> -->
<%-- 			<form:textarea type="text" name="detail5" id="detail5" path="detail5" placeholder="產品敘述 5" required="required" autocomplete="off"/><br> --%>
<!-- 			<label for="detail6">產品敘述 6:</label> -->
<%-- 			<form:textarea type="text" name="detail6" id="detail6" path="detail6" placeholder="產品敘述 6" required="required" autocomplete="off"/><br> --%>
<!-- 			<label for="detail7">產品敘述 7:</label> -->
<%-- 			<form:textarea type="text" name="detail7" id="detail7" path="detail7" placeholder="產品敘述 7" required="required" autocomplete="off"/><br> --%>
			
			<label for="image1">封頁圖片1:</label>
        	<form:input type="file" name="image1" id="image1" path="image1" required="required" accept="image/*"/><br>
        	<label for="image2">封頁圖片2:</label>
        	<form:input type="file" name="image2" id="image2" path="image2" required="required" accept="image/*"/><br>
        	<label for="image3">封頁圖片3:</label>
        	<form:input type="file" name="image3" id="image3" path="image3" required="required" accept="image/*"/><br>
<!-- 			<label for="image4">封頁圖片4:</label> -->
<%--         	<form:input type="file" name="image4" id="image4" path="image4"/><br> --%>
<!--         	<label for="image5">封頁圖片5:</label> -->
<%--         	<form:input type="file" name="image5" id="image5" path="image5"/><br> --%>
<!--         	<label for="image6">封頁圖片6:</label> -->
<%--         	<form:input type="file" name="image6" id="image6" path="image6"/><br> --%>
			
			<div class="pics-row-6 border">
				<div id="image1-container" class="border border-primary square-50 margin-bot-10">
	            	<img src="" alt="" id="img-image1">
	        	</div>
				<div id="image2-container" class="border border-primary square-50 margin-bot-10">
	            	<img src="" alt="" id="img-image2">
	        	</div>
				<div id="image3-container" class="border border-primary square-50 margin-bot-10">
	            	<img src="" alt="" id="img-image3">
	        	</div>
<!-- 				<div id="image4-container" class="border border-primary square-50 margin-bot-10"> -->
<!-- 	            	<img src="" alt="" id="img-image4"> -->
<!-- 	        	</div> -->
<!-- 				<div id="image5-container" class="border border-primary square-50 margin-bot-10"> -->
<!-- 	            	<img src="" alt="" id="img-image5"> -->
<!-- 	        	</div> -->
<!-- 				<div id="image6-container" class="border border-primary square-50 margin-bot-10"> -->
<!-- 	            	<img src="" alt="" id="img-image6"> -->
<!-- 	        	</div> -->
        	</div>

        	<div id="big-image-container" class="border">
            	<img src="" alt="" id="big-image">
        	</div><br>
        	
			<input type="submit" value="新增產品">
		</form:form>
	</div>
</body>
</html>