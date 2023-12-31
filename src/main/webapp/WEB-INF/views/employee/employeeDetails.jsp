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
    <link href="${pageContext.request.contextPath}/resources/css/employeeDetails.css" rel="stylesheet">
</head>

<body>

<div class="page-title" >사원상세정보</div>

<div class="main-details">

<!-- <div class="forms-group-receive"> -->

<div class="form-group-receive">

<!-- 사진부분 -->
<div class="form-group-column">
  <img src="${pageContext.request.contextPath}/resources/upload/${employeeDTO.empPhoto}" 
       width="200" height="200" style="display: block; margin: 0 auto;">
</div>

<div class="form-group-column" style="display:none;">
<p>비밀번호</p>
<input type="text" id="empPass" name="empPass" class="form-control search-input" value="${employeeDTO.empPass}" readonly >
</div>


<div class="form-group-row">

<div class="form-group-column">

<p>사원번호</p>
<input type="text" id="empId" class="form-control search-input" placeholder="${employeeDTO.empId}" readonly>
</div>
<div class="form-group-column">
<p>이름</p>
<input type="text" id="empName" class="form-control search-input" placeholder="${employeeDTO.empName}" readonly>
</div>

</div>

<div class="form-group-row">

<div class="form-group-column">
<p>이메일</p>
<input type="text" id="empEmail" class="form-control search-input" placeholder="${employeeDTO.empEmail}" readonly>
</div>
<div class="form-group-column">
<p>생년월일</p>
<input type="text" id="empBirth" class="form-control search-input" placeholder="${employeeDTO.empBirth}" readonly>
</div>

</div>


<div class="form-group-row">

<div class="form-group-column">
<p>연락처</p>
<input type="text" id="empPhone" class="form-control search-input" placeholder="${employeeDTO.empPhone}" readonly>
</div>
<div class="form-group-column">
<p>내선번호</p>
<input type="text" id="empTel" class="form-control search-input" placeholder="${employeeDTO.empTel}" readonly>
</div>

</div>



<div class="form-group-column">
<p>주소</p>
<input type="text" id="empAddress" class="form-control search-input" placeholder="${employeeDTO.empAddress}" readonly>
</div>
<div class="form-group-column">
<p>상세주소</p>
<input type="text" id="empAddress_dtail" class="form-control search-input" placeholder="${employeeDTO.empAddress_dtail}" readonly>
</div>


</div><!-- main-details1 -->
</div><!-- form-group-receive -->


<div class="main-details"><!-- main-details2 -->
<div class="form-group-receive">

<div class="form-group-row">

<div class="form-group-column">
<p>부서</p>
<input type="text" id="departmentName" class="form-control search-input" placeholder="${employeeDTO.departmentName}" readonly>
</div>

<div class="form-group-column">
<p>직급</p>
<input type="text" id="empPosition" class="form-control search-input" placeholder="${employeeDTO.empPosition}" readonly>
</div>

<div class="form-group-column">
<p>재직여부</p>
<input type="text" id="empStatus" class="form-control search-input" placeholder="${employeeDTO.empStatus}" readonly>
</div>

</div>

<div class="form-group-row">

<div class="form-group-column">
<p>입사일</p>
<input type="text" id="empHiredate" class="form-control search-input" placeholder="${employeeDTO.empHiredate}" readonly>
</div>

<div class="form-group-column">
<p>휴직일</p>
<input type="text" id="empLeavedate" class="form-control search-input" placeholder="${employeeDTO.empLeavedate}" readonly>
</div>

<div class="form-group-column">
<p>퇴직일</p>
<input type="text" id="empRetiredate" class="form-control search-input" placeholder="${employeeDTO.empRetiredate}" readonly>
</div>

</div>




<div class="form-group-column">
<c:choose>
  <c:when test="${employeeDTO1.empRole eq '3'}">
  <p>권한</p>
    <input type="text" id="empRole" class="form-control search-input" placeholder="${employeeDTO.empRole}" readonly/>
  </c:when>
  <c:when test="${employeeDTO1.empRole eq '2' and employeeDTO1.departmentName eq '인사부'}">
  <p>권한</p>
    <input type="text" id="empRole" class="form-control search-input" placeholder="${employeeDTO.empRole}" readonly/>
  </c:when>
  <c:otherwise>
    <!--     빈칸 -->
  </c:otherwise>
</c:choose>
</div>




</div><!-- form-group-receive -->
</div><!-- main-details2 -->

<div class="details-buttons">
<input type="button" value="수정" class="btn btn-primary mybutton1" 
	   onclick="location.href='${pageContext.request.contextPath}/employee/employeeUpdate?empId=${employeeDTO.empId}'">
<input type="button" value="비밀번호 초기화" class="btn btn-secondary mybutton1" id="resetPasswordButton">
<input type="button" value="확인" class="btn btn-secondary mybutton1" onClick="window.close()">

</div>




<script>

// 비밀번호 초기화
resetPasswordButton.addEventListener("click", function() {
    // 확인 메시지 창 표시
    if (confirm("비밀번호를 초기화하시겠습니까?")) {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", `${pageContext.request.contextPath}/employee/resetPassword/${employeeDTO.empId}`, true);
        xhr.setRequestHeader("Content-Type", "application/json");
        xhr.send();
        
        // 서버 응답을 기다리고 페이지를 새로고침합니다.
        xhr.onload = function() {
            if (xhr.status >= 200 && xhr.status < 300) {
                console.log("비밀번호 초기화 성공");
                // 비밀번호 초기화 성공 시 알림 메시지 표시
                alert("비밀번호가 초기화되었습니다.");
                // 페이지를 새로고침하여 변경된 비밀번호를 표시
                location.reload();
            } else {
                console.error("비밀번호 초기화 실패");
            }
        };
    }
});

// 상세주소(cusAddress_dtail) 가져오기
var empAddress_dtail = document.getElementById("empAddress_dtail").value;

// 사원 수정하기 새창
function openUpdate(empId) {
 	var url = '${pageContext.request.contextPath}/employee/employeeUpdate?empId='+empId;
    var windowWidth = 500;
    var windowHeight = 1500;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}


// "권한" 텍스트 안보이게 조건줌
// document.addEventListener("DOMContentLoaded", function () {
//   var empRole = ${employeeDTO1.empRole}; // 서버에서 가져온 값으로 설정
//   var empRole2 = ${employeeDTO.empRole};
//   var departmentName = '인사부'; // 예제값으로 '인사부'를 사용합니다;
//   var roleText = document.getElementById('roleText');
//   var empRoleInput = document.getElementById('empRole');

//   if (empRole2 === 3 || (empRole === 2 && departmentName === '인사부')) {
//     roleText.style.display = 'block'; // "권한" 텍스트 보이게 설정
//     empRoleInput.style.display = 'block'; // input 요소 보이게 설정
//   }
// });

</script>
</body>
</html>