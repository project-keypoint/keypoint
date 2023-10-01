<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업지시등록</title>
	<!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <!-- 수주 CSS 적용-->
    <link href="${pageContext.request.contextPath}/resources/css/receive.css" rel="stylesheet">
</head>
<body>
<div class="main-details">
<form action="#">
<div class="forms-group-receive">
<div class="page-title-popup">작업지시등록</div>
<div class="form-group-receive">
<p>지시번호</p>
<input type="text" id="woCode" class="form-control search-input" placeholder="작업지시번호" >
</div>
<div class="search-bar-popup">
<div class="form-group-receive">
<p>업체명</p>
<input type="text" id="cusCode" class="form-control search-input inputcode" placeholder="업체검색">
<input type="text" id="cusName" class="form-control search-input inputname" placeholder="업체명" readonly>
</div>
<div class="form-group-receive">
<p>상품명</p>
<input type="text" id="productCode" class="form-control search-input inputcode" placeholder="상품검색">
<input type="text" id="productName" class="form-control search-input inputname" placeholder="상품코드" readonly>
</div>
</div>
<div class="form-group-receive">
<p>수주번호</p>
<input type="text" id="roCode" class="form-control search-input" placeholder="수주번호">
</div>
<div class="form-group-receive">
<p>지시수량</p>
<input type="number" id="roCount" class="form-control search-input" placeholder="지시수량" min="0">
</div>
<div class="form-group-receive">
<p>라인코드</p>
<input type="text" id="roPrice" class="form-control search-input" placeholder="라인코드" readonly>
</div>
<div class="form-group-receive">
<p>지시일자</p>
<input type="text" id="roDate" class="form-control search-input" placeholder="지시일자">
</div>
<div class="form-group-receive">
<p>납품예정일</p>
<input type="text" id="shipSdate" class="form-control search-input" placeholder="납품예정일">
</div>
<div class="form-group-receive">
<p>상태</p>
<select id="roStatus" name="roStatus" class="form-control search-input status">
        <option value="pending">대기</option>
        <option value="ongoing">진행</option>
        <option value="completed">완료</option>
        <option value="canceled">취소</option>
</select>
</div>
</div>
<div class="details-buttons">
<input type="submit" value="등록" class="btn btn-primary mybutton1">
<input type="button" value="취소" class="btn btn-secondary mybutton1" onClick="window.close()">
</div>
</form><!-- form 끝 -->
</div><!-- main-details -->

<!-- 데이트피커 타임피커를 사용하기위한 j쿼리 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">

$(document).ready(function() {
    $("#woCode").click(function() {
        // 업체코드 입력란의 값을 가져옵니다.
        var woCode = $("input[name='woCode']").val();
        // 여기에서 검색 기능을 구현하고, 필요한 로직을 수행합니다.
        // 예: 업체코드를 이용하여 검색하고 결과를 표시합니다.
        
        $(document).ready(function() {
	        $("#woCode").click(function() {
	            // 팝업 창 크기 및 위치 설정
	            var width = 500;
	            var height = 500;
	            var left = (screen.width - width) / 2;
	            var top = (screen.height - height) / 2;
	            // 팝업 창 열기
	            var url = '${pageContext.request.contextPath}/workOrder/workInstructList'; // 업체 검색 페이지의 URL.
	            var popupWindow = window.open(url, '_blank', "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
	            // 팝업 창 포커스
	            popupWindow.focus();
	        });
	    });
    });
});



$(document).ready(function() {
    $("#cusCode").click(function() {
        // 업체코드 입력란의 값을 가져옵니다.
        var cusCode = $("input[name='cusCode']").val();
        // 여기에서 검색 기능을 구현하고, 필요한 로직을 수행합니다.
        // 예: 업체코드를 이용하여 검색하고 결과를 표시합니다.
        
        $(document).ready(function() {
	        $("#cusCode").click(function() {
	            // 팝업 창 크기 및 위치 설정
	            var width = 500;
	            var height = 500;
	            var left = (screen.width - width) / 2;
	            var top = (screen.height - height) / 2;
	            // 팝업 창 열기
	            var url = '${pageContext.request.contextPath}/workOrder/workCusList'; // 업체 검색 페이지의 URL.
	            var popupWindow = window.open(url, '_blank', "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
	            // 팝업 창 포커스
	            popupWindow.focus();
	        });
	    });
    });
});
$(document).ready(function() {
    $("#productCode").click(function() {
        // 상품코드 입력란의 값을 가져옵니다.
        var productCode = $("input[name='productCode']").val();
        // 여기에서 검색 기능을 구현하고, 필요한 로직을 수행합니다.
        // 예: 상품코드를 이용하여 검색하고 결과를 표시합니다.
        
        $(document).ready(function() {
	        $("#productCode").click(function() {
	            // 팝업 창 크기 및 위치 설정
	            var width = 500;
	            var height = 500;
	            var left = (screen.width - width) / 2;
	            var top = (screen.height - height) / 2;
	            // 팝업 창 열기
	            var url = '${pageContext.request.contextPath}/workOrder/workProdList'; // 상품 검색 페이지의 URL.
	            var popupWindow = window.open(url, '_blank', "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
	            // 팝업 창 포커스
	            popupWindow.focus();
	        });
	    });
    });
});

// 수주일자 클릭시 현재날짜로 변경
document.addEventListener('DOMContentLoaded', function () {
    var roDateInput = document.getElementById("roDate");
roDateInput.addEventListener("click", function () {
	var today = new Date();
	var yyyy = today.getFullYear();
	var mm = String(today.getMonth() + 1).padStart(2, '0');
	var dd = String(today.getDate()).padStart(2, '0');
	var hh = String(today.getHours()).padStart(2, '0');
	var mi = String(today.getMinutes()).padStart(2, '0');
	var ss = String(today.getSeconds()).padStart(2, '0');
	var formattedDate = yyyy + "-" + mm + "-" + dd + " " + hh + ":" + mi + ":" + ss;
	roDateInput.value = formattedDate;
	roDateInput.readOnly = true;
	roDateInput.placeholder = "";
    });
});
// 수주일자(현재날짜) 이후로 납품예정일 선택 설정
// 수주일자 입력란의 값 가져오기
var roDateInput = document.getElementById("roDate");
var roDateValue = roDateInput.value;

// 수주일자를 현재 년월일로 설정 (YYYY-MM-DD 형식)
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
        minDate: currentDateString, // 현재 날짜 이후로 설정
        dateFormat: "yy-mm-dd", // MySQL DATE 형식으로 출력
    });
});
</script>
</body>
</html>