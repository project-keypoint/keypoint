<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업지시등록</title>
<!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css"
	rel="stylesheet">
<!-- 수주 CSS 적용-->
<link
	href="${pageContext.request.contextPath}/resources/css/receive.css"
	rel="stylesheet">
</head>
<body>
	<div class="main-details">
		<form
			action="${pageContext.request.contextPath}/workOrder/workOrderInsertPro"
			method="post" onsubmit="return validateForm()">
			<div class="forms-group-receive">
				<div class="page-title-popup">작업지시등록</div>
				<div class="form-group-receive-insert">
					<p>수주번호</p>
					<input type="text" id="roCode" name="roCode"
						class="form-control search-input" value="수주번호">
				</div>
				<div class="search-bar-popup">
					<div class="form-group-receive">
						<p>업체코드</p>
						<input type="text" id="cusCode" name="cusCode"
							class="form-control search-input inputcode" value="업체검색" readonly>
						
					</div>
					<div class="form-group-receive">
						<p>상품코드</p>
						<input type="text" id="productCode" name="productCode"
							class="form-control search-input inputcode" value="상품검색" readonly>
						
					</div>
				</div>

				<div class="form-group-receive">
					<p>지시수량</p>
					<input type="number" id="woCount" name="woCount"
						class="form-control search-input" placeholder="지시수량" min="0" readonly>
				</div>
				<div class="form-group-receive">
					<p>라인코드</p>
					<input type="text" id="lineCode" name="lineCode"
						class="form-control search-input" value="라인코드">
				</div>
				<div class="form-group-receive">
					<p>지시일자</p>
					<input type="text" id="woDate" name="woDate"
						class="form-control search-input" value="지시일자">
				</div>
				<div class="form-group-receive">
					<p>납품예정일</p>
					<input type="text" id="shipSdate" name="shipSdate"
						class="form-control search-input" value="납품예정일" readonly >
				</div>
				<div class="form-group-receive">
					<p>상태</p>
					<select id="woStatus" name="woStatus"
						class="form-control search-input status">
						<option value="진행">진행</option>
					</select>
				</div>

				<div class="search-bar-popup">
					<div class="form-group-receive">
						<p>담당자</p>
						<input type="text" id="empId" name="empId"
							class="form-control search-input inputcode" value="사원검색">
						<input type="text" id="empName" name="empName"
							class="form-control search-input inputcode" value="사원명" readonly>
					</div>
				</div>


			</div>
			<div class="details-buttons">
				<input type="submit" value="등록" class="btn btn-primary mybutton1">
				<input type="button" value="취소" class="btn btn-secondary mybutton1"
					onClick="window.close()">
			</div>
		</form>
		<!-- form 끝 -->
	</div>
	<!-- main-details -->

	<!-- 데이트피커 타임피커를 사용하기위한 j쿼리 -->
	<link rel="stylesheet"
		href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<script type="text/javascript">
	var defaultWidth = 500;
	var defaultHeight = 500;
	//팝업 창을 열어주는 함수
	function openPopup(url, width, height) {
	    
		width = width || defaultWidth;
	    height = height || defaultHeight;
	    
	    var left = (screen.width - width) / 2;
	    var top = (screen.height - height) / 2;
	    var popupWindow = window.open(url, '_blank', "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
	    popupWindow.focus();
	}

		$(document).ready(function() {
			// 수주코드 검색 팝업 열기
		$("#roCode, #roCode").click(function() {
			var url = '${pageContext.request.contextPath}/workOrder/workRoCodeList';
			openPopup(url,610,480);
		});
													
		// 라인명 검색 팝업 열기
		$("#lineCode, #lineCode").click(function() {
			var url = '${pageContext.request.contextPath}/workOrder/workLineList';
			openPopup(url,480,485);
		});

		// 사원 검색 팝업 열기
		$("#empId, #empName").click(function() {
			var url = '${pageContext.request.contextPath}/workOrder/workEmpList';
			openPopup(url,550,470);
			});
						});

		// 지시일자 클릭시 현재날짜로 변경
		document.addEventListener('DOMContentLoaded', function() {
			var woDateInput = document.getElementById("woDate");
			woDateInput.addEventListener("click", function() {
				var today = new Date();
				var yyyy = today.getFullYear();
				var mm = String(today.getMonth() + 1).padStart(2, '0');
				var dd = String(today.getDate()).padStart(2, '0');
				var hh = String(today.getHours()).padStart(2, '0');
				var mi = String(today.getMinutes()).padStart(2, '0');
				var ss = String(today.getSeconds()).padStart(2, '0');
				var formattedDate = yyyy + "-" + mm + "-" + dd + " " + hh + ":"
						+ mi;
				woDateInput.value = formattedDate;
				woDateInput.readOnly = true;
				woDateInput.placeholder = "";
			});
		});
		// 지시일자(현재날짜) 이후로 납품예정일 선택 설정
		// 지시일자 입력란의 값 가져오기
		var woDateInput = document.getElementById("woDate");
		var woDateValue = woDateInput.value;

		// 지시일자를 현재 년월일로 설정 (YYYY-MM-DD 형식)
		var today = new Date();
		var dd = String(today.getDate()).padStart(2, '0');
		var mm = String(today.getMonth() + 1).padStart(2, '0'); // January is 0!
		var yyyy = today.getFullYear();
		var currentDateString = yyyy + '-' + mm + '-' + dd;
		// 납품예정일 입력란
		var shipSdateInput = document.getElementById("shipSdate");
		// 수주일자 이후의 날짜만 선택할 수 있도록 Datepicker 설정
		$(function() {
			$("#shipSdate").datepicker({
				minDate : currentDateString, // 현재 날짜 이후로 설정
				dateFormat : "yy-mm-dd", // MySQL DATE 형식으로 출력
			});
		});

// 		//유효성 검사
function validateForm() {
  var roCode = document.getElementById('roCode').value;
  var cusCode = document.getElementById('cusCode').value;
  var productCode = document.getElementById('productCode').value;
  var woCount = document.getElementById('woCount').value;
  var lineCode = document.getElementById('lineCode').value;
  var woDate = document.getElementById('woDate').value;
  var shipSdate = document.getElementById('shipSdate').value;
  var woStatus = document.getElementById('woStatus').value;
  var empId = document.getElementById('empId').value;
  if (roCode === '수주번호' || cusCode === '업체검색' || productCode === '상품검색' || woCount === '' || lineCode === '라인코드' || woDate === '지시일자' || shipSdate === '납품예정일' || woStatus === '' || empId === '사원검색') {
    // 필수 입력 필드 중 하나라도 값을 가지고 있지 않은 경우
    alert("모든 칸에 값을 입력해주세요.");
    return false; // 폼 제출을 막기 위해 false를 반환합니다.
  }
  return true; // 유효성 검사 통과 시 폼을 제출합니다.
}

	</script>
</body>
</html>