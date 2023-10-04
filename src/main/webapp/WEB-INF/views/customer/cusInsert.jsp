<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수주등록</title>
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
<form action="${pageContext.request.contextPath}/customer/cusInsertPro" method="post" onsubmit="return validateForm()">

<div class="forms-group-customer">
<div class="page-title-popup">거래처 등록</div>


<div class="form-group-customer">
<p>거래처코드</p>
<input type="text" id="cusCode" name="cusCode" class="form-control search-input" placeholder="거래처코드" readonly>
</div>


<div class="form-group-customer">
<p><a style="color: red;">*</a>거래처구분</p>
<input type="radio" id="cusCategory" name="cusCategory" class="form-control search-input" value="납입처"> 납입처
<input type="radio" id="cusCategory" name="cusCategory" class="form-control search-input" value="납품처"> 납품처
</div>


<div class="form-group-customer">
<p><a style="color: red;">*</a>사업자번호</p>
<input type="text" id="cusNumber" class="form-control search-input" placeholder="-없이 10자리 입력하세요" >
<input type="submit" id="dubSubmit" value="중복확인" class="btn btn-primary mybutton2">
</div>


<div class="form-group-customer">
<p><a style="color: red;">*</a>거래처명</p>
<input type="text" id="cusName" name="cusName" class="form-control search-input">
</div>


<div class="form-group-customer">
<p><a style="color: red;">*</a>대표명</p>
<input type="text" id="cusRep" name="cusRep" class="form-control search-input">
</div>


<div class="form-group-customer">
<p><a style="color: red;">*</a>대표전화</p>
<input type="text" id="cusTel" name="cusTel" class="form-control search-input">
</div>


<div class="form-group-customer">
<p><a style="color: red;">*</a>업태</p>
<select id="cusType1" name="cusType1" class="form-control search-input">
        <option value="도매 및 소매업">도매 및 소매업</option>
        <option value="제조업">제조업</option>
</select>
</div>


<div class="form-group-customer">
<p><a style="color: red;">*</a>종목</p>
<select id="cusType" name="cusType" class="form-control search-input">
        <option value="키캡">키캡</option>
        <option value="스위치(적축)">스위치(적축)</option>
        <option value="스위치(청축)">스위치(청축)</option>
        <option value="스위치(갈축)">스위치(갈축)</option>
        <option value="프레임(상부)">프레임(상부)</option>
        <option value="프레임(하부)">프레임(하부)</option>
        <option value="흡음제">흡음제</option>
        <option value="플레이트">플레이트</option>
        <option value="PCB">PCB</option>
        <option value="키보드(적축)">키보드(적축)</option>
        <option value="키보드(청축)">키보드(청축)</option>
        <option value="키보드(갈축)">키보드(갈축)</option>
</select>
</div>


<div class="form-group-customer">
<p><a style="color: red;">*</a>주소</p>
<input type="text" id="cusAddress" name="cusAddress" class="form-control search-input">
</div>

<div class="form-group-customer">
<p><a style="color: red;">*</a>담당자</p>
<input type="text" id="cusResp" name="cusResp" class="form-control search-input">
</div>

<div class="form-group-customer">
<p><a style="color: red;">*</a>담당자 전화번호</p>
<input type="text" id="cusPhone" name="cusPhone" class="form-control search-input">
</div>

<div class="form-group-customer">
<p><a style="color: red;">*</a>담당자 이메일</p>
<input type="text" id="cusEmail" name="cusEmail" class="form-control search-input">
</div>

<div class="form-group-customer">
<p>FAX</p>
<input type="text" id="cusFax" name="cusFax" class="form-control search-input">
</div>

<div class="form-group-customer">
<p>홈페이지</p>
<input type="text" id="cusHome" name="cusHome" class="form-control search-input">
</div>

<div class="form-group-customer">
<p>적요</p>
<input type="text" id="cusMemo" name="cusMemo" class="form-control search-input" style="height: 200px; width:280px;"><br>
</div>

<br>



<div class="form-group-customer">
<p><a style="color: red;">*</a>상태</p>
<select id="cusStatus" name="cusStatus" class="form-control search-input">
        <option value="거래중">거래중</option>
        <option value="거래중지">거래중지</option>
</select>
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
/* //팝업 창을 열어주는 함수
function openPopup(url) {
    var width = 500;
    var height = 500;
    var left = (screen.width - width) / 2;
    var top = (screen.height - height) / 2;
    var popupWindow = window.open(url, '_blank', "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
    popupWindow.focus();
}
$(document).ready(function() {
    // 업체명 검색 팝업 열기
    $("#cusCode, #cusName").click(function() {
        var url = '${pageContext.request.contextPath}/workOrder/workCusList';
        openPopup(url);
    });
    // 상품명 검색 팝업 열기
    $("#productCode, #productName").click(function() {
        var url = '${pageContext.request.contextPath}/workOrder/workProdList';
        openPopup(url);
    });
 	// 사원 검색 팝업 열기
    $("#empId, #empName").click(function() {
        var url = '${pageContext.request.contextPath}/workOrder/workEmpList';
        openPopup(url);
    });
}); */




// 유효성 검사
function validateForm() {
    // 각 입력 필드 값
    var cusCode2 = document.getElementById("cusCode").value;
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