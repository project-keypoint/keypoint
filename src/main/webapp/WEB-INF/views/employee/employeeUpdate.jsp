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
<form action="${pageContext.request.contextPath}/employee/photoUpdatePro" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">

<!-- <div class="page-title-popup">사원상세정보수정</div> -->
<div class="page-title" >사원상세정보수정</div>


<div class="main-details">

<div class="form-group-receive">

<!-- -------------------- 사진첨부 -------------------- -->
<div class="form-group-column">
<!-- 사진 부분-->
<img id="preview" src="${pageContext.request.contextPath }/resources/upload/${employeeDTO.empPhoto}" 
     width="200" height="200"  style="display: block; margin: 0 auto;">
</div>   

<label for="file" style="display: flex; justify-content: center;">
  <span class="btn btn-outline-primary btn-icon-text" style="width: 180px;">
    <i class="ti-upload btn-icon-prepend"></i>사진 수정하기
  </span>
</label>
<input type="hidden" name="oldfile" value="${employeeDTO.empPhoto}">

<div class="imgbtn">
<input type="file" name="empPhoto" id="file" accept="image/*" onchange="setThumbnail(event);" style="display: none;"></div>
<%-- <input type="text" id="empPhoto" name="empPhoto" class="form-control search-input" value="${employeeDTO.empPhoto}"> --%>
<!-- </div> -->
<!-- -------------------- // 사진첨부 -------------------- -->

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
    <input type="text" id="empEmail" name="empEmail" class="form-control search-input" value="${employeeDTO.empEmail}" onblur="validateEmail()">
    <span id="emailError" style="color: red; font-size: 12px; position: relative; top: -2px; left: 1px;"></span>
</div>

<div class="form-group-column">
<p>생년월일</p>
<input type="text" id="empBirth" name="empBirth" class="form-control search-input" value="${employeeDTO.empBirth}" readonly>
</div>

</div>

<div class="form-group-row">

<div class="form-group-column">
<p>연락처</p>
<input type="text" id="empPhone" name="empPhone" class="form-control search-input" value="${employeeDTO.empPhone}" oninput="addHyphen(this)">
</div>
<div class="form-group-column">
<p>내선번호</p>
<input type="text" id="empTel" name="empTel" class="form-control search-input" value="${employeeDTO.empTel}" oninput="addHyphen(this)">
</div>
</div>

<div class="form-group-column">
<p>주소</p>
<input type="text" id="empAddress" name="empAddress" class="form-control search-input" value="${employeeDTO.empAddress}" readonly>
</div>
<div class="form-group-column">
<p>상세주소</p>
<input type="text" id="empAddress_dtail" name="empAddress_dtail" class="form-control search-input" value="${employeeDTO.empAddress_dtail}" readonly>
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
<p>권한</p>
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
<input type="submit" value="수정완료" class="btn btn-primary mybutton1">
<input type="button" value="비밀번호변경" class="btn btn-secondary mybutton1" id="modifyPass">
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

//첨부파일 미리보기
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

// 하이픈 자동 생성(연락처, 내선번호), 길이 제한
function addHyphen(input) {
    // 사용자가 입력한 숫자를 가져옴
    let value = input.value;

    // 숫자만 포함된 새로운 문자열을 생성
    let newValue = value.replace(/\D/g, '');

    // 최대 길이를 제한
    if (input.id === "empPhone" && newValue.length > 11) {
        newValue = newValue.substring(0, 11);
    } else if (input.id === "empTel" && newValue.length > 10) {
        newValue = newValue.substring(0, 10);
    }

    // 숫자의 길이에 따라 적절한 형식으로 하이픈을 추가
    if (input.id === "empPhone" && newValue.length === 11) {
        newValue = newValue.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
    } else if (input.id === "empTel" && newValue.length === 10) {
        newValue = newValue.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
    } else {
        // 10자리 미만인 경우, 하이픈 x
    }

    // 입력 필드에 새로운 값을 설정
    input.value = newValue;
}
// 비밀번호 수정 	
modifyPass.addEventListener("click", function() {
    var empPass = prompt("새로운 비밀번호를 입력하세요:");
    
    if (empPass === null || empPass.trim() === "") {
        return alert("비밀번호를 입력하세요");
    }

    if (confirm("비밀번호를 변경하시겠습니까?")) {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", `${pageContext.request.contextPath}/employee/modifyPass/${employeeDTO.empId}`, true);
        xhr.setRequestHeader("Content-Type", "application/json");

        // empPass 값을 JSON 객체로 만들어 서버로 보냅니다.
        var data = {
            empPass: empPass
        };

        // 객체를 JSON 문자열로 변환하여 전송합니다.
        xhr.send(JSON.stringify(data));

        xhr.onload = function() {
            if (xhr.status >= 200 && xhr.status < 300) {
                console.log("비밀번호 변경 성공");
                alert("비밀번호가 변경되었습니다.");
                location.reload();
            } else {
                console.error("비밀번호 변경 실패");
            }
        };
    }
});

//이메일 유효성 검사(밑에 메세지 나오게) 
function validateEmail() {
    var emailField = document.getElementById("empEmail");
    var emailError = document.getElementById("emailError");
    
    // 이메일 주소 정규식
    var emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
    
    if (emailField.value.match(emailRegex)) {
        // 올바른 이메일 형식
        emailError.innerHTML = "";
    } else {
        // 잘못된 이메일 형식
        emailError.innerHTML = "올바른 이메일 주소를 입력하세요.";
        emailField.focus(); // 포커스를 이메일 입력 필드로 이동
        emailField.value = ""; // 입력 필드를 비우기 (초기화)
    }
}

</script>
</body>
</html>