<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입고목록</title>
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
<div class="page-title">입고현황(입고전체목록)</div>

<div class="contents2">
<div class="search-bar">

<div class="search-b">
<div class="search-select">
<p>코드</p> <input type="text" id="materialCode" name="materialCode" class="form-control search-input" placeholder="자재코드">
</div>
</div>

<div class="search-b">
<div class="search-select">
<p>자재명</p> <input type="text" id="materialName" name="materialName" class="form-control search-input" placeholder="자재명 ">
</div>
</div>

<div class="search-button">
<input type="button" value="검색" class="btn btn-primary mybutton1">
<input type="button" value="취소" class="btn btn-secondary mybutton1">
</div>
</div><!-- search-bar -->
<br>

<div class="select-status">
<a>대기<input type="checkbox" id="select1" name="select1" class="list-select" checked></a>
<a>완료<input type="checkbox" id="select2" name="select2" class="list-select" checked></a>
<a>취소<input type="checkbox" id="select3" name="select3" class="list-select"></a>
<!-- <a>( 체크박스 사용여부 보류중 )</a> -->
<div>
<!-- <input type="button" value="등록" class="btn btn-primary mybutton1" onclick="openInsert()"> -->
<!-- <input type="button" value="삭제" class="btn btn-secondary mybutton1"> -->
</div>
</div>

<div>
<table class="table-list">
<tr class="table-head">
	<th><input type="checkbox" id="delete-list-all" name="delete-list" data-group="delete-list"></th>
	<th>입고코드</th>
    <th>자재코드</th>
    <th>자재명</th>
    <th>발주수량</th>
    <th>입고예정수량</th>
    <th>미입고수량</th>
    <th>입고완료수량</th>
    <th>입고예정일</th>
    <th>담당자</th>
    <th>입고상태</th>
    <th>관리</th>
</tr>

<tr class="table-body">
	<td><input type="checkbox" id="delete-list" name="delete-list" data-group="delete-list"></td>
    <td>IN20231019121539</td>
    <td>M001</td>
    <td>키캡</td>
    <td>100</td>
    <td>90</td>
    <td>-</td>
    <td>-</td>
    <td>2023/09/10</td>
    <td>이홍렬</td>
    <td>입고대기</td>
    <td>
    <input type="button" value="수정" class="btn btn-secondary mybutton1" onclick="openUpdate()">
    <input type="button" value="입고처리" class="btn btn-secondary mybutton1" onclick="openComplete()">
    </td>
	<!-- + openDetails(가져갈값넣기) -->
</tr>
</table>
</div><!-- table -->

<div class="content-bottom">
<div>
<input type="button" value="입고등록" class="btn btn-primary mybutton1" onclick="openInsert()">
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

<!-- 자재코드, 자재명 검색 팝업 -->
$(document).ready(function() {
    $("#materialCode").click(function() {
        // 업체코드 입력란의 값을 가져옵니다.
        var poCode = $("input[name='materialCode']").val();
        // 여기에서 검색 기능을 구현하고, 필요한 로직을 수행합니다.
        // 예: 업체코드를 이용하여 검색하고 결과를 표시합니다.
        
        $(document).ready(function() {
	        $("#materialCode").click(function() {
	            // 팝업 창 크기 및 위치 설정
	            var width = 400;
	            var height = 400;
	            var left = (screen.width - width) / 2;
	            var top = (screen.height - height) / 2;
	            // 팝업 창 열기
	            var url = '${pageContext.request.contextPath}/purchase/test2'; // 업체 검색 페이지의 URL.
	            var popupWindow = window.open(url, '_blank', "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
	            // 팝업 창 포커스
	            popupWindow.focus();
	        });
	    });
    });
});

$(document).ready(function() {
    $("#materialName").click(function() {
        // 상품코드 입력란의 값을 가져옵니다.
        var materialName = $("input[name='materialName']").val();
        // 여기에서 검색 기능을 구현하고, 필요한 로직을 수행합니다.
        // 예: 상품코드를 이용하여 검색하고 결과를 표시합니다.
        
        $(document).ready(function() {
	        $("#materialName").click(function() {
	            // 팝업 창 크기 및 위치 설정
	            var width = 400;
	            var height = 400;
	            var left = (screen.width - width) / 2;
	            var top = (screen.height - height) / 2;
	            // 팝업 창 열기
	            var url = '${pageContext.request.contextPath}/purchase/test2'; // 상품 검색 페이지의 URL.
	            var popupWindow = window.open(url, '_blank', "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
	            // 팝업 창 포커스
	            popupWindow.focus();
	        });
	    });
    });
});
<!-- // 자재코드, 자재명 검색 팝업 -->

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

//입고등록 새창
function openInsert() {
    var url = '${pageContext.request.contextPath}/receipt/receiptInsert';
    var windowWidth = 500;
    var windowHeight = 600;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}

//입고수정 새창
function openUpdate() {
    var url = '${pageContext.request.contextPath}/receipt/receiptUpdate';
    var windowWidth = 500;
    var windowHeight = 600;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}

//입고처리 새창
function openComplete() {
    var url = '${pageContext.request.contextPath}/receipt/receiptComplete';
    var windowWidth = 500;
    var windowHeight = 600;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}
</script>

</body>
</html>