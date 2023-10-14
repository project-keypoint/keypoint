<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원정보</title>

 <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<!--     <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet"> -->

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <!-- 사원 CSS 적용-->
    <link href="${pageContext.request.contextPath}/resources/css/employee.css" rel="stylesheet">

</head>

<body>
<%@include file="../inc/top-bar.jsp" %>
<%@include file="../inc/side-bar.jsp" %>


<!--  contents start -->
<div class="main">
<div class="card shadow" > <!-- 그림자아니야 영역 -->
<div class="page-title">사원목록(사원기본정보)</div>
<div class="contents2">


<!-- 검색부분 -->
<div class="search-bar">
<div class="search-b">
<div class="search-select">

<form name="search" method="get" action="${pageContext.request.contextPath}/employee/employeeList" id="selectBox" name="selectBox2" onsubmit="return fun1()">
                       
 <div style="float: left;">
 <select id="search" name="search" class="form-control search-input">
 <option value=""> 선택하세요 </option>
 <option value="empName"> 이름 </option>
 <option value="empId"> 사원번호 </option>
<option value="empTel"> 내선번호 </option>
<option value="departmentName"> 부서 </option>
 </select>

</div>
 <div style="float: left;"><span id="text_search"><input class="form-control search-input" type="text" name="search2"></span></div>                     
 <div style="float: left; magin-top: 3px;"><span id="icon_search">
 </span></div>
	                    
 </form>
  
</div>
</div>
   
            
<div class="search-button">
<input type="button" value="검색" class="btn btn-primary mybutton1" onclick="fun1()">
<input type="button" value="취소" class="btn btn-secondary mybutton1" onclick="cancelSearch()">
</div>

</div>
<!-- 검색부분 -->


<br>


<div class="select-status" style="display: flex; justify-content: space-between;">
<div style="display: flex; justify-content: flex-start;">
<a>재직자<input type="checkbox" id="select1" name="select1" class="list-select"></a>
<a>휴직자<input type="checkbox" id="select2" name="select2" class="list-select"></a>
<a>퇴직자<input type="checkbox" id="select3" name="select3" class="list-select"></a>
</div>
<a style="text-align: right;">총 사원수 : ${employeeCount}명</a>
</div>


<div>
<table class="table-list">
<tr class="table-head">
<!-- 	<th><input type="checkbox" id="delete-list-all" name="delete-list" data-group="delete-list"></th> -->
	<th>사원번호</th> 
    <th>이름</th> 
    <th>부서</th> 
    <th>직급</th> 
    <th>내선번호</th> 
    <th>이메일</th> 
    <th>입사일</th>
    <th>재직여부</th>
    <th>상세내역</th>
</tr>

<c:forEach var="employeeDTO" items="${employeeList}">
<tr class="table-body">

<!-- 	<td><input type="checkbox" id="delete-list" name="delete-list" data-group="delete-list"></td> -->
    <td>${employeeDTO.empId}</td>
    <td>${employeeDTO.empName}</td>
    <td>${employeeDTO.departmentName}</td>
    <td>${employeeDTO.empPosition}</td>
    <td>${employeeDTO.empTel}</td>
    <td>${employeeDTO.empEmail}</td>
    <td>${employeeDTO.empHiredate}</td>
    <td>${employeeDTO.empStatus}</td>
    <td><input type="button" value="상세내역" class="btn btn-secondary mybutton1" onclick="openDetails('${employeeDTO.empId}')"></td>
<!-- 사원상세내역 연결되는지 테스트 -->
<!--     <td><input type="button" value="상세내역" class="btn btn-secondary mybutton1" onclick="openDetails()"></td> -->
</tr>
</c:forEach>    
</table>
</div><!-- table -->
<div class="content-bottom">
<div>
<input type="button" value="사원등록" class="btn btn-primary mybutton1" onclick="openInsert()">
<!-- <input type="button" value="삭제" class="btn btn-secondary mybutton1"> -->
</div>


<!-- -------------- 페이징처리 -------------- -->
<div class="page-buttons">

<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
	<a href="${pageContext.request.contextPath}/employee/employeeList?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&search=${pageDTO.search}" class="page-button">&lt;</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
	<c:choose>
		<c:when test="${i eq pageDTO.currentPage}">
			<a href="#" class="page-button page-button-active">${i}</a>
		</c:when>
		<c:otherwise>
			<a href="${pageContext.request.contextPath}/employee/employeeList?pageNum=${i}&search=${pageDTO.search}" class="page-button">${i}</a>
		</c:otherwise>
	</c:choose>
</c:forEach>

<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath}/employee/employeeList?pageNum=${pageDTO.startPage + pageDTO.pageBlock}" class="page-button">&gt;</a>
</c:if>

</div><!-- page-button -->
<!-- -------------- // 페이징처리 -------------- -->


</div>
</div><!-- contents -->
</div><!-- 그림자아니야 영역 -->
</div><!-- main -->
<!-- contents end -->


<!-- 데이트피커 : 날짜선택요소(달력형식) -->
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

// 사원 상세내용 새창
function openDetails(empId) {
	// 연결되는지 보기위해
//     var url = '${pageContext.request.contextPath}/employee/employeeDetails';
 	var url = '${pageContext.request.contextPath}/employee/employeeDetails?empId='+empId;
    var windowWidth = 500;
    var windowHeight = 850;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}

// 사원등록 새창
function openInsert() {
    var url = '${pageContext.request.contextPath}/employee/employeeInsert';
    var windowWidth = 650;
    var windowHeight = 900;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}




 //검색어
function fun1() {
	
	if(document.search.search.value=="") {
		alert("검색 조건을 선택하세요")
		document.search.search.focus();
		return false;
	}
	if(document.search.search2.value==0) {
		alert("검색어를 입력하세요");
		document.search.search2.focus();
		return false;
		}
	
		document.search.submit();
}

 

</script>


</body>
</html>