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
    <!--  CSS 적용-->
    <link href="${pageContext.request.contextPath}/resources/css/receive.css" rel="stylesheet">
    
        
</head>
<body>
<%@include file="../inc/top-bar.jsp" %>
<%@include file="../inc/side-bar.jsp" %>
<!--  contents start -->
<!-- <div class="contents" style="position:fixed; left: 15rem;"> -->
<div class="main">
<div class="card shadow" > <!-- 그림자아니야 영역 -->
<div class="page-title">공지사항
<img src="${pageContext.request.contextPath}/resources/img/icon_reload.png" id="resetFilters" 
style="height: 1.5rem; width: 1.5rem; cursor: pointer; position: relative; right: 10px; bottom: 3px; margin-left: 10px;">
</div>
<div class="contents2">

<form action="${pageContext.request.contextPath}/notice/noticeList" method="get">
<div class="search-bar">
<div class="search-b">
<div class="search-select">

<select id="search" name="search" class="form-control search-input"> 
	<option value="all">전체</option>
	<option value="sales">영업</option>
	<option value="production">생산</option>
	<option value="materials">자재</option>
	<option value="personnel">인사</option>
</select>

<input type="text" id="search2" name="search2" class="form-control search-input">

</div> <!--  search-select  -->
</div> <!-- search-b -->

<div class="search-button">
<input type="submit" value="검색" class="btn btn-primary mybutton1">
<input type="submit" value="취소" class="btn btn-secondary mybutton1" onclick="cancelSearch()">
</div>
</div><!--  search-bar -->
</form>

<br>

<div class="select-status" style="text-align: right;">
<a style="text-align: right;">총 ${noticeCount}건</a>
<!--   <a style="text-align: right;">총 -->
<%--     <c:if test="${insertCount != null}"> --%>
<%--       ${insertCount} --%>
<%--     </c:if> --%>
<!--     건</a> -->
</div>




<div>
<table class="table-list">
<tr class="table-head">
	<th><input type="checkbox" id="delete-list-all" name="delete-list" data-group="delete-list"></th>
	<th>글번호</th> 
    <th>구분</th> 
    <th>ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ제목ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ</th> 
    <th>작성자</th> 
    <th>조회수</th> 
    <th>작성일</th> 

</tr>
<c:forEach var="noticeDTO" items="${noticeList}">
<tr class="table-body" >
	<td><input type="checkbox" id="delete-list" name="delete-list" data-group="delete-list"></td>
    <td>${noticeDTO.noticeNum}</td>
    <td>${noticeDTO.noticeCategory}</td>
    <td onclick="location.href='${pageContext.request.contextPath}/notice/noticeContent?noticeNum=${noticeDTO.noticeNum}'" style="text-align: left;">ㅤㅤ${noticeDTO.noticeSubject}</td>
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
<input type="button" value="삭제" class="btn btn-secondary mybutton1" onclick="deleteNotice()">
</div>


<!-- ---------------------페이징---------------- -->
<div class="page-buttons">
<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
    <c:choose>
        <c:when test="${i eq pageDTO.pageNum}">
            <a href="${pageContext.request.contextPath}/notice/noticeList?pageNum=${i}&search=${pageDTO.search}&search2=${pageDTO.search2}" class="page-button page-button-active">${i}</a>
        </c:when>
        <c:otherwise>
            <a href="${pageContext.request.contextPath}/notice/noticeList?pageNum=${i}&search=${pageDTO.search}&search2=${pageDTO.search2}" class="page-button">${i}</a>
        </c:otherwise>
    </c:choose>
</c:forEach>
</div>
<!-- ---------------------페이징---------------- -->
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



//체크박스(삭제용) 전체선택
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



//초기화 버튼 이미지 클릭 시,
$("#resetFilters").click(function() {
	location.href = "${pageContext.request.contextPath}/notice/noticeList";
});


//검색의 [취소] 버튼 누르면 입력 된 값 초기화
function cancelSearch() {
//	검색어 입력 초기화
	document.getElementById("search").value = "";
	document.getElementById("search2").value = "";
}





</script>

</body>
</html>