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
<!-- <div class="select-status"> -->
<!-- <a>전체<input type="radio" id="select1" name="select" class="list-select" checked></a> -->
<!-- <a>상품<input type="radio" id="select2" name="select" class="list-select"></a> -->
<!-- <a>자재<input type="radio" id="select3" name="select" class="list-select"></a> -->
<!-- <a>( 체크박스 사용여부 보류중 )</a> -->
<!-- </div> -->
<div style="display: flex; justify-content: space-between;">
<div style="width: 69%;">
<table class="table-list">
<tr class="table-head">
	<th>폐기코드</th>
	<th>상품코드</th>
    <th>　상품명　</th>
    <th>폐기수량</th>
    <th>폐기담당자</th>
    <th>폐기일자</th>
    <th>　　　　　　폐기내용　　　　　　</th>
</tr>
<tr class="table-body">
	<td>DISP00001</td>
	<td>P1123</td>
	<td>키키보드</td>
	<td>2</td>
	<td>홍길동</td>
	<td>2023-10-11</td>
	<td>품질검사 불량</td>
</tr>
</table><!-- table1 -->
<div class="content-bottom">
<div>
<input type="button" value="추가(상품)" class="btn btn-primary mybutton1">
</div>
<div id="page_control" class="page-buttons">
<a href="#" class="page-button">1</a>
<a href="#" class="page-button">2</a>
<a href="#" class="page-button">3</a>
<a href="#" class="page-button">4</a>
<a href="#" class="page-button">5</a>
<%--     <c:if test="${pageDTO.startPage > pageDTO.pageBlock}"> --%>
<%--         <a href="${pageContext.request.contextPath}/qc/qcList?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&search=${pageDTO.search}" class="page-button">&lt;</a> --%>
<%--     </c:if> --%>
<%--     <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1"> --%>
<%--         <c:choose> --%>
<%--             <c:when test="${i eq pageDTO.pageNum}"> --%>
<%--                 <a href="${pageContext.request.contextPath}/qc/qcList?pageNum=${i}&search=${pageDTO.search}" class="page-button page-button-active">${i}</a> --%>
<%--             </c:when> --%>
<%--             <c:otherwise> --%>
<%--                 <a href="${pageContext.request.contextPath}/qc/qcList?pageNum=${i}&search=${pageDTO.search}" class="page-button">${i}</a> --%>
<%--             </c:otherwise> --%>
<%--         </c:choose> --%>
<%--     </c:forEach> --%>
<%--     <c:if test="${pageDTO.endPage < pageDTO.pageCount}"> --%>
<%--         <a href="${pageContext.request.contextPath}/qc/qcList?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&search=${pageDTO.search}" class="page-button">&gt;</a> --%>
<%--     </c:if> --%>
</div>
</div>
</div>
<div style="width: 29%;">
<table class="table-list">
<tr class="table-head">
	<th>상품코드</th>
	<th>　상품명　</th>
    <th>총폐기수량</th>
</tr>
<tr class="table-body">
	<td>P1123</td>
	<td>키키보드</td>
	<td>SUM(disCount)</td>
</tr>
</table><!-- table2 -->
<div class="content-bottom">
<div></div>
<div id="page_control" class="page-buttons">
<a href="#" class="page-button">1</a>
<a href="#" class="page-button">2</a>
<a href="#" class="page-button">3</a>
<a href="#" class="page-button">4</a>
<a href="#" class="page-button">5</a>
<%--     <c:if test="${pageDTO.startPage > pageDTO.pageBlock}"> --%>
<%--         <a href="${pageContext.request.contextPath}/qc/qcList?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&search=${pageDTO.search}" class="page-button">&lt;</a> --%>
<%--     </c:if> --%>
<%--     <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1"> --%>
<%--         <c:choose> --%>
<%--             <c:when test="${i eq pageDTO.pageNum}"> --%>
<%--                 <a href="${pageContext.request.contextPath}/qc/qcList?pageNum=${i}&search=${pageDTO.search}" class="page-button page-button-active">${i}</a> --%>
<%--             </c:when> --%>
<%--             <c:otherwise> --%>
<%--                 <a href="${pageContext.request.contextPath}/qc/qcList?pageNum=${i}&search=${pageDTO.search}" class="page-button">${i}</a> --%>
<%--             </c:otherwise> --%>
<%--         </c:choose> --%>
<%--     </c:forEach> --%>
<%--     <c:if test="${pageDTO.endPage < pageDTO.pageCount}"> --%>
<%--         <a href="${pageContext.request.contextPath}/qc/qcList?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&search=${pageDTO.search}" class="page-button">&gt;</a> --%>
<%--     </c:if> --%>
</div>
</div>
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
</script>

</body>
</html>