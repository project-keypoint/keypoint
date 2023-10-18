<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>완제품수정</title>
	<!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <!-- 수주 CSS 적용-->
    <link href="${pageContext.request.contextPath}/resources/css/product.css" rel="stylesheet">
</head>
<body>
<div class="main-details">
<form action="${pageContext.request.contextPath}/product/productUpdatePro" method="post" onsubmit="return validateForm()">
<div class="forms-group-receive">
<div class="page-title-popup">완제품수정</div>

<input type="hidden" name="productCode" id="productCode" class="form-control search-input" value="${productDTO.productCode}">

<div class="form-group-receive">
<p>완제품명</p>
<input type="text" name="productName" class="form-control search-input" value="${productDTO.productName}">
</div>
<div class="search-bar-popup">
<div class="form-group-receive">
<p>업체명</p>
<input type="text" name="cusCode" id="cusCode" class="form-control search-input inputcode" value="${productDTO.cusCode}">
<input type="text" name="cusName" id="cusName" class="form-control search-input inputname" value="${productDTO.cusName}" readonly>
</div>
</div>
<div class="form-group-receive">
<p>매출단가</p>
<input type="text" name="productPrice" class="form-control search-input" value="${productDTO.productPrice}">원
</div>
<div class="form-group-receive">
<p>초기수량</p>
<input type="number" name="productCount" class="form-control search-input" value="${productDTO.productCount}" min="0">
</div>
<div class="form-group-receive">
<p>단위</p>
<select name="productUnit" class="form-control search-input status" required="required">
<option value="EA" selected="selected">EA</option></select>
</div>
<div class="form-group-receive">
<p>비고</p>
<textarea rows="5px" cols="25px" name="productMemo" class="form-control search-input textarea" value="${productDTO.productMemo}"></textarea>
</div>

</div>
</div>
<div class="details-buttons">
<input type="submit" value="등록" class="btn btn-primary mybutton1">
<input type="button" value="취소" class="btn btn-secondary mybutton1" onClick="window.close()">
</div>
</form><!-- form 끝 -->
</div><!-- main-details -->

<!-- 데이트피커 타임피커를 사용하기위한 j쿼리 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
//팝업 창을 열어주는 함수
function openPopup(url) {
    var width = 500;
    var height = 500;
    var left = (screen.width - width) / 2;
    var top = (screen.height - height) / 2;
    var popupWindow = window.open(url, '_blank', "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
    popupWindow.focus();
}
$(document).ready(function() {
    // 상품명 검색 팝업 열기
    $("#cusCode").click(function() {
        var url = '${pageContext.request.contextPath}/workOrder/workCusList';
        openPopup(url);
    });
});
</script>
</body>
</html>