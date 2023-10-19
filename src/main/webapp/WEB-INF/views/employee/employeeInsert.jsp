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
    <link href="${pageContext.request.contextPath}/resources/css/employeeInsert.css" rel="stylesheet">
</head>


<body>
<div class="page-title-popup">사원 등록</div>
<div class="main-details">
<%-- <form action="${pageContext.request.contextPath}/employee/employeeInsertPro" method="post" onsubmit="return validateForm()"> --%>
<form action="${pageContext.request.contextPath }/employee/photoPro" id="join" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">

<div class="forms-group-customer">



<!-- <div class="form-group-customer">  -->
<p><a style="color: red; font-size: 17px;">* 사진은 필수입력사항이 아닙니다.</a></p>
<!-- -------------------- 사진첨부 -------------------- -->
<div class="form-group-customer" style="display: flex; flex-direction: column; align-items: center;">
        <img src="${pageContext.request.contextPath }/resources/img/test.png" id="preview" width="200" height="230" style="border-radius: 3px">
<!-- </div> -->

<div class="imgbtn">
  <label for="file" style="display: flex; justify-content: center; margin-top: -20px; margin-left: -15px;">
    <span class="btn btn-outline-primary btn-icon-text" style="width: 180px;"> 
      <i class="ti-upload btn-icon-prepend"></i>사진 업로드하기
    </span>
  </label>
  <input type="file" name="empPhoto" id="file" accept="image/*" onchange="setThumbnail(event);" style="display: none;">
</div>



<!-- -------------------- // 사진첨부 -------------------- -->
  </div>
</div>

<div class="form-group-customer">
	<p>사원번호</p>
	<input type="text" id="empPass" name="empPass" class="form-control search-input" readonly>
</div>

<div class="form-group-customer">
	<p>이름</p>
	<input type="text" id="empName" name="empName" class="form-control search-input">
</div>

<!-- 주소 -->
<div class="form-group-customer">
	<p>주소</p>
	<input type="text" id="empAddress" name="empAddress" class="form-control search-input" placeholder="클릭하여 주소를 입력하세요">
</div>
 
<div class="form-group-customer">
	<p></p>
	<input type="text" id="empAddress_dtail" name="empAddress_dtail" class="form-control search-input" placeholder="상세주소">
</div>

<div class="form-group-customer">
    <p>연락처</p> 
    <input type="tel" id="empPhone" name="empPhone" class="form-control search-input" onblur="checkDuplicate('phone')" oninput="addHyphen(this)">
</div>
<div class="divdup"></div>

<div class="form-group-customer">
	<p>내선번호</p>
	<input type="tel" id="empTel" name="empTel" class="form-control search-input" oninput="addHyphen(this)">
</div>

<div class="form-group-customer">
    <p>이메일</p>
    <input type="text" id="empEmail" name="empEmail" class="form-control search-input" onblur="validateCheck('email');">
</div>
<span id="emailError" style="color: red; font-size: 14px; position: relative; top: -10px; left: 130px;"></span>

<div class="form-group-customer">
	<p>부서</p>
	<select id="departmentName" name="departmentName" class="form-control search-input" style="width: 280px;">
        	<option value="영업부">영업</option>
        	<option value="생산부">생산</option>
        	<option value="자재부">자재</option>
        	<option value="인사부">인사</option>
	</select>
</div>

<div class="form-group-customer">
	<p>직급</p>
		<select id="empPosition" name="empPosition" class="form-control search-input" style="width: 280px;">
        	<option value="사원">사원</option>
       	 	<option value="대리">대리</option>
        	<option value="부장">부장</option>
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

<div class="form-group-customer" style="display: none;">
	<p>재직여부</p>
	<input type="hidden" id="empStatus" name="empStatus" class="form-control search-input" value="재직">
</div>

<div class="form-group-customer">
<p>권한</p>
<select id="empRole" name="empRole" class="form-control search-input" style="width: 280px;">
        <option value="0">0</option>
        <option value="1" selected>1</option>
        <option value="2">2</option>
        <option value="3">3</option>
</select>
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
// 		yearRange: '1980:2023'
		yearRange:'1980:+0',
		maxDate:new Date() // 오늘 이후의 날짜는 선택 못하게
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
// 		yearRange: '1980:2023'
		yearRange:'1980:+0',
		maxDate:new Date() // 오늘 이후의 날짜는 선택 못하게
	});
});


// 주소 검색 API
window.onload = function(){
    document.getElementById("empAddress").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("empAddress").value = data.address; // 주소 넣기
                document.querySelector("input[name=empAddress_dtail]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}

// 유효성 검사
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

// 비밀번호값 불러오기
document.addEventListener("DOMContentLoaded", function() {
    // Ajax 요청 보내기
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "${pageContext.request.contextPath}/employee/getInitialPass", true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var initialPass = xhr.responseText;
            var empPassField = document.getElementById("empPass");
            empPassField.value = initialPass; // empPass 필드에 서버에서 받은 값을 설정
        }
    };
    xhr.send();
});

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

// 이메일 유효성 검사(밑에 메세지 나오게) 
function validateCheck(type) {
    var emailField = document.getElementById("empEmail");
    var emailError = document.getElementById("emailError");
    // 이메일 주소 정규식
    var emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
    
    if (emailField.value.match(emailRegex)) {
    	// 올바른 이메일 형식
        emailError.innerHTML = "";
        
        // 이메일 유효성 검사 통과 시 중복 확인 실행
        checkDuplicate(type);
    } else {
    	// 잘못된 이메일 형식
        emailError.innerHTML = "올바른 이메일 주소를 입력하세요.";
        emailField.focus(); // 포커스를 이메일 입력 필드로 이동
        emailField.value = ""; // 입력 필드를 비우기 (초기화)
    }
}

//중복확인(연락처, 이메일)
function checkDuplicate(type) {
    var empPhone = document.getElementById("empPhone").value;
    var empEmail = document.getElementById("empEmail").value;

    // 여기에서 중복 확인 및 처리를 수행
    $.ajax({
        url: '${pageContext.request.contextPath}/employee/empCheck',
        data: {
            empPhone: empPhone,
            empEmail: empEmail,
            type: type
        },
        success: function (result) {
            if (result == 'iddup') {
                alert("중복");
                if (type == "phone") {
                    document.getElementById("empPhone").value = "";
                }
                if (type == "email") {
                    document.getElementById("empEmail").value = "";
                }
            }
        }
    });
}


</script>
</body>
</html>