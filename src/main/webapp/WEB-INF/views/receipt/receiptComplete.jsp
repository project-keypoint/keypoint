<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입고처리</title>
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
<form action="${pageContext.request.contextPath}/receipt/receiptCompletePro" id="receiptInsert" method="post" >

<div class="forms-group-receive">
<div class="page-title-popup">입고처리</div>

<div class="form-group-receive">
<p>입고코드</p>
<input type="text" id="grCode" name="grCode" class="form-control search-input" value="${receiptDTO.grCode}" readonly>
</div>

<div class="form-group-receive">
<p>입고예정수량</p>
<input type="number" id="grCount" name="grCount" class="form-control search-input" value="${receiptDTO.grCount}" min="0" readonly>
</div>

<div class="form-group-receive">
<p>입고완료수량</p>
<input type="number" id="grEcount" name="grEcount" class="form-control search-input" placeholder="입고완료수량" min="1">
</div>

<div class="form-group-receive">
<p>입고완료날짜</p>
<input type="text" id="grEdate" name="grEdate" class="form-control search-input" readonly>
</div>

</div>
<div class="details-buttons">
<input type="submit" value="입고" class="btn btn-primary mybutton1">
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


</script>

<script type="text/javascript">
    $(document).ready(function() {
        // 현재 날짜를 가져옵니다.
        var today = new Date();
        
        // 날짜를 'YYYY-MM-DD' 형식으로 포맷팅합니다.
        var formattedDate = today.getFullYear() + '-' + (today.getMonth() + 1).toString().padStart(2, '0') + '-' + today.getDate().toString().padStart(2, '0');
        
        // #grEdate 요소에 현재 날짜를 자동으로 입력합니다.
        $("#grEdate").val(formattedDate);
    });
</script>




</body>
</html>