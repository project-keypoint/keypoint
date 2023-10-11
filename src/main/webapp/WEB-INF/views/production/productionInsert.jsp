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
<form action="${pageContext.request.contextPath}/production/productionInsertPro" method="post" onsubmit="return validateForm()">
<div class="forms-group-receive">
<div class="page-title-popup">생산실적등록</div>
<div class="form-group-receive-insert">
<p>지시번호</p>
<input type="text" id="woCode" name="woCode" class="form-control search-input" value="작업지시번호" >
</div>
<div class="search-bar-popup">
<div class="form-group-receive">
<p>실적코드</p>
<input type="text" id="poCode" name="poCode" class="form-control search-input inputcode" value="실적코드">
</div>
<div class="form-group-receive">
<p>실적일자</p>
<input type="text" id="poDate" name="poDate" class="form-control search-input" value="실적일자">
</div>
<div class="form-group-receive">
<p>라인코드</p>
<input type="text" id="lineCode" name="lineCode" class="form-control search-input" value="라인코드">
</div>
<div class="form-group-receive">
<p>상품명</p>
<input type="text" id="productCode" name="productCode" class="form-control search-input inputcode" value="상품검색">
<input type="text" id="productName" name="productName" class="form-control search-input inputname" value="상품코드" readonly>
</div>
</div>
<div class="form-group-receive">
<p>지시수량</p>
<input type="number" id="woCount" name="woCount" class="form-control search-input" placeholder="지시수량" min="0" >
</div>

<div class="form-group-receive">
<p>양품</p>
<input type="number" id="poGood" name="poGood" class="form-control search-input" value="양품">
</div>
<div class="form-group-receive">
<p>불량</p>
<input type="number" id="poErr" name="poErr" class="form-control search-input" value="불량">
</div>
<div class="form-group-receive">
<p>불량사유</p>
<input type="text" id="poCause" name="poCause" class="form-control search-input" value="">
</div>
<div class="form-group-receive">
<p>수주번호</p>
<input type="text" id="roCode" name="roCode" class="form-control search-input" value="수주번호">
</div>
<div class="form-group-receive">
<p>거래처</p>
<input type="text" id="cusCode" name="cusCode" class="form-control search-input" value=거래처코드>
<input type="text" id="cusName" name="cusName" class="form-control search-input" value="거래처명">
</div>

<div class="search-bar-popup">
<div class="form-group-receive">
<p>당담자</p>
<input type="text" id="empId" name="empId" class="form-control search-input inputcode" value="사원검색">
<input type="text" id="empName" name="empName" class="form-control search-input inputcode" value="사원명" readonly>
</div>
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
	
	$("#woCode, #woCode").click(function() {
        var url = '${pageContext.request.contextPath}/workOrder/workList';
        openPopup(url, 600, 700);
    });
    // 수주코드 검색 팝업 열기
    $("#roCode, #roCode").click(function() {
        var url = '${pageContext.request.contextPath}/workOrder/workRoCodeList';
        openPopup(url);
    });
    // 업체명 검색 팝업 열기
    $("#cusCode, #cusCode").click(function() {
        var url = '${pageContext.request.contextPath}/workOrder/workCusList';
        openPopup(url);
    });
 // 상품명 검색 팝업 열기
    $("#productCode, #productCode").click(function() {
        var url = '${pageContext.request.contextPath}/workOrder/workProdList';
        openPopup(url);
    });
 // 라인명 검색 팝업 열기
    $("#lineCode, #lineCode").click(function() {
        var url = '${pageContext.request.contextPath}/workOrder/workLineList';
        openPopup(url);
    });
    
 	// 사원 검색 팝업 열기
    $("#empId, #empName").click(function() {
        var url = '${pageContext.request.contextPath}/workOrder/workEmpList';
        openPopup(url);
    });
});





// 지시일자 클릭시 현재날짜로 변경
document.addEventListener('DOMContentLoaded', function () {
    var poDateInput = document.getElementById("poDate");
poDateInput.addEventListener("click", function () {
	var today = new Date();
	var yyyy = today.getFullYear();
	var mm = String(today.getMonth() + 1).padStart(2, '0');
	var dd = String(today.getDate()).padStart(2, '0');
	var hh = String(today.getHours()).padStart(2, '0');
	var mi = String(today.getMinutes()).padStart(2, '0');
	var ss = String(today.getSeconds()).padStart(2, '0');
	var formattedDate = yyyy + "-" + mm + "-" + dd + " " + hh + ":" + mi;
	poDateInput.value = formattedDate;
	poDateInput.readOnly = true;
	poDateInput.placeholder = "";
    });
});
// 지시일자(현재날짜) 이후로 납품예정일 선택 설정
// 지시일자 입력란의 값 가져오기
var poDateInput = document.getElementById("poDate");
var poDateValue = woDateInput.value;

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
        minDate: currentDateString, // 현재 날짜 이후로 설정
        dateFormat: "yy-mm-dd", // MySQL DATE 형식으로 출력
    });
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
    var poDate = document.getElementById("poDate").value;
    var empId = document.getElementById("empId").value;
    
    console.log("cusCode: " + cusCode);
    // 빈 필드 검사
    if (cusCode === "" || productCode === "" ||
    		woCount === "" || lineCode === "" || woDate === "" ||
    		poDate === "" || empId === "") {
        alert("모든 내용을 입력해주세요.");
        return false; // 제출 방지
    }
//     // 추가 유효성 검사
//     if (woCount == 0) {
//         alert("몇개부터 가능하도록 할까");
//         return false; // 제출 방지
//     }
    return true;
}

</script>
</body>
</html>