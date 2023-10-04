<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입고수정</title>
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
<form action="${pageContext.request.contextPath}/receipt/receiptUpdatePro" id="receiptInsert" method="post" onsubmit="return validateForm()">

<div class="forms-group-receive">
<div class="page-title-popup">입고수정</div>

<div class="form-group-receive">
<p>입고코드</p>
<input type="text" id="grCode" name="grCode" class="form-control search-input" value="${receiptDTO.grCode}" readonly>
</div>

<div class="search-bar-popup">
<div class="form-group-receive">
<p>발주서</p>
<input type="text" id="poCode" name="poCode" class="form-control search-input inputcode" value="${receiptDTO.poCode}" readonly>
</div>
</div>

<div class="form-group-receive">
<p>입고수량</p>
<input type="number" id="grCount" name="grCount" class="form-control search-input" value="${receiptDTO.grCount}" min="0">
</div>

<div class="search-bar-popup">
<div class="form-group-receive">
<p>당담자</p>
<input type="text" id="empId" name="grOwner" class="form-control search-input inputcode" value="${receiptDTO.grOwner}(변경가능)" readonly>
<input type="text" id="empName" name="roEmpName" class="form-control search-input inputcode" placeholder="담당자명" readonly hidden>
</div>
</div>


<!-- <div class="form-group-receive"> -->
<!-- <p>담당자</p> -->
<!-- <input type="text" id="grOwner" name="grOwner" class="form-control search-input inputcode" placeholder="담당자검색"> -->
<!-- </div> -->

<div class="form-group-receive">
<p>입고등록</p>
<input type="text" id="grSdate" name="grSdate" class="form-control search-input" value="${receiptDTO.grSdate}" readonly>
</div>

<div class="form-group-receive">
<p>입고예정</p>
<input type="text" id="grDate" name="grDate" class="form-control search-input" value="${receiptDTO.grDate}">
</div>

<div class="form-group-receive">
<p>입고상태</p>
<input type="text" id="grStatus" name="grStatus" class="form-control search-input" value="입고대기" readonly>
</div>

</div>
<div class="details-buttons">
<input type="submit" value="완료" class="btn btn-primary mybutton1">
<input type="button" value="취소" class="btn btn-secondary mybutton1" onClick="window.close()">
</div>

</form><!-- form 끝 -->
</div><!-- main-details -->

<!-- 데이트피커 타임피커를 사용하기위한 j쿼리 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script type="text/javascript">
//팝업 창을 열어주는 함수
function openPopup(url) {
    var width = 500;
    var height = 500;
    var left = (screen.width - width) / 2;
    var top = (screen.height - height) / 2;
    var popupWindow = window.open(url, '_blank', "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
    popupWindow.focus();
}
$(document).ready(function() {
    // 업체명 검색 팝업 열기
    $("#cusCode, #cusName").click(function() {
        var url = '${pageContext.request.contextPath}/workOrder/workCusList';
        openPopup(url);
    });
    // 상품명 검색 팝업 열기
    $("#materialCode, #materialName, #materialPrice").click(function() {
        var url = '${pageContext.request.contextPath}/material/materialList';
        openPopup(url);
    });
 	// 사원 검색 팝업 열기
    $("#empId, #empName").click(function() {
        var url = '${pageContext.request.contextPath}/workOrder/workEmpList';
        openPopup(url);
    });
});
</script>
</script>
<!-- // 자재코드, 거래처, 담당자 검색기능 -->


<!-- 발주날짜(현재날짜) 이후로 납기일자 선택하게끔 설정 -->
<script>
// 발주일자 입력란의 값 가져오기
var grSdateInput = document.getElementById("grSdate");
var grSdateValue = grSdateInput.value;

// 발주일자를 현재 년월일로 설정 (YYYY-MM-DD 형식)
var today = new Date();
var dd = String(today.getDate()).padStart(2, '0');
var mm = String(today.getMonth() + 1).padStart(2, '0'); // January is 0!
var yyyy = today.getFullYear();
var currentDateString = yyyy + '-' + mm + '-' + dd;

// 납기일자 입력란
var grDateInput = document.getElementById("grDate");

// 발주일자 이후의 날짜만 선택할 수 있도록 Datepicker 설정
$(function() {
    $("#grDate").datepicker({
        minDate: currentDateString, // 현재 날짜 이후로 설정
        dateFormat: "yy-mm-dd", // MySQL DATE 형식으로 출력
    });
});
</script>
<!-- // 발주날짜(현재날짜) 이후로 납기일자 선택하게끔 설정 -->




</body>
</html>