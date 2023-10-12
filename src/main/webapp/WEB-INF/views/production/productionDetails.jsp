<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<div class="page-title-popup">작업지시상세</div>
			<div class="form-group-receive">
				<p>실적코드</p>
				<input type="text" id="woCode" class="form-control search-input"
					value="${workOrderDTO.woCode}" readonly>
			</div>
			<div class="search-bar-popup">
				<div class="form-group-receive">
					<p>업체명</p>
					<input type="text" id="cusCode" name="cusCode"
						class="form-control search-input inputcode"
						value="${workOrderDTO.cusCode}" readonly> <input
						type="text" id="cusName" name="cusName"
						class="form-control search-input inputname"
						value="${workOrderDTO.cusName}" readonly>
				</div>
				<div class="form-group-receive">
					<p>상품명</p>
					<input type="text" id="productCode" name="productCode"
						class="form-control search-input inputcode"
						value="${workOrderDTO.productCode}" readonly> <input
						type="text" id="productName" name="productName"
						class="form-control search-input inputname"
						value="${workOrderDTO.productName}" readonly>
				</div>
			</div>
			<div class="form-group-receive">
				<p>수주번호</p>
				<input type="text" id="roCode" name="roCode"
					class="form-control search-input"
					value="${workOrderDTO.roCode}" readonly>
			</div>
			<div class="form-group-receive">
				<p>지시수량</p>
				<input type="number" id="woCount" name="woCount"
					class="form-control search-input"
					value="${workOrderDTO.woCount}" min="0" readonly>
			</div>
			<div class="form-group-receive">
				<p>라인코드</p>
				<input type="text" id="lineCode" name="lineCode"
					class="form-control search-input"
					value="${workOrderDTO.lineCode}" readonly>
			</div>
			<div class="form-group-receive">
				<p>지시일자</p>
				<input type="text" id="woDate" name="woDate"
					class="form-control search-input"
					value="${workOrderDTO.woDate}" readonly>
			</div>
			<div class="form-group-receive">
				<p>납품예정일</p>
				<input type="text" id="shipSdate" name="shipSdate"
					class="form-control search-input"
					value="${workOrderDTO.shipSdate}" readonly>
			</div>
			<div class="form-group-receive">
				<p>상태</p>
				<input type="text" id="woStatus" class="form-control search-input"
					value="${workOrderDTO.woStatus}" readonly>
			</div>

			<div class="search-bar-popup">
				<div class="form-group-receive">
					<p>담당자</p>
					<input type="text" id="empId" name="empId"
						class="form-control search-input inputcode"
						value="${workOrderDTO.empId}" readonly> <input
						type="text" id="empName" name="empName"
						class="form-control search-input inputcode"
						value="${workOrderDTO.empName}" readonly>
				</div>
			</div>

		</div>
		<div class="details-buttons">
			<input type="button" value="수정" class="btn btn-primary mybutton1"
				onclick="location.href='${pageContext.request.contextPath}/workOrder/workOrderUpdate?woCode=${workOrderDTO.woCode}'">
			<input type="button" value="삭제" class="btn btn-secondary mybutton1" onclick="confirmDelete()">
		</div>
	</div>
	<!-- main-details -->
	
	<script>
// 삭제 확인메세지
function confirmDelete() {
    if (confirm("정말로 삭제하시겠습니까?")) {
        location.href = '${pageContext.request.contextPath}/workOrder/workOrderDelete?woCode=${workOrderDTO.woCode}';
    } else {
    	
    }
}
</script>
</body>
</html>