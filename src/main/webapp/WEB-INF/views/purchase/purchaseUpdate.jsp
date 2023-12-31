<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>발주수정</title>
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
<form action="${pageContext.request.contextPath}/purchase/purchaseUpdatePro" id="purchaseInsert" method="post" >

<div class="forms-group-receive">
<div class="page-title-popup">발주수정</div>

<div class="form-group-receive">
<p>발주코드</p>
<input type="text" id="poCode" name="poCode" class="form-control search-input" value="${purchaseDTO.poCode}" readonly>
</div>

<div class="search-bar-popup">
<div class="form-group-receive">
<p>자재코드</p>
<input type="text" id="materialCode" name="materialCode" class="form-control search-input inputcode" value="${purchaseDTO.materialCode}" readonly>
</div>

<div class="form-group-receive">
<p>자재명</p>
<input type="text" id="materialName" name="materialName" class="form-control search-input inputname" value="${purchaseDTO.materialName}" readonly>
</div>

<div class="form-group-receive">
<p>자재단가</p>
<input type="text" id="materialPrice" name="materialPrice" class="form-control search-input" value="${purchaseDTO.materialPrice}" readonly>
</div>
</div>

<div class="form-group-receive">
<p>발주수량</p>
<input type="number" id="poCount" name="poCount" class="form-control search-input" value="${purchaseDTO.poCount}" min="0">
</div>

<div class="form-group-receive">
<p>발주금액</p>
<input type="text" class="form-control search-input" id="poPrice" name="poPrice" value="${purchaseDTO.poPrice}" readonly>
</div>



<div class="search-bar-popup">
<div class="form-group-receive">
<p>담당자명</p>
<input type="text" id="empName" name="poOwner" class="form-control search-input inputcode" placeholder="담당자검색" value="${purchaseDTO.poOwner}" readonly>
<input type="text" id="empId" name="empId" class="form-control search-input inputcode" placeholder="담당자명" readonly hidden >
</div>

<!-- <div class="form-group-receive"> -->
<!-- <p>담당자</p> -->
<!-- <input type="text" id="poOwner" name="poOwner" class="form-control search-input inputcode" placeholder="담당자검색"> -->
<!-- </div> -->


<div class="form-group-receive">
<p>거래처명</p>
<input type="text" id="cusCode" name="cusCode" class="form-control search-input inputcode" placeholder="거래처검색" hidden readonly>
<input type="text" id="cusName" name="cusName" class="form-control search-input inputname" placeholder="거래처명" value="${purchaseDTO.cusName}" readonly >
</div>
</div>
<!-- <div class="form-group-receive"> -->
<!-- <p>담당자</p> -->
<%-- <input type="text" id="poOwner" name="poOwner" class="form-control search-input inputcode" value="${purchaseDTO.poOwner}"> --%>
<!-- </div> -->

<!-- <div class="form-group-receive"> -->
<!-- <p>거래처</p> -->
<%-- <input type="text" id="cusName" name="cusName" class="form-control search-input inputcode" value="${purchaseDTO.cusName}"> --%>
<!-- </div> -->


<div class="form-group-receive">
<p>발주일자</p>
<input type="text" id="poDate" name="poDate" class="form-control search-input" value="${purchaseDTO.poDate}" readonly>
</div>

<div class="form-group-receive">
<p>납기일자</p>
<input type="text" id="payDate" name="payDate" class="form-control search-input" value="${purchaseDTO.payDate}">
</div>

<div class="form-group-receive">
<p>발주상태</p>
<input type="text" id="poStatus" name="poStatus" class="form-control search-input" value="${purchaseDTO.poStatus}" readonly>
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


<!-- 자재코드, 거래처, 담당자 검색기능 -->
<script type="text/javascript">
//팝업 창을 열어주는 함수
function openPopup(url) {
    var width = 580;
    var height = 550;
    var left = (screen.width - width) / 2;
    var top = (screen.height - height) / 2;
    var popupWindow = window.open(url, '_blank', "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
    popupWindow.focus();
}
$(document).ready(function() {
    // 업체명 검색 팝업 열기
    $("#cusCode, #cusName").click(function() {
        var url = '${pageContext.request.contextPath}/workOrder/workCusList2';
        openPopup(url);
    });
    // 상품명 검색 팝업 열기
    $("#materialCode, #materialName, #materialPrice").click(function() {
        var url = '${pageContext.request.contextPath}/material/purchaseMaterialList';
        openPopup(url);
    });
 	// 사원 검색 팝업 열기
    $("#empId, #empName").click(function() {
        var url = '${pageContext.request.contextPath}/workOrder/productEmpList';
        openPopup(url);
    });
});
</script>
</script>
<!-- // 자재코드, 거래처, 담당자 검색기능 -->

<!-- 발주수량 * 자재단가의 곱 -->
<script>
//poCount와 materialPrice 값을 곱하여 poPrice에 설정하는 함수
function calculatePoPrice() {
    // poCount와 materialPrice 입력란의 값을 읽어옴
    var poCount = parseFloat(document.getElementsByName("poCount")[0].value);
    var materialPrice = parseFloat(document.getElementsByName("materialPrice")[0].value);
    
    // 입력값이 유효한 숫자인지 확인
    if (!isNaN(poCount) && !isNaN(materialPrice)) {
        // poCount와 materialPrice를 곱함
        var poPrice = poCount * materialPrice;
        
        // 곱한 결과를 poPrice 입력란에 설정
        document.getElementsByName("poPrice")[0].value = poPrice;
    } else {
        // 입력값이 숫자가 아닌 경우 또는 둘 중 하나라도 숫자가 아닌 경우
        document.getElementsByName("poPrice")[0].value = "";
    }
}

// poCount와 materialPrice 입력란 값이 변경될 때마다 자동으로 발생하는 이벤트 리스너 등록
document.getElementsByName("poCount")[0].addEventListener("input", calculatePoPrice);
document.getElementsByName("materialPrice")[0].addEventListener("input", calculatePoPrice);

</script>
<!-- //  발주수량 * 자재단가의 곱 -->


<!-- 발주날짜(현재날짜) 이후로 납기일자 선택하게끔 설정 -->
<script>
// 발주일자 입력란의 값 가져오기
var poDateInput = document.getElementById("poDate");
var poDateValue = poDateInput.value;

// 발주일자를 현재 년월일로 설정 (YYYY-MM-DD 형식)
var today = new Date();
var dd = String(today.getDate()).padStart(2, '0');
var mm = String(today.getMonth() + 1).padStart(2, '0'); // January is 0!
var yyyy = today.getFullYear();
var currentDateString = yyyy + '-' + mm + '-' + dd;

// 납기일자 입력란
var payDateInput = document.getElementById("payDate");

// 발주일자 이후의 날짜만 선택할 수 있도록 Datepicker 설정
$(function() {
    $("#payDate").datepicker({
        minDate: currentDateString, // 현재 날짜 이후로 설정
        dateFormat: "yy-mm-dd", // MySQL DATE 형식으로 출력
    });
});
</script>
<!-- // 발주날짜(현재날짜) 이후로 납기일자 선택하게끔 설정 -->



</body>
</html>