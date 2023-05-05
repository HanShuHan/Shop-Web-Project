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
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<style type="text/css">
.invoice {
    background: #fff;
    padding: 20px
}

.invoice-company {
    font-size: 20px
}

.invoice-header {
    margin: 0 -20px;
    background: #f0f3f4;
    padding: 20px
}

.invoice-date,
.invoice-from,
.invoice-to {
    display: table-cell;
    width: 1%
}

.invoice-from,
.invoice-to {
    padding-right: 20px
}

.invoice-date .date,
.invoice-from strong,
.invoice-to strong {
    font-size: 16px;
    font-weight: 600
}

.invoice-date {
    text-align: right;
    padding-left: 20px
}

.invoice-price {
    background: #f0f3f4;
    display: table;
    width: 100%
}

.invoice-price .invoice-price-left,
.invoice-price .invoice-price-right {
    display: table-cell;
    padding: 20px;
    font-size: 20px;
    font-weight: 600;
    width: 75%;
    position: relative;
    vertical-align: middle
}

.invoice-price .invoice-price-left .sub-price {
    display: table-cell;
    vertical-align: middle;
    padding: 0 20px
}

.invoice-price small {
    font-size: 12px;
    font-weight: 400;
    display: block
}

.invoice-price .invoice-price-row {
    display: table;
    float: left
}

.invoice-price .invoice-price-right {
    width: 25%;
    background: #2d353c;
    color: #fff;
    font-size: 28px;
    text-align: right;
    vertical-align: bottom;
    font-weight: 300
}

.invoice-price .invoice-price-right small {
    display: block;
    opacity: .6;
    position: absolute;
    top: 10px;
    left: 10px;
    font-size: 12px
}

.invoice-footer {
    border-top: 1px solid #ddd;
    padding-top: 10px;
    font-size: 10px
}

.invoice-note {
    color: #999;
    margin-top: 80px;
    font-size: 85%
}

.invoice>div:not(.invoice-footer) {
    margin-bottom: 20px
}

.btn.btn-white, .btn.btn-white.disabled, .btn.btn-white.disabled:focus, .btn.btn-white.disabled:hover, .btn.btn-white[disabled], .btn.btn-white[disabled]:focus, .btn.btn-white[disabled]:hover {
    color: #2d353c;
    background: #fff;
    border-color: #d9dfe3;
}
</style>
<script>
	addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);

	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>
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
							<h1 class="m-0">訂單管理</h1>
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
								 <a class="btn btn-sm btn-primary" href="${contextRoot}/borindex">返回</a>
										<br><br>
										<section class="ab-info-main py-md-5 py-4">
											<div class="container">
											   <div class="col-md-12">
											      <div class="invoice">
											         <!-- begin invoice-company -->
											         <div class="invoice-company text-inverse f-w-600">
											            訂單查詢
											         </div>
											         <!-- end invoice-company -->
											         <!-- begin invoice-header -->
											         <div class="invoice-header">
											            <div class="invoice-from">
											               <small>會員資訊</small>
											               <address class="m-t-5 m-b-5">
											                  <strong class="text-inverse"><c:out value="${account.ac}"></c:out></strong><br>
											                  <c:out value="${account.aname}"></c:out><br>
											                  <c:out value="${account.mail}"></c:out><br>
											                  Phone: <c:out value="${account.phone}"></c:out>
											               </address>
											            </div>
											            <div class="invoice-date">
											               <small>訂單編號</small>
											               <div class="date text-inverse m-t-5"></div>
											            </div>
											         </div>
											         <!-- end invoice-header -->
											         <!-- begin invoice-content -->
											         <div class="invoice-content">
											            <!-- begin table-responsive -->
											            <div class="table-responsive">
											               <table class="table table-invoice">
											               <c:forEach items="${OrderDetail}" var="OrderDetail" varStatus="s">
											                  <thead>
											                     <tr>
											                        <th>購買資訊</th>
											                        <th class="text-center" width="10%">單價</th>
											                        <th class="text-center" width="10%">數量</th>
											                        <th class="text-right" width="20%">價格</th>
											                     </tr>
											                  </thead>
											                  <tbody>
											                     <tr>
											                        <td>
											                           <c:if test="${OrderDetail.product.coverImage1 != null}">
																				<img width="50" class="image1" alt=""
																					src='<c:url value="/showImage1/${OrderDetail.product.productId}"/>'>
																	   </c:if>
											                           <span class="text-inverse">${OrderDetail.product.name}</span><br>
											                        </td>
											                        <td class="text-center">${OrderDetail.product.price}</td>
											                        <td class="text-center">${OrderDetail.quantity}</td>
											                        <td class="text-right">${OrderDetail.price}</td>
											                     </tr>
											                  </tbody>
											                  </c:forEach>
											               </table>
											            </div>
											            <!-- end table-responsive -->
											            <!-- begin invoice-price -->
											            <div class="invoice-price">
											               <div class="invoice-price-left">
											                  <div class="invoice-price-row">
											                     <div class="sub-price">
											                        <small>付款狀態</small>
											                        <span class="text-inverse">${OrderBean.tradeDesc}</span>
											                        <small>綠界單號</small>
											                        <span class="text-inverse">${OrderBean.tradeNo}</span>
											                     </div>
											                     <div class="sub-price">
											                        <small>貨運狀態</small>
											                        <span class="text-inverse">${OrderBean.rtnMsgL}</span>
											                        <small>貨運單號</small>
											                        <span class="text-inverse">${OrderBean.allPayLogisticsID}</span>
											                     </div>
											                  </div>
											               </div>
											               <div class="invoice-price-right">
											                  <small>結帳金額</small> <span class="f-w-600">${OrderBean.totalAmount}</span>
											               </div>
											            </div>
											            <!-- end invoice-price -->
											         </div>
											      </div>
											   </div>
											</div>
									</section>
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