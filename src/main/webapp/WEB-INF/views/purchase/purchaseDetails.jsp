<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>발주상세</title>
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

<div class="forms-group-receive">
<div class="page-title-popup">발주상세</div>

<div class="form-group-receive">
<p>발주코드</p>
<input type="text" id="poCode" name="poCode" class="form-control search-input" placeholder="${purchaseDTO.poCode}" readonly>
</div>

<div class="search-bar-popup">
<div class="form-group-receive">
<p>자재코드</p>
<input type="text" id="materialCode" name="materialCode" class="form-control search-input inputcode" placeholder="${purchaseDTO.materialCode}" readonly>

</div>

<div class="form-group-receive">
<p>자재명</p>
<input type="text" id="materialName" name="materialName" class="form-control search-input inputname" placeholder="${purchaseDTO.materialName}" readonly>
</div>

<div class="form-group-receive">
<p>자재단가</p>
<input type="text" id="materialPrice" name="materialPrice" class="form-control search-input" placeholder="<fmt:formatNumber type='number' value='${purchaseDTO.materialPrice}' pattern='#,###'/>" readonly>
</div>
</div>

<div class="form-group-receive">
<p>발주수량</p>
<input type="number" id="poCount" name="poCount" class="form-control search-input" placeholder="${purchaseDTO.poCount}" min="0" readonly>
</div>

<div class="form-group-receive">
<p>발주금액</p>
<input type="text" class="form-control search-input" id="poPrice" name="poPrice" placeholder="<fmt:formatNumber type='number' value='${purchaseDTO.poPrice}' pattern='#,###'/>" readonly>
</div>

<div class="search-bar-popup">
<div class="form-group-receive">
<p>당담자명</p>
<%-- <input type="text" id="empId" name="empId" class="form-control search-input inputcode" placeholder="${purchaseDTO.poOwner}" readonly> --%>
<input type="text" id="empName" name="empName" class="form-control search-input inputcode" placeholder="${purchaseDTO.poOwner}" readonly>
</div>

<div class="form-group-receive">
<p>거래처명</p>
<input type="text" id="cusName" name="cusName" class="form-control search-input inputcode" placeholder="${purchaseDTO.cusName}" readonly>
</div>
</div>



<!-- <div class="form-group-receive"> -->
<!-- <p>담당자</p> -->
<%-- <input type="text" id="poOwner" name="poOwner" class="form-control search-input inputcode" placeholder="${purchaseDTO.poOwner}" readonly> --%>
<!-- </div> -->

<!-- <div class="form-group-receive"> -->
<!-- <p>거래처</p> -->
<%-- <input type="text" id="cusName" name="cusName" class="form-control search-input inputcode" placeholder="${purchaseDTO.cusName}" readonly> --%>
<!-- </div> -->


<div class="form-group-receive">
<p>발주일자</p>
<input type="text" id="poDate" name="poDate" class="form-control search-input" placeholder="${purchaseDTO.poDate}" readonly>
</div>

<div class="form-group-receive">
<p>납기일자</p>
<input type="text" id="payDate" name="payDate" class="form-control search-input" placeholder="${purchaseDTO.payDate}" readonly>
</div>

<div class="form-group-receive">
<p>발주상태</p>
<input type="text" id="poStatus" name="poStatus" class="form-control search-input" placeholder="${purchaseDTO.poStatus}" readonly>
</div>

</div>
<div class="details-buttons">

<c:choose>    
    <c:when test = "${employeeDTO.empRole >= 2}">

	<c:if test="${purchaseDTO.poStatus eq '발주대기'}">
        <input type="button" value="수정" class="btn btn-primary mybutton1" onclick="location.href='${pageContext.request.contextPath}/purchase/purchaseUpdate?poCode=${purchaseDTO.poCode}'">
        <input type="button" value="삭제" class="btn btn-secondary mybutton1" onclick="confirmDelete()">
    </c:if>
    
    </c:when>
    <c:otherwise>
    </c:otherwise>
</c:choose>



</div>

</div><!-- main-details -->

<script>
// 삭제 확인메세지
function confirmDelete() {
    if (confirm("정말로 삭제하시겠습니까?")) {
        location.href = '${pageContext.request.contextPath}/purchase/purchaseDelete?poCode=${purchaseDTO.poCode}';
    } else {
    	
    }
}
</script>



</body>
</html>