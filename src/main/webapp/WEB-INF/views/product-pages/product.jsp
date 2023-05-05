<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<jsp:include page="${contextRoot}/WEB-INF/views/include-page/bootstrapLinks.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Page</title>
</head>
<body>
    	<div class="container border">
	    	<p>商品名稱: ${product.name}</p>
	    	<p>上架狀態: ${product.productStatus.status}</p>
	    	<p>商品價錢: ${product.price}</p>
	    	<p>商品類別: ${product.category.type}</p>
			關於此商品
	    	<ul>
	    		<c:if test="${product.detail1 != null}">
	    			<li>${product.detail1}</li>
	    		</c:if>
	    		<c:if test="${product.detail2 != null}">
	    			<li>${product.detail2}</li>
	    		</c:if>
	    	</ul>
	    	<c:if test="${product.coverImage1 != null}">
		    	<img class="image1" alt="" src='<c:url value="/showImage1/${product.productId}"/>'>
	    	</c:if>
	    	<c:if test="${product.coverImage2 != null}">
		    	<img class="image2" alt="" src='<c:url value="/showImage2/${product.productId}"/>'>
	    	</c:if>
	    	<c:if test="${product.coverImage3 != null}">
		    	<img class="image3" alt="" src='<c:url value="/showImage3/${product.productId}"/>'>
	    	</c:if>
	    	
	    	<a href='<c:url value="/editProduct?productId=${product.productId}"/>'>
    			<button>修改</button>
    		</a>
	    	<a href='<c:url value="/deleteProduct/productId/${product.productId}"/>'>
    			<button onclick="return confirm('確定刪除?')">刪除</button>
    		</a>
    	</div>
</body>
</html>