<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수주수정</title>
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
<form action="${pageContext.request.contextPath}/receive/receiveUpdatePro" method="post" onsubmit="return validateForm()">
<div class="forms-group-receive">
<div class="page-title-popup">수주수정</div>
<div class="form-group-receive">
<p>수주번호</p>
<input type="text" id="roCode" name="roCode" class="form-control search-input" value="${receiveDTO.roCode}" readonly>
</div>
<div class="search-bar-popup">
<div class="form-group-receive">
<p>업체명</p>
<input type="text" id="cusCode" name="cusCode" class="form-control search-input inputcode readonly-color" value="${receiveDTO.cusCode}" readonly>
<input type="text" id="cusName" class="form-control search-input inputname readonly-color" value="${receiveDTO.cusName}" readonly>
</div>
<div class="form-group-receive">
<p>상품명</p>
<input type="text" id="productCode" name="productCode" class="form-control search-input inputcode readonly-color readonly-color" value="${receiveDTO.productCode}" readonly>
<input type="text" id="productName" class="form-control search-input inputname readonly-color readonly-color" value="${receiveDTO.productName}" readonly>
</div>
</div>
<div class="form-group-receive">
<p>수주수량</p>
<input type="number" id="roCount" name="roCount" class="form-control search-input" value="${receiveDTO.roCount}" min="0">
<p>납품수량</p>
<c:choose>
    <c:when test="${not empty receiveDTO.shipDate}">
        <input type="text" id="shipCount" class="form-control search-input f-bold" placeholder="${receiveDTO.shipCount}" readonly>
    </c:when>
    <c:otherwise>
        <input type="text" id="shipCount" class="form-control search-input f-bold" placeholder="-" readonly>
    </c:otherwise>
</c:choose>
</div>
<div class="form-group-receive">
<p>수주금액</p>
<input type="text" id="roPrice" class="form-control search-input" value="<fmt:formatNumber value="${receiveDTO.roPrice}" groupingUsed="true"/>원" readonly>
<p>납품금액</p>
<c:choose>
    <c:when test="${not empty receiveDTO.shipDate}">
        <input type="text" id="shipPrice" class="form-control search-input f-bold" placeholder="<fmt:formatNumber value="${receiveDTO.shipPrice}" groupingUsed="true"/>원" readonly>
    </c:when>
    <c:otherwise>
        <input type="text" id="shipPrice" class="form-control search-input f-bold" placeholder="-" readonly>
    </c:otherwise>
</c:choose> 
</div>
<div class="form-group-receive">
<p>납품메모</p>
<c:choose>
    <c:when test="${not empty receiveDTO.shipDate}">
        <input type="text" id="shipMemo" class="form-control search-input" placeholder="${receiveDTO.shipMemo}" style="width: 445px;" readonly>
    </c:when>
    <c:otherwise>
        <input type="text" id="shipMemo" class="form-control search-input" placeholder="-" style="width: 445px;" readonly>
    </c:otherwise>
</c:choose>
</div>
<div class="form-group-receive">
<p>수주등록일</p>
<input type="text" id="roDate" class="form-control search-input" value="${receiveDTO.roDate}" readonly>
<p>상태</p>
<select id="roStatus" name="roStatus" class="form-control search-input status">
    <option value="대기" ${receiveDTO.roStatus eq '대기' ? 'selected' : ''}>대기</option>
    <option value="진행" ${receiveDTO.roStatus eq '진행' ? 'selected' : ''}>진행</option>
    <option value="완료" ${receiveDTO.roStatus eq '완료' ? 'selected' : ''}>완료</option>
    <option value="취소" ${receiveDTO.roStatus eq '취소' ? 'selected' : ''}>취소</option>
</select>
</div>
<div class="form-group-receive">
<p>납품예정일</p>
<input type="text" id="shipSdate" name="shipSdate" class="form-control search-input readonly-color" value="${receiveDTO.shipSdate}" readonly>
<p>납품일</p>
<c:choose>
    <c:when test="${not empty receiveDTO.shipDate}">
        <input type="text" id="shipDate" class="form-control search-input" placeholder="${receiveDTO.shipDate}" readonly>
    </c:when>
    <c:otherwise>
        <input type="text" id="shipDate" class="form-control search-input" placeholder="-" readonly>
    </c:otherwise>
</c:choose>
</div>

<div class="search-bar-popup">
<div class="form-group-receive">
<p>수주자</p>
<input type="text" id="empId" name="roEmpId" class="form-control search-input inputcode readonly-color" value="${receiveDTO.roEmpId}" style="width: 150px;" readonly>
<input type="text" id="empName" name="roEmpName" class="form-control search-input inputcode readonly-color" value="${receiveDTO.roEmpName}" readonly>
</div>
<div class="form-group-receive">
<p>납품자</p>
<c:choose>
	<c:when test="${0 eq receiveDTO.shipEmpId}">
	<input type="text" class="form-control search-input inputcode" value="-" style="width: 150px;" readonly>
	</c:when>
	<c:otherwise>
	<input type="text" id="shipEmpId" class="form-control search-input inputcode" value="${receiveDTO.shipEmpId}" style="width: 150px;" readonly>
	</c:otherwise>
</c:choose>
<c:choose>
	<c:when test="${empty receiveDTO.shipEmpName}">
	<input type="text" class="form-control search-input inputcode" value="-" readonly>
	</c:when>
	<c:otherwise>
	<input type="text" id="shipEmpName"  class="form-control search-input inputcode" value="${receiveDTO.shipEmpName}" readonly>
	</c:otherwise>
</c:choose>
<%-- <input type="text" id="shipEmpId" class="form-control search-input inputcode" value="${receiveDTO.shipEmpId}" style="width: 150px;" readonly> --%>
<%-- <input type="text" id="shipEmpName" class="form-control search-input inputcode" value="${receiveDTO.shipEmpName}" readonly> --%>
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
    var width = 590;
    var height = 470;
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
    $("#productCode, #productName").click(function() {
        var url = '${pageContext.request.contextPath}/workOrder/workProdList';
        openPopup(url);
    });
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
    var shipSdate = "${receiveDTO.shipSdate}"; // 서버에서 날짜를 받아옵니다.
    var formattedDate = new Date(shipSdate).toISOString().slice(0, 10);
    $("#shipSdate").val(formattedDate);
});
//유효성 검사
function validateForm() {
    // 각 입력 필드 값
    var cusCode = document.getElementById("cusCode").value;
    var productCode = document.getElementById("productCode").value;
    var roCount = document.getElementById("roCount").value;
    var roDate = document.getElementById("roDate").value;
    var shipSdate = document.getElementById("shipSdate").value;
    var roEmpId = document.getElementById("roEmpId").value;
    // 빈 필드 검사
    if (cusCode === "" || productCode === "" || roCount === "" ||
    	roDate === "" || shipSdate === "" || roEmpId === "") {
        alert("모든 내용을 입력해주세요.");
        return false; // 제출 방지
    }
    // 추가 유효성 검사
    if (roCount == 0) {
        alert("몇개부터 가능하도록 할까");
        return false; // 제출 방지
    }
    return true;
}
</script>
</body>
</html>