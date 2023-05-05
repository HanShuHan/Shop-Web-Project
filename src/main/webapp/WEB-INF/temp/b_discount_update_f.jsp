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
<style>
.img {
	width: 320px;
	height: 180px;
}
</style>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script>
	//月曆套件
	$(function() {
		$("#datepicker").datepicker({
			changeMonth : true,
			changeYear : true
		});
	});

	//上傳圖片預覽  
	var loadFile = function(event) {
		var output = document.getElementById('output');
		output.src = URL.createObjectURL(event.target.files[0]);
		output.onload = function() {
			URL.revokeObjectURL(output.src)
		}
	};

	//檢查活動名稱
	function checkNM() {
		var fixedName = document.getElementById("fixedName");
		let fixedNamestr = fixedName.value;
		let nmspstr = document.getElementById("nmsp");
		//檢查是否為兩個字以上
		if (/^.{2,}$/.test(fixedNamestr)) {
			nmspstr.innerHTML = `<img style="width :10px","" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource/3fa62acd2f04022f50c3238284631ab6.png">OK!`;
		} else {
			nmspstr.innerHTML = `<img style="width :10px" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource-thumbnail/aaa5ea30708aef68af78543f707fe55c.png">格式錯誤，請重新輸入`;
		}
	}

	//檢查低消 
	function checkAMC() {
		var fixedMinimumCharge = document.getElementById("fixedMinimumCharge");
		var fixedMinimumChargestr = fixedMinimumCharge.value;
		var fixed = document.getElementById("fixed");
		var fixedstr = fixed.value;
		let fmcspstr = document.getElementById("fmcsp");

		if (/^[0-9]*$/.test(fixedMinimumChargestr)
				&& /\d{1,}$/.test(fixedMinimumChargestr)) { //檢查是否為數字
			if (Number(fixedMinimumChargestr) > Number(fixedstr)) {
				fmcspstr.innerHTML = `<img style="width :10px" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource/3fa62acd2f04022f50c3238284631ab6.png">OK!`;
			} else {
				fmcspstr.innerHTML = `<img style="width :10px" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource-thumbnail/aaa5ea30708aef68af78543f707fe55c.png">最低消費金額須高於折扣金額`;
			}
		} else {
			fmcspstr.innerHTML = `<img style="width :10px" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource-thumbnail/aaa5ea30708aef68af78543f707fe55c.png">請勿空白,並輸入數字`;
		}
	}
	//檢查折扣金額 
	function checkA() {
		var fixedMinimumCharge = document.getElementById("fixedMinimumCharge");
		var fixedMinimumChargestr = fixedMinimumCharge.value;
		var fixed = document.getElementById("fixed");
		var fixedstr = fixed.value;
		let fspstr = document.getElementById("fsp");

		if (/^[0-9]*$/.test(fixedstr) && /\d{1,}$/.test(fixedstr)) { //檢查是否為數字
			if (Number(fixedMinimumChargestr) > Number(fixedstr)) {
				fspstr.innerHTML = `<img style="width :10px" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource/3fa62acd2f04022f50c3238284631ab6.png">OK!`;
			} else {
				fspstr.innerHTML = `<img style="width :10px" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource-thumbnail/aaa5ea30708aef68af78543f707fe55c.png">折扣金額需低於最低消費金額`;
			}
		} else {
			fspstr.innerHTML = `<img style="width :10px" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource-thumbnail/aaa5ea30708aef68af78543f707fe55c.png">請勿空白,並輸入數字`;
		}
	}
	//送出檢查
	function checkSubit() {
		let sbstr = document.getElementById("sbstr");
		var fixedName = document.getElementById("fixedName");
		var fixedNamestr = fixedName.value;
		var fixedTime = document.getElementById("datepicker");
		var fixedTimestr = fixedTime.value;
		var fixedMinimumCharge = document.getElementById("fixedMinimumCharge");
		var fixedMinimumChargestr = fixedMinimumCharge.value;
		var fixed = document.getElementById("fixed");
		var fixedstr = fixed.value;

		if (/^.{2,}$/.test(fixedNamestr)
				&& /^((((0[13578])|([13578])|(1[02]))[\/](([1-9])|([0-2][0-9])|(3[01])))|(((0[469])|([469])|(11))[\/](([1-9])|([0-2][0-9])|(30)))|((2|02)[\/](([1-9])|([0-2][0-9]))))[\/]\d{4}$|^\d{4}$/
						.test(fixedTimestr)
				&& /^[0-9]*$/.test(fixedMinimumChargestr)
				&& /\d{1,}$/.test(fixedMinimumChargestr)
				&& /^[0-9]*$/.test(fixedstr) && /\d{1,}$/.test(fixedstr)
				&& Number(fixedMinimumChargestr) > Number(fixedstr)) {
			return true;
		} else {
			sbstr.innerHTML = `<img style="width :10px" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource-thumbnail/aaa5ea30708aef68af78543f707fe55c.png">請輸入正確`;
			return false;
		}

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
							<h1 class="m-0">活動管理</h1>
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
									<div>
										<form:form class="form" action="${contextRoot}/updateFixeds"
											modelAttribute="fixeds" method="post"
											enctype="multipart/form-data" onsubmit="return checkSubit()">
											<form:input type="hidden" path="fixedId" />

											<div>
												<label>活動名稱:</label>
												<form:input path="fixedName" id="fixedName"
													onblur="checkNM()" />
												<span id="nmsp" style="font-size: 10px;"></span>
											</div>
											<div>
												<img class="img"
													src='<c:url value="/showImageFixed/${fixeds.fixedId}"/>'
													onerror="this.src='http://pic.616pic.com/ys_bnew_img/00/04/81/RWvymh6QCe.jpg'">
<!-- 												<span>更換新照片為====></span> <img class="img" id="output" -->
<!-- 													src="http://pic.616pic.com/ys_bnew_img/00/04/81/RWvymh6QCe.jpg" /> -->
												<label>活動照片:</label>
												<form:input type="file" name="image" id="image"
													path="fixedImage" accept="image/*"
													onchange="loadFile(event)" />
											</div>
											<div>
												<label>活動時間:</label>
												<form:input path="fixedTime" id="datepicker"
													name="fixedTime" autocomplete="off" />
											</div>
											<div>
												<form:radiobutton path="fixedOnOff" value="1" />
												開始活動
												<form:radiobutton path="fixedOnOff" value="0" />
												關閉活動
											</div>
											<div>
												<label>最低消費金額:</label>
												<form:input path="fixedMinimumCharge"
													id="fixedMinimumCharge" onblur="checkAMC()" />
												<span id="fmcsp" style="font-size: 10px;"></span>
											</div>
											<div>
												<label>折扣金額:</label>
												<form:input path="fixed" id="fixed" onblur="checkA()" />
												<span id="fsp" style="font-size: 10px;"></span>
											</div>
											<span id="sbstr" style="font-size: 10px;"></span>
											<button type="submit" name="submit"
												onsubmit="return checkSubit()">修改</button>
											<a href="${contextRoot}/viewFixeds"><button type="button">返回</button></a>
										</form:form>
										
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