<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<jsp:include page="${contextRoot}/WEB-INF/views/include-page/bootstrapLinks.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Products Page</title>
<script src="${contextRoot}/js/allProducts.js"></script>
</head>
<body>
<%-- 	<form:select> --%>
<%-- 		<form:options items="${categories}"></form:options> --%>
<%-- 	</form:select> --%>
   	<div class="container border">
		<select>
			<option>全部</option>
			<c:forEach var="category" items="${categoriesList}">
				<option>${category.type}</option>
			</c:forEach>
		</select>
	</div>
    <c:forEach var="product" items="${products}" varStatus="s">
    	<c:if test="${product.productStatus.id == 1}">
	    	<div class="container border product_div">
	
		    	<h3>產品 ${s.count}</h3>
		    	
		    	<p>商品名稱: ${product.name}</p>
		    	<p>商品價錢: ${product.price}</p>
		    	<p>商品類別: ${product.category.type}</p>
	<%-- 	    	<p>商品種類: ${product.type}</p> --%>
	<%-- 	    	<p>商品顏色: ${product.color}</p> --%>
	<%-- 	    	<p>商品大小: ${product.size}</p> --%>
	<%-- 	    	<p>商品長度: ${product.length}</p> --%>
	<%-- 	    	<p>商品寬度: ${product.width}</p> --%>
	<%-- 	    	<p>商品高度: ${product.heigth}</p> --%>
	<%-- 	    	<p>商品重量: ${product.weigth}</p> --%>
	
				關於此商品
		    	<ul>
		    		<c:if test="${product.detail1 != null}">
		    			<li>${product.detail1}</li>
		    		</c:if>
		    		<c:if test="${product.detail2 != null}">
		    			<li>${product.detail2}</li>
		    		</c:if>
	<%-- 	    		<c:if test="${product.detail3 != null}"> --%>
	<%-- 	    			<li>${product.detail3}</li> --%>
	<%-- 	    		</c:if> --%>
	<%-- 	    		<c:if test="${product.detail4 != null}"> --%>
	<%-- 	    			<li>${product.detail4}</li> --%>
	<%-- 	    		</c:if> --%>
	<%-- 	    		<c:if test="${product.detail5 != null}"> --%>
	<%-- 	    			<li>${product.detail5}</li> --%>
	<%-- 	    		</c:if> --%>
	<%-- 	    		<c:if test="${product.detail6 != null}"> --%>
	<%-- 	    			<li>${product.detail6}</li> --%>
	<%-- 	    		</c:if> --%>
	<%-- 	    		<c:if test="${product.detail7 != null}"> --%>
	<%-- 	    			<li>${product.detail7}</li> --%>
	<%-- 	    		</c:if> --%>
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
	<%-- 	    	<c:if test="${product.coverImage4 != null}"> --%>
	<%-- 		    	<img class="image4" alt="" src='<c:url value="/showImage4/${product.productId}"/>'> --%>
	<%-- 	    	</c:if> --%>
	<%-- 	    	<c:if test="${product.coverImage5 != null}"> --%>
	<%-- 		    	<img class="image5" alt="" src='<c:url value="/showImage5/${product.productId}"/>'> --%>
	<%-- 	    	</c:if> --%>
	<%-- 	    	<c:if test="${product.coverImage6 != null}"> --%>
	<%-- 		    	<img class="image6" alt="" src='<c:url value="/showImage6/${product.productId}"/>'> --%>
	<%-- 	    	</c:if> --%>
		    	
    			<button class="add-to-cart" data-product_id="${product.productId}">加入購物車</button>
	    	</div>
	    </c:if>
    </c:forEach>
</body>
</html>