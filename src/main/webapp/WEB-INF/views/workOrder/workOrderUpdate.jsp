<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업지시수정</title>
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
<form action="${pageContext.request.contextPath}/workOrder/workOrderUpdatePro" method="post" onsubmit="return validateForm()">
<div class="forms-group-receive">
<div class="page-title-popup">작업지시수정</div>
<div class="form-group-receive">
<p>작업지시번호</p>
<input type="text" id="woCode" name="woCode" class="form-control search-input" value="${workOrderDTO.woCode}" readonly>
</div>
<div class="search-bar-popup">
<div class="form-group-receive">
<p>업체명</p>
<input type="text" id="cusCode" name="cusCode" class="form-control search-input inputcode" value="${workOrderDTO.cusCode}" readonly>
<input type="text" id="cusName" name="cusName" class="form-control search-input inputname" value="${workOrderDTO.cusName}" readonly>
</div>
<div class="form-group-receive">
<p>상품명</p>
<input type="text" id="productCode" name="productCode" class="form-control search-input inputcode" value="${workOrderDTO.productCode}" readonly>
<input type="text" id="productName" name="productName" class="form-control search-input inputname" value="${workOrderDTO.productName}" readonly>
</div>
</div>
<div class="form-group-receive">
<p>수주번호</p>
<input type="text" id="roCode" name="roCode" class="form-control search-input" value="${workOrderDTO.roCode}" readonly>
</div>
<div class="form-group-receive">
<p>지시수량</p>
<input type="number" id="woCount" name="woCount" class="form-control search-input" value="${workOrderDTO.woCount}">
</div>
<div class="form-group-receive">
<p>라인코드</p>
<input type="text" id="lineCode" name="lineCode" class="form-control search-input" value="${workOrderDTO.lineCode}" readonly>
</div>
<div class="form-group-receive">
<p>지시일자</p>
<input type="text" id="woDate" name="woDate" class="form-control search-input" value="${workOrderDTO.woDate}" readonly>
</div>
<div class="form-group-receive">
<p>납품예정일</p>
<input type="text" id="shipSdate" name="shipSdate" class="form-control search-input" value="${workOrderDTO.shipSdate}" readonly>
</div>
<div class="form-group-receive">
<p>상태</p>
<select id="woStatus" name="woStatus" class="form-control search-input status">
    <option value="진행" ${workOrderDTO.woStatus eq '진행' ? 'selected' : ''}>진행</option>
    <option value="완료" ${workOrderDTO.woStatus eq '완료' ? 'selected' : ''}>완료</option>
</select>
</div>

<div class="search-bar-popup">
<div class="form-group-receive">
<p>담당자</p>
<input type="text" id="empId" name="empId" class="form-control search-input inputcode" value="${workOrderDTO.empId}" readonly>
<input type="text" id="empName" name="empName" class="form-control search-input inputcode" value="${workOrderDTO.empName}" readonly>
</div>
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
	
	    // 수주코드 검색 팝업 열기
	    $("#roCode, #roCode").click(function() {
	        var url = '${pageContext.request.contextPath}/workOrder/workRoCodeList';
	        openPopup(url);
	    });
	 	// 라인명 검색 팝업 열기
	    $("#lineCode, #lineCode").click(function() {
	        var url = '${pageContext.request.contextPath}/workOrder/workLineList';
	        openPopup(url);
	    });
    // 업체명 검색 팝업 열기
//     $("#cusCode, #cusName").click(function() {
//         var url = '${pageContext.request.contextPath}/workOrder/workCusList';
//         openPopup(url);
//     });
    // 상품명 검색 팝업 열기
//     $("#productCode, #productName").click(function() {
//         var url = '${pageContext.request.contextPath}/workOrder/workProdList';
//         openPopup(url);
//     });
 	// 사원 검색 팝업 열기
    $("#empId, #empName").click(function() {
        var url = '${pageContext.request.contextPath}/workOrder/workEmpList';
        openPopup(url);
    });
});
//수주일, 납품예정일 검색 데이트피커(나중에 수정하기)
$(function() {
    $("#shipSdate").datepicker({
    	dateFormat: "yy-mm-dd"
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
    if (cusCode === "" || productCode === "" ||
    		woCount === "" || lineCode === "" || woDate === "" ||
    		shipSdate === "" || empId === "") {
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
</script>
</body>
</html>