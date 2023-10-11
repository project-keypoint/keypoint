<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항내용</title>
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
<div class="page-title">공지사항</div>
<div class="contents2">


<div>
<table class="table-list">
<tr class="table-head">
	<th colspan="4">[${noticeDTO.noticeCategory}] ${noticeDTO.noticeSubject}</th> 

</tr>
<tr class="table-body">
    <td>번호 ${noticeDTO.noticeNum}</td>
    <td>${noticeDTO.empName}</td>
    <td>조회 ${noticeDTO.noticeReadcount}</td>
	<td>작성일 <fmt:formatDate value="${noticeDTO.noticeDate}" pattern="yy.MM.dd"/></td>
</tr>

<tr class="table-body">
    <td colspan="4" style="height: 300px; text-align: left;">
        <div style="padding-left: 20px;">${noticeDTO.noticeContent}</div>
    </td>
</tr>


</table>
</div><!-- table -->



<div class="content-bottom">
<div>
<input type="button" value="글목록" class="btn btn-primary mybutton1" onclick="location.href='${pageContext.request.contextPath}/notice/noticeList'">
<input type="button" value="글수정" class="btn btn-primary mybutton1" onclick="openInsert()">
<input type="button" value="삭제" class="btn btn-secondary mybutton1" onclick="confirmDelete()">
<br>
</div>



<div class="page-buttons">
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
    // 업체명 검색 팝업 열기
    $("#cusCode, #cusName").click(function() {
        var url = '${pageContext.request.contextPath}/workOrder/workCusList';
        openPopup(url);
    });
    // 상품명 검색 팝업 열기
    $("#productCode, #productName").click(function() {
        var url = '${pageContext.request.contextPath}/workOrder/workProdList';
        openPopup(url);
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


//	공지사항수정하기 새창
function openInsert() {
    var url = '${pageContext.request.contextPath}/notice/noticeUpdate?noticeNum=${noticeDTO.noticeNum}';
    var windowWidth = 900;
    var windowHeight = 675;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}



//삭제 확인메세지
function confirmDelete() {
    if (confirm("정말로 삭제하시겠습니까?")) {
        location.href = '${pageContext.request.contextPath}/notice/noticeDeletePro?noticeNum=${noticeDTO.noticeNum}';
    } else {
    	
    }
}

</script>

</body>
</html>