<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>품질검사대상</title>
	<!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<!--     <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet"> -->
    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <!-- 수주 CSS 적용-->
    <link href="${pageContext.request.contextPath}/resources/css/receive.css" rel="stylesheet">
</head>
<body>
<%@include file="../inc/top-bar.jsp" %>
<%@include file="../inc/side-bar.jsp" %>
<!--  contents start -->
<!-- <div class="contents" style="position:fixed; left: 15rem;"> -->
<div class="main">
<div class="card shadow" > <!-- 그림자아니야 영역 -->
<div class="page-title">품질검사목록</div>
<div class="contents2">

<div class="search-bar">
<div class="search-b">
<div class="search-select">
<p>상품명</p> 
<input type="text" id="productCode" class="form-control search-input readonly-color" placeholder="상품코드" style="width:110px;" readonly>
<input type="text" id="productName" class="form-control search-input readonly-color" placeholder="상품명(클릭)" readonly>
</div>
</div>

<div class="search-b">
<div class="search-date">
<p>폐기일</p> <input type="text" id="shipSdate1" class="form-control search-input readonly-color" placeholder="폐기일" readonly>
~<input type="text" id="shipSdate2" class="form-control search-input readonly-color" placeholder="폐기일" readonly>
</div>
</div>
<div class="search-button">
<input type="button" value="검색" class="btn btn-primary mybutton1">
<input type="button" value="취소" class="btn btn-secondary mybutton1">
</div>
</div><!-- search-bar -->
<br>
<div class="dis-select-buttons">
<div>
<input type="button" class="btn btn-secondary mybutton1" value="전체">
<input type="button" class="btn btn-secondary mybutton1" value="상품">
<input type="button" class="btn btn-secondary mybutton1" value="자재">
</div>
<div>
<input type="button" class="btn btn-secondary mybutton1" value="상품">
<input type="button" class="btn btn-secondary mybutton1" value="자재">
</div>
</div>
<div style="display: flex; justify-content: space-between;">
<div style="width: 69%;">
<table class="table-list">
<tr class="table-head">
	<th>폐기코드</th>
	<th>상품코드</th>
    <th>　　　상품명　　　</th>
    <th>폐기수량</th>
    <th>담당자</th>
    <th>이름</th>
    <th>폐기일자</th>
    <th>폐기내용</th>
</tr>
<c:forEach var="qualityDTO" items="${disposedList}">
<tr class="table-body">
	<td>${qualityDTO.disCode}</td>
	<td>${qualityDTO.disItemCode}</td>
	<td>
	<c:choose>
    <c:when test="${empty qualityDTO.productName}">
        ${qualityDTO.materialName}
    </c:when>
    <c:when test="${empty qualityDTO.materialName}">
        ${qualityDTO.productName}
    </c:when>
    </c:choose>
	</td>
	<td>${qualityDTO.disCount}</td>
	<td>${qualityDTO.disEmpId}</td>
	<td>${qualityDTO.disEmpName}</td>
	<td><c:out value="${fn:substring(qualityDTO.disDate, 0, 10)}" /></td>
	<td>${qualityDTO.disMemo}</td>
</tr>
</c:forEach>  
</table><!-- table1 -->
<div class="content-bottom">
<div>
<input type="button" value="추가(상품)" class="btn btn-primary mybutton1" onclick="openDisInsert()">
</div>
<div id="page_control" class="page-buttons">
    <c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
        <a href="${pageContext.request.contextPath}/qc/disposedList?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&search=${pageDTO.search}" class="page-button">&lt;</a>
    </c:if>
    <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
        <c:choose>
            <c:when test="${i eq pageDTO.pageNum}">
                <a href="${pageContext.request.contextPath}/qc/disposedList?pageNum=${i}&search=${pageDTO.search}" class="page-button page-button-active">${i}</a>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/qc/disposedList?pageNum=${i}&search=${pageDTO.search}" class="page-button">${i}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:if test="${pageDTO.endPage < pageDTO.pageCount}">
        <a href="${pageContext.request.contextPath}/qc/disposedList?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&search=${pageDTO.search}" class="page-button">&gt;</a>
    </c:if>
</div>
</div>
</div>
<div class="page-buttons" style="width: 29%;">
<table id="content1" class="table-list" style="display: none;">
<tr class="table-head">
	<th>상품코드</th>
	<th>　상품명　</th>
    <th>총폐기수량</th>
</tr>
<c:forEach var="qualityDTO" items="${disposedSum}">
<tr class="table-body">
	<td>${qualityDTO.productCode}</td>
	<td>${qualityDTO.productName}</td>
	<td>${qualityDTO.disSum}</td>
</tr>
</c:forEach>
</table><!-- 상품 disSum -->

<table id="content2" class="table-list">
<tr class="table-head">
	<th>자재코드</th>
	<th>　자재명　</th>
    <th>총폐기수량</th>
</tr>
<c:forEach var="qualityDTO" items="${disposedSumMat}">
<tr class="table-body">
	<td>${qualityDTO.materialCode}</td>
	<td>${qualityDTO.materialName}</td>
	<td>${qualityDTO.disSum}</td>
</tr>
</c:forEach>
</table><!-- 자재 disSum -->
</div>


</div>
</div><!-- contents -->
</div><!-- 그림자아니야 영역 -->

<!-- 리스트 -->

</div><!-- main -->
<!-- contents end -->

<!-- 데이트피커 타임피커를 사용하기위한 j쿼리 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
//폐기등록 새창
function openDisInsert() {
    var url = '${pageContext.request.contextPath}/qc/disInsert';
    var windowWidth = 500;
    var windowHeight = 425;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}
</script>

</body>
</html>