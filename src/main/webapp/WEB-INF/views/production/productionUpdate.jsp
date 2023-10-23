<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업지시수정</title>
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
			action="${pageContext.request.contextPath}/production/productionUpdatePro"
			method="post" onsubmit="return validateForm()">
			<div class="forms-group-receive">
				<div class="page-title-popup">생산실적수정</div>
			<div class="form-group-receive">
				<p>실적코드</p>
				<input type="text" id="poCode" name="poCode" class="form-control search-input"
					value="${productionDTO.poCode}" readonly>
			</div>			
			<div class="search-bar-popup">
				<div class="form-group-receive">
					<p>실적일자</p>
					<input type="text" id="poDate" name="poDate"
						class="form-control search-input inputcode"
						value="${productionDTO.poDate}" readonly> 

				</div>
				<div class="form-group-receive">
					<p>라인코드</p>
					<input type="text" id="lineCode" name="lineCode"
						class="form-control search-input inputcode"
						value="${productionDTO.lineCode}" > 
				</div>
			<div class="form-group-receive">
				<p>상품명</p>
				<input type="text" id="productCode" name="productCode"
					class="form-control search-input"
					value="${productionDTO.productCode}" readonly>
						<input type="text" id="productName" name="productName" 
						class="form-control search-input inputname"
						value="${productionDTO.productName}" readonly>
			</div>
			</div>
			<div class="form-group-receive">
				<p>지시수량</p>
				<input type="number" id="woCount" name="poCount"
					class="form-control search-input"
					value="${productionDTO.poCount}" min="0" readonly>
			</div>
			<div class="form-group-receive">
				<p>양품</p>
				<input type="text" id="poGood" name="poGood"
					class="form-control search-input"
					value="${productionDTO.poGood}" readonly>
			</div>
			<div class="form-group-receive">
				<p>불량</p>
				<input type="text" id="poErr" name="poErr"
					class="form-control search-input"
					value="${productionDTO.poErr}" >
			</div>
			<div class="form-group-receive">
				<p>불량사유</p>
				<input type="text" id="poCause" name="poCause"
					class="form-control search-input"
					value="${productionDTO.poCause}" >
			</div>
<!-- 			<div class="form-group-receive"> -->
<!-- 				<p>상태</p> -->
<!-- 				<input type="text" id="woStatus" class="form-control search-input" -->
<%-- 					value="${productionDTO.woStatus}" readonly> --%>
<!-- 			</div> -->
			<div class="form-group-receive">
				<p>수주번호</p>
				<input type="text" id="roCode" class="form-control search-input"
					value="${productionDTO.roCode}" readonly>
			</div>
			<div class="form-group-receive">
				<p>거래처</p>
				<input type="text" id="cusCode" class="form-control search-input"
					value="${productionDTO.cusCode}" readonly>
					<input type="text" id="cusName" class="form-control search-input"
					value="${productionDTO.cusName}" readonly>
			</div>
			
			<div class="form-group-receive">
				<p>담당자</p>
				<input type="text" id="empId" class="form-control search-input"
					value="${productionDTO.empId}" readonly>
					<input type="text" id="empName" class="form-control search-input"
					value="${productionDTO.empName}" readonly>
			</div>
			

			</div>
			<div class="details-buttons">
				<input type="submit" value="완료" class="btn btn-primary mybutton1">
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
		//팝업 창을 열어주는 함수
		function openPopup(url) {
			var width = 500;
			var height = 500;
			var left = (screen.width - width) / 2;
			var top = (screen.height - height) / 2;
			var popupWindow = window.open(url, '_blank', "width=" + width
					+ ", height=" + height + ", left=" + left + ", top=" + top);
			popupWindow.focus();
		}
			
		$(document).ready(function() {

			// 라인명 검색 팝업 열기
		    $("#lineCode, #lineCode").click(function() {
		        var url = '${pageContext.request.contextPath}/workOrder/workLineList';
		        openPopup(url);
		    });
		});
							
		//수주일, 납품예정일 검색 데이트피커(나중에 수정하기)
		$(function() {
			$("#shipSdate").datepicker({
				dateFormat : "yy-mm-dd"
			});
		});
		// 수주수정 페이지가 로드되면 수주예정일 값을 포맷팅해서 input에 넣음
		$(document).ready(function() {
			var shipSdate = "${workOrderDTO.shipSdate}"; // 서버에서 날짜를 받아옵니다.
			var formattedDate = new Date(shipSdate).toISOString().slice(0, 10);
			$("#shipSdate").val(formattedDate);
		});
		//유효성 검사
		function validateForm() {
			// 각 입력 필드 값
			var cusCode = document.getElementById("cusCode").value;
			var productCode = document.getElementById("productCode").value;
			var roCode = document.getElementById("roCode").value;
			var woCount = document.getElementById("woCount").value;
			var lineCode = document.getElementById("lineCode").value;
			var woDate = document.getElementById("woDate").value;
			var shipSdate = document.getElementById("shipSdate").value;
			var empId = document.getElementById("empId").value;

			console.log("cusCode: " + cusCode);
			// 빈 필드 검사
			if (cusCode === "" || productCode === "" || woCount === ""
					|| lineCode === "" || woDate === "" || shipSdate === ""
					|| empId === "") {
				alert("모든 내용을 입력해주세요.");
				return false; // 제출 방지
			}
			// 추가 유효성 검사
			if (woCount == 0) {
				alert("몇개부터 가능하도록 할까");
				return false; // 제출 방지
			}
			return true;
		}
		
		var inputSelector = 'input[name="poCount"]';

		//숫자 제어 이벤트리스너 함수
		$('body').on('input', woCount, function() {

		  // 이벤트 발생 대상의 밸류값을 가져온다
		  var inputValue = parseInt($(this).val());
		  
		  // 숫자가 아니라면 강제로 0으로 설정한다
		  if (isNaN(inputValue)) {
		    inputValue = 0;
		  }
		  
		  // 0보다 적은 숫자라면 강제로 0으로 설정한다
		  if (inputValue < 0) {
		    inputValue = 0;
		  } 
		  // 밸류값을 업데이트한다
		  $(this).val(inputValue);
		});// end function



		//양품 계산
		$(document).on("input", "#poErr", function() {
		// 수주량을 가져온다
		var woCount = parseInt($("#woCount").val());
		console.log(woCount);
		// 단가를 가져온다
		var poErr = parseInt($(this).val());
		console.log(poErr);

		// 수주량과 단가를 계산한다
		var result  = woCount - poErr;
		console.log(result );

		// 밸류값을 최종가격으로 변경한다
		if (isNaN(result ) || result  == 0) {
		    $("#poGood").val("");
		} else {
		    $("#poGood").val(result );
		}


		}); // end function
		
		
	</script>
</body>
</html>