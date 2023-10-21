<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>top-bar</title>

<!-- Custom fonts for this template-->
<link href="resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">

<style type="text/css">
.modal {
	top: 45px;
	width: 120px;
	left: 1537px;
	height: auto;
}
</style>

</head>
<body>



	<!-- 모달 창 -->
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close" style="margin-left: 100px; onclick="closeModal()">&times;</span>
			<input type="text" id="newSessionValue" placeholder="세션 값 입력">
			<button onclick="updateSessionValue()">변경</button>
		</div>
	</div>


	<!-- Topbar -->
	<nav
		class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

		<!-- Sidebar Toggle (Topbar) -->
		<button id="sidebarToggleTop"
			class="btn btn-link d-md-none rounded-circle mr-3">
			<i class="fa fa-bars"></i>
		</button>



		<!-- Topbar Navbar -->
		<ul class="navbar-nav ml-auto">

			<!-- Nav Item - Search Dropdown (Visible Only XS) -->
			<li class="nav-item dropdown no-arrow d-sm-none"><a
				class="nav-link dropdown-toggle" href="#" id="searchDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
			</a> <!-- Dropdown - Messages -->
				<div
					class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
					aria-labelledby="searchDropdown">
					<form class="form-inline mr-auto w-100 navbar-search">
						<div class="input-group">
							<input type="text" class="form-control bg-light border-0 small"
								placeholder="Search for..." aria-label="Search"
								aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button class="btn btn-primary" type="button">
									<i class="fas fa-search fa-sm"></i>
								</button>
							</div>
						</div>
					</form>
				</div></li>

			<td class="btn_bgtd_timeout" align="right"><script
					type="text/javascript" charset="utf-8"
					src="/js_std/kor/util/timeoutchk.js"></script> <span id="timer"
				style="position: relative; top: 24px;"></span> &nbsp; <a
				href="javascript:refreshTimer();"><img
					src="${pageContext.request.contextPath}/resources/img/icon_reload.png"
					align="top"
					style="position: relative; top: 21px; height: 1rem; width: 1rem;">
					</a>&nbsp;&nbsp;&nbsp;</td>

			<div class="topbar-divider d-none d-sm-block"></div>

			<!-- Nav Item - User Information -->
			<li class="nav-item dropdown no-arrow"><a
				class="nav-link dropdown-toggle" href="#" id="userDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <span
					class="mr-2 d-none d-lg-inline text-gray-600 ">${sessionScope.empId}
						/ ${sessionScope.empName} 님</span> <!-- 프로필사진 가져오기 --> <%
 String empPhoto = (String) session.getAttribute("empPhoto");
 // 사진을 등록하지 않았을 경우 기본 이미지(test.png)로 보이게
 String imgSrc = empPhoto != null ? empPhoto : request.getContextPath() + "/resources/img/test.png";
 %> <img class="img-profile rounded-circle"
					src="${pageContext.request.contextPath }/resources/upload/${sessionScope.empPhoto}"
					style="position: relative; top: -3px; border: solid 1px black;">
					<!-- // 프로필사진 가져오기 -->



			</a> <!-- Dropdown - User Information -->
				<div
					class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
					aria-labelledby="userDropdown">
					<a class="dropdown-item"
						onclick="openProfile('${sessionScope.empId}')"> <i
						class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 내 정보
					</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item"
						href="${pageContext.request.contextPath}/employee/logout"> <i
						class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
						로그아웃
					</a>
				</div></li>

		</ul>

	</nav>
	<!-- End of Topbar -->

	<!-- Bootstrap core JavaScript-->
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="resources/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="resources/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="resources/js/demo/chart-area-demo.js"></script>
	<script src="resources/js/demo/chart-pie-demo.js"></script>



	<!-- 스크립트  -->

	<script type="text/javascript">
	

		//사원 상세내용 새창
		function openProfile(empId) {
			// 연결되는지 보기위해
			//     var url = '${pageContext.request.contextPath}/employee/employeeDetails';
			var url = '${pageContext.request.contextPath}/employee/employeeDetails?empId='
					+ empId;
			var windowWidth = 500;
			var windowHeight = 1250;
			var windowLeft = (screen.width - windowWidth) / 2;
			var windowTop = (screen.height - windowHeight) / 2;
			var newWindow = window.open(url, '_blank', 'width=' + windowWidth
					+ ', height=' + windowHeight + ', left=' + windowLeft
					+ ', top=' + windowTop);
		}

		//세션 타이머 및 로그아웃
		var iSecond; // 초 단위로 환산
		var timerchecker = null;

		window.onload = function() {
			fncClearTime();
			initTimer();
		}

		function fncClearTime() {
			iSecond = 3600; // 세션 시간을 초 단위로 설정 (예: 3시간 60*180분 / 계산 60*n분)
		}

		function initTimer() {
			var timer = document.getElementById("timer");

			if (iSecond > 0) {
				timer.innerHTML = formatTime(iSecond);
				iSecond--;
				timerchecker = setTimeout(initTimer, 1000); // 1초 간격으로 함수를 호출
			} else {
				window.alert("세션이 만료되었습니다. 로그아웃됩니다.");
				window.location.href = '${pageContext.request.contextPath}/employee/logout';
			}
		}
		function refreshTimer() {
			// 세션 시간을 초기화합니다.
			fncClearTime();

			// 타이머를 재시작합니다.
			clearTimeout(timerchecker);
			initTimer();
		}

		function formatTime(seconds) {
			var hours = Math.floor(seconds / 3600);
			var minutes = Math.floor((seconds % 3600) / 60);
			var remainingSeconds = seconds % 60;
			return "&nbsp;" + Lpad(hours, 2) + "시간 " 
					+ Lpad(minutes, 2) + "분 "
					+ Lpad(remainingSeconds, 2) + "초 ";
			//        + Lpad(hours, 2) + "시간 " 붙여넣으면 시간나옴
		}

		function Lpad(str, len) {
			str = str + "";
			while (str.length < len) {
				str = "0" + str;
			}
			return str;
		}
		// 프로필 사진 가져오기
	</script>

</body>
</html>