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

<!-- <div class="search-bar"> -->
<!-- <div class="search-b"> -->
<!-- <div class="search-select"> -->
<!-- <p>업체명</p>  -->
<!-- <input type="text" id="cusCode" class="form-control search-input" placeholder="업체코드" style="width:110px;" readonly> -->
<!-- <input type="text" id="cusName" class="form-control search-input" placeholder="업체명(클릭)" readonly> -->
<!-- </div> -->
<!-- <div class="search-select"> -->
<!-- <p>상품명</p>  -->
<!-- <input type="text" id="productCode" class="form-control search-input" placeholder="상품코드" style="width:110px;" readonly> -->
<!-- <input type="text" id="productName" class="form-control search-input" placeholder="상품명(클릭)" readonly> -->
<!-- </div> -->
<!-- </div> -->

<!-- <div class="search-b"> -->
<!-- <div class="search-date"> -->
<!-- <p>수주일자</p> <input type="text" id="roDate1" class="form-control search-input" placeholder="수주일자" readonly> -->
<!-- ~<input type="text" id="roDate2" class="form-control search-input" placeholder="수주일자" readonly> -->
<!-- </div> -->
<!-- <div class="search-date"> -->
<!-- <p>납품예정일</p> <input type="text" id="shipSdate1" class="form-control search-input" placeholder="납품예정일" readonly> -->
<!-- ~<input type="text" id="shipSdate2" class="form-control search-input" placeholder="납품예정일" readonly> -->
<!-- </div> -->
<!-- </div> -->
<!-- <div class="search-button"> -->
<!-- <input type="button" value="검색" class="btn btn-primary mybutton1"> -->
<!-- <input type="button" value="취소" class="btn btn-secondary mybutton1"> -->
<!-- </div> -->
<!-- </div>search-bar -->

<br>
<!-- <div class="select-status"> -->
<!-- <a>대기<input type="checkbox" id="select1" name="select1" class="list-select" checked></a> -->
<!-- <a>진행<input type="checkbox" id="select2" name="select2" class="list-select" checked></a> -->
<!-- <a>완료<input type="checkbox" id="select3" name="select3" class="list-select" checked></a> -->
<!-- <a>취소<input type="checkbox" id="select4" name="select4" class="list-select"></a> -->
<!-- <a>( 체크박스 사용여부 보류중 )</a> -->
<!-- <div> -->
<!-- </div> -->
<!-- </div> -->

<div>
<table class="table-list">
<tr class="table-head">
<!-- 	<th><input type="checkbox" id="delete-list-all" name="delete-list" data-group="delete-list"></th> -->
	<th>사번</th> 
    <th>이름</th> 
    <th>부서</th> 
    <th>직급</th> 
    <th>내선번호</th> 
    <th>이메일</th> 
    <th>재직여부</th>
    <th>상세내역</th>
</tr>
<c:forEach var="employeeDTO" items="${employeeList}">
<tr class="table-body">
	<td><input type="checkbox" id="delete-list" name="delete-list" data-group="delete-list"></td>
    <td>${employeeDTO.empId}</td>
    <td>${employeeDTO.empName}</td>
    <td>${employeeDTO.departmentName}</td>
    <td>${employeeDTO.empPosition}</td>
    <td>${employeeDTO.empTel}</td>
    <td>${employeeDTO.empEmail}</td>
    <td>${employeeDTO.empStatus}</td>
    <td><input type="button" value="상세내역" class="btn btn-secondary mybutton1" onclick="openDetails('${employeeDTO.empId}')"></td>
</tr>
</c:forEach>    
</table>
</div><!-- table -->
<div class="content-bottom">
<div>
<input type="button" value="사원등록" class="btn btn-primary mybutton1" onclick="openInsert()">
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

<!-- 데이트피커 : 날짜선택요소(달력형식, 직접입력) -->
<!-- 데이트피커 타임피커를 사용하기위한 j쿼리 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


</body>
</html>