<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수주테스트</title>
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
<style>

</style>
<body>
<%@include file="../inc/top-bar.jsp" %>
<%@include file="../inc/side-bar.jsp" %>
<!--  contents start -->
<!-- <div class="contents" style="position:fixed; left: 15rem;"> -->
<div class="main">
<div class="card shadow mb-4" > <!-- 그림자아니야 영역 -->

<div class="page-title">수주현황(전체수주목록)</div>
<div class="contents">
<div class="search-bar">
업체명 : <input type="text" id="search-customer" class="search-input">
　상품명 : <input type="text" id="search-product" class="search-input">
　<input type="button" value="검색">
</div><!-- search-bar -->

<br>

<div class="test">
<div>
<a>　대기<input type="checkbox" id="select1" name="select1" class="list-select" checked></a>
<a>진행<input type="checkbox" id="select2" name="select2" class="list-select" checked></a>
<a>완료<input type="checkbox" id="select3" name="select3" class="list-select" checked></a>
<a>취소<input type="checkbox" id="select4" name="select4" class="list-select"></a>
</div>
<div>
<input type="button" value="등록" class="insert" onclick="openInsert()">
<input type="button" value="삭제" class="">
</div>
</div>

<div>
<table class="table-list">
<tr class="table-head">
	<td><input type="checkbox" id="delete-list-all" name="delete-list" data-group="delete-list"></td>
	<td>수주번호</td>
    <td>업체코드</td>
    <td>업체명</td>
    <td>상품코드</td>
    <td>상품명</td>
    <td>수량</td>
    <td>수주금액</td>
    <td>수주일자</td>
    <td>상태</td>
    <td>상세내역</td>
</tr>

<tr class="table-body">
	<td><input type="checkbox" id="delete-list" name="delete-list" data-group="delete-list"></td>
    <td>RO2309272201</td>
    <td>C012003</td>
    <td>키키보드</td>
    <td>EEB003</td>
    <td>키포인트넘버원</td>
    <td>30 EA</td>
    <td>500,000원</td>
    <td>23.09.27</td>
    <td>대기</td>
    <td><input type="button" value="상세내역" class="detail" onclick="openDetails()"></td>
	<!-- + openDetails(가져갈값넣기) -->
</tr>
    
<tr class="table-body">
	<td><input type="checkbox" id="delete-list2" name="delete-list" data-group="delete-list"></td>
    <td>RO2309272200</td>
    <td>C012003</td>
    <td>키키보드</td>
    <td>EEB003</td>
    <td>키포인트넘버원</td>
    <td>30 EA</td>
    <td>500,000원</td>
    <td>23.09.27</td>
    <td>대기</td>
    <td><input type="button" value="상세내역" class="detail" onclick="openDetails()"></td>
</tr> <!-- DB연결 시 삭제될 tr -->
</table>
</div><!-- table -->

<div class="page-buttons">
<a href="#" class="page-button page-button-active">1</a>
<a href="#" class="page-button">2</a>
<a href="#" class="page-button">3</a>
<a href="#" class="page-button">4</a>
<a href="#" class="page-button">5</a>
</div><!-- page-button -->
</div><!-- contents -->
</div><!-- 그림자아니야 영역 -->
</div><!-- main -->
<!-- contents end -->

<script type="text/javascript">

//업체명(거래처) 검색 새창
var searchCustomer = document.getElementById("search-customer");
searchCustomer.addEventListener("click", function () {
	var url = '${pageContext.request.contextPath}/receive/empty';
	// ↑ 업체검색페이지 새로 입력하기
    window.open(url, '_blank', 'width=400, height=400');
});

//상품명 검색 새창
var searchProduct = document.getElementById("search-product");
searchProduct.addEventListener("click", function () {
	var url = '${pageContext.request.contextPath}/receive/empty';
	// ↑ 상품검색페이지 새로 입력하기
    window.open(url, '_blank', 'width=400, height=400');
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

// 수주상세내용 새창
function openDetails() {
    var url = '${pageContext.request.contextPath}/receive/receiveDetails';
    var windowWidth = 480;
    var windowHeight = 570;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}
//수주등록 새창
function openInsert() {
    var url = '${pageContext.request.contextPath}/receive/receiveInsert';
    var windowWidth = 480;
    var windowHeight = 570;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}
</script>
</body>
</html>