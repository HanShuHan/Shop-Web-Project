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
<div class="wrapper">
  <!-- 上方導航欄 -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item d-none d-sm-inline-block">
        <a href="${contextRoot}/index_b" class="nav-link">首頁</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="https://www.iiiedu.org.tw/" class="nav-link">聯絡開發人員</a>
      </li>
    </ul>
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" data-widget="fullscreen" href="#" role="button">切換全螢幕</a>
      </li>
    </ul>
  </nav> 
  <!-- 結束 -->

  <!-- 左側導航欄 -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- 商標LOGO -->
    <a href="${contextRoot}/index_b" class="brand-link">
      <span class="brand-text font-weight-light">A-Jen Sport</span>
      <span class="brand-text font-weight-light">商店管理平台</span>
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
      <script type="text/javascript">
      function rankfail() {
    	  alert("權限不足，無法訪問!!");
    	}
      </script>
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
            <h1 class="m-0">管理員平台使用須知</h1>
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
                <h5 class="card-title">系統管理規章</h5>
				<hr>
                <p class="card-text">
                依管理權限另有規範，將依據超級管理員說明為主。<br><br>

				■ 使用聲明<br>
				1.為了提供良好的使用品質，管理員需熟知並遵守以下使用規則，務必確實遵守。<br>
				
				2.如果不同意本系統管理規章之內容，請勿繼續使用本服務。<br>
				
				3.如果繼續使用本服務，則表示同意並接受本管理規章之全部內容。<br>
				<br>
				■ 管理員規章<br>
				1.管理員將有權立即針對平台所有資料進行改動，所有管理員都將嚴格依據誠實和謹慎原則，不徇私。<br>
				
				2.所有管理員必須隨時配合開發人員的詢問及任何方式之測試等要求之義務，並應遵守開發人員的規定，並且不可以對開發人員進行恐嚇或是謾罵等行為。<br>
				
				3.管理員並非開發者，不應介入任何系統開發相關技術問題。<br>
				<br>
				■ 違反管理規章說明<br>
				以上條款得違規、違規多項或情節重大，開發人員有權終止合約。<br>
                </p>
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
    <strong>Copyright &copy; 2021-2022 <a href="#">EEIT38 Group 3</a>.</strong> All rights reserved.
  </footer>
</div>
<!-- 結束 -->

<!-- jQuery -->
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${contextRoot}/js/adminlte.min.js"></script>
</body>
</html>