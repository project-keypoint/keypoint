<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원등록</title>
<br>
<p><a style="color: red; font-size: 17px;">사진, 권한빼고 다 입력해야함</a></p>

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
<%-- <form action="${pageContext.request.contextPath}/employee/employeeInsertPro" method="post" onsubmit="return validateForm()"> --%>
<form action="${pageContext.request.contextPath }/employee/photoPro" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">

<div class="forms-group-customer">
<div class="page-title-popup">사원 등록</div>
<!-- </div> -->

<!-- <div class="form-group-customer"> -->
<!-- <p>사원ID</p> -->
<!-- <input type="text" id="empId" name="empId" class="form-control search-input" readonly> -->
<!-- </div> -->


<!-- -------------------- 사진첨부 -------------------- -->
<!-- <div class="form-group-customer">  -->

<div class="form-group-customer">
	<img id="preview" width="200" height="230" style="border-radius: 3px">
</div>

<div class="imgbtn">
<label for="file">
<span class="btn btn-outline-danger btn-icon-text" style="width: 200px;">
<i class="ti-upload btn-icon-prepend"></i>사진 업로드하기
</span>
</label>
<input type="file" name="empPhoto" id="file" accept="image/*" onchange="setThumbnail(event);" style="display: none;"></div>
<!-- accept="image/*": 이 속성은 업로드할 수 있는 파일 형식을 제한 함. "image/*"로 설정된 경우, 사용자는 이미지 파일만 선택할 수 있음. -->
<!-- -------------------- // 사진첨부 -------------------- -->


<div class="form-group-customer">
<p>비밀번호(수정필요)</p>
<input type="text" id="empPass" name="empPass" class="form-control search-input" >
</div>

<div class="form-group-customer">
<p>이름</p>
<input type="text" id="empName" name="empName" class="form-control search-input">
</div>

<!-- 주소 -->
<div class="form-group-customer">
<p>주소</p>
<input type="text" id="zonecode" name="zonecode" class="form-control search-input" placeholder="우편번호">
<input type="button" onclick="sample6_execDaumPostcode()"id="dubSubmit" value="우편번호" class="btn btn-primary mybutton2">
</div>

<div class="form-group-customer">
<p></p>
<input type="text" id="empAddress" name="empAddress" class="form-control search-input" placeholder="기본주소">
</div>

<div class="form-group-customer">
<p></p>
<input type="text" id="empAddress_dtail" name="empAddress_dtail" class="form-control search-input" placeholder="상세주소">
</div>
<!-- // 주소 -->


<!-- <div class="form-group-customer"> -->
<!-- <p>연락처</p> -->
<!-- <input type="text" id="empPhone" name="empPhone" class="form-control search-input" onblur="checkDuplicate()"> -->
<!-- <div class="divdup"></div> -->
<!-- </div> -->


<div class="form-group-customer">
    <p>연락처</p>
    <input type="tel" id="empPhone" name="empPhone" class="form-control search-input" onblur="checkDuplicate()">
</div>
    <div class="divdup"></div>





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
        <option value="영업부">영업</option>
        <option value="생산부">생산</option>
        <option value="자재부">자재</option>
        <option value="인사부">인사</option>
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


<!-- <div class="form-group-customer"> -->
<!-- <p>사진</p> -->
<!-- <input type="file" id="empPhoto" name="empPhoto" class="form-control search-input"> -->
<!-- </div> -->




<!-- 이게 맞나..? 나중에 수정에서 재직여부 수정가능한가?? -->
<div class="form-group-customer" style="display: none;">
<p>재직여부</p>
<input type="hidden" id="empStatus" name="empStatus" class="form-control search-input" value="재직">
</div>

<!-- 기본권한이 1이므로 화면에서는 안 보이게 하고 싶음 -->
<div class="form-group-customer">
<p>권한(보류)</p>
<select id="empRole" name="empRole" class="form-control search-input">
        <option value="0">0</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
</select>
</div>

<p><a style="color: gray; font-size: 10px;">(보류)권한: 0->퇴직자, 1->일반사원, 2->관리자(부서+권한), 3->마스터(모든권한)</a></p>

</div>



<div class="details-buttons">
<input type="submit" id="receiveSubmit" value="등록" class="btn btn-primary mybutton1">
<input type="button" value="취소" class="btn btn-secondary mybutton1" onClick="window.close()">
</div>


</form><!-- form 끝 -->
</div><!-- main-details -->


<!-- 데이트피커 : 날짜선택요소(달력형식) -->
<!-- 데이트피커 타임피커를 사용하기위한 j쿼리 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 주소API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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


// 생년월일, 일사일 검색 데이트피커
$(function() {
	$("#empBirth").datepicker({
		dateFormat: 'yy-mm-dd', //달력 날짜 형태
		showOtherMonths: true, //빈 공간에 현재월의 앞뒤월의 날짜를 표시
		showMonthAfterYear:true, // 월- 년 순서가아닌 년도 - 월 순서
		changeYear: true, //option값 년 선택 가능
		changeMonth: true, //option값 월 선택 가능
		yearSuffix: "년", //달력의 년도 부분 뒤 텍스트
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], //달력의 월 부분 텍스트
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], //달력의 월 부분
		dayNamesMin: ['일','월','화','수','목','금','토'], //달력의 요일 텍스트
		dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'], //달력의 요일
		yearRange: '1980:2023'
	});

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
		yearRange: '1980:2023'
	});
});


// 주소 검색 API
function sample6_execDaumPostcode() {
	new daum.Postcode({
	    oncomplete: function(data) {
	      var fullAddress = data.address; // 선택한 주소 변수에 저장
	      var extraAddress = ''; // 조합형 주소 변수 초기화

	      if (data.addressType === 'R') {
	        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
	          extraAddress += data.bname;
	        }
	        if (data.buildingName !== '' && data.apartment === 'Y') {
	          extraAddress += (extraAddress !== '' ? ', ' + data.buildingName : data.buildingName);
	        }
	        fullAddress += (extraAddress !== '' ? ' (' + extraAddress + ')' : '');
	      }

	      // 우편번호와 주소 정보를 각각의 입력란에 넣기
	      document.getElementById('zonecode').value = data.zonecode; // 우편번호
	      document.getElementById('empAddress').value = fullAddress; // 기본주소

	      // 상세주소 입력란으로 포커스 이동
	      document.getElementById('cusAddress_dtail').focus();
	    }
	  }).open();
	}
	
	
// // 테스트	empPhone
// //연락처 하이픈 + 글자 수 고정
// document.addEventListener("DOMContentLoaded", function() {
//   var empPhoneInput = document.getElementById("empPhone");

// // 연락처 하이픈 추가
//   function formatEmpPhone(inputField, maxLength) {
//     inputField.addEventListener("input", function() {
//       var inputValue = inputField.value;

// //		하이픈(-)을 제외한 숫자만 추출
//       var numericValue = inputValue.replace(/[^0-9]/g, "");

// //		0000-00-0000 형식
//       var formattedValue = numericValue.slice(0, 4) + "-" + numericValue.slice(4, 6) + "-" + numericValue.slice(6);

// //		maxLength 길이로 고정합니다.
//       if (formattedValue.length > maxLength) {
//         formattedValue = formattedValue.slice(0, maxLength);
//       }

// //		포맷된 값을 입력 필드에 설정
//       inputField.value = formattedValue;
//     });
//   }
	
// //	길이고정(12, 12, 13)
//   formatEmpPhone(EmpPhoneInput, 12);
// });
// // 테스트중
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//중복확인
function checkDuplicate() {
// 입력된 연락처 가져오기
    var empPhone = document.getElementById("empPhone").value;

    $.ajax({
        url: '${pageContext.request.contextPath}/employee/empPhoneCheck',
        data: { 'empPhone': empPhone },
        success: function (result) {
            if (result == 'iddup') {
                alert("중복");
            } else {
                alert("사용가능");
            }
        }
    });
}



//유효성 검사
function validateForm() {
//	각 필수 입력 필드 값
    var empName = document.getElementById("empName").value;
    var empAddress = document.getElementById("empAddress").value;
    var empPhone = document.getElementById("empPhone").value;
    var empTel = document.getElementById("empTel").value;
    var empEmail = document.getElementById("empEmail").value;
    var departmentName = document.getElementById("departmentName").value;
    var empPosition = document.getElementById("empPosition").value;
    var empBirth = document.getElementById("empBirth").value;
    var empHiredate = document.getElementById("empHiredate").value;
    
    
// 	빈 필드 검사
    if (empName === "" || empAddress === "" || empPhone === "" ||
    	empTel === "" || empEmail === "" || departmentName === "" || empPosition === "" ||
    	empBirth === "" || empHiredate === "") {
        alert("모든 내용을 입력해주세요.");
        return false; // 제출 방지
    }
    return true;
}	


// 첨부파일 미리보기
function setThumbnail(event) {
  // 선택된 파일 정보 가져오기
  var input = event.target;
  var file = input.files[0];
  
  // FileReader 객체 사용하여 파일 읽기
  var reader = new FileReader();
  reader.onload = function(e) {
    // 읽은 파일을 이미지로 변환하여 미리보기
    var img = document.getElementById("preview");
    img.src = e.target.result;
  }
  reader.readAsDataURL(file);
}









</script>
</body>
</html>