<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<jsp:include page="${contextRoot}/WEB-INF/views/include-page/bootstrapLinks.jsp"/>
<jsp:include page="${contextRoot}/WEB-INF/views/include-page/dataTablesSource.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User My Products Page</title>
<script src="${contextRoot}/js/user-pages/myProducts.js"></script>
</head>
<body>
	<table id="table_id" class="display">  
	    <thead>
			<tr>
				<th>
					<input type="checkbox" id="pickAll" name="pickAll">
					<label for="pickAll">全選</label>
				</th>
				<th>商品序號</th>
				<th>商品名稱</th>
				<th>商品價錢</th>
				<th>商品類別</th>
				<th>上架狀態</th>
			</tr>
	    </thead>
	    <tbody>
	    	<c:forEach var='product' items='${products}' varStatus="s">
			    <tr>
				    <td>
						<input type="checkbox" id="item${s.count}" name="items" value="">
				    </td>
				    <td>${s.count}</td>
				    <td>
				    	<a href='<c:out value="/product/${product.productId}"/>'>
				    		${product.name}
				    	</a>
				    </td>
				    <td>${product.price}</td>
				    <td>${product.category.type}</td>
				    <td>
<%-- 				    	<button class="on-and-off" data-status_on="${statusOn}" data-status_off="${statusOff}">${product.productStatus.status}</button> --%>
				    	${product.productStatus.status}
				    </td>
			    </tr>
		    </c:forEach>
	    </tbody>
	</table>
</body>
</html>