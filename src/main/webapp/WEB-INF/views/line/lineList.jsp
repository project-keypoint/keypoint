<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라인관리</title>

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
<link
	href="${pageContext.request.contextPath}/resources/css/receive.css"
	rel="stylesheet">
</head>
</head>
<body>
	<%@include file="../inc/top-bar.jsp"%>
	<%@include file="../inc/side-bar.jsp"%>


	<!--  contents start -->
	<div class="main">
<div class="card shadow" > <!-- 그림자아니야 영역 -->
<div class="page-title">라인현황</div>
<div class="contents2">
<div class="search-bar">
<div class="search-b">
<div class="search-select">
<p>라인명</p> 
<input type="text" id="cusCode" class="form-control search-input" placeholder="라인코드" style="width:110px;" readonly>
<input type="text" id="cusName" class="form-control search-input" placeholder="라인명(클릭)" readonly>
</div>
<div class="search-select">
<p>작업명</p> 
<input type="text" id="productCode" class="form-control search-input" placeholder="작업코드" style="width:110px;" readonly>
<input type="text" id="productName" class="form-control search-input" placeholder="작업명(클릭)" readonly>
</div>
</div>

<div class="search-button">
<input type="button" value="검색" class="btn btn-primary mybutton1">
<input type="button" value="취소" class="btn btn-secondary mybutton1">
</div>
</div><!-- search-bar -->
<br>
<!-- <div class="select-status"> -->
<!-- <a>대기<input type="checkbox" id="select1" name="select1" class="list-select" checked></a> -->
<!-- <a>진행<input type="checkbox" id="select2" name="select2" class="list-select" checked></a> -->
<!-- <a>완료<input type="checkbox" id="select3" name="select3" class="list-select" checked></a> -->
<!-- <a>취소<input type="checkbox" id="select4" name="select4" class="list-select"></a> -->
<!-- <a>( 체크박스 사용여부 보류중 )</a> -->
<!-- <div> -->
<!-- </div> -->
<!-- </div> -->

<div>
<table class="table-list">
<tr class="table-head">
	<th><input type="checkbox" id="delete-list-all" name="delete-list" data-group="delete-list"></th>
	<th>라인코드</th>
    <th>라인명</th>
    <th>작업코드</th>
    <th>작업명</th>
    <th>담당자</th>
    <th>작업상태</th>
    <th>상세보기</th>
</tr>
<c:forEach var="LineDTO" items="${LineList}">
<tr class="table-body">
	<td><input type="checkbox" id="delete-list" name="delete-list" data-group="delete-list"></td>
    <td>${LineDTO.lineCode}</td>
    <td>${LineDTO.lineName}</td>
    <td>${WorkOrderDTO.woCode}</td>
    <td>${LineDTO.lineMemo}</td>
    <td>${LineDTO.lineEmp}</td>
    <td><button>대기중</button></td>
   
<%--     <td><c:out value="${fn:substring(receiveDTO.roDate, 0, 10)}" /></td> --%>
<%--     <td>${receiveDTO.shipSdate}</td> --%>
<%--     <td><c:choose> --%>
<%--             <c:when test="${not empty receiveDTO.shipDate}"> --%>
<%--                 ${receiveDTO.shipDate} --%>
<%--             </c:when> --%>
<%--             <c:otherwise> --%>
<!--                 - -->
<%--             </c:otherwise> --%>
<%--         </c:choose></td><!-- 납품일 null 대신 '-' --> --%>
<%--     <td>${receiveDTO.roStatus}</td> --%>
    <td><input type="button" value="상세내역" class="btn btn-secondary mybutton1" onclick="openDetails('${lineDTO.lineCode}')"></td>
</tr>
</c:forEach>    
</table>
</div><!-- table -->
<div class="content-bottom">
<div>
<input type="button" value="라인등록" class="btn btn-primary mybutton1" onclick="openInsert()">
<input type="button" value="삭제" class="btn btn-secondary mybutton1">
</div>
<div class="page-buttons">
<a href="#" class="page-button">&lt;</a>
<a href="#" class="page-button page-button-active">1</a>
<a href="#" class="page-button">2</a>
<a href="#" class="page-button">3</a>
<a href="#" class="page-button">4</a>
<a href="#" class="page-button">5</a>
<a href="#" class="page-button">&gt;</a>
</div><!-- page-button -->
</div>
</div><!-- contents -->
</div><!-- 그림자아니야 영역 -->
</div><!-- main -->

		<!-- contents end -->
</body>
</html>