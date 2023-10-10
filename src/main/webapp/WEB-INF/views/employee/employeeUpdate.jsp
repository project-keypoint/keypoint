<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원상세정보수정</title>
	<!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <!-- 사원 CSS 적용-->
    <link href="${pageContext.request.contextPath}/resources/css/employeeDetails.css" rel="stylesheet">
</head>
<body>
<form action="${pageContext.request.contextPath}/employee/employeeUpdatePro" method="post" onsubmit="return validateForm()">

<!-- <div class="page-title-popup">사원상세정보수정</div> -->
<div class="page-title">사원상세정보수정</div>

<div class="main-details">

<div class="form-group-receive">

<div class="form-group-column">
<p>사진</p>
<input type="text" id="empPhoto" name="empPhoto" class="form-control search-input" value="${employeeDTO.empPhoto}">
</div>

<div class="form-group-row">

<div class="form-group-column">
<p>사원번호</p>
<input type="text" id="empId" name="empId" class="form-control search-input" value="${employeeDTO.empId}" readonly>
</div>
<div class="form-group-column">
<p>이름</p>
<input type="text" id="empName" name="empName" class="form-control search-input" value="${employeeDTO.empName}" readonly>
</div>

</div>

<div class="form-group-row">

<div class="form-group-column">
<p>이메일</p>
<input type="text" id="empEmail" name="empEmail" class="form-control search-input" value="${employeeDTO.empEmail}">
</div>
<div class="form-group-column">
<p>생년월일</p>
<input type="text" id="empBirth" name="empBirth" class="form-control search-input" value="${employeeDTO.empBirth}" readonly>
</div>

</div>

<div class="form-group-row">

<div class="form-group-column">
<p>연락처</p>
<input type="text" id="empPhone" name="empPhone" class="form-control search-input" value="${employeeDTO.empPhone}">
</div>
<div class="form-group-column">
<p>내선번호</p>
<input type="text" id="empTel" name="empTel" class="form-control search-input" value="${employeeDTO.empTel}">
</div>
</div>

<div class="form-group-column">
<p>주소</p>
<input type="text" id="empAddress" name="empAddress" class="form-control search-input" value="${employeeDTO.empAddress}" readonly>
</div>

</div><!-- form-group-receive -->
</div><!-- main-details1 -->


<div class="main-details"><!-- main-details2 -->
<div class="form-group-receive">

<div class="form-group-row">

<div class="form-group-column">
<p>부서</p>
<select id="departmentName" name="departmentName" class="form-control search-input status">
    <option value="영업부" ${employeeDTO.departmentName eq '영업부' ? 'selected' : ''}>영업부</option>
    <option value="생산부" ${employeeDTO.departmentName eq '생산부' ? 'selected' : ''}>생산부</option>
    <option value="자재부" ${employeeDTO.departmentName eq '자재부' ? 'selected' : ''}>자재부</option>
    <option value="인사부" ${employeeDTO.departmentName eq '인사부' ? 'selected' : ''}>인사부</option>
</select>    
</div>

<div class="form-group-column">
<p>직급</p>
<select id="empPosition" name="empPosition" class="form-control search-input status">
    <option value="사원" ${employeeDTO.empPosition eq '사원' ? 'selected' : ''}>사원</option>
    <option value="대리" ${employeeDTO.empPosition eq '대리' ? 'selected' : ''}>대리</option>
    <option value="부장" ${employeeDTO.empPosition eq '부장' ? 'selected' : ''}>부장</option>
    <option value="이사" ${employeeDTO.empPosition eq '이사' ? 'selected' : ''}>이사</option>
    <option value="대표" ${employeeDTO.empPosition eq '대표' ? 'selected' : ''}>대표</option>
</select>    
</div>

<div class="form-group-column">
<p>재직여부</p>
<select id="empStatus" name="empStatus" class="form-control search-input status">
    <option value="재직" ${employeeDTO.empStatus eq '재직' ? 'selected' : ''}>재직</option>
    <option value="휴직" ${employeeDTO.empStatus eq '휴직' ? 'selected' : ''}>휴직</option>
    <option value="퇴직" ${employeeDTO.empStatus eq '퇴직' ? 'selected' : ''}>퇴직</option>
</select>    
</div>

</div>

<div class="form-group-row">
    <div class="form-group-column">
        <p>입사일</p>
        <input type="text" id="empHiredate" name="empHiredate" class="form-control search-input" value="${employeeDTO.empHiredate}">
    </div>
    <div class="form-group-column">
        <p>휴직일</p>
        <input type="text" id="empLeavedate" name="empLeavedate" class="form-control search-input" value="${employeeDTO.empLeavedate}">
    </div>
    <div class="form-group-column">
        <p>퇴직일</p>
        <input type="text" id="empRetiredate" name="empRetiredate" class="form-control search-input" value="${employeeDTO.empRetiredate}">
    </div>
</div>

<div class="form-group-column">
<p>권한(보류)</p>
<select id="empRole" name="empRole" class="form-control search-input status">
    <option value="0" ${employeeDTO.empRole eq '0' ? 'selected' : ''}>0</option>
    <option value="1" ${employeeDTO.empRole eq '1' ? 'selected' : ''}>1</option>
    <option value="2" ${employeeDTO.empRole eq '2' ? 'selected' : ''}>2</option>
    <option value="3" ${employeeDTO.empRole eq '3' ? 'selected' : ''}>3</option>
</select>    
</div>
</div><!-- form-group-receive -->
</div><!-- main-details2 -->

<div class="details-buttons">
<input type="submit" value="완료" class="btn btn-primary mybutton1">
<input type="button" value="취소" class="btn btn-secondary mybutton1" onClick="window.close()">
</div>

</form><!-- form 끝 -->


<!-- 데이트피커 : 날짜선택요소(달력형식) -->
<!-- 데이트피커 타임피커를 사용하기위한 j쿼리 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 주소API -->
<!-- <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->

<script type="text/javascript">
// 팝업 창을 열어주는 함수
function openPopup(url) {
    var width = 500;
    var height = 500;
    var left = (screen.width - width) / 2;
    var top = (screen.height - height) / 2;
    var popupWindow = window.open(url, '_blank', "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
    popupWindow.focus();
}


// 입사일, 휴직일, 퇴직일 검색 데이트피커
$(function() {
    $("#empHiredate").datepicker({
		dateFormat: 'yy-mm-dd',
		showOtherMonths: true,
		showMonthAfterYear:true,
		changeYear: true,
		changeMonth: true,
		yearSuffix: "년",
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], //달력의 월 부분 텍스트
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], //달력의 월 부분
		dayNamesMin: ['일','월','화','수','목','금','토'], //달력의 요일 텍스트
		dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'], //달력의 요일
		yearRange: '1950:2023'
	});
    
    $("#empLeavedate").datepicker({
		dateFormat: 'yy-mm-dd',
		showOtherMonths: true,
		showMonthAfterYear:true,
		changeYear: true,
		changeMonth: true,
		yearSuffix: "년",
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], //달력의 월 부분 텍스트
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], //달력의 월 부분
		dayNamesMin: ['일','월','화','수','목','금','토'], //달력의 요일 텍스트
		dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'], //달력의 요일
		yearRange: '1980:2023'
	});
    
    $("#empRetiredate").datepicker({
		dateFormat: 'yy-mm-dd',
		showOtherMonths: true,
		showMonthAfterYear:true,
		changeYear: true,
		changeMonth: true,
		yearSuffix: "년",
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], //달력의 월 부분 텍스트
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], //달력의 월 부분
		dayNamesMin: ['일','월','화','수','목','금','토'], //달력의 요일 텍스트
		dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'], //달력의 요일
		yearRange: '1980:2023'
	});
});


// 주소 검색 API
// function sample6_execDaumPostcode() {
// 	new daum.Postcode({
// 	    oncomplete: function(data) {
// 	      var fullAddress = data.address; // 선택한 주소 변수에 저장
// 	      var extraAddress = ''; // 조합형 주소 변수 초기화

// 	      if (data.addressType === 'R') {
// 	        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
// 	          extraAddress += data.bname;
// 	        }
// 	        if (data.buildingName !== '' && data.apartment === 'Y') {
// 	          extraAddress += (extraAddress !== '' ? ', ' + data.buildingName : data.buildingName);
// 	        }
// 	        fullAddress += (extraAddress !== '' ? ' (' + extraAddress + ')' : '');
// 	      }

// 	      // 우편번호와 주소 정보를 각각의 입력란에 넣기
// 	      document.getElementById('zonecode').value = data.zonecode; // 우편번호
// 	      document.getElementById('empAddress').value = fullAddress; // 기본주소

// 	      // 상세주소 입력란으로 포커스 이동
// 	      document.getElementById('cusAddress_dtail').focus();
// 	    }
// 	  }).open();
// 	}
	


</script>
</body>
</html>