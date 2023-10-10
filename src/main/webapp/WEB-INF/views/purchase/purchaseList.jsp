<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>발주목록</title>
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
<div class="page-title">발주현황(발주전체목록)</div>

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
<!-- 	<th><input type="checkbox" id="delete-list-all" name="delete-list" data-group="delete-list"></th> -->
	<th>발주코드</th>
    <th>자재코드</th>
    <th>자재명</th>
    <th>발주수량</th>
    <th>발주일자</th>
    <th>납기일자</th>
    <th>자재단가</th>
    <th>발주금액</th>
    <th>담당자</th>
    <th>거래처</th>
    <th>발주상태</th>
    <th>상세내역</th>
</tr>

<c:forEach var="purchaseDTO" items="${purchaseList}">
<tr class="table-body">
<!-- 	<td><input type="checkbox" id="delete-list" name="delete-list" data-group="delete-list"></td> -->
    <td>${purchaseDTO.poCode}</td>
    <td>${purchaseDTO.materialCode}</td>
    <td>${purchaseDTO.materialName}</td>
    <td>${purchaseDTO.poCount}EA</td>
    <td>${purchaseDTO.poDate}</td>
    <td>${purchaseDTO.payDate}</td>
    <td>${purchaseDTO.materialPrice}원</td>
    <td>${purchaseDTO.poPrice}원</td>
    <td>${purchaseDTO.poOwner}</td>
    <td>${purchaseDTO.cusName}</td>
    <td>
    	<c:choose>
                <c:when test="${purchaseDTO.poStatus eq '발주완료'}">
                    <span style="color: skyblue;">${purchaseDTO.poStatus}</span>
                </c:when>
                <c:otherwise>${purchaseDTO.poStatus}</c:otherwise>
            </c:choose>
    </td>
    <td><input type="button" value="상세내역" class="btn btn-secondary mybutton1" onclick="openDetails('${purchaseDTO.poCode}')"></td>
	<!-- + openDetails(가져갈값넣기) -->
</tr>
</c:forEach>
</table>
</div><!-- table -->

<div class="content-bottom">
<div>
<input type="button" value="발주등록" class="btn btn-primary mybutton1" onclick="openInsert()">
<!-- <input type="button" value="삭제" class="btn btn-secondary mybutton1"> -->
</div>


<div class="page-buttons">

<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
	<a href="${pageContext.request.contextPath}/purchase/purchaseList?pageNum=${pageDTO.startPage - pageDTO.pageBlock}" class="page-button">&lt;</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage}" 
                   end="${pageDTO.endPage}" step="1">
	<a href="${pageContext.request.contextPath}/purchase/purchaseList?pageNum=${i}" class="page-button page-button-active">${i}</a>
</c:forEach>

<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath}/purchase/purchaseList?pageNum=${pageDTO.startPage + pageDTO.pageBlock}" class="page-button">&gt;</a>
</c:if>

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

//발주등록 새창
function openInsert() {
    var url = '${pageContext.request.contextPath}/purchase/purchaseInsert';
    var windowWidth = 500;
    var windowHeight = 600;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}

//발수정주등록 새창
function openDetails(poCode) {
    var url = '${pageContext.request.contextPath}/purchase/purchaseDetails?poCode='+poCode;
    var windowWidth = 500;
    var windowHeight = 600;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}
</script>

</body>
</html>