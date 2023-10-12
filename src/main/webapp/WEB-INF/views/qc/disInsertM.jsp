<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>폐기</title>
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
<div class="main-details">
<form action="${pageContext.request.contextPath}/qc/disInsertMaterial" method="post" onsubmit="return validateForm()">
<div class="forms-group-receive">
<div class="page-title-popup">폐기등록</div>
<div class="search-bar-popup">
<div class="form-group-receive-insert">
<p>자재명</p>
<input type="text" id="materialCode" name="materialCode" class="form-control search-input inputcode" placeholder="상품검색" readonly>
<input type="text" id="materialName" class="form-control search-input inputname" placeholder="상품명" readonly>
</div>
</div>
<div class="form-group-receive-insert">
<p>폐기수량</p>
<input type="number" id="disCount" name="disCount" class="form-control search-input" placeholder="폐기수량" min="0">
</div>
<div class="form-group-receive-insert">
<p>폐기내용</p>
<input type="text" id="disMemo" name="disMemo" class="form-control search-input" placeholder="폐기내용">
</div>
<div class="search-bar-popup">
<div class="form-group-receive-insert">
<p>당담자</p>
<input type="text" id="empId" name="disEmpId" class="form-control search-input inputcode" placeholder="사원검색" readonly>
<input type="text" id="empName" class="form-control search-input inputcode" placeholder="사원명" readonly>
</div>
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
function openPopup(popurl) {
    var width = 500;
    var height = 500;
    var left = (screen.width - width) / 2;
    var top = (screen.height - height) / 2;
    var popupWindow = window.open(popurl, '_blank', "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
    popupWindow.focus();
}
$(document).ready(function() {
    // 상품명 검색 팝업 열기
    $("#materialCode, #materialName").click(function() {
        var url = '${pageContext.request.contextPath}/qc/materialList';
        openPopup(url);
    });
 	// 사원명 검색 팝업 열기
    $("#empId, #empName").click(function() {
    	var url = '${pageContext.request.contextPath}/workOrder/workEmpList';
        openPopup(url);
    });
});

$(document).ready(function() {
    var maxLength = 20; // 최대 글자 수

    $("#disMemo").on("input", function() {
        var text = $(this).val();
        if (text.length > maxLength) {
            text = text.slice(0, maxLength);
            $(this).val(text);
        }
    });
});


// 유효성 검사
function validateForm() {
    // 각 입력 필드 값
    var materialCode = document.getElementById("materialCode").value;
    var disCount = document.getElementById("disCount").value;
    var disMemo = document.getElementById("disMemo").value;
    var disEmpId = document.getElementById("empId").value;
    // 빈 필드 검사
    if (materialCode === "" || disCount === "" || 
    	disMemo === "" || disEmpId === "") {
        alert("모든 내용을 입력해주세요.");
        return false; // 제출 방지
    }
	var confirmation = prompt("자재폐기 내용을 등록합니다.\n등록하려면 '폐기'라고 입력하세요.");
    if (confirmation !== "폐기") {
        return false; // 제출 방지
    }
    return true;
}
</script>
</body>
</html>