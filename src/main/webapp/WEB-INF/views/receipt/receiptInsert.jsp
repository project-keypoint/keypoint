<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입고등록</title>
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
<form action="${pageContext.request.contextPath}/receipt/receiptInsertPro" id="receiptInsert" method="post" onsubmit="return validateForm()">

<div class="forms-group-receive">
<div class="page-title-popup">입고예정등록</div>

<div class="form-group-receive">
<p>입고코드</p>
<input type="text" id="grCode" name="grCode" class="form-control search-input" placeholder="입고코드" readonly>
</div>

<div class="search-bar-popup">
<div class="form-group-receive">
<p>발주서</p>
<input type="text" id="poCode" name="poCode" class="form-control search-input inputcode" placeholder="발주코드">
<input type="text" id="materialName" name="materialName" class="form-control search-input inputname" placeholder="자재명">
</div>
</div>

<div class="form-group-receive">
<p>입고수량</p>
<input type="number" id="grCount" name="grCount" class="form-control search-input" placeholder="입고예정수량" min="0">
</div>

<div class="form-group-receive">
<p>담당자</p>
<input type="text" id="grOwner" name="grOwner" class="form-control search-input inputcode" placeholder="담당자검색">
</div>

<div class="form-group-receive">
<p>입고등록</p>
<input type="text" id="grSdate" name="grSdate" class="form-control search-input" placeholder="입고등록날짜">
</div>

<div class="form-group-receive">
<p>입고예정</p>
<input type="text" id="grDate" name="grDate" class="form-control search-input" placeholder="입고예정날짜">
</div>

<div class="form-group-receive">
<p>입고상태</p>
<input type="text" id="grStatus" name="grStatus" class="form-control search-input" value="입고대기" readonly>
</div>

</div>
<div class="details-buttons">
<input type="submit" value="등록" class="btn btn-primary mybutton1">
<input type="reset" value="초기화" class="btn btn-primary mybutton1">
<input type="button" value="취소" class="btn btn-secondary mybutton1" onClick="window.close()">
</div>

</form><!-- form 끝 -->
</div><!-- main-details -->

<!-- 데이트피커 타임피커를 사용하기위한 j쿼리 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<!-- 자재코드,담당자 검색기능 -->
<script type="text/javascript">
$(document).ready(function() {
    $("#materialCode").click(function() {
        // 업체코드 입력란의 값을 가져옵니다.
        var materialCode = $("input[name='materialCode']").val();
        // 여기에서 검색 기능을 구현하고, 필요한 로직을 수행합니다.
        // 예: 업체코드를 이용하여 검색하고 결과를 표시합니다.
        
        $(document).ready(function() {
	        $("#materialCode").click(function() {
	            // 팝업 창 크기 및 위치 설정
	            var width = 400;
	            var height = 400;
	            var left = (screen.width - width) / 2;
	            var top = (screen.height - height) / 2;
	            // 팝업 창 열기
	            var url = '${pageContext.request.contextPath}/purchase/test2'; // 업체 검색 페이지의 URL.
	            var popupWindow = window.open(url, '_blank', "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
	            // 팝업 창 포커스
	            popupWindow.focus();
	        });
	    });
    });
});

$(document).ready(function() {
    $("#grOwner").click(function() {
        // 상품코드 입력란의 값을 가져옵니다.
        var poOwner = $("input[name='grOwner']").val();
        // 여기에서 검색 기능을 구현하고, 필요한 로직을 수행합니다.
        // 예: 상품코드를 이용하여 검색하고 결과를 표시합니다.
        
        $(document).ready(function() {
	        $("#grOwner").click(function() {
	            // 팝업 창 크기 및 위치 설정
	            var width = 400;
	            var height = 400;
	            var left = (screen.width - width) / 2;
	            var top = (screen.height - height) / 2;
	            // 팝업 창 열기
	            var url = '${pageContext.request.contextPath}/receive/empty'; // 상품 검색 페이지의 URL.
	            var popupWindow = window.open(url, '_blank', "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
	            // 팝업 창 포커스
	            popupWindow.focus();
	        });
	    });
    });
});

$(document).ready(function() {
    $("#poCode").click(function() {
        // 상품코드 입력란의 값을 가져옵니다.
        var poCode = $("input[name='poCode']").val();
        // 여기에서 검색 기능을 구현하고, 필요한 로직을 수행합니다.
        // 예: 상품코드를 이용하여 검색하고 결과를 표시합니다.
        
        $(document).ready(function() {
	        $("#poCode").click(function() {
	            // 팝업 창 크기 및 위치 설정
	            var width = 400;
	            var height = 400;
	            var left = (screen.width - width) / 2;
	            var top = (screen.height - height) / 2;
	            // 팝업 창 열기
	            var url = '${pageContext.request.contextPath}/receive/empty'; // 상품 검색 페이지의 URL.
	            var popupWindow = window.open(url, '_blank', "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
	            // 팝업 창 포커스
	            popupWindow.focus();
	        });
	    });
    });
});

</script>
<!-- // 자재코드,담당자 검색기능 -->

<!-- 발주수량 * 자재단가의 곱 -->
<script>
// poCount와 materialPrice 값을 곱하여 poPrice에 설정하는 함수
function calculatePoPrice() {
    // poCount와 materialPrice 입력란의 값을 읽어옴
    var poCount = parseFloat(document.getElementsByName("poCount")[0].value);
    var materialPrice = parseFloat(document.getElementsByName("materialPrice")[0].value);
    
    // materialPrice 값이 NaN인지 확인
    if (isNaN(materialPrice)) {
        // materialPrice가 NaN이면 poPrice 입력란에 빈 문자열 설정
        document.getElementsByName("poPrice")[0].value = "";
    } else {
        // poCount와 materialPrice를 곱함
        var poPrice = poCount * materialPrice;
        
        // 곱한 결과를 poPrice 입력란에 설정
        document.getElementsByName("poPrice")[0].value = poPrice;
    }
}

// poCount와 materialPrice 입력란 값이 변경될 때마다 자동으로 발생하는 이벤트 리스너 등록
document.getElementsByName("poCount")[0].addEventListener("input", calculatePoPrice);
document.getElementsByName("materialPrice")[0].addEventListener("input", calculatePoPrice);
</script>
<!-- //  발주수량 * 자재단가의 곱 -->

<!-- 입고등록일자 클릭시 입고코드 자동생성 -->
<script>
document.addEventListener('DOMContentLoaded', function () {
    var grSdateInput = document.getElementById("grSdate");
    var grCodeInput = document.getElementById("grCode");

    grSdateInput.addEventListener("click", function () {
        var today = new Date();
        var yyyy = today.getFullYear();
        var mm = String(today.getMonth() + 1).padStart(2, '0');
        var dd = String(today.getDate()).padStart(2, '0');
        var hh = String(today.getHours()).padStart(2, '0');
        var mi = String(today.getMinutes()).padStart(2, '0');
        var ss = String(today.getSeconds()).padStart(2, '0');
        var formattedDate = yyyy + "-" + mm + "-" + dd + " " + hh + ":" + mi + ":" + ss;

        // 생성된 발주일자를 입력란에 설정
        grSdateInput.value = formattedDate;
        grSdateInput.readOnly = true;
        grSdateInput.placeholder = "";

        // 발주일자와 함께 poCode를 생성하여 입력란에 설정
        var grCode = "IN" + yyyy + mm + dd + hh + mi + ss;
        grCodeInput.value = grCode;
    });
});
</script>
<!-- // 발주일자 클릭시 발주코드 자동생성 -->


<!-- 발주일자 클릭시 현재날짜로 변경 -->
<script>
document.addEventListener('DOMContentLoaded', function () {
    var grSdateInput = document.getElementById("grSdate");

    grSdateInput.addEventListener("click", function () {
        var today = new Date();
        var yyyy = today.getFullYear();
        var mm = String(today.getMonth() + 1).padStart(2, '0');
        var dd = String(today.getDate()).padStart(2, '0');
        var hh = String(today.getHours()).padStart(2, '0');
        var mi = String(today.getMinutes()).padStart(2, '0');
        var ss = String(today.getSeconds()).padStart(2, '0');
        var formattedDate = yyyy + "-" + mm + "-" + dd + " " + hh + ":" + mi + ":" + ss;
        
        grSdateInput.value = formattedDate;
        grSdateInput.readOnly = true;
        grSdateInput.placeholder = "";
    });
});
</script>
<!-- // 발주일자 클릭시 현재날짜로 변경 -->

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

<!-- 필수입력항목 메시지 -->
<script>
function validateForm() {
    // 각 입력 필드 값
    var grCode = document.getElementById("grCode").value;
    var poCode = document.getElementById("poCode").value;
    var materialName = document.getElementById("materialName").value;
    var grCount = document.getElementById("grCount").value;
    var grOwner = document.getElementById("grOwner").value;
    var grSdate = document.getElementById("grSdate").value;
    var grDate = document.getElementById("grDate").value;
    var grStatus = document.getElementById("grStatus").value;
    // 빈 필드 검사
    if (grCode === "" || poCode === "" || materialName === "" ||
   		grCount === "" || grOwner === "" || grSdate === "" || grDate === "" || grStatus === "") {
        alert("모든 내용을 입력해주세요.");
        return false; // 제출 방지
    }
    return true;
}
</script>
<!-- // 필수입력항목 메시지 -->


</body>
</html>