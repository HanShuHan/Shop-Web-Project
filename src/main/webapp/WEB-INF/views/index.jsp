<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="${contextRoot}/WEB-INF/views/include-page/bootstrapLinks.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
</head>
<body>
	<div class="container justify-content-center">
		<table class="">
			<tr><th><a href="<c:url value='/loginPage'/>">登入 頁面</a></th></tr>
			<tr><th><a href="<c:url value='/addProduct'/>">新增 產品</a></th></tr>
			<tr><th><a href="<c:url value='/allProducts'/>">商品 陳列</a></th></tr>
			<tr><th><a href="<c:url value='/user/myProducts'/>">後臺管理</a></th></tr>
			<tr><th><a href="<c:url value='/myCartList'/>">Cart 清單</a></th></tr>
			<tr><th><a href=""></a></th></tr>
		</table>
	</div>
</body>
</html>