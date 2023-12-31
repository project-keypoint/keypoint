<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라인등록</title>
	<!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <!-- 수주 CSS 적용-->
    <link href="${pageContext.request.contextPath}/resources/css/line.css" rel="stylesheet">
</head>
<body>
<div class="main-details">
<form action="${pageContext.request.contextPath}/line/lineInsertPro" method="post" onsubmit="return validateForm()">
<div class="forms-group-receive">
<div class="page-title-popup">라인등록</div>

<div class="search-bar-popup">
<div class="form-group-receive">
<p>라인코드</p>
<input type="text" id="lineCode" name="lineCode" class="form-control search-input inputcode" readonly>
</div>
<div class="form-group-receive">
<p>라인명</p>
<input type="text" id="lineName" name="lineName" class="form-control search-input inputcode" readonly>
</div>
<div class="form-group-receive">
<p>작업명</p>
<input type="text" id="lineMemo" name="lineMemo" class="form-control search-input inputcode" placeholder="작업명" >
</div>
<div class="form-group-receive">
<p>관리자</p>
<input type="text" id="empName" name="empName" class="form-control search-input inputcode" placeholder="관리자" >
</div>
<div class="form-group-receive" style="display:none;">
<p>관리자</p>
<input type="text" id="empId" name="empId" class="form-control search-input inputcode" placeholder="관리자코드" >
</div>
</div> 
<!-- search-bar-popup end -->

</div>
<div class="details-buttons">
<input type="submit" id="lineSubmit" value="등록" class="btn btn-primary mybutton1">
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
function openPopup(url) {
    var width = 500;
    var height = 500;
    var left = (screen.width - width) / 2;
    var top = (screen.height - height) / 2;
    var popupWindow = window.open(url, '_blank', "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
    popupWindow.focus();
}

//검색 팝업창
$(document).ready(function() {
    // 관리자 검색 팝업 열기
    $("#empName").click(function() {
        var url = '${pageContext.request.contextPath}/workOrder/workEmpList';
        openPopup(url);
    });
});

// 유효성 검사
function validateForm() {
    // 각 입력 필드 값
    var lineCode = document.getElementById("lineCode").value;
    var lineName = document.getElementById("lineName").value;
    var lineMemo = document.getElementById("lineMemo").value;
    var lineEmp = document.getElementById("empName").value;
    // 빈 필드 검사
    if (lineCode === "" || lineName === "" || lineMemo === "" ||
    		empName === "") {
        alert("모든 내용을 입력해주세요.");
        return false; // 제출 방지
    }
//     // 추가 유효성 검사
//     if (roCount == 0) {
//         alert("몇개부터 가능하도록 할까");
//         return false; // 제출 방지
//     }
    return true;
}
document.addEventListener("DOMContentLoaded", function() {
    // Ajax 요청 보내기
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "${pageContext.request.contextPath}/line/getLineInfo", true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var response = JSON.parse(xhr.responseText);
            var lineCodeField = document.getElementById("lineCode");
            var lineNameField = document.getElementById("lineName");
            
            // lineCodeField와 lineNameField의 value 속성에 가져온 값 설정
            lineCodeField.value = response.lineCode;
            lineNameField.value = response.lineName;
        }
    };
    xhr.send();
});


</script>
</body>
</html>