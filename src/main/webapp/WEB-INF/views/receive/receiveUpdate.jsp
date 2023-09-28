<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<form action="#">
<div class="forms-group-receive">
<div class="page-title-popup">수주수정</div>
<div class="form-group-receive">
<p>수주번호</p>
<input type="text" id="roCode" class="form-control search-input" placeholder="수주번호" readonly>
</div>
<div class="search-bar-popup">
<div class="form-group-receive">
<p>업체명</p>
<input type="text" id="cusCode" class="form-control search-input inputcode" placeholder="업체검색">
<input type="text" id="cusName" class="form-control search-input inputname" placeholder="업체명" readonly>
</div>
<div class="form-group-receive">
<p>상품명</p>
<input type="text" id="productCode" class="form-control search-input inputcode" placeholder="상품검색">
<input type="text" id="productName" class="form-control search-input inputname" placeholder="상품명" readonly>
</div>
</div>
<div class="form-group-receive">
<p>수주수량</p>
<input type="number" id="roCount" class="form-control search-input" placeholder="수주수량" min="0">
</div>
<div class="form-group-receive">
<p>수주금액</p>
<input type="text" id="roPrice" class="form-control search-input" placeholder="수주금액" readonly>
</div>
<div class="form-group-receive">
<p>수주등록일</p>
<input type="text" id="roDate" class="form-control search-input" placeholder="수주등록일" readonly>
</div>
<div class="form-group-receive">
<p>납품예정일</p>
<input type="text" id="shipSdate" class="form-control search-input" placeholder="납품예정일">
</div>
<div class="form-group-receive">
<p>상태</p>
<select id="roStatus" name="roStatus" class="form-control search-input status">
        <option value="pending">대기</option>
        <option value="ongoing">진행</option>
        <option value="completed">완료</option>
        <option value="canceled">취소</option>
</select>
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
//업체명(거래처) 검색 새창
var searchCustomer = document.getElementById("cusCode");
searchCustomer.addEventListener("click", function () {
	var url = '${pageContext.request.contextPath}/receive/empty';
	// ↑ 업체검색페이지 새로 입력하기
    window.open(url, '_blank', 'width=400, height=400');
});

//상품명 검색 새창
var searchProduct = document.getElementById("productCode");
searchProduct.addEventListener("click", function () {
	var url = '${pageContext.request.contextPath}/receive/empty';
	// ↑ 상품검색페이지 새로 입력하기
    window.open(url, '_blank', 'width=400, height=400');
});

//수주일, 납품예정일 검색 데이트피커(나중에 수정하기)
$(function() {
    $("#shipSdate").datepicker({
    	dateFormat: "yy-mm-dd"
    });
});
</script>
</body>
</html>