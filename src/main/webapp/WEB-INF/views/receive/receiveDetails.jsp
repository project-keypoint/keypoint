<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<div class="page-title">수주상세</div>
<div class="forms-group-receive">
<div class="form-group-receive">
<p>업체코드</p>
<input type="text" class="" name="cusCode" placeholder="업체코드" readonly>
</div>
<div class="form-group-receive">
<p>업체명</p>
<input type="text" class="" name="cusName" placeholder="업체명" readonly>
</div>
<div class="form-group-receive">
<p>상품코드</p>
<input type="text" class="" name="productCode" placeholder="상품코드" readonly>
</div>
<div class="form-group-receive">
<p>상품명</p>
<input type="text" class="" name="productName" placeholder="상품명" readonly>
</div>
<div class="form-group-receive">
<p>수주수량</p>
<input type="text" class="" name="roCount" placeholder="수주수량" readonly>
</div>
<div class="form-group-receive">
<p>수주금액</p>
<input type="text" class="" name="roPrice" placeholder="수주금액" readonly>
</div>
<div class="form-group-receive">
<p>수주일자</p>
<input type="text" class="" name="roDate" placeholder="수주일자" readonly>
</div>
<div class="form-group-receive">
<p>상태</p>
<input type="text" class="" name="roStatus" placeholder="상태" readonly>
</div>
</div>
<div class="details-buttons">
<input type="button" value="수정" class="" onclick="location.href='${pageContext.request.contextPath}/receive/receiveUpdate'">
<input type="button" value="삭제" class="">
</div>
</div><!-- main-details -->
</body>
</html>