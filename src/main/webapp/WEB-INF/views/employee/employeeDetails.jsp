<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원정보</title>
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

<body>
<div class="main-details">

<!-- <div class="page-title">상세정보</div> -->
<div class="forms-group-receive">

<div class="page-title-popup">상세정보</div>

<div class="form-group-receive">
<p>사진</p>
<input type="text" id="empPhoto" class="form-control search-input" placeholder="${employeeDTO.empPhoto}" readonly>
</div>

<div class="form-group-receive">
<p>사원ID</p>
<input type="text" id="empId" class="form-control search-input" placeholder="${employeeDTO.empId}" readonly>
</div>
<div class="form-group-receive">
<p>이름</p>
<input type="text" id="empName" class="form-control search-input" placeholder="${employeeDTO.empName}" readonly>
</div>

<div class="form-group-receive">
<p>이메일</p>
<input type="text" id="empEmail" class="form-control search-input" placeholder="${employeeDTO.empEmail}" readonly>
</div>
<div class="form-group-receive">
<p>생년월일</p>
<input type="text" id="empBirth" class="form-control search-input" placeholder="${employeeDTO.empBirth}" readonly>
</div>

<div class="form-group-receive">
<p>연락처</p>
<input type="text" id="empPhone" class="form-control search-input" placeholder="${employeeDTO.empPhone}" readonly>
</div>
<div class="form-group-receive">
<p>내선번호</p>
<input type="text" id="empTel" class="form-control search-input" placeholder="${employeeDTO.empTel}" readonly>
</div>

<div class="form-group-receive">
<p>주소</p>
<input type="text" id="empAddress" class="form-control search-input" placeholder="${employeeDTO.empAddress}" readonly>
</div>

<div class="form-group-receive">
<p>부서</p>
<input type="text" id="departmentName" class="form-control search-input" placeholder="${employeeDTO.departmentName}" readonly>
</div>
<div class="form-group-receive">
<p>직급</p>
<input type="text" id="empPosition" class="form-control search-input" placeholder="${employeeDTO.empPosition}" readonly>
</div>
<div class="form-group-receive">
<p>재직여부</p>
<input type="text" id="empStatus" class="form-control search-input" placeholder="${employeeDTO.empStatus}" readonly>
</div>

<div class="form-group-receive">
<p>입사일</p>
<input type="text" id="empHiredate" class="form-control search-input" placeholder="${employeeDTO.empHiredate}" readonly>
</div>
<div class="form-group-receive">
<p>휴직일</p>
<input type="text" id="empLeavedate" class="form-control search-input" placeholder="${employeeDTO.empLeavedate}" readonly>
</div>
<div class="form-group-receive">
<p>퇴직일</p>
<input type="text" id="empRetiredate" class="form-control search-input" placeholder="${employeeDTO.empRetiredate}" readonly>
</div>

<div class="form-group-receive">
<p>권한(보류)</p>
<input type="text" id="empRole" class="form-control search-input" placeholder="${employeeDTO.empRole}" readonly>
</div>


</div>
<div class="details-buttons">
<input type="button" value="수정" class="btn btn-primary mybutton1" 
	   onclick="location.href='${pageContext.request.contextPath}/employee/employeeUpdate?empId=${employeeDTO.empId}'">
<input type="button" value="삭제" class="btn btn-secondary mybutton1" onclick="confirmDelete()">
</div>
</div><!-- main-details -->

<script>
// 삭제 확인메세지
function confirmDelete() {
    if (confirm("정말로 삭제하시겠습니까?")) {
        location.href = '${pageContext.request.contextPath}/employee/employeeDelete?empId=${employeeDTO.empId}';
    } else {
    	
    }
}
</script>
</body>
</html>