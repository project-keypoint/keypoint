<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   <style type="text/css">
   .table-list td {
    padding: 7px 0px 7px 0px;
    border: 1px solid #ddd;
    background: #FFF;
}
   </style>
</head>
<body>
<div class="main-details">
<!-- <form action="#" method="post" onsubmit="return validateForm()"> -->
<div class="forms-group-qc-receive">
<div class="page-title-popup">품질검사(진행)</div>
<div class="search-bar-popup-qc">
<div class="form-group-qc-receive">
<p>작업지시코드</p>
<input type="text" id="workNum" name="cusCode" class="form-control search-input inputcode" placeholder="작업지시코드" readonly>
</div>
<div class="form-group-qc-receive">
<p>생산코드</p>
<input type="text" id="prodCode" name="prodCode" class="form-control search-input inputcode" placeholder="생산코드" readonly>
</div>
<div class="form-group-qc-receive">
<p>상품명</p> 
<input type="text" id="productCode" class="form-control search-input" placeholder="상품코드" style="width:110px;" readonly>
<input type="text" id="productName" class="form-control search-input" placeholder="상품명(클릭)" readonly>
</div>
<div class="form-group-qc-receive">
<p>상품생산자</p>
<input type="text" id="empId" name="empId" class="form-control search-input inputcode" placeholder="사원검색" readonly>
<input type="text" id="empName" class="form-control search-input inputname" placeholder="사원명" readonly>
</div>
<div class="form-group-qc-receive">
<p>납품예정일</p> <input type="text" id="shipSdate1" class="form-control search-input" placeholder="납품예정일" readonly>
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
			<select id="qcStatus" name="qcStatus" class="form-control search-input status qc-status">
				<option value="대기" selected>대기</option>
    			<option value="진행">진행</option>
    			<option value="완료">완료</option>
			<%--     <option value="대기" ${receiveDTO.roStatus eq '대기' ? 'selected' : ''}>대기</option> --%>
			<%--     <option value="진행" ${receiveDTO.roStatus eq '진행' ? 'selected' : ''}>진행</option> --%>
			<%--     <option value="완료" ${receiveDTO.roStatus eq '완료' ? 'selected' : ''}>완료</option> --%>
			</select>
		</div>
	</td>
	<td>
		<div class="form-group-qc-receive">
			<select id="qcStatus" name="qcStatus" class="form-control search-input status qc-status">
				<option value="대기" selected>대기</option>
    			<option value="진행">진행</option>
    			<option value="완료">완료</option>
			<%--     <option value="대기" ${receiveDTO.roStatus eq '대기' ? 'selected' : ''}>대기</option> --%>
			<%--     <option value="진행" ${receiveDTO.roStatus eq '진행' ? 'selected' : ''}>진행</option> --%>
			<%--     <option value="완료" ${receiveDTO.roStatus eq '완료' ? 'selected' : ''}>완료</option> --%>
			</select>
		</div>
	</td>
	<td>
		<div class="form-group-qc-receive">
			<select id="qcStatus" name="qcStatus" class="form-control search-input status qc-status">
				<option value="대기" selected>대기</option>
    			<option value="진행">진행</option>
    			<option value="완료">완료</option>
			<%--     <option value="대기" ${receiveDTO.roStatus eq '대기' ? 'selected' : ''}>대기</option> --%>
			<%--     <option value="진행" ${receiveDTO.roStatus eq '진행' ? 'selected' : ''}>진행</option> --%>
			<%--     <option value="완료" ${receiveDTO.roStatus eq '완료' ? 'selected' : ''}>완료</option> --%>
			</select>
		</div>
	</td></tr>
</table>
<br>
<table class="table-list">
<tr class="table-head"><th>검사대상수</th>
	<th>합격</th>
	<th>불량</th>
	<th>최종불량률</th></tr>
<tr class="table-body">
	<td><input type="text" id="qcCount" name="qcCount" class="form-control search-input input-center hide" placeholder="30" readonly></td>
	<td><input type="number" id="qcPass" name="qcPass" class="form-control search-input input-center" value="0" min="0" oninput="calculateQCDefectRate()"></td>
	<td><input type="number" id="qcDefect" name="qcDefect" class="form-control search-input input-center" value="0" min="0" oninput="calculateQCDefectRate()"></td>
	<td><input type="text" id="qcDefectRate" name="qcDefectRate" class="form-control search-input input-center" value="??" min="0"></td>
</tr>
</table>
<br>
<div class="search-bar-popup-qc">
<div class="form-group-qc-receive">
<p>품질검사코드</p>
<input type="text" id="qcCode" name="cusCode" class="form-control search-input inputcode" placeholder="품질검사코드" readonly>
</div>
<div class="form-group-qc-receive">
<p>품질검사원</p>
<input type="text" id="empId" name="empId" class="form-control search-input inputcode" placeholder="사원검색" readonly>
<input type="text" id="empName" class="form-control search-input inputname" placeholder="사원명" readonly>
</div>

<div class="form-group-qc-receive">
<p>검사시작일</p> <input type="text" id="shipSdate1" class="form-control search-input" placeholder="검사시작일" readonly>
</div>

<div class="form-group-qc-receive">
<p>검사완료일</p> <input type="text" id="shipSdate1" class="form-control search-input" placeholder="검사완료일" readonly>
</div>

</div>
</div>
<div class="details-buttons">
<input type="button" value="임시저장" class="btn btn-primary mybutton1">
<input type="button" value="검사완료" class="btn btn-primary mybutton1">
</div>
<!-- </form>form 끝 -->
</div><!-- main-details -->

<!-- 데이트피커 타임피커를 사용하기위한 j쿼리 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
//업체명(거래처) 검색 새창
var searchCustomer = document.getElementById("cusCode");
searchCustomer.addEventListener("click", function () {
	var url = '${pageContext.request.contextPath}/receive/empty';
	// ↑ 업체검색페이지 새로 입력하기
    window.open(url, '_blank', 'width=400, height=400');
});

//상품명 검색 새창
var searchProduct = document.getElementById("productCode");
searchProduct.addEventListener("click", function () {
	var url = '${pageContext.request.contextPath}/receive/empty';
	// ↑ 상품검색페이지 새로 입력하기
    window.open(url, '_blank', 'width=400, height=400');
});

//수주일, 납품예정일 검색 데이트피커(나중에 수정하기)
$(function() {
    $("#shipSdate").datepicker({
    	dateFormat: "yy-mm-dd"
    });
});
// 수주수정 페이지가 로드되면 수주예정일 값을 포맷팅해서 input에 넣음
$(document).ready(function() {
    var shipSdate = "${receiveDTO.shipSdate}"; // 서버에서 날짜를 받아옵니다.
    var formattedDate = new Date(shipSdate).toISOString().slice(0, 10);
    $("#shipSdate").val(formattedDate);
});
//유효성 검사
function validateForm() {
    // 각 입력 필드 값
    var cusCode = document.getElementById("cusCode").value;
    var productCode = document.getElementById("productCode").value;
    var roCount = document.getElementById("roCount").value;
    var roDate = document.getElementById("roDate").value;
    var shipSdate = document.getElementById("shipSdate").value;
    var empId = document.getElementById("empId").value;
    // 빈 필드 검사
    if (cusCode === "" || productCode === "" || roCount === "" ||
    	roDate === "" || shipSdate === "" || empId === "") {
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
</script>
</body>
</html>