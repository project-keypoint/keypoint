<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처수정</title>
	<!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <!-- customer CSS 적용-->
    <link href="${pageContext.request.contextPath}/resources/css/customer.css" rel="stylesheet">
</head>
<body>
<div class="main-details">
<form action="${pageContext.request.contextPath}/customer/cusUpdatePro" method="post" onsubmit="return validateForm()">

<div class="forms-group-customer">
<div class="page-title-popup">거래처수정</div>


<div class="form-group-customer">
<p>거래처코드</p>
<input type="text" id="cusCode" name="cusCode" class="form-control search-input" value="${customerDTO.cusCode}" readonly="readonly">
</div>


<div class="form-group-customer">
<p>거래처구분</p>
<select id="cusCategory" name="cusCategory" class="form-control search-input">
	<option value="납입처" ${customerDTO.cusCategory eq '납입처' ? 'selected' : ''}>납입처</option>
	<option value="납품처" ${customerDTO.cusCategory eq '납품처' ? 'selected' : ''}>납품처</option>
</select>
</div>

<div class="form-group-customer">
<p>업태</p>
<select id="cusBusiness" name="cusBusiness" class="form-control search-input">
    <option value="제조업" ${customerDTO.cusBusiness eq '제조업' ? 'selected' : ''}>제조업</option>
    <option value="도매 및 소매업" ${customerDTO.cusBusiness eq '도매 및 소매업' ? 'selected' : ''}>도매 및 소매업</option>
</select>
</div>


<div class="form-group-customer">
<p>종목</p>
<select id="cusType" name="cusType" class="form-control search-input">
	 <option value="스위치(적축)" ${customerDTO.cusType eq '스위치(적축)' ? 'selected' : ''}>스위치(적축)</option>
	 <option value="스위치(청축)" ${customerDTO.cusType eq '스위치(청축)' ? 'selected' : ''}>스위치(청축)</option>
	 <option value="스위치(갈축)" ${customerDTO.cusType eq '스위치(갈축)' ? 'selected' : ''}>스위치(갈축)</option>
	 <option value="프레임(상부)" ${customerDTO.cusType eq '프레임(상부)' ? 'selected' : ''}>프레임(상부)</option>
	 <option value="프레임(하부)" ${customerDTO.cusType eq '프레임(하부)' ? 'selected' : ''}>프레임(하부)</option>
	 <option value="키캡" ${customerDTO.cusType eq '키캡' ? 'selected' : ''}>키캡</option>
	 <option value="흡음제" ${customerDTO.cusType eq '흡음제' ? 'selected' : ''}>흡음제</option>
	 <option value="플레이트" ${customerDTO.cusType eq '플레이트' ? 'selected' : ''}>플레이트</option>
	 <option value="PCB" ${customerDTO.cusType eq 'PCB' ? 'selected' : ''}>PCB</option>
	 <option value="키포인트A87(적축)" ${customerDTO.cusType eq '키포인트A87(적축)' ? 'selected' : ''}>키포인트A87(적축)</option>
	 <option value="키포인트A87(청축)" ${customerDTO.cusType eq '키포인트A87(청축)' ? 'selected' : ''}>키포인트A87(청축)</option>
	 <option value="키포인트A87(갈축)" ${customerDTO.cusType eq '키포인트A87(갈축)' ? 'selected' : ''}>키포인트A87(갈축)</option>
	 <option value="키포인트B104(적축)" ${customerDTO.cusType eq '키포인트B104(적축)' ? 'selected' : ''}>키포인트B104(적축)</option>
	 <option value="키포인트B104(청축)" ${customerDTO.cusType eq '키포인트B104(청축)' ? 'selected' : ''}>키포인트B104(청축)</option>
	 <option value="키포인트B104(갈축)" ${customerDTO.cusType eq '키포인트B104(갈축)' ? 'selected' : ''}>키포인트B104(갈축)</option>
</select>
</div>


<div class="form-group-customer">
    <p>사업자번호</p>
    <input type="text" id="cusNumber" name="cusNumber" class="form-control search-input" onfocus="clearInput(this)" onblur="performActions(this)" value="${customerDTO.cusNumber}">
</div>


<div class="form-group-customer">
<p>거래처명</p>
<input type="text" id="cusName" name="cusName" class="form-control search-input" value="${customerDTO.cusName}" onfocus="clearInput(this)" onblur="restoreInput(this)">
</div>


<div class="form-group-customer">
<p>대표명</p>
<input type="text" id="cusRep" name="cusRep" class="form-control search-input" value="${customerDTO.cusRep}" onfocus="clearInput(this)" onblur="restoreInput(this)">
</div>


<div class="form-group-customer">
<p>대표전화</p>
<input type="text" id="cusTel" name="cusTel" class="form-control search-input" value="${customerDTO.cusTel}" onfocus="clearInput(this)" onblur="restoreInput(this)">
</div>


<div class="form-group-customer">
<p>주소</p>
<input type="text" id="cusZonecode" name="cusZonecode" class="form-control search-input" value="${customerDTO.cusZonecode}" onclick="sample6_execDaumPostcode()">
</div>

<div class="form-group-customer">
<p></p>
<input type="text" id="cusAddress" name="cusAddress" class="form-control search-input" value="${customerDTO.cusAddress}">
</div>

<div class="form-group-customer">
<p></p>
<input type="text" id="cusAddress_dtail" name="cusAddress_dtail" class="form-control search-input"value="${customerDTO.cusAddress_dtail}">
</div>

<div class="form-group-customer">
<p>담당자</p>
<input type="text" id="cusResp" name="cusResp" class="form-control search-input" value="${customerDTO.cusResp}" onfocus="clearInput(this)" onblur="restoreInput(this)">
</div>

<div class="form-group-customer">
<p>담당자 전화번호</p>
<input type="text" id="cusPhone" name="cusPhone" class="form-control search-input" value="${customerDTO.cusPhone}" onfocus="clearInput(this)" onblur="restoreInput(this)">
</div>


<div class="form-group-customer">
<p>담당자 이메일</p>
<input type="text" id="cusEmail" name="cusEmail" class="form-control search-input" value="${customerDTO.cusEmail}" onfocus="clearInput(this)" onblur="restoreInput(this)">
</div>

<div class="form-group-customer">
<p>FAX</p>
<input type="text" id="cusFax" name="cusFax" class="form-control search-input" value="${customerDTO.cusFax}" onfocus="clearInput(this)" onblur="restoreInput(this)">
</div>

<div class="form-group-customer">
<p>홈페이지</p>
<input type="text" id="cusHome" name="cusHome" class="form-control search-input" value="${customerDTO.cusHome}" onfocus="clearInput(this)" onblur="restoreInput(this)">
</div>

<div class="form-group-customer">
<p>적요</p>
<textarea id="cusMemo" name="cusMemo" class="form-control search-input" style="height: 200px; resize: none;">${customerDTO.cusMemo}</textarea>
</div>

<br>


<div class="form-group-customer">
<p>상태</p>
<select id="cusStatus" name="cusStatus" class="form-control search-input">
    <option value="거래중" ${customerDTO.cusStatus eq '거래중' ? 'selected' : ''}>거래중</option>
    <option value="거래정지" ${customerDTO.cusStatus eq '거래정지' ? 'selected' : ''}>거래정지</option>
</select>
</div>
</div>


<div class="details-buttons">
<input type="submit" id="receiveSubmit" value="수정완료" class="btn btn-primary mybutton1">
<input type="button" value="취소" class="btn btn-secondary mybutton1" onClick="window.close()">
</div>
</form><!-- form 끝 -->
</div><!-- main-details -->







<!-- 데이트피커 타임피커를 사용하기위한 j쿼리 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">

//주소 넣기
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
	      document.getElementById('cusZonecode').value = data.zonecode; // 우편번호
	      document.getElementById('cusAddress').value = fullAddress; // 기본주소

	      // 상세주소 입력란으로 포커스 이동
	      document.getElementById('cusAddress_dtail').focus();
	    }
	  }).open();
	}



//	사업자번호, 대표전화, 담당자전화 자동으로 하이픈 + 글자 수 고정
document.addEventListener("DOMContentLoaded", function() {
var cusNumberInput = document.getElementById("cusNumber");
var cusTelInput = document.getElementById("cusTel");
var cusPhoneInput = document.getElementById("cusPhone");


//사업자번호 하이픈 추가
function formatCusNumber(inputField, maxLength) {
 inputField.addEventListener("input", function() {
   var inputValue = inputField.value;

//		하이픈(-)을 제외한 숫자만 추출
   var numericValue = inputValue.replace(/[^0-9]/g, "");

//		0000-00-0000 형식
   var formattedValue = numericValue.slice(0, 4) + "-" + numericValue.slice(4, 6) + "-" + numericValue.slice(6);

//		maxLength 길이로 고정합니다.
   if (formattedValue.length > maxLength) {
     formattedValue = formattedValue.slice(0, maxLength);
   }

//		포맷된 값을 입력 필드에 설정
   inputField.value = formattedValue;
 });
}

//대표전화번호 하이픈 추가
function formatCusTel(inputField, maxLength) {
 inputField.addEventListener("input", function() {
   var inputValue = inputField.value;

   // 하이픈(-)을 제외한 숫자만 추출
   var numericValue = inputValue.replace(/[^0-9]/g, "");

   // 000-000-000 형식
   var formattedValue = numericValue.slice(0, 3) + "-" + numericValue.slice(3, 6) + "-" + numericValue.slice(6);

   // maxLength 길이로 고정
   if (formattedValue.length > maxLength) {
     formattedValue = formattedValue.slice(0, maxLength);
   }

   // 포맷된 값을 입력 필드에 설정
   inputField.value = formattedValue;
 });
}

//	담당자 전화번호 하이픈 추가
function formatCusPhone(inputField, maxLength) {
	    inputField.addEventListener("input", function() {
	      var inputValue = inputField.value;

	      // 하이픈(-)을 제외한 숫자만 추출
	      var numericValue = inputValue.replace(/[^0-9]/g, "");

	      // 000-0000-0000 형식
	      var formattedValue = numericValue.slice(0, 3) + "-" + numericValue.slice(3, 7) + "-" + numericValue.slice(7);

	      // maxLength 길이로 고정
	      if (formattedValue.length > maxLength) {
	        formattedValue = formattedValue.slice(0, maxLength);
	      }

	      // 포맷된 값을 입력 필드에 설정
	      inputField.value = formattedValue;
	    });
	  }

//	fax번호도 시간나면 해봅쉬다
	  
//	길이고정(12, 12, 13)
formatCusNumber(cusNumberInput, 12);
formatCusTel(cusTelInput, 12);
formatCusPhone(cusPhoneInput, 13);
});




//	포커스 들어가면 원래의 값 삭제
function clearInput(inputElement) {
    inputElement.setAttribute("data-original-value", inputElement.value); // 원래 값 저장
    inputElement.value = ""; // 입력 값을 지움
}


//	포커스 빠지면 원래의 값 복원
function restoreInput(inputElement) {
    if (inputElement.value === "") {
        inputElement.value = inputElement.getAttribute("data-original-value"); // 원래 값 복원
    }
}


//	사업자번호 중복확인
function checkDuplicate(inputElement) {
    var cusNumber = inputElement.value;

    $.ajax({
        url: '${pageContext.request.contextPath}/customer/cusNumberCheck',
        data: { 'cusNumber': cusNumber },
        success: function (result) {
            if (result == 'iddup') {
                alert("중복");
            } else {
                alert("사용가능");
            }
        }
    });
}

function performActions(inputElement) {
    restoreInput(inputElement); // 입력값 복원
    checkDuplicate(inputElement); // 중복 확인
}




//구분 선택에 따라 업태 자동입력, 업태에 따른 종목 목록 다르게 불러오	ㅏ
document.getElementById("cusCategory").addEventListener("change", function() {
    var cusCategory = this.value;
    var cusBusinessSelect = document.getElementById("cusBusiness");
    var cusTypeSelect = document.getElementById("cusType");

    // 초기화
    cusBusinessSelect.selectedIndex = 0;
    cusTypeSelect.innerHTML = ''; // 종목 선택 내용 초기화

    if (cusCategory === "납입처") {
        // 납입처를 선택한 경우
        cusBusinessSelect.value = "제조업";
//         cusBusinessSelect.disabled = true;
        // 원하는 옵션만 추가
        var allowedOptions = ["키캡", "스위치(적축)", "스위치(청축)", "스위치(갈축)", "프레임(상부)", "프레임(하부)", "흡음제", "플레이트", "PCB"];
        for (var i = 0; i < allowedOptions.length; i++) {
            var option = document.createElement("option");
            option.value = allowedOptions[i];
            option.text = allowedOptions[i];
            cusTypeSelect.appendChild(option);
        }
    } else {
        // 납품처를 선택한 경우
        cusBusinessSelect.value = "도매 및 소매업";
//         cusBusinessSelect.disabled = true;
        // 모든 옵션을 추가
        var allOptions = ["키포인트A87(적축)", "키포인트A87(청축)", "키포인트A87(갈축)", "키포인트B104(적축)", "키포인트B104(청축)", "키포인트B104(갈축)"];
        for (var i = 0; i < allOptions.length; i++) {
            var option = document.createElement("option");
            option.value = allOptions[i];
            option.text = allOptions[i];
            cusTypeSelect.appendChild(option);
        }
    }
});

// 초기 설정
document.getElementById("cusCategory").dispatchEvent(new Event('change'));







</script>
</body>
</html>