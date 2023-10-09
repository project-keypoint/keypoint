<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>완제품목록</title>
	<!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<!--     <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet"> -->

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <!-- 수주 CSS 적용-->
    <link href="${pageContext.request.contextPath}/resources/css/product.css" rel="stylesheet">
</head>
<body>
<%@include file="../inc/top-bar.jsp" %>
<%@include file="../inc/side-bar.jsp" %>
<!--  contents start -->
<!-- <div class="contents" style="position:fixed; left: 15rem;"> -->
<div class="main">
<div class="card shadow" > <!-- 그림자아니야 영역 -->
<div class="page-title">완제품목록(재고현황)</div>
<div class="contents2">
<div class="search-bar">
<div class="search-b">
<div class="search-select">
<p>완제품코드</p> <input type="text" id="productCode" class="form-control search-input" placeholder="완제품코드 ">
</div>
<div class="search-select">
<p>완제품명</p> <input type="text" id="productName" class="form-control search-input" placeholder="완제품명 ">
</div>
</div>

<div class="search-button">
<input type="button" value="검색" class="btn btn-primary mybutton1">
<input type="button" value="취소" class="btn btn-secondary mybutton1">
</div>
</div><!-- search-bar -->
<br>



<div>
<table class="table-list">
<tr class="table-head">
	<th><input type="checkbox" id="delete-list-all" name="delete-list" data-group="delete-list"></th>
    <th>완제품코드</th>
    <th>완제품명</th>
    <th>거래처코드</th>
    <th>매출단가</th>
    <th>수량</th>
    <th>단위</th>
    <th>비고</th>
    <th>관리</th>
</tr>

<c:forEach var="productDTO" items="${productList}">
<tr class="table-body">
	<td><input type="checkbox" id="delete-list" name="delete-list" data-group="delete-list"></td>
    <td>${productDTO.productCode}</td>
    <td>${productDTO.productName}</td>
    <td>${productDTO.cusCode}</td>
    <td>${productDTO.productPrice}원</td>
    <td>${productDTO.productCount}</td>
    <td>${productDTO.productUnit}</td>
    <td>${productDTO.productMemo}</td>
    <td><input type="button" value="수정" class="btn btn-primary mybutton1" onclick="openUpdate('${productDTO.productCode}')">
    	<input type="button" value="삭제" class="btn btn-secondary mybutton1" onclick="confirmDelete('${productDTO.productCode}')"></td>
</tr>
</c:forEach>      

</table>
</div><!-- table -->
<div class="content-bottom">
<div>
<input type="button" value="등록" class="btn btn-primary mybutton1" onclick="openInsert()">
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
    $("#productCode, #productName").click(function() {
        var url = '${pageContext.request.contextPath}/workOrder/workProdList';
        openPopup(url);
    });
});
// //업체명(거래처) 검색 새창
// var searchCustomer = document.getElementById("search-customer");
// searchCustomer.addEventListener("click", function () {
// 	var url = '${pageContext.request.contextPath}/receive/empty';
// 	// ↑ 업체검색페이지 새로 입력하기
//     window.open(url, '_blank', 'width=400, height=400');
// });

// //상품명 검색 새창
// var searchProduct = document.getElementById("search-product");
// searchProduct.addEventListener("click", function () {
// 	var url = '${pageContext.request.contextPath}/receive/empty';
// 	// ↑ 상품검색페이지 새로 입력하기
//     window.open(url, '_blank', 'width=400, height=400');
// });
//수주일, 납품예정일 검색 데이트피커(나중에 수정하기)
$(function() {
    $("#roDate1").datepicker({
    	dateFormat: "yy-mm-dd"
    });
    $("#roDate2").datepicker({
    	dateFormat: "yy-mm-dd"
    });
    $("#shipSdate1").datepicker({
    	dateFormat: "yy-mm-dd"
    });
    $("#shipSdate2").datepicker({
    	dateFormat: "yy-mm-dd"
    });
});

// 체크박스(삭제용) 전체선택
var selectAllCheckbox = document.getElementById("delete-list-all");
var checkboxes = document.querySelectorAll('[data-group="delete-list"]');
selectAllCheckbox.addEventListener("change", function () {
    checkboxes.forEach(function (checkbox) {
        checkbox.checked = selectAllCheckbox.checked;
    });
});
checkboxes.forEach(function (checkbox) {
    checkbox.addEventListener("change", function () {
        if (!this.checked) {
            selectAllCheckbox.checked = false;
        } else {
            // 모든 체크박스가 선택되었는지 확인
            var allChecked = true;
            checkboxes.forEach(function (c) {
                if (!c.checked) {
                    allChecked = false;
                }
            });
            selectAllCheckbox.checked = allChecked;
        }
    });
});

// 완제품등록 새창
function openInsert() {
    var url = '${pageContext.request.contextPath}/product/productInsert';
    var windowWidth = 500;
    var windowHeight = 600;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}
// 완제품수정 새창
function openUpdate(productCode) {
    var url = '${pageContext.request.contextPath}/product/productUpdate?productCode='+productCode;
    var windowWidth = 500;
    var windowHeight = 600;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}
//삭제 확인메세지
function confirmDelete(productCode) {
    if (confirm("정말로 삭제하시겠습니까?")) {
    	var query = {"productCode" : productCode};
    	$.ajax({
        	url : "${pageContext.request.contextPath}/product/productDelete",
    		type : "get",
    		data : query,
    		dataType : "text",
    		success : function(data){
    			location.reload();
    		}
    	});
    } 
}
</script>

</body>
</html>