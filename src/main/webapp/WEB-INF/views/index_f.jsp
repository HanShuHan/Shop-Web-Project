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
<title>Home Page</title>
 <!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome Icons -->
<link rel="stylesheet" href="${contextRoot}/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${contextRoot}/css/adminlte.min.css">
</head>
<body>
 <a href="${contextRoot}/backEnd">後台</a>
 <br>
 <form action="${contextRoot}/paypage"method="post" target="_blank">
 <input type="text" name="msg">
 <button>測試訂單後送</button>
 </form>
 <br>
 


<form id="someForm" action="" method="POST">
<input type="text" name="msg">
<input type="button" value="測試訂單後送" name="back" onclick="askForSave()" />
</form>

 <form action="${contextRoot}/paidpage"method="post" target="_blank">
 <button>測試</button>
 </form>
 
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
<script>
form=document.getElementById("someForm");
function askForSave() {
    form.action="${contextRoot}/testpage";   
    form.submit();
    form.action="${contextRoot}/paypage";
    form.target="_blank";
    form.submit();
}
</script>



<!-- jQuery -->
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${contextRoot}/js/adminlte.min.js"></script>
</body>
</html>