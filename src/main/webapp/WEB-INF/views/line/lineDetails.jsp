<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라인상세내역</title>
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
<div class="page-title-popup">라인상세내역</div>

<div class="search-bar-popup">
<div class="form-group-receive">
<p>라인코드</p>
<input type="text" id="lineCode" name="lineCode" class="form-control search-input inputcode" placeholder="${lineDTO.lineCode }" readonly >
</div>
<div class="form-group-receive">
<p>라인명</p>
<input type="text" id="lineName" name="lineName" class="form-control search-input inputcode" placeholder="${lineDTO.lineName }" readonly >
</div>
<div class="form-group-receive">
<p>작업명</p>
<input type="text" id="lineMemo" name="lineMemo" class="form-control search-input inputcode" placeholder="${lineDTO.lineMemo }" readonly >
</div>
<div class="form-group-receive">
<p>관리자</p>
<input type="text" id="empName" name="empName" class="form-control search-input inputcode" placeholder="${lineDTO.empName }" readonly >
</div>
</div> 
<!-- search-bar-popup end -->

</div>
<div class="details-buttons">
<input type="button" value="수정" class="btn btn-primary mybutton1" onclick="location.href='${pageContext.request.contextPath}/line/lineUpdate?lineCode=${lineDTO.lineCode}'">
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
// $(document).ready(function() {
//     // 라인명 검색 팝업 열기
//     $("#lineCode, #lineName").click(function() {
//         var url = '${pageContext.request.contextPath}/workOrder/workLineList';
//         openPopup(url);
//     });
//     // 상품명 검색 팝업 열기
//     $("#productCode, #productName").click(function() {
//         var url = '${pageContext.request.contextPath}/workOrder/workProdList';
//         openPopup(url);
//     });
//  	// 사원 검색 팝업 열기
//     $("#empId, #empName").click(function() {
//         var url = '${pageContext.request.contextPath}/workOrder/workEmpList';
//         openPopup(url);
//     });
// });
// // 수주일자 클릭시 현재날짜로 변경
// document.addEventListener('DOMContentLoaded', function () {
//     var roDateInput = document.getElementById("roDate");
// roDateInput.addEventListener("click", function () {
// 	var today = new Date();
// 	var yyyy = today.getFullYear();
// 	var mm = String(today.getMonth() + 1).padStart(2, '0');
// 	var dd = String(today.getDate()).padStart(2, '0');
// 	var hh = String(today.getHours()).padStart(2, '0');
// 	var mi = String(today.getMinutes()).padStart(2, '0');
// 	var ss = String(today.getSeconds()).padStart(2, '0');
// 	var formattedDate = yyyy + "-" + mm + "-" + dd + " " + hh + ":" + mi + ":" + ss;
// 	roDateInput.value = formattedDate;
// 	roDateInput.readOnly = true;
// 	roDateInput.placeholder = "";
//     });
// });
// // 수주일자(현재날짜) 이후로 납품예정일 선택 설정
// // 수주일자 입력란의 값 가져오기
// var roDateInput = document.getElementById("roDate");
// var roDateValue = roDateInput.value;

// // 수주일자를 현재 년월일로 설정 (YYYY-MM-DD 형식)
// var today = new Date();
// var dd = String(today.getDate()).padStart(2, '0');
// var mm = String(today.getMonth() + 1).padStart(2, '0'); // January is 0!
// var yyyy = today.getFullYear();
// var currentDateString = yyyy + '-' + mm + '-' + dd;
// // 납품예정일 입력란
// var shipSdateInput = document.getElementById("shipSdate");
// // 수주일자(오늘) 이후의 날짜만 선택할 수 있도록 Datepicker 설정
// $(function() {
//     $("#shipSdate").datepicker({
//         minDate: currentDateString, // 현재 날짜 이후로 설정
//         dateFormat: "yy-mm-dd", // MySQL DATE 형식으로 출력
//     });
// });

// // 유효성 검사
// function validateForm() {
//     // 각 입력 필드 값
//     var lineCode = document.getElementById("lineCode").value;
//     var lineName = document.getElementById("lineName").value;
//     var lineMemo = document.getElementById("lineMemo").value;
//     var lineEmp = document.getElementById("lineEmp").value;
//     // 빈 필드 검사
//     if (lineCode === "" || lineName === "" || lineMemo === "" ||
//     		lineEmp === "") {
//         alert("모든 내용을 입력해주세요.");
//         return false; // 제출 방지
//     }
// //     // 추가 유효성 검사
// //     if (roCount == 0) {
// //         alert("몇개부터 가능하도록 할까");
// //         return false; // 제출 방지
// //     }
//     return true;
// }


</script>
</body>
</html>