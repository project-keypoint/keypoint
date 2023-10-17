<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수주상세</title>
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
<!-- <div class="page-title">수주상세</div> -->
<div class="forms-group-receive">
<div class="page-title-popup">수주상세</div>
<div class="form-group-receive">
<p>수주번호</p>
<input type="text" id="roCode" class="form-control search-input" placeholder="${receiveDTO.roCode}" readonly>
</div>
<div class="form-group-receive">
<div class="search-bar-popup">
<div class="form-group-receive">
<p>업체명</p>
<input type="text" id="cusCode" class="form-control search-input inputcode input-short" placeholder="${receiveDTO.cusCode}" readonly>
<input type="text" id="cusName" class="form-control search-input inputname input-middle" placeholder="${receiveDTO.cusName}" readonly>
</div>
<div class="form-group-receive">
<p>상품명</p>
<input type="text" id="productCode" class="form-control search-input inputcode" placeholder="${receiveDTO.productCode}" readonly>
<input type="text" id="productName" class="form-control search-input inputname" placeholder="${receiveDTO.productName}" readonly>
</div>
</div>
</div>
<div class="form-group-receive">
<p>수주수량</p>
<input type="text" id="roCount" class="form-control search-input" placeholder="${receiveDTO.roCount}" readonly>
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
<input type="text" id="roPrice" class="form-control search-input" placeholder="<fmt:formatNumber value="${receiveDTO.roPrice}" groupingUsed="true"/>원" readonly>
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
<input type="text" id="roDate" class="form-control search-input" placeholder="${receiveDTO.roDate}" readonly>
<p>상태</p>
<input type="text" id="roStatus" class="form-control search-input" placeholder="${receiveDTO.roStatus}" readonly>
</div>
<div class="form-group-receive">
<p>납품예정일</p>
<input type="text" id="shipSdate" class="form-control search-input" placeholder="${receiveDTO.shipSdate}" readonly>
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
<div class="form-group-receive">
<div class="search-bar-popup">
<div class="form-group-receive">
<p>수주자</p>
<input type="text" id="roEmpId" name="roEmpId" class="form-control search-input inputcode" value="${receiveDTO.roEmpId}" style="width: 150px;" readonly>
<input type="text" id="roEmpName" name="roEmpName" class="form-control search-input inputcode" value="${receiveDTO.roEmpName}" readonly>
</div>
<div class="form-group-receive">
<p>납품자</p>
<input type="text" id="shipEmpId" name="shipEmpId" class="form-control search-input inputcode" value="새컬럼필요" style="width: 150px;" readonly>
<input type="text" id="shipEmpName" name="shipEmpName" class="form-control search-input inputcode" value="새컬럼필요" readonly>
</div>
</div>
</div>

</div>
<div class="details-buttons">
<c:choose>
    <c:when test="${not empty receiveDTO.shipDate}">
        <input type="button" value="수정" class="btn btn-secondary mybutton1">
    </c:when>
    <c:otherwise>
        <input type="button" value="수정" class="btn btn-primary mybutton1" onclick="location.href='${pageContext.request.contextPath}/receive/receiveUpdate?roCode=${receiveDTO.roCode}'">
    </c:otherwise>
</c:choose> 

<c:choose>    
    <c:when test = "${employeeDTO.empRole >= 2}">
	<input type="button" value="삭제" class="btn btn-secondary mybutton1" onclick="confirmDelete()">
    </c:when>
    <c:otherwise>
    <input type="button" value="삭제" class="btn btn-secondary mybutton1" onclick="accessDenied()">
    </c:otherwise>
</c:choose> 
</div>
</form>
</div><!-- main-details -->

<script>
// 삭제 확인메세지
function confirmDelete() {
    if (confirm("정말로 삭제하시겠습니까?")) {
        location.href = '${pageContext.request.contextPath}/receive/receiveDelete?roCode=${receiveDTO.roCode}';
    } else {
    	
    }
}
//권한없는 버튼
function accessDenied() {
    alert("권한이 없습니다.");
}
</script>
</body>
</html>