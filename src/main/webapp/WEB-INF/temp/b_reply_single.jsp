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
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome Icons -->
<link rel="stylesheet" href="${contextRoot}/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${contextRoot}/css/adminlte.min.css">
<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css"
	href="http://cdn.datatables.net/1.10.15/css/jquery.dataTables.css">
<!-- DataTables -->
<script type="text/javascript" charset="utf8"
	src="http://cdn.datatables.net/1.10.15/js/jquery.dataTables.js"></script>
<!-- jQuery -->
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${contextRoot}/js/adminlte.min.js"></script>
</head>
<body>
	<div class="wrapper">
		<!-- 上方導航欄 -->
		<nav
			class="main-header navbar navbar-expand navbar-white navbar-light">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item d-none d-sm-inline-block"><a
					href="${contextRoot}/index_b" class="nav-link">首頁</a></li>
				<li class="nav-item d-none d-sm-inline-block"><a href="#"
					class="nav-link">聯絡開發人員</a></li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link"
					data-widget="fullscreen" href="#" role="button">切換全螢幕</a></li>
			</ul>
		</nav>
		<!-- 結束 -->

		<!-- 左側導航欄 -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- 商標LOGO -->
			<a href="${contextRoot}/index_b" class="brand-link"> <span
				class="brand-text font-weight-light">A-Jen Sport</span> <span
				class="brand-text font-weight-light">商店管理平台</span>
			</a>

			<!-- 導航欄 -->
    <div class="sidebar">
      <!-- 使用者顯示 -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src='<c:url value="/showImage/${sessionScope.adminId}"/>' class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="${contextRoot}/index_b" class="d-block">${sessionScope.ad}</a>
        </div>
      </div>

      <!-- 導航菜單 -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <li class="nav-item">
            <a href="${contextRoot}/badindex" class="nav-link">管理員/權限</a>
          </li>
          <li class="nav-item">
            <a href="${contextRoot}/bacindex" class="nav-link">會員管理</a>
          </li>
          <li class="nav-item">
            <a href="${contextRoot}/bprindex" class="nav-link">商品管理</a>
          </li>
          <li class="nav-item">
            <a href="${contextRoot}/borindex" class="nav-link">訂單管理</a>
          </li>
          <li class="nav-item">
            <a href="${contextRoot}/viewDiscounts" class="nav-link">活動管理</a>
          </li>
          <li class="nav-item">
            <a href="${contextRoot}/barindex" class="nav-link">文章管理</a>
          </li>
          <li class="nav-item">
            <a href="${contextRoot}/breindex" class="nav-link">訊息管理</a>
          </li>
          <li class="nav-item">
          	<a href="${contextRoot}/adlogout" class="nav-link">登出</a>
          </li>
        </ul>
      </nav>
      <!-- 菜單結束 -->
    </div>   
  </aside>
  <!-- 左側導航結束 -->
		<!-- 內容 -->
		<div class="content-wrapper">
			<!-- 標頭 -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0">訊息管理</h1>
						</div>
					</div>
				</div>
			</div>
			<!-- 標頭結束 -->

			<!-- 主頁內容 -->
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-12">
							<div class="card">
								<div class="card-body">
									<div class="speak px-lg-5">
										<div class="single-form-left">
											<!-- contact form grid -->
											<div class="contact-single">
												<h3>
													<span class="sub-tittle"></span>回覆顧客留言
												</h3>
												<form:form class="form"
													action="${contextRoot}/b_reply_single?id=${reply.id}"
													modelAttribute="reply" method="post">
													<form:input type="hidden" path="id" />
													<form:input type="hidden" path="message" />
													<form:input type="hidden" path="title" />
													<form:input type="hidden" path="added" />
													<form:input type="hidden" path="accountid" />
													<div class="form-group">
														<label for="contactcomment">回復內容：</label>
														<form:textarea path="replymessage"
															class="form-control border" rows="5" required="required"></form:textarea>
													</div>
													<button type="submit"
														class="mt-3 btn btn-success btn-block py-3">送出</button>
												</form:form>
											</div>
											<!--  //contact form grid ends here -->
										</div>
										<div class="media py-5">
											<div class="media-body">
												<h5 class="mt-0">${ac.ac}</h5>
												<h6 class="mt-0">${reply.title}</h6>
												<span>送出時間：<fmt:formatDate
														pattern="yyyy/MM/dd HH:mm:ss" value="${reply.added}"></fmt:formatDate></span>
												<p class="mt-2">${reply.message}</p>
												<div class="media mt-5">
													<div class="media-body">
														<h5 class="mt-0">客服人員</h5>
														<c:choose>
															<c:when test="${reply.replymessage == null}">
																<p class="mt-2">尚未回覆</p>
															</c:when>
															<c:otherwise>
																<p class="mt-2">${reply.replymessage}</p>
																<p class="mt-2">
																	回復於：
																	<fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss"
																		value="${reply.replyadded}"></fmt:formatDate>
																</p>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</div><a class="btn btn-sm btn-primary" href="${contextRoot}/breindex">返回</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 內容結束 -->

		<!-- 尾標 -->
		<footer class="main-footer">
			<!-- 內容 -->
			<strong>Copyright &copy; 2021-2022 <a href="#">EEIT38
					Group 3</a>.
			</strong> All rights reserved.
		</footer>
	</div>
	<!-- 結束 -->


</body>
</html>