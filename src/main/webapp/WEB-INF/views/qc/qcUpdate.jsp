<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>픔질검사(진행)</title>
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
<form action="${pageContext.request.contextPath}/qc/qcUpdatePro" method="post" onsubmit="return validateForm()">
<div class="main-details">
<div class="forms-group-qc-receive">
<div class="page-title-popup">품질검사(진행)</div>
<div class="search-bar-popup-qc">
<div class="form-group-qc-receive">

<p>작업지시코드</p>
<input type="text" id="woCode" class="form-control search-input inputcode" placeholder="${qualityDTO.woCode}" readonly>
</div>
<div class="form-group-qc-receive">
<p>생산코드</p>
<input type="text" id="poCode" name="poCode" class="form-control search-input inputcode" value="${qualityDTO.poCode}" readonly>
</div>
<div class="form-group-qc-receive">
<p>상품명</p> 
<input type="text" id="productCode" class="form-control search-input" placeholder="${qualityDTO.productCode}" style="width:110px;" readonly>
<input type="text" id="productName" class="form-control search-input" placeholder="${qualityDTO.productName}" readonly>
</div>
<div class="form-group-qc-receive">
<p>상품생산자</p>
<input type="text" id="prodEmpId" class="form-control search-input inputcode" placeholder="${qualityDTO.prodEmpId}" readonly>
<input type="text" id="prodEmpName" class="form-control search-input inputname" placeholder="${qualityDTO.prodEmpName}" readonly>
</div>
<div class="form-group-qc-receive">
<p>납품예정일</p>
<input type="text" id="shipSdate" class="form-control search-input" placeholder="${qualityDTO.shipSdate}" readonly>
</div>
</div>
<table class="table-list">
<tr class="table-head">
	<th>검사1</th>
	<th>검사2</th>
	<th>검사3</th></tr>
<tr class="table-body">
	<td>
		<div class="form-group-qc-receive">
			<select id="qcTest1" name="qcTest1" class="form-control search-input status qc-status">
			    <option value="대기" ${qualityDTO.qcTest1 eq '대기' ? 'selected' : ''}>대기</option>
			    <option value="진행" ${qualityDTO.qcTest1 eq '진행' ? 'selected' : ''}>진행</option>
			    <option value="완료" ${qualityDTO.qcTest1 eq '완료' ? 'selected' : ''}>완료</option>
			</select>
		</div>
	</td>
	<td>
		<div class="form-group-qc-receive">
			<select id="qcTest2" name="qcTest2" class="form-control search-input status qc-status">
			    <option value="대기" ${qualityDTO.qcTest2 eq '대기' ? 'selected' : ''}>대기</option>
			    <option value="진행" ${qualityDTO.qcTest2 eq '진행' ? 'selected' : ''}>진행</option>
			    <option value="완료" ${qualityDTO.qcTest2 eq '완료' ? 'selected' : ''}>완료</option>
			</select>
		</div>
	</td>
	<td>
		<div class="form-group-qc-receive">
			<select id="qcTest3" name="qcTest3" class="form-control search-input status qc-status">
			    <option value="대기" ${qualityDTO.qcTest3 eq '대기' ? 'selected' : ''}>대기</option>
			    <option value="진행" ${qualityDTO.qcTest3 eq '진행' ? 'selected' : ''}>진행</option>
			    <option value="완료" ${qualityDTO.qcTest3 eq '완료' ? 'selected' : ''}>완료</option>
			</select>
		</div>
	</td>
</tr>
</table>
<br>
<table class="table-list">
<tr class="table-head"><th>검사대상수</th>
	<th>합격</th>
	<th>불량</th>
	<th>최종불량률</th></tr>
<tr class="table-body">
	<td><input type="text" id="qcCount" class="form-control search-input input-center hide" placeholder="${qualityDTO.poCount}" readonly></td>
	<td><input type="number" id="qcPass" name="qcPass" class="form-control search-input input-center" value="${qualityDTO.qcPass}" min="0" oninput="calculateQCDefectRate(); checkTotal()"></td>
	<td><input type="number" id="qcDefect" name="qcDefect" class="form-control search-input input-center" value="${qualityDTO.qcDefect}" min="0" oninput="calculateQCDefectRate(); checkTotal()"></td>
	<td><input type="text" id="qcDefectRate" name="qcDefectRate" class="form-control search-input input-center" value="${qualityDTO.qcDefectRate}" min="0"></td>
</tr>
</table>
<br>
<div class="search-bar-popup-qc">
<div class="form-group-qc-receive">
<p>품질검사코드</p>
<input type="text" id="qcCode" class="form-control search-input inputcode" placeholder="${qualityDTO.qcCode}" readonly>
</div>
<div class="form-group-qc-receive">
<p>품질검사원</p>
<input type="text" id="empId" name="qcEmpId" class="form-control search-input inputcode readonly-color" value="${qualityDTO.qcEmpId}" readonly>
<input type="text" id="empName" class="form-control search-input inputname readonly-color" placeholder="사원명" readonly>
</div>

<div class="form-group-qc-receive">
<p>검사시작일</p> 
<input type="text" id="qcStartDate" class="form-control search-input" placeholder="${qualityDTO.qcStartDate}" readonly>
</div>

<div class="form-group-qc-receive">
<p>검사완료일</p> 
<input type="text" id="qcEndDate" name="qcEndDate" class="form-control search-input readonly-color" value="${qualityDTO.qcEndDate}" placeholder="" readonly>
</div>

</div>
</div>
<div class="details-buttons">
<input type="submit" value="검사저장" class="btn btn-primary mybutton1">
<!-- <select id="qcStatus" name="qcStatus" class="form-control search-input status qc-status"> -->
<%--     <option value="대기" ${qualityDTO.qcStatus eq '대기' ? 'selected' : ''}>대기</option> --%>
<%--     <option value="진행" ${qualityDTO.qcStatus eq '진행' ? 'selected' : ''}>진행</option> --%>
<%--     <option value="완료" ${qualityDTO.qcStatus eq '완료' ? 'selected' : ''}>완료</option> --%>
<!-- </select> -->
<!-- <input type="button" value="검사완료" class="btn btn-primary mybutton1"> -->
</div>
<!-- </form>form 끝 -->
</div><!-- main-details -->
</form>
<!-- 데이트피커 타임피커를 사용하기위한 j쿼리 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
// 받아온 값이 0 또는 null일 경우 '-'
function setPlaceholder(id, value) {
    var inputElement = document.getElementById(id);
    inputElement.placeholder = (value !== null && value !== "" && value !== "0") ? value : '-';
}
setPlaceholder('qcTest1', "${qualityDTO.qcTest1}");
setPlaceholder('qcTest2', "${qualityDTO.qcTest2}");
setPlaceholder('qcTest3', "${qualityDTO.qcTest3}");
setPlaceholder('qcDefectRate', "${qualityDTO.qcDefectRate}");
setPlaceholder('poCode', "${qualityDTO.poCode}");

setPlaceholder('qcStartDate', "${qualityDTO.qcStartDate}");
setPlaceholder('qcEndDate', "${qualityDTO.qcEndDate}"); //시작일or완료일 컬럼추가하기
setPlaceholder('empName', "${qualityDTO.qcEmpName}");

//팝업 창을 열어주는 함수
function openPopup(url) {
    var width = 500;
    var height = 500;
    var left = (screen.width - width) / 2;
    var top = (screen.height - height) / 2;
    var popupWindow = window.open(url, '_blank', "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
    popupWindow.focus();
}
$(document).ready(function() {
 	// 사원 검색 팝업 열기
    $("#empId, #empName").click(function() {
        var url = '${pageContext.request.contextPath}/workOrder/workEmpList';
        openPopup(url);
    });
});

function setPlaceholderQcEmp(id, value) {
    var inputElement = document.getElementById(id);
    inputElement.placeholder = (value !== null && value !== "" && value !== "0") ? value : '사원검색(클릭)';
}
setPlaceholderQcEmp('qcEmpId', "${qualityDTO.qcEmpId}");

function setPlaceholderStart(id, value) {
    var inputElement = document.getElementById(id);
    inputElement.placeholder = (value !== null && value !== "" && value !== "0") ? value : '(검사등록시 자동생성)';
}
setPlaceholderStart('qcCode', "${qualityDTO.qcCode}");
</script>

<script type="text/javascript">
//검사완료일 클릭시 현재날짜로 변경
document.addEventListener('DOMContentLoaded', function () {
    var qcEndDateInput = document.getElementById("qcEndDate");
    qcEndDateInput.addEventListener("click", function () {
	var today = new Date();
	var yyyy = today.getFullYear();
	var mm = String(today.getMonth() + 1).padStart(2, '0');
	var dd = String(today.getDate()).padStart(2, '0');
	var hh = String(today.getHours()).padStart(2, '0');
	var mi = String(today.getMinutes()).padStart(2, '0');
	var ss = String(today.getSeconds()).padStart(2, '0');
	var formattedDate = yyyy + "-" + mm + "-" + dd + " " + hh + ":" + mi + ":" + ss;
	qcEndDateInput.value = formattedDate;
	qcEndDateInput.readOnly = true;
	qcEndDateInput.placeholder = "";
    });
});

//유효성 검사
function validateForm() {
    // 각 입력 필드 값
    var qcEmpIdElement = document.getElementById("qcEmpId") || document.getElementById("empId");
    var qcEmpId = qcEmpIdElement.value;
    console.log('qcEmpId:', qcEmpId);  // 로깅
    // 빈 필드 검사
    if (qcEmpId === "") {
        alert("[품질검사원]을 입력해주세요.");
        return false; // 제출 방지
    }
    return true;
}
function validateForm() {
    // 각 입력 필드 값
    var qcEndDateElement = document.getElementById("qcEndDate");
    var qcEndDate = qcEndDateElement.value;
    console.log('qcEndDate:', qcEndDate);  // 로깅
    // 빈 필드 검사
    if (qcEndDate === "") {
        alert("[검사완료일]을 입력해주세요.");
        return false; // 제출 방지
    }
    return true;
}
// 불량률 계산
function calculateQCDefectRate() {
    // qcPass와 qcDefect 입력값 가져오기
    var qcPassValue = parseFloat(document.getElementById('qcPass').value);
    var qcDefectValue = parseFloat(document.getElementById('qcDefect').value);

    // 계산 수행 및 결과 표시
    var qcDefectRateValue = qcDefectValue/ (qcPassValue + qcDefectValue) * 100 ;
    if (!isNaN(qcDefectRateValue)) {
      document.getElementById('qcDefectRate').value = qcDefectRateValue.toFixed(1)+'%'; // 소수점 두 자리까지 표시
    } else {
      document.getElementById('qcDefectRate').value = '??';
    }
  }
// 합격+불량 < 전체
function checkTotal() {
    var qcCount = parseInt(document.getElementById("qcCount").getAttribute("placeholder"), 10);
    var qcPass = parseInt(document.getElementById("qcPass").value, 10);
    var qcDefect = parseInt(document.getElementById("qcDefect").value, 10);
    
    if (qcPass + qcDefect > qcCount) {
        alert("[합격]과 [불량]의 합은 [검사대상수]를 넘을 수 없습니다.");
    }
}
</script>
</body>
</html>