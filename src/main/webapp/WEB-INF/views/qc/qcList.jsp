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
<input type="text" id="productCode" class="form-control search-input" placeholder="상품코드" style="width:110px;" readonly>
<input type="text" id="productName" class="form-control search-input" placeholder="상품명(클릭)" readonly>
</div>
</div>

<div class="search-b">
<div class="search-date">
<p>납품예정일</p> <input type="text" id="shipSdate1" class="form-control search-input" placeholder="납품예정일" readonly>
~<input type="text" id="shipSdate2" class="form-control search-input" placeholder="납품예정일" readonly>
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
<a>진행<input type="checkbox" id="select2" name="select2" class="list-select" checked></a>
<a>완료<input type="checkbox" id="select3" name="select3" class="list-select"></a>
<a>( 체크박스 사용여부 보류중 )</a>
<div>
<div>
<table class="table-list">
<tr class="table-head">
	<th><input type="checkbox" id="delete-list-all" name="delete-list" data-group="delete-list"></th>
	<th>품질검사코드</th>
	<th>납품예정일</th>
    <th>상품코드</th>
    <th>상품명</th>
    <th>전체수량</th>
    <th>1차</th>
    <th>2차</th>
    <th>3차</th>
    <th>합격</th>
    <th>불량</th>
    <th>최종불량률</th>
    <th>상태</th>
    <th>품질검사원</th>
    <th>검사완료일</th>
    <th>버튼</th>
</tr>

<c:forEach var="qualityDTO" items="${qcList}">
<tr class="table-body">
	<td><input type="checkbox" id="delete-list" name="delete-list" data-group="delete-list"></td>
	<td>
	<c:choose>
        <c:when test="${empty qualityDTO.qcCode}">-</c:when>
        <c:otherwise>${qualityDTO.qcCode}</c:otherwise>
    </c:choose>
    </td>
	<td>${qualityDTO.shipSdate}</td>
    <td>${qualityDTO.productCode}</td>
    <td>${qualityDTO.productName}</td>
    <td>${qualityDTO.prodCount}</td>
    <td>
    <c:choose>
        <c:when test="${empty qualityDTO.qcTest1}">-</c:when>
        <c:otherwise>${qualityDTO.qcTest1}</c:otherwise>
    </c:choose>
    </td>
    <td>
    <c:choose>
        <c:when test="${empty qualityDTO.qcTest2}">-</c:when>
        <c:otherwise>${qualityDTO.qcTest2}</c:otherwise>
    </c:choose>
    </td>
    <td>
    <c:choose>
        <c:when test="${empty qualityDTO.qcTest3}">-</c:when>
        <c:otherwise>${qualityDTO.qcTest3}</c:otherwise>
    </c:choose>
    </td>
    <td>
    <c:choose>
        <c:when test="${qualityDTO.qcPass eq 0}">-</c:when>
        <c:otherwise>${qualityDTO.qcPass}</c:otherwise>
    </c:choose>
    </td>
    <td>
    <c:choose>
        <c:when test="${qualityDTO.qcDefect eq 0}">-</c:when>
        <c:otherwise>${qualityDTO.qcDefect}</c:otherwise>
    </c:choose>
    </td>
    <td>
    <c:choose>
        <c:when test="${empty qualityDTO.qcDefectRate}">-</c:when>
        <c:otherwise>${qualityDTO.qcDefectRate}</c:otherwise>
    </c:choose>
    </td>
    <td>
	<c:choose>
        <c:when test="${empty qualityDTO.qcStatus}">대기</c:when>
        <c:otherwise>${qualityDTO.qcStatus}</c:otherwise>
    </c:choose>
	</td>
    <td>
    <c:choose>
        <c:when test="${empty qualityDTO.qcEmpName}">-</c:when>
        <c:otherwise>${qualityDTO.qcEmpName}</c:otherwise>
    </c:choose>
    </td>
    <td>
    <c:choose>
        <c:when test="${empty qualityDTO.qcEndDate}">-</c:when>
        <c:otherwise><c:out value="${fn:substring(qualityDTO.qcEndDate, 0, 10)}" /></c:otherwise>
    </c:choose>
    </td>
    <td><input type="button" value="검사진행(상세)" class="btn btn-secondary mybutton1" onclick="openDetails('${qualityDTO.prodCode}')"></td>
	<!-- + openDetails(가져갈값넣기) -->
</tr>
</c:forEach>


</table>
</div><!-- table -->
<div class="content-bottom">
<div>
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

<!-- 리스트 -->

</div><!-- main -->
</div>
</div>
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
 	// 사원 검색 팝업 열기
    $("#productCode, #productName").click(function() {
        var url = '${pageContext.request.contextPath}/workOrder/workProdList';
        openPopup(url);
    });
});
$(function() {
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

// 품질상세내용 새창
function openDetails(prodCode) {
    var url = '${pageContext.request.contextPath}/qc/qcDetails?prodCode='+prodCode;
    var windowWidth = 600;
    var windowHeight = 890;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}
//수주등록 새창
function openInsert() {
    var url = '${pageContext.request.contextPath}/receive/receiveInsert';
    var windowWidth = 500;
    var windowHeight = 600;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}
</script>

</body>
</html>