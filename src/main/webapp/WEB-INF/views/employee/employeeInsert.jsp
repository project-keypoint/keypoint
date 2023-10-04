<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원등록</title>

<!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<!--     <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet"> -->

<!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <!-- employee CSS 적용-->
    <link href="${pageContext.request.contextPath}/resources/css/employee.css" rel="stylesheet">
</head>


<body>
<div class="main-details">
<form action="${pageContext.request.contextPath}/customer/cusInsertPro" method="post" onsubmit="return validateForm()">

<div class="forms-group-customer">
<div class="page-title-popup">사원 등록</div>


<div class="form-group-customer">
<p>사원ID</p>
<input type="text" id="empId" name="empId" class="form-control search-input">
</div>

<div class="form-group-customer">
<p>비밀번호</p>
<input type="text" id="empPass" name="empPass" class="form-control search-input" >
</div>

<div class="form-group-customer">
<p>이름</p>
<input type="text" id="empName" name="empName" class="form-control search-input">
</div>

<div class="form-group-customer">
<p>주소</p>
<input type="text" id="empAddress" name="empAddress" class="form-control search-input">
</div>

<div class="form-group-customer">
<p>연락처</p>
<input type="tel" id="empPhone" name="empPhone" class="form-control search-input">
</div>

<div class="form-group-customer">
<p>내선번호</p>
<input type="tel" id="empTel" name="empTel" class="form-control search-input">
</div>

<div class="form-group-customer">
<p>이메일</p>
<input type="text" id="empEmail" name="empEmail" class="form-control search-input">
</div>

<div class="form-group-customer">
<p>부서</p>
<select id="departmentName" name="departmentName" class="form-control search-input">
        <option value="영업">영업</option>
        <option value="생산">생산</option>
        <option value="자재">자재</option>
        <option value="인사">인사</option>
</select>
</div>

<div class="form-group-customer">
<p>직급</p>
<select id="empPosition" name="empPosition" class="form-control search-input">
        <option value="사원">사원</option>
        <option value="대리">대리</option>
        <option value="부장">부장</option>
        <option value="이사">이사</option>
        <option value="대표">대표</option>
</select>
</div>

<div class="form-group-customer">
<p>생년월일</p>
<input type="text" id="empBirth" name="empBirth" class="form-control search-input">
</div>

<div class="form-group-customer">
<p>입사일</p>
<input type="text" id="empHiredate" name="empHiredate" class="form-control search-input">
</div>

<div class="form-group-customer">
<p>사진</p>
<input type="text" id="empPhoto" name="empPhoto" class="form-control search-input">
</div>


</div>
<div class="details-buttons">
<input type="submit" id="receiveSubmit" value="등록" class="btn btn-primary mybutton1">
<input type="button" value="취소" class="btn btn-secondary mybutton1" onClick="window.close()">
</div>
</form><!-- form 끝 -->
</div><!-- main-details -->





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
// $(document).ready(function() {
//     // 업체명 검색 팝업 열기
//     $("#cusCode, #cusName").click(function() {
//         var url = '${pageContext.request.contextPath}/workOrder/workCusList';
//         openPopup(url);
//     });
//     // 상품명 검색 팝업 열기
//     $("#productCode, #productName").click(function() {
//         var url = '${pageContext.request.contextPath}/workOrder/workProdList';
//         openPopup(url);
//     });
//  	// 사원 검색 팝업 열기
//     $("#empId, #empName").click(function() {
//         var url = '${pageContext.request.contextPath}/workOrder/workEmpList';
//         openPopup(url);
//     });
// });

// 유효성 검사
function validateForm() {
    // 각 입력 필드 값
    var cusCode = document.getElementById("cusCode").value;
    var productCode = document.getElementById("productCode").value;
    var roCount = document.getElementById("roCount").value;
    var roDate = document.getElementById("roDate").value;
    var shipSdate = document.getElementById("shipSdate").value;
    var roEmpId = document.getElementById("roEmpId").value;
    // 빈 필드 검사
    if (cusCode === "" || productCode === "" || roCount === "" ||
    	roDate === "" || shipSdate === "" || roEmpId === "") {
        alert("모든 내용을 입력해주세요.");
        return false; // 제출 방지
    }
    // 추가 유효성 검사
    if (roCount == 0) {
        alert("몇개부터 가능하도록 할까");
        return false; // 제출 방지
    }
    return true;
}
</script>
</body>
</html>


<!-- <body> -->
<%-- <form action="${pageContext.request.contextPath}/employee/add" name="employeeInsert" id="employeeInsert" method="post"> --%>
<!-- <input type="text" name = "empId" id="empId"> -->
<!-- <input type="text" id="empPass"> -->
<!-- <input type="text" id="empSalt"> -->
<!-- <input type="text" id="empName"> -->
<!-- <input type="text" id="empPhoto"> -->
<!-- <input type="text" id="empBirth"> -->
<!-- <input type="text" id="empPhone"> -->
<!-- <input type="text" id="empEmail"> -->
<!-- <input type="text" id="empAddress"> -->
<!-- <input type="text" id="empStatus"> -->
<!-- <input type="text" id="departmentId"> -->
<!-- <input type="text" id="departmentName"> -->
<!-- <input type="text" id="empPosition"> -->
<!-- <input type="text" id="empHiredate"> -->
<!-- <input type="text" id="empRole"> -->
<!-- <input type="text" id="empLeavedate"> -->
<!-- <input type="submit" value="등록" class="btn btn-primary mybutton1"> -->
<!-- </form> -->
<!-- </body> -->





