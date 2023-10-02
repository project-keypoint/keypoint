<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>픔질검사(상세)</title>
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
<form action="${pageContext.request.contextPath}/qc/qcStart" method="post" onsubmit="return validateForm()">
<div class="main-details">
<!-- <form action="#" method="post" onsubmit="return validateForm()"> -->
<div class="forms-group-qc-receive">
<div class="page-title-popup">품질검사(상세)</div>
<div class="search-bar-popup-qc">
<div class="form-group-qc-receive">

<p>작업지시코드</p>
<input type="text" id="woCode" class="form-control search-input inputcode" placeholder="${qualityDTO.woCode}" readonly>
</div>
<div class="form-group-qc-receive">
<p>생산코드</p>
<input type="text" id="prodCode" name="prodCode" class="form-control search-input inputcode" value="${qualityDTO.prodCode}" readonly>
</div>
<div class="form-group-qc-receive">
<p>상품명</p> 
<input type="text" id="productCode" class="form-control search-input" placeholder="${qualityDTO.productCode}" style="width:110px;" readonly>
<input type="text" id="productName" class="form-control search-input" placeholder="${qualityDTO.productName}" readonly>
</div>
<div class="form-group-qc-receive">
<p>상품생산자</p>
<input type="text" id="prodEmpId" class="form-control search-input inputcode" placeholder="${qualityDTO.prodEmpId}" readonly>
<input type="text" id="prodEmpName" class="form-control search-input inputname" placeholder="${qualityDTO.prodEmpName}" readonly>
</div>
<div class="form-group-qc-receive">
<p>납품예정일</p>
<input type="text" id="shipSdate" class="form-control search-input" placeholder="${qualityDTO.shipSdate}" readonly>
</div>
</div>
<table class="table-list">
<tr class="table-head">
	<th>검사1</th>
	<th>검사2</th>
	<th>검사3</th></tr>
<tr class="table-body">
	<td><input type="text" id="qcTest1" class="form-control search-input input-center" readonly></td>
	<td><input type="text" id="qcTest2" class="form-control search-input input-center" readonly></td>
	<td><input type="text" id="qcTest3" class="form-control search-input input-center" readonly></td>
</tr>
</table>
<br>
<table class="table-list">
<tr class="table-head"><th>검사대상수</th>
	<th>합격</th>
	<th>불량</th>
	<th>최종불량률</th></tr>
<tr class="table-body">
	<td><input type="text" id="qcCount" class="form-control search-input input-center hide" placeholder="${qualityDTO.prodCount}" readonly></td>
	<td><input type="text" id="qcPass" class="form-control search-input input-center hide" placeholder="${qualityDTO.qcPass}" readonly></td>
	<td><input type="text" id="qcDefect" class="form-control search-input input-center hide" placeholder="${qualityDTO.qcDefect}" readonly></td>
	<td><input type="text" id="qcDefectRate" class="form-control search-input input-center" placeholder="${qualityDTO.qcDefectRate}" min="0" readonly></td>
</tr>
</table>
<br>
<div class="search-bar-popup-qc">
<div class="form-group-qc-receive">
<p>품질검사코드</p>
<input type="text" id="qcCode" class="form-control search-input inputcode" placeholder="${qualityDTO.qcCode}" readonly>
</div>
<div class="form-group-qc-receive">
<p>품질검사원</p>
<c:choose>
  <c:when test="${not empty qualityDTO.qcCode}">
    <input type="text" id="qcEmpId" name="qcEmpId" class="form-control search-input inputcode" placeholder="${qualityDTO.qcEmpId}" readonly>
	<input type="text" id="qcEmpName" class="form-control search-input inputname" placeholder="사원명" readonly>
  </c:when>
  <c:otherwise>
    <input type="text" id="empId" name="qcEmpId" class="form-control search-input inputcode" placeholder="${qualityDTO.qcEmpId}" readonly>
	<input type="text" id="empName" class="form-control search-input inputname" placeholder="사원명" readonly>
  </c:otherwise>
</c:choose>

</div>

<div class="form-group-qc-receive">
<p>검사시작일</p> <input type="text" id="qcStartDate" class="form-control search-input" placeholder="${qualityDTO.qcStartDate}" readonly>
</div>

<div class="form-group-qc-receive">
<p>검사완료일</p> <input type="text" id="qcEndDate" class="form-control search-input" placeholder="${qualityDTO.qcEndDate}" readonly>
</div>

</div>
</div>
<div class="details-buttons">
<c:choose>
  <c:when test="${not empty qualityDTO.qcCode}">
    <input type="button" value="검사등록" class="btn btn-secondary mybutton1">
  </c:when>
  <c:otherwise>
    <input type="submit" value="검사등록" class="btn btn-primary mybutton1">
  </c:otherwise>
</c:choose>

<c:choose>
  <c:when test="${not empty qualityDTO.qcCode}">
    <input type="button" value="검사시작" class="btn btn-primary mybutton1" onclick="location.href='${pageContext.request.contextPath}/qc/qcUpdate?prodCode=${qualityDTO.prodCode}'">
  </c:when>
  <c:otherwise>
    <input type="button" value="검사시작" class="btn btn-secondary mybutton1">
  </c:otherwise>
</c:choose>
<input type="text" id="qcStatus" class="form-control search-input input-center" readonly>

</div>
<!-- </form>form 끝 -->
</div><!-- main-details -->
</form>
<!-- 데이트피커 타임피커를 사용하기위한 j쿼리 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script>
// 받아온 값이 0 또는 null일 경우 '-'
function setPlaceholder(id, value) {
    var inputElement = document.getElementById(id);
    inputElement.placeholder = (value !== null && value !== "" && value !== "0") ? value : '-';
}
setPlaceholder('qcTest1', "${qualityDTO.qcTest1}");
setPlaceholder('qcTest2', "${qualityDTO.qcTest2}");
setPlaceholder('qcTest3', "${qualityDTO.qcTest3}");
setPlaceholder('qcStatus', "${qualityDTO.qcStatus}");
setPlaceholder('qcDefectRate', "${qualityDTO.qcDefectRate}");
setPlaceholder('prodCode', "${qualityDTO.prodCode}");

setPlaceholder('qcStartDate', "${qualityDTO.qcStartDate}");
setPlaceholder('qcEndDate', "${qualityDTO.qcEndDate}"); //시작일or완료일 컬럼추가하기
setPlaceholder('empName', "${qualityDTO.qcEmpName}");

function setPlaceholderQcEmp(id, value) {
    var inputElement = document.getElementById(id);
    inputElement.placeholder = (value !== null && value !== "" && value !== "0") ? value : '사원검색(클릭)';
}
setPlaceholderQcEmp('empId', "${qualityDTO.qcEmpId}");

function setPlaceholderStart(id, value) {
    var inputElement = document.getElementById(id);
    inputElement.placeholder = (value !== null && value !== "" && value !== "0") ? value : '(검사등록시 자동생성)';
}
setPlaceholderStart('qcCode', "${qualityDTO.qcCode}");
</script>

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
 	// 사원 검색 팝업 열기
    $("#empId, #empName").click(function() {
        var url = '${pageContext.request.contextPath}/workOrder/workEmpList';
        openPopup(url);
    });
});
//유효성 검사
function validateForm() {
    // 각 입력 필드 값
    var qcEmpId = document.getElementById("qcEmpId").value;
    // 빈 필드 검사
    if (qcEmpId === "") {
        alert("[품질검사원]을 입력해주세요.");
        return false; // 제출 방지
    }
    return true;
}
</script>
</body>
</html>