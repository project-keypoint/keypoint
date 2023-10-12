<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항목록</title>
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

<div class="search-bar">

<div class="search-b">
<div class="search-select">

<select id="search_option" name="search_option" class="form-control search-input"> 
	<option value=""> 선택하세요 </option>
	<option value="전체">전체</option>
	<option value="영업">영업</option>
	<option value="생산">생산</option>
	<option value="자재">자재</option>
	<option value="인사">인사</option>
</select>

<input type="text" id="keyword" class="form-control search-input">

</div><!-- search-select -->
</div><!-- search-b -->

<div class="search-button">
<input type="button" value="검색" class="btn btn-primary mybutton1">
<input type="button" value="취소" class="btn btn-secondary mybutton1">
</div>
</div><!-- search-bar -->


<br>
<br>
<div class="select-status" style="display: flex; justify-content: space-between;">
  <div style="display: flex; justify-content: flex-start;">
    <a>전체<input type="checkbox" id="select1" name="select1" class="list-select"></a>
    <a>영업<input type="checkbox" id="select2" name="select2" class="list-select"></a>
    <a>생산<input type="checkbox" id="select3" name="select3" class="list-select"></a>
    <a>자재<input type="checkbox" id="select4" name="select4" class="list-select"></a>
    <a>인사<input type="checkbox" id="select5" name="select5" class="list-select"></a>
    <a>인사<input type="checkbox" id="select5" name="select5" class="list-select"></a>
    <a>인사<input type="checkbox" id="select5" name="select5" class="list-select"></a>
    <a>인사<input type="checkbox" id="select5" name="select5" class="list-select"></a>
    <a>인사<input type="checkbox" id="select5" name="select5" class="list-select"></a>
    <a>인사<input type="checkbox" id="select5" name="select5" class="list-select"></a>
    <a>인사<input type="checkbox" id="select5" name="select5" class="list-select"></a>
    <a>인사<input type="checkbox" id="select5" name="select5" class="list-select"></a>
    <a>인사<input type="checkbox" id="select5" name="select5" class="list-select"></a>
  </div>
  <a style="text-align: right;">총 ${noticeCount}건</a>
</div>




<div>
<table class="table-list">
<tr class="table-head">
	<th><input type="checkbox" id="delete-list-all" name="delete-list" data-group="delete-list"></th>
	<th>글번호</th> 
    <th>구분</th> 
    <th>제목</th> 
    <th>작성자</th> 
    <th>조회수</th> 
    <th>작성일</th> 

</tr>
<c:forEach var="noticeDTO" items="${noticeList}">
<tr class="table-body" >
	<td><input type="checkbox" id="delete-list" name="delete-list" data-group="delete-list"></td>
    <td>${noticeDTO.noticeNum}</td>
    <td>${noticeDTO.noticeCategory}</td>
    <td onclick="location.href='${pageContext.request.contextPath}/notice/noticeContent?noticeNum=${noticeDTO.noticeNum}'">${noticeDTO.noticeSubject}</td>
    <td>${noticeDTO.empName}</td>
    <td>${noticeDTO.noticeReadcount}</td>
    <td><fmt:formatDate value="${noticeDTO.noticeDate}" pattern="yy.MM.dd"/></td>
</tr>
</c:forEach>    
</table>
</div><!-- table -->



<div class="content-bottom">
<div>
<input type="button" value="글쓰기" class="btn btn-primary mybutton1" onclick="openInsert()">
<input type="button" value="삭제" class="btn btn-secondary mybutton1">
</div>


<!-- ---------------------페이징---------------- -->
<div class="page-buttons">
<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
	<a href="${pageContext.request.contextPath}/notice/noticeList?pageNum=${pageDTO1.startPage - pageDTO1.pageBlock}&search=${pageDTO.search}" class="page-button">&lt;</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
	<c:choose>
		<c:when test="${i eq pageDTO.currentPage}">
			<a href="#" class="page-button page-button-active">${i}</a>
		</c:when>
		<c:otherwise>
                <a href="${pageContext.request.contextPath}/notice/noticeList?pageNum=${i}&search=${pageDTO.search}" class="page-button">${i}</a>
		</c:otherwise>
	</c:choose>
</c:forEach>

<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath}/notice/noticeList?pageNum=${pageDTO.startPage + pageDTO.pageBlock}" class="page-button">&gt;</a>
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






//	공지사항등록 새창
function openInsert() {
    var url = '${pageContext.request.contextPath}/notice/noticeWrite';
    var windowWidth = 900;
    var windowHeight = 675;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}
</script>

</body>
</html>