<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수주수정</title>
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
<div class="page-title">수주수정</div>
<form action="#">
<div class="forms-group-receive">
<div class="form-group-receive">
<p>업체코드</p>
<input type="text" id="search-customer" name="cusCode" class="" placeholder="업체코드">
</div>
<div class="form-group-receive">
<p>업체명</p>
<input type="text" class="" name="cusName" placeholder="업체명" readonly>
</div>
<div class="form-group-receive">
<p>상품코드</p>
<input type="text" id="search-product" name="productCode" class="" placeholder="상품코드">
</div>
<div class="form-group-receive">
<p>상품명</p>
<input type="text" class="" name="productName" placeholder="상품명" readonly>
</div>
<div class="form-group-receive">
<p>수주수량</p>
<input type="text" class="" name="roCount" placeholder="수주수량">
</div>
<div class="form-group-receive">
<p>수주금액</p>
<input type="text" class="" name="roPrice" placeholder="수주금액" readonly>
</div>
<div class="form-group-receive">
<p>수주일자</p>
<input type="text" id="datepicker" name="datepicker" placeholder="수주일자 선택" readonly>
<!-- <input type="text" class="" name="roDate" placeholder="수주일자"> -->
</div>
<div class="form-group-receive">
<!-- <p>상태</p> -->
<!-- <input type="text" class="" name="roStatus" placeholder="상태"> -->
<!-- <label for="roStatus">상태</label> -->
<p>상태</p>
	<select id="roStatus" name="roStatus">
<!--         <option value="on">선택</option> -->
        <option value="pending">대기</option>
        <option value="ongoing">진행</option>
        <option value="completed">완료</option>
        <option value="canceled">취소</option>
    </select>
</div>
</div>
<div class="details-buttons">
<input type="submit" value="완료" class="">
<input type="button" value="취소" class="" onClick="window.close()">
</div>
</form><!-- form 끝 -->
</div><!-- main-details -->

<script type="text/javascript">
//업체명(거래처) 검색 새창
var searchCustomer = document.getElementById("search-customer");
searchCustomer.addEventListener("click", function () {
	var url = '${pageContext.request.contextPath}/receive/empty';
	// ↑ 업체검색페이지 새로 입력하기
    window.open(url, '_blank', 'width=400, height=400');
});

//상품명 검색 새창
var searchProduct = document.getElementById("search-product");
searchProduct.addEventListener("click", function () {
	var url = '${pageContext.request.contextPath}/receive/empty';
	// ↑ 상품검색페이지 새로 입력하기
    window.open(url, '_blank', 'width=400, height=400');
});
</script>

<!-- 데이트피커 타임피커를 사용하기위한 j쿼리 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!--  데이트피커 커스텀 css-->
<link rel="stylesheet" type="text/css" href="./css/datepicker_gr.css">
<script>
// 데이트피커에서 비활성화할 날짜
var disabledDates = []; // 여기에 비활성화될 데이터들 JSON으로 가져와서 넣기
// 수주코드 변수값
var selectedStore = $('#roCode').val();
// 날짜 구하는 함수
var currentDate = new Date();
var currentYear = currentDate.getFullYear();
var currentMonth = currentDate.getMonth();
var currentDateVal = currentDate.getDate();
//서브밋 기능 제어 함수
$('#roDate').submit(function() {
	if($('#datepicker').val() == ""){
		alert("날짜를 선택해 주십시오"); 
		return false;
	}
});//submit기능 제어 끝

// 데이트피커 초기화
$("#datepicker").datepicker({
  dateFormat: 'yy-mm-dd',
  prevText: '이전 달',
  nextText: '다음 달',
  monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
  monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
  dayNames: ['일','월','화','수','목','금','토'],
  dayNamesShort: ['일','월','화','수','목','금','토'],
  dayNamesMin: ['일','월','화','수','목','금','토'],
  showMonthAfterYear: true,
  yearSuffix: '년',
  // 날짜 비활성화 관련 함수들
  beforeShowDay: function(date) {
    var day = date.getDay();
    var dateString = $.datepicker.formatDate('yy-mm-dd', date); // 날짜를 형식에 맞게 문자열로 변환
    var isDisabled = ($.inArray(dateString, disabledDates) !== -1);//비활성화될 데이터들 데이터 변환해서 최종적으로 일자 보여주기전에 비활성화해서 반환
    return [(day !== 0 && day !== 6 && !isDisabled)]; // 일요일(0)과 토요일(6)을 제외한 날짜만 선택 가능
  },
  // 날짜 제한 관련
  // 년도 범위 년도 : 년도 형식 2021 : 2023이라면 2021~2023까지 활성
  yearRange: currentYear + ':' + (currentYear + 1),
  // 최소 날짜 범위 년도, 달, 일로 되어있음. 지금은 23년 8월 17일로 되어있어서 8월 18일부터 선택 가능
  minDate: new Date(currentYear, currentMonth, currentDateVal + 1),
});

// 데이트피커 AJAX 처리
$.ajax({
type: "GET",
url: '#',
data: { "selectedStore": selectedStore }, // 선택된 값을 서버로 전송
dataType: 'json',
success: function (result) {
disabledDates = result.map(function (item) {
return item.date;
});
$("#datepicker").focus();
}
});
</script>
</body>
</html>