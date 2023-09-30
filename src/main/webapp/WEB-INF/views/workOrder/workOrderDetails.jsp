<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업지시상세</title>
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
<!-- <div class="page-title">수주상세</div> -->
<div class="forms-group-receive">
<div class="page-title-popup">수주상세</div>
<div class="form-group-receive">
<p>지시번호</p>
<input type="text" id="search-customer" class="form-control search-input" placeholder="수주번호" readonly>
</div>
<div class="search-bar-popup">
<div class="form-group-receive">
<p>업체명</p>
<input type="text" id="search-customer" class="form-control search-input inputcode" placeholder="업체코드" readonly>
<input type="text" id="search-customer" class="form-control search-input inputname" placeholder="업체명" readonly>
</div>
<div class="form-group-receive">
<p>상품명</p>
<input type="text" id="search-customer" class="form-control search-input inputcode" placeholder="상품코드" readonly>
<input type="text" id="search-customer" class="form-control search-input inputname" placeholder="상품명" readonly>
</div>
</div>
<div class="form-group-receive">
<p>지시수량</p>
<input type="text" id="search-customer" class="form-control search-input" placeholder="수주수량" readonly>
</div>
<div class="form-group-receive">
<p>수주금액</p>
<input type="text" id="search-customer" class="form-control search-input" placeholder="수주금액" readonly>
</div>
<div class="form-group-receive">
<p>수주등록일</p>
<input type="text" id="search-customer" class="form-control search-input" placeholder="수주등록일" readonly>
</div>
<div class="form-group-receive">
<p>납품예정일</p>
<input type="text" id="search-customer" class="form-control search-input" placeholder="납품예정일" readonly>
</div>
<div class="form-group-receive">
<p>상태</p>
<input type="text" id="search-customer" class="form-control search-input" placeholder="상태" readonly>
</div>
</div>
<div class="details-buttons">
<input type="button" value="수정" class="btn btn-primary mybutton1" onclick="location.href='${pageContext.request.contextPath}/receive/receiveUpdate'">
<input type="button" value="삭제" class="btn btn-secondary mybutton1">
</div>
</div><!-- main-details -->
</body>
</html>