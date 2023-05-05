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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script type="text/javascript">
//月曆套件
$(function() {
	$("#datepicker").datepicker({
		changeMonth : true,
		changeYear : true
	});
});
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
							<h1 class="m-0">會員管理</h1>
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

									<form:form action="${contextRoot}/updateAccountBean"
										modelAttribute="AccountBean" method="post"
										enctype="multipart/form-data" onsubmit="#">
										<hr>
										<div class="form-group">
											<form:input type="hidden" path="acid"></form:input>
										</div>
										<div class="pics-row-6">
											<c:if test="${AccountBean.coverImage != null}">
												<img width="100" id="big-image" class="image" alt=""
													src='<c:url value="/acimage/${AccountBean.acid}"/>'>
											</c:if>
											<c:if test="${AccountBean.coverImage == null}">
												<img width="100" id="big-image" class="image" alt="" src=''>
											</c:if>
										</div>
										<label for="image">會員頭像:</label>
										<form:input type="file" name="image" id="image"
											path="image" accept="image/*" />
										<br>
										<div class="form-group">
											<label>帳號</label>
											<p><c:out value="${AccountBean.ac}"></c:out><br>
											<form:input type="hidden" value="${AccountBean.ac}" path="ac"/>
										</div>
										<div class="form-group">
											<label>密碼</label>
											<form:input value="${AccountBean.pw}" path="pw"/>
										</div>
										<div class="form-group">
											<label>姓名</label>
											<form:input value="${AccountBean.aname}" path="aname"/>
										</div>
										<div class="form-group">
											<label>郵件</label>
											<p><c:out value="${AccountBean.mail}"></c:out><br>
											<form:input type="hidden" value="${AccountBean.mail}" path="mail"/>
										</div>
										<div class="form-group">
											<label>手機</label>
											<form:input value="${AccountBean.phone}" path="phone"/>
										</div>
										<div class="form-group">
											<label>生日</label>
											<fmt:formatDate pattern="yyyy/MM/dd" value="${AccountBean.birth}" var="bt"/>
											<form:input value="${bt}" path="birth" id="datepicker"/>
										</div>
										<label>性別</label><br>
											<select name="sex">
													<option value="女">女</option>
													<option value="男">男</option>
											</select><br><br>
										<form:input type="hidden" path="added"/>
										<span id="rsp" style="font-size: 10px;"></span><br>
										<button type="submit" class="btn btn-primary">修改</button>
										<a href="${contextRoot}/oneAC?id=${AccountBean.acid}"><button
												type="button" class="btn btn-primary">取消</button></a>
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
        $("#big-image").css({width: w})
                        .attr('src', objectURL)
    });})
</script>
	<script>
function checkAC() {
    var account = document.getElementById("ac");
    let accountstr = account.value;
    let acspstr = document.getElementById("acsp");
    if (/^(?=.*[a-zA-Z])(?=.*\d)[A-Za-z\d]{8,}$/.test(accountstr)&& /^[^\s]*$/.test(accountstr)) {
        acspstr.innerHTML = ``;
    } else {
        acspstr.innerHTML = `<img style="width :10px" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource-thumbnail/aaa5ea30708aef68af78543f707fe55c.png">請輸入至少有一個英數字，八碼以上帳號`;
    }
}

function checkPW() {
    var pwd = document.getElementById("pw");
    let pwdstr = pwd.value;
    let pwspstr = document.getElementById("pwsp");
    if (/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/.test(pwdstr)) {
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
	  if (patternA1.test(accountstr) &&
		  patternA2.test(accountstr) &&
		  patternP.test(pwdstr) &&
		  patternN.test(nmstr) &&
		  patternM.test(tellstr)) {	    
	  } else {
		rsp.innerHTML = `<img style="width :10px" src="https://memeprod.sgp1.digitaloceanspaces.com/user-resource-thumbnail/aaa5ea30708aef68af78543f707fe55c.png">填寫資訊有誤，請檢察。`;	  	    	
		return false;
		 }
	}
</script>

</body>
</html>