<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업지시상세</title>
<!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css"
	rel="stylesheet">
<!-- 수주 CSS 적용-->
<link
	href="${pageContext.request.contextPath}/resources/css/workOrder.css"
	rel="stylesheet">
</head>
<body>
	<div class="main-details">
		<!-- <div class="page-title">작업지시상세</div> -->
		<div class="forms-group-receive">
			<div class="page-title-popup">생산실적상세</div>
			<div class="form-group-receive">
				<p>실적코드</p>
				<input type="text" id="poCode" class="form-control search-input"
					value="${productionDTO.poCode}" readonly>
			</div>			
			<div class="search-bar-popup">
				<div class="form-group-receive">
					<p>실적일자</p>
					<input type="text" id="poDate" name="poDate"
						class="form-control search-input inputcode"
						value="${productionDTO.poDate}" readonly> 
<!-- 						<input type="text" id="cusName" name="cusName" -->
<!-- 						class="form-control search-input inputname" -->
<%-- 						value="${workOrderDTO.cusName}" readonly> --%>
				</div>
				<div class="form-group-receive">
					<p>라인코드</p>
					<input type="text" id="lineCode" name="lineCode"
						class="form-control search-input inputcode"
						value="${productionDTO.lineCode}" readonly> 
<!-- 						<input type="text" id="productName" name="productName" -->
<!-- 						class="form-control search-input inputname" -->
<%-- 						value="${workOrderDTO.productName}" readonly> --%>
				</div>
			<div class="form-group-receive">
				<p>상품명</p>
				<input type="text" id="productCode" name="productCode"
					class="form-control search-input"
					value="${productionDTO.productCode}" readonly>
						<input type="text" id="productName" name="productName" 
						class="form-control search-input inputname"
						value="${productionDTO.productName}" readonly>
			</div>
			</div>
			<div class="form-group-receive">
				<p>지시수량</p>
				<input type="number" id="poCount" name="poCount"
					class="form-control search-input"
					value="${productionDTO.poCount}" min="0" readonly>
			</div>
			<div class="form-group-receive">
				<p>양품</p>
				<input type="text" id="poGood" name="poGood"
					class="form-control search-input"
					value="${productionDTO.poGood}" readonly>
			</div>
			<div class="form-group-receive">
				<p>불량</p>
				<input type="text" id="poErr" name="poErr"
					class="form-control search-input"
					value="${productionDTO.poErr}" readonly>
			</div>
			<div class="form-group-receive">
				<p>불량사유</p>
				<input type="text" id="poCause" name="poCause"
					class="form-control search-input"
					value="${productionDTO.poCause}" readonly>
			</div>
<!-- 			<div class="form-group-receive"> -->
<!-- 				<p>상태</p> -->
<!-- 				<input type="text" id="woStatus" class="form-control search-input" -->
<%-- 					value="${productionDTO.woStatus}" readonly> --%>
<!-- 			</div> -->
			<div class="form-group-receive">
				<p>수주번호</p>
				<input type="text" id="roCode" class="form-control search-input"
					value="${productionDTO.roCode}" readonly>
			</div>
			<div class="form-group-receive">
				<p>거래처</p>
				<input type="text" id="cusCode" class="form-control search-input"
					value="${productionDTO.cusCode}" readonly>
					<input type="text" id="cusName" class="form-control search-input"
					value="${productionDTO.cusName}" readonly>
			</div>

<!-- 			<div class="search-bar-popup"> -->
<!-- 				<div class="form-group-receive"> -->
<!-- 					<p>담당자</p> -->
<!-- 					<input type="text" id="empId" name="empId" -->
<!-- 						class="form-control search-input inputcode" -->
<%-- 						value="${productionDTO.empId}" readonly> <input --%>
<!-- 						type="text" id="empName" name="empName" -->
<!-- 						class="form-control search-input inputcode" -->
<%-- 						value="${productionDTO.empName}" readonly> --%>
<!-- 				</div> -->
<!-- 			</div> -->

		</div>
		<div class="details-buttons">
			<input type="button" value="수정" class="btn btn-primary mybutton1"
				onclick="location.href='${pageContext.request.contextPath}/production/productionUpdate?poCode=${productionDTO.poCode}'">
			<c:choose>    
   				 <c:when test = "${employeeDTO.empRole >= 2}">
			<input type="button" value="삭제" class="btn btn-secondary mybutton1" onclick="confirmDelete()">
				 </c:when>
   			<c:otherwise>
   				 <input type="button" value="삭제" class="btn btn-secondary mybutton1" onclick="accessDenied()" style="margin-right: 3px;">
   			</c:otherwise>
			</c:choose>  
		
		</div>
	</div>
	<!-- main-details -->
	
	<script>
// 삭제 확인메세지
function confirmDelete() {
    if (confirm("정말로 삭제하시겠습니까?")) {
        location.href = '${pageContext.request.contextPath}/production/productionDelete?poCode=${productionDTO.poCode}';
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