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
<title>Contact Page</title>
<!-- Style-CSS -->
<link rel="stylesheet" href="${contextRoot}/css/style.css" type="text/css" media="all" />  
<!-- font-awesome-icons -->
<link href="${contextRoot}/css/font-awesome.css" rel="stylesheet">
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link href="//fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900" rel="stylesheet">
<!-- Font Awesome Icons -->
<link rel="stylesheet" href="${contextRoot}/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${contextRoot}/css/adminlte.min.css">
<link rel="stylesheet" href="${contextRoot}/css/loginPage.css" />
<script src="${contextRoot}/js/loginPage.js"></script>
<!-- jQuery -->
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${contextRoot}/js/adminlte.min.js"></script>
 <script>
      addEventListener("load", function() {
          setTimeout(hideURLbar, 0);
      }, false);

      function hideURLbar() {
          window.scrollTo(0, 1);
      }
  </script>
    <style>
	.menu {
		font-size: 20px;
	}
		#big-head, #cart-img {
		width: 20px;
		height: 20px;
	}
</style>
</head>
<body>
   <!-- 置頂區塊 -->
    <div class="main-banner inner" id="home">
         <!-- 上標 -->
        <header class="header">
            <div class="container-fluid px-lg-5">
                <!-- 導航 -->
                <nav class="py-4">
                    <div id="logo">
                        <h1> <a href="${contextRoot}/">A-Jen Sport</a></h1>
                    </div>
                    <label for="drop" class="toggle">Menu</label>
                    <input type="checkbox" id="drop" />
                    <ul class="menu mt-2">
                        <li class="active"><a href="${contextRoot}/">Home</a></li>
                        <li><a href="${contextRoot}/about">About</a></li>
                        <li><a href="${contextRoot}/blog">Blog</a></li>
						<li><a href="${contextRoot}/shop">Products</a>
                            <label for="drop-2" class="toggle">Products</label>
                            <input type="checkbox" id="drop-2" />
                            <ul>
                                <li><a href="${contextRoot}/shop">All</a></li>
                            	<c:forEach var="category" items="${categoriesList}" varStatus="status">
	                                <li>
	                                	<a href="${contextRoot}/shop?type${status.count}=${category.type}">
	                                		<c:out value="${category.type}"/>
	                                	</a>
	                                </li>
                            	</c:forEach>
                            </ul>
						</li>
						<li><a href="${contextRoot}/contact">Contact</a></li>
                        <li>
						<c:choose>
								<c:when test="${sessionScope.accountId == null}">
									<a href="${contextRoot}/register"> Register/Login </a>
								</c:when>
								<c:otherwise>
									<a href="${contextRoot}/account?id=${sessionScope.accountId}">										
										<img id="cart-img" src="${contextRoot}/css/images/member.png"
										width="9"
										data-user_id="${sessionScope.accountId}"
										data-web_url="${pageContext.request.contextPath}">
										<span><c:out value="${sessionScope.ac}" /></span>
									</a>
									<a href="${contextRoot}/logout"><span>|LogOut</span></a>
								</c:otherwise>
							</c:choose>
						</li>
                        <li>
                        	<c:choose>
                        		<c:when test="${sessionScope.accountId == null}">
	                        		<a href="${contextRoot}/register">
										<img id="cart-img" src="${contextRoot}/css/images/cart2.svg">
									</a>
                        		</c:when>
                        		<c:otherwise>
                        			<a href="<c:url value='/myCartList/accountId/${sessionScope.accountId}'/>">
										<img id="cart-img" src="${contextRoot}/css/images/cart2.svg" data-user_id="${sessionScope.accountId}">
									</a>
									<span id="show-number-in-cart" style="color: yellow;">
										<c:if test="${sessionScope.numberInCart > 0}">
											<b><c:out value="${sessionScope.numberInCart}"/></b>
										</c:if>
									</span>
                        		</c:otherwise>
                        	</c:choose>
                        </li>
					</ul>
                </nav>
                <!-- //導航 -->
            </div>
        </header>
        <!-- //上標 -->

    </div>
    <!--//置頂區塊-->
    <!--當前位址提示-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="${contextRoot}/">Home</a>
        </li>
        <li class="breadcrumb-item active">聯絡我們</li>
    </ol>
	<!--當前位址提示 -->
	<!-- 聯絡我主區塊 -->
	<section class="ab-info-main py-md-5">
        <div class="container py-md-3">
            <h3 class="tittle text-center mb-lg-5 mb-3">--聯絡我們--</h3>
            <div class="speak px-lg-5">
                <div class="single-form-left">
                    <!-- contact form grid -->
                    <div class="contact-single">
                        <h3><span class="sub-tittle"></span>留下您的留言</h3>
                        <form:form class="form" action="${contextRoot}/cusReply?id=${sessionScope.accountId}"
										modelAttribute="reply" method="post">
                            <div class="form-group">
                            	<div class="col-sm-6 form-group p-0">
                                    <label for="contactusername">主旨</label>
                                    <form:input path="title" type="text" class="form-control border" required="required"></form:input>
                                </div>
                                <label for="contactcomment">內容：</label>
                                <form:textarea path="message" class="form-control border" rows="5" required="required"></form:textarea>
                            </div>
                            <form:input type="hidden" path="accountid" value="${sessionScope.accountId}"></form:input>
                            <button type="submit" class="mt-3 btn btn-success btn-block py-3">送出</button>
                        </form:form>
                    </div>
                    <!--  //contact form grid ends here -->
                </div>
                <c:forEach var="replys" items="${replys}">
                <div class="media py-5">
                
                    <img width="80" src='<c:url value="/acimage/${sessionScope.accountId}"/>' class="mr-3 img-fluid rounded-circle" alt="image">
                    <div class="media-body">
                        <h5 class="mt-0">${sessionScope.ac}</h5>
                        <h6 class="mt-0">${replys.title}</h6>
                        <span>送出時間：<fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${replys.added}"></fmt:formatDate></span>
                        <p class="mt-2">${replys.message}</p>
                        <div class="media mt-5">
                            <div class="media-body">
                                <h5 class="mt-0">客服人員</h5>
                                <c:choose>
                        		<c:when test="${replys.replymessage == null}">
	                        		<p class="mt-2">尚未回覆</p>
                        		</c:when>
                        		<c:otherwise>
                        			<p class="mt-2">${replys.replymessage}</p>
                        			<p class="mt-2">回復於：<fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${replys.replyadded}"></fmt:formatDate></p>
                        		</c:otherwise>
                        	</c:choose>
                            </div>
                        </div>
                    </div>
                </div></c:forEach>
            </div>
        </div>
    </section>
	<!-- 聯絡我主區塊 -->
    <!-- 標底 -->
    <footer>
        <div class="container">
            <div class="row footer-top">
                <div class="col-lg-4 footer-grid_section_w3layouts">
                    <p class="col-md-10">© 2022 A-Jen Sport. All rights reserved | Design by
                            <a href="https://www.ispan.com.tw/longterm/JJEEITT">資展國際 EEIT138.</a>
                        </p>                   
                </div>
            </div>
        </div>
    </footer>
    <!-- //標底 -->
</body>
</html>