<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<jsp:include page="${contextRoot}/WEB-INF/views/include-page/bootstrapLinks.jsp"/>
<jsp:include page="${contextRoot}/WEB-INF/views/nav-bar/homePageBar.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link rel="stylesheet" href="${contextRoot}/css/loginPage.css" />
<script src="${contextRoot}/js/loginPage.js"></script>
</head>
<body>
	<div class="container border padding-10" id="login-div">
		<nav>
			<div class="nav nav-tabs justify-content-center" id="nav-tab" role="tablist">
			    <a class="nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home"  role="tab" aria-controls="nav-home" aria-selected="true">登入</a>
			    <a class="nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">註冊</a>
			    <a class="nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">Contact</a>
		  	</div>
		</nav>
		<div class="tab-content border border-top-0" id="nav-tabContent">
		    <div class="tab-pane fade show active padding-10" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
		    	<form>
					<div class="form-group">
					    <label for="loginUserName">使用者帳號</label>
					    <input type="text" class="form-control" id="loginUserName" aria-describedby="loginUserNamelHelp" autofocus="autofocus">
					    <small id="loginUserNamelHelp" class="form-text">We'll never share your email with anyone else.</small>
				  	</div>
				  	<div class="form-group">
					    <label for="loginUserPassword">密碼</label>
					    <input type="password" class="form-control" id="loginUserPassword">
				  	</div>
					<button type="submit" class="btn btn-primary">Sign In</button>
				</form>
		    </div>
		  	<div class="tab-pane fade padding-10" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
		  		<form>
					<div class="form-group">
					    <label for="registerUserName">使用者帳號</label>
					    <input type="text" class="form-control" id="registerUserName" aria-describedby="registerUserNameHelp1 registerUserNameHelp2" pattern="[\w]{8,16}" required minlength="8" maxlength="16" autocomplete="off">
						<small id="registerUserNameHelp1" class="form-text text-align-center">必須為 大小寫英文字 或數字 或底線_</small>
					    <small id="registerUserNameHelp2" class="form-text text-align-center">必須為 8 至 16 個字元</small>
					</div>
				  	<div class="form-group">
					    <label for="registerUserPassword">密碼</label>
					    <input type="password" class="form-control" id="registerUserPassword" pattern="[\W]{8,16}" required minlength="8" maxlength="16">
				  	</div>
  					<button type="submit" class="btn btn-primary">Sign Up</button>
				</form>
		  	</div>
		  	<div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">789</div>
		</div>
	</div>	
</body>
</html>