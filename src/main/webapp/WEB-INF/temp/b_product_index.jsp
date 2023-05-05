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
<!-- <script type="text/javascript" charset="utf8" -->
<!-- src="http://cdn.datatables.net/1.10.15/js/jquery.dataTables.js"></script> -->
<!-- jQuery -->
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${contextRoot}/js/adminlte.min.js"></script>
<!-- Page js -->
<script src="${contextRoot}/js/b_product_index.js"></script>
<!-- CDN -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body  data-web_url="${pageContext.request.contextPath}">
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
							<h1 class="m-0">商品管理</h1>
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
								<a href="${contextRoot}/addProduct"><button class="btn btn-info">新增商品</button></a><br>	<hr>
									<h5 class="card-title">商品列表</h5><br>
									<div class="table-responsive">
										<table class="table table-striped table-sm" id="table_id">
											<thead>
												<tr>
													<th>No.</th>
													<th>商品照片</th>
													<th>商品名稱</th>
													<th>商品售價</th>
													<th>商品類別</th>
													<th>商品簡述</th>
													<th>上架狀態</th>
													<th>設定</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="products" items="${products}" varStatus="s">
													<tr>
														<td><c:out value="${s.count}"></c:out></td>
														<td><a href="${contextRoot}/onePR?id=${products.productId}"><img width="100" src='<c:url value="/showImage1/${products.productId}"/>'></a></td>
														<td><a href="${contextRoot}/onePR?id=${products.productId}"><c:out value="${products.name}"></c:out></a></td>
														<td style="color: red;">NT$ <c:out value="${products.price}"></c:out></td>
														<td style="color: green;"><c:out value="${products.category.type}"></c:out></td>
														<td><c:out value="${products.detail1}"></c:out></td>
														<td>
															<c:choose>
																<c:when test="${products.productStatus.id == 0}">
																	<button id="change-product-status-btn-${s.count}" type="button" class="btn btn-outline-warning product-status-btn"
																		data-product_id="${products.productId}" data-product_status_id="${products.productStatus.id}"
																		data-product_status_0="${productStatusList.get(0).status}" data-product_status_1="${productStatusList.get(1).status}"
																		data-product_name="${products.name}">
																		<span><b><c:out value="${products.productStatus.status}"/></b></span>
																	</button>
																</c:when>
																<c:otherwise>
																	<button id="change-product-status-btn-${s.count}" type="button" class="btn btn-warning product-status-btn"
																		data-product_id="${products.productId}" data-product_status_id="${products.productStatus.id}"
																		data-product_status_0="${productStatusList.get(0).status}" data-product_status_1="${productStatusList.get(1).status}"
																		data-product_name="${products.name}">
																		<span><b><c:out value="${products.productStatus.status}"/></b></span>
																	</button>
																</c:otherwise>
															</c:choose>
														</td>
														<td>
															<div>
<%-- 																<a href="${contextRoot}/deleteProduct?id=${products.productId}" onClick="return confirm('確定刪除?');"> --%>
																	<button class="btn btn-sm btn-danger delete-btn" data-product_id="${products.productId}" data-product_name="${products.name}">
																		<img src="${contextRoot}/css/images/trash3.svg">
																	</button>
<!-- 																</a> -->
															</div>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
									<script
										src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
									<script>
										$(document).ready(function() {
											$('#table_id').DataTable();
										});
									</script>
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