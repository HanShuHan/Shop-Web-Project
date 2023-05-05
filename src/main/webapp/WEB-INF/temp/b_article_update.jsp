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
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome Icons -->
<link rel="stylesheet" href="${contextRoot}/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${contextRoot}/css/adminlte.min.css">
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
							<h1 class="m-0">文章管理</h1>
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
									<h5 class="card-title">文章預覽</h5><br>
									<hr><br>
										<form:form class="form" action="${contextRoot}/editArticle"
										modelAttribute="post" method="post">
										<form:input type="hidden" path="id"></form:input>
										<form:input type="hidden" path="added"/>
										<label class="post-title">文章標題</label>
										<label class="post-title">|類型：</label>
										<select name="type">
												<option value="科技">科技</option>
												<option value="美妝">美妝</option>
												<option value="美食">美食</option>
												<option value="旅遊">旅遊</option>
												<option value="趣事">趣事</option>
												<option value="新聞">新聞</option>
											</select>
										<br>
										<form:input class="form-control" required="required" value="${post.posttitle}" path="Posttitle"/>
										<p/><br>
										<label>內容</label><br>
										<form:textarea id="postcontent"  required="required" name="postcontent" value="${post.postcontent}" path="Postcontent" />
										<script>
											var editor = CKEDITOR.replace('postcontent');
											CKFinder.setupCKEditor(editor, 'ckfinder/');
										</script>
										<p/>
										<br>
										&nbsp;&nbsp;&nbsp;
										<button type="submit" name="submit" class="btn btn-primary" >更新</button>
										<a href="${contextRoot}/barindex"><button type="button" class="btn btn-primary" >返回</button></a>
									</form:form>
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
	<script>
		$(function() {
			// 上傳預覽
			let w = 100
			$("#image").on("change", function() {
				const file = this.files[0];
				const objectURL = URL.createObjectURL(file);
				$("#big-image").css({
					width : w
				}).attr('src', objectURL)
			});
		})
	</script>
	<script>
		function checkAC() {
			var account = document.getElementById("ac");
			let accountstr = account.value;
			let acspstr = document.getElementById("acsp");
			if (/^(?=.*[a-zA-Z])(?=.*\d)[A-Za-z\d]{8,}$/.test(accountstr)
					&& /^[^\s]*$/.test(accountstr)) {
				acspstr.innerHTML = ``;
			} else {
				acspstr.innerHTML = `<img style="width :10px" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource-thumbnail/aaa5ea30708aef68af78543f707fe55c.png">請輸入至少有一個英數字，八碼以上帳號`;
			}
		}

		function checkPW() {
			var pwd = document.getElementById("pw");
			let pwdstr = pwd.value;
			let pwspstr = document.getElementById("pwsp");
			if (/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/
					.test(pwdstr)) {
				pwspstr.innerHTML = ``;
			} else {
				pwspstr.innerHTML = `<img style="width :10px" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource-thumbnail/aaa5ea30708aef68af78543f707fe55c.png">請輸入至少一個英文數字特殊字元，八碼以上密碼。`;
			}
		}

		function checkNM() {
			var name = document.getElementById("name");
			let nmstr = name.value;
			let nmspstr = document.getElementById("nmsp");
			if (/^[\u4e00-\u9fa5]{2,}$/.test(nmstr)) {
				nmspstr.innerHTML = ``;
			} else {
				nmspstr.innerHTML = `<img style="width :10px" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource-thumbnail/aaa5ea30708aef68af78543f707fe55c.png">請輸入兩個字以上的中文字`;
			}
		}

		function checkTel() {
			var name = document.getElementById("tel");
			let tlstr = name.value;
			let tlspstr = document.getElementById("telsp");
			if (/^09[0-9]{8}$/.test(tlstr)) {
				tlspstr.innerHTML = ``;
			} else {
				tlspstr.innerHTML = `<img style="width :10px" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource-thumbnail/aaa5ea30708aef68af78543f707fe55c.png">請輸入手機號碼`;
			}
		}

		function validate() {
			var account = document.getElementById("ac");
			let accountstr = account.value;
			var pwd = document.getElementById("pw");
			let pwdstr = pwd.value;
			var name = document.getElementById("name");
			let nmstr = name.value;
			var tel = document.getElementById("tel");
			let tellstr = tel.value;
			var patternA1 = /^(?=.*[a-zA-Z])(?=.*\d)[A-Za-z\d]{8,}$/;
			var patternA2 = /^[^\s]*$/;
			var patternP = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
			var patternN = /^[\u4e00-\u9fa5]{2,}$/;
			var patternM = /^09[0-9]{8}$/;
			let rsp = document.getElementById("rsp");
			if (patternA1.test(accountstr) && patternA2.test(accountstr)
					&& patternP.test(pwdstr) && patternN.test(nmstr)
					&& patternM.test(tellstr)) {
			} else {
				rsp.innerHTML = `<img style="width :10px" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource-thumbnail/aaa5ea30708aef68af78543f707fe55c.png">填寫資訊有誤，請檢察。`;
				return false;
			}
		}
	</script>

</body>
</html>