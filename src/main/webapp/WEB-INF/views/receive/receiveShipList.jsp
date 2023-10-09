<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수주목록</title>
	<!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<!--     <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet"> -->
    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <!-- 수주 CSS 적용-->
    <link href="${pageContext.request.contextPath}/resources/css/receive.css" rel="stylesheet">
    
</head>
<body>
<%@include file="../inc/top-bar.jsp" %>
<%@include file="../inc/side-bar.jsp" %>
<!--  contents start -->
<!-- <div class="contents" style="position:fixed; left: 15rem;"> -->
<div class="main">
<!-- 수주영역 [시작] =================================================== -->
<div class="card shadow" > <!-- 그림자아니야 영역 -->
<div class="page-title">수주현황(전체수주목록)</div>
<div class="contents2">
<div class="search-bar">
<div class="search-b">
<div class="search-select">
<p>업체명</p> 
<input type="text" id="cusCode" class="form-control search-input readonly-color" placeholder="업체코드" style="width:110px;" readonly>
<input type="text" id="cusName" class="form-control search-input readonly-color" placeholder="업체명(클릭)" readonly>
</div>
<div class="search-select">
<p>상품명</p> 
<input type="text" id="productCode" class="form-control search-input readonly-color" placeholder="상품코드" style="width:110px;" readonly>
<input type="text" id="productName" class="form-control search-input readonly-color" placeholder="상품명(클릭)" readonly>
</div>
</div>

<div class="search-b">
<div class="search-date">
<p>수주일자</p> <input type="text" id="roDate1" class="form-control search-input readonly-color" placeholder="수주일자" readonly>
~<input type="text" id="roDate2" class="form-control search-input readonly-color" placeholder="수주일자" readonly>
</div>
<div class="search-date">
<p>납품예정일</p> <input type="text" id="shipSdate1" class="form-control search-input readonly-color" placeholder="납품예정일" readonly>
~<input type="text" id="shipSdate2" class="form-control search-input readonly-color" placeholder="납품예정일" readonly>
</div>
</div>
<div class="search-button">
<input type="button" value="검색" class="btn btn-primary mybutton1">
<input type="button" value="취소" class="btn btn-secondary mybutton1">
</div>
</div><!-- search-bar -->
<br>
<div class="select-status">
<a>대기<input type="checkbox" id="select1" name="select1" class="list-select" checked></a>
<a>진행<input type="checkbox" id="select2" name="select2" class="list-select" checked></a>
<a>완료<input type="checkbox" id="select3" name="select3" class="list-select" checked></a>
<a>취소<input type="checkbox" id="select4" name="select4" class="list-select"></a>
<a>( 체크박스 사용여부 보류중 )</a>
</div>

<div>
<table class="table-list">
<tr class="table-head">
	<th><input type="checkbox" id="delete-list-all" name="delete-list" data-group="delete-list"></th>
	<th>수주번호</th> 
    <th>업체코드</th> 
    <th>업체명</th> 
    <th>상품코드</th> 
    <th>상품명</th>
    <th>재고(EA)</th>
    <th>수주수량(EA)</th> 
    <th>수주금액</th> 
    <th>수주일자</th>
    <th>납품예정일</th>
<!--     <th>납품일</th> -->
    <th>상태</th>
    <th>상세내역</th>
    <th>납품</th>
</tr>
<c:forEach var="receiveDTO" items="${receiveList}">
<tr class="table-body">
	<td><input type="checkbox" id="delete-list" name="delete-list" data-group="delete-list"></td>
    <td>${receiveDTO.roCode}</td>
    <td>${receiveDTO.cusCode}</td>
    <td>${receiveDTO.cusName}</td>
    <td>${receiveDTO.productCode}</td>
    <td>${receiveDTO.productName}</td>
    <td>${receiveDTO.productCount}</td>
    <td>${receiveDTO.roCount}</td>
    <td><fmt:formatNumber value="${receiveDTO.roPrice}" groupingUsed="true"/>원</td>
    <td><c:out value="${fn:substring(receiveDTO.roDate, 0, 10)}" /></td>
    <td>${receiveDTO.shipSdate}</td>
    <td>${receiveDTO.roStatus}</td>
    <td><input type="button" value="상세내역" class="btn btn-info mybutton1" onclick="openDetails('${receiveDTO.roCode}')"></td>
<c:choose>
    <c:when test="${not empty receiveDTO.shipDate}">
        <td><input type="button" value="완료" class="btn btn-dark mybutton1"></td>
    </c:when>
    <c:when test="${receiveDTO.productCount >= receiveDTO.roCount}">
        <td><input type="button" value="납품" class="btn btn-primary mybutton1 shipment-button"></td>
    </c:when>
    <c:otherwise>
        <td><input type="button" value="납품" class="btn btn-secondary mybutton1"></td>
    </c:otherwise>
</c:choose> 
</tr>

<tr class="shipment-row">
	<td colspan="2" class="text-right">▶</td>
	<th colspan="11" class="text-right">
	<div class="shipment-div">
	　사원명 :
	<input type="text" id="shipEmpId" name="shipEmpId" class="form-control search-input inputcode readonly-color ei" placeholder="사원코드(클릭)" readonly>
	<input type="text" id="shipEmpName" class="form-control search-input inputname readonly-color en" placeholder="사원명(클릭)" readonly>
	　납품 :
	<input type="number" id="shipCount" class="form-control search-input inputname input-middle shipCount-input" name="shipCount" value="${receiveDTO.roCount}" min="0" max="${receiveDTO.productCount}">
	　납품메모 :
	<input type="text" id="shipMemo" class="form-control search-input inputname input-middle shipMemo-input" name="shipMemo" maxlength="100">
	</div>
	</th>
	<th>
	<input type='button' value='확인' class='btn btn-danger mybutton1' onclick="confirmShipment('${receiveDTO.roCode}','${receiveDTO.productCode}', this)">
	</th>
</tr>
</c:forEach>    
</table>
</div><!-- table -->
<div class="content-bottom">
<div>
<input type="button" value="수주등록" class="btn btn-primary mybutton1" onclick="openInsert()">
<input type="button" value="삭제" class="btn btn-secondary mybutton1">
</div>
<div class="page-buttons">
<a href="#" class="page-button">&lt;</a>
<a href="#" class="page-button page-button-active">1</a>
<a href="#" class="page-button">2</a>
<a href="#" class="page-button">3</a>
<a href="#" class="page-button">4</a>
<a href="#" class="page-button">5</a>
<a href="#" class="page-button">&gt;</a>
</div><!-- page-button -->
</div>
</div><!-- contents -->
</div><!-- 그림자아니야 영역 -->
<!-- 수주영역 [끝] ==================================================== -->

<!-- 납품영역 [시작] =================================================== -->
<div class="card shadow" > <!-- 그림자아니야 영역 -->
<div class="page-title">납품현황(전체납품목록)</div>
<div class="contents2">
<!-- <div class="search-bar"> -->
<!-- <div class="search-b"> -->
<!-- <div class="search-select"> -->
<!-- <p>업체명</p>  -->
<!-- <input type="text" id="cusCode" class="form-control search-input" placeholder="업체코드" style="width:110px;" readonly> -->
<!-- <input type="text" id="cusName" class="form-control search-input" placeholder="업체명(클릭)" readonly> -->
<!-- </div> -->
<!-- <div class="search-select"> -->
<!-- <p>상품명</p>  -->
<!-- <input type="text" id="productCode" class="form-control search-input" placeholder="상품코드" style="width:110px;" readonly> -->
<!-- <input type="text" id="productName" class="form-control search-input" placeholder="상품명(클릭)" readonly> -->
<!-- </div> -->
<!-- </div> -->

<!-- <div class="search-b"> -->
<!-- <div class="search-date"> -->
<!-- <p>수주일자</p> <input type="text" id="roDate1" class="form-control search-input" placeholder="수주일자" readonly> -->
<!-- ~<input type="text" id="roDate2" class="form-control search-input" placeholder="수주일자" readonly> -->
<!-- </div> -->
<!-- <div class="search-date"> -->
<!-- <p>납품예정일</p> <input type="text" id="shipSdate1" class="form-control search-input" placeholder="납품예정일" readonly> -->
<!-- ~<input type="text" id="shipSdate2" class="form-control search-input" placeholder="납품예정일" readonly> -->
<!-- </div> -->
<!-- </div> -->
<!-- <div class="search-button"> -->
<!-- <input type="button" value="검색" class="btn btn-primary mybutton1"> -->
<!-- <input type="button" value="취소" class="btn btn-secondary mybutton1"> -->
<!-- </div> -->
<!-- </div>search-bar -->
<!-- <br> -->
<!-- <div class="select-status"> -->
<!-- <a>대기<input type="checkbox" id="select1" name="select1" class="list-select" checked></a> -->
<!-- <a>진행<input type="checkbox" id="select2" name="select2" class="list-select" checked></a> -->
<!-- <a>완료<input type="checkbox" id="select3" name="select3" class="list-select" checked></a> -->
<!-- <a>취소<input type="checkbox" id="select4" name="select4" class="list-select"></a> -->
<!-- <a>( 체크박스 사용여부 보류중 )</a> -->
<!-- </div> -->

<div>
<table class="table-list">
<tr class="table-head">
	<th><input type="checkbox" id="delete-list-all" name="delete-list" data-group="delete-list"></th>
	<th>수주번호</th> 
    <th>업체코드</th> 
    <th>업체명</th> 
    <th>상품코드</th> 
    <th>상품명</th> 
    <th>수주수량(EA)</th>
    <th>납품수량(EA)</th> 
    <th>최종금액</th> 
    <th>수주일자</th>
    <th>납품예정일</th>
    <th>납품일</th>
<!--     <th>상태</th> -->
    <th>상세내역</th>
</tr>
<c:forEach var="receiveDTO" items="${shipmentList}">
<tr class="table-body">
	<td><input type="checkbox" id="delete-list" name="delete-list" data-group="delete-list"></td>
    <td>${receiveDTO.roCode}</td>
    <td>${receiveDTO.cusCode}</td>
    <td>${receiveDTO.cusName}</td>
    <td>${receiveDTO.productCode}</td>
    <td>${receiveDTO.productName}</td>
    <td>${receiveDTO.roCount}</td>
    <td>${receiveDTO.shipCount}</td>
    <td><fmt:formatNumber value="${receiveDTO.shipPrice}" groupingUsed="true"/>원</td>
    <td><c:out value="${fn:substring(receiveDTO.roDate, 0, 10)}" /></td>
    <td>${receiveDTO.shipSdate}</td>
    <td><c:out value="${fn:substring(receiveDTO.shipDate, 0, 10)}" /></td>
    <td><input type="button" value="상세내역" class="btn btn-info mybutton1" onclick="openDetails('${receiveDTO.roCode}')"></td>
</tr>
</c:forEach>    
</table>
</div><!-- table -->
<div class="content-bottom">
<div>
<input type="button" value="삭제" class="btn btn-secondary mybutton1">
</div>
<div class="page-buttons">
<a href="#" class="page-button">&lt;</a>
<a href="#" class="page-button page-button-active">1</a>
<a href="#" class="page-button">2</a>
<a href="#" class="page-button">3</a>
<a href="#" class="page-button">4</a>
<a href="#" class="page-button">5</a>
<a href="#" class="page-button">&gt;</a>
</div><!-- page-button -->
</div>
</div><!-- contents -->
</div><!-- 그림자아니야 영역 -->
<!-- 납품영역 [끝] ==================================================== -->
</div><!-- main -->

<!-- contents end -->

<!-- 데이트피커 타임피커를 사용하기위한 j쿼리 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 행 추가 관련 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
// 납품완료 ajax
// function confirmShipment(roCode, productCode, button) {
//     var row = button.parentNode.parentNode;
//     var shipCount = row.querySelector('#shipCount').value;
//     var shipMemo = row.querySelector('#shipMemo').value;

//     if (confirm('확인하시겠습니까?')) {
//         $.ajax({
//             type: "POST",
//             url: '${pageContext.request.contextPath}/receive/shipComplete',
//             data: {
//                 "roCode": roCode,
//                 "productCode": productCode,
//                 "shipCount": shipCount,
//                 "shipMemo": shipMemo
//             },
//             success: function(result) {
//                 const data = $.trim(result);
//                 if (data === "success") {
//                     alert("완료");
//                     location.reload();
//                 } else {
//                     alert("에러");
//                 }
//             }
//         });
//     }
// }
function confirmShipment(roCode, productCode, button) {
    var row = button.parentNode.parentNode;
    var shipCount = row.querySelector('#shipCount').value;
    var shipMemo = row.querySelector('#shipMemo').value;

    var userInput = prompt('진행하려면 "납품"라고 입력하세요.');

    if (userInput === '납품') {
        $.ajax({
            type: "POST",
            url: '${pageContext.request.contextPath}/receive/shipComplete',
            data: {
                "roCode": roCode,
                "productCode": productCode,
                "shipCount": shipCount,
                "shipMemo": shipMemo
            },
            success: function(result) {
                const data = $.trim(result);
                if (data === "success") {
                    alert("완료");
                    location.reload();
                } else {
                    alert("에러");
                }
            }
        });
    } else {
        alert('잘못된 입력입니다.');
    }
}

// 숨겨진 행 나타내는 코드(납품수량)
$(document).ready(function() {
    $('.shipment-button').click(function() {
        $(this).closest('tr').next('.shipment-row').toggle();
    });
});

// 납품수량 키보드입력방지(min,max값 범위넘는값, '-'문자 방지)
$(document).ready(function() {
    $('.shipCount-input').on('input', function() {
        var min = parseInt($(this).attr('min'));
        var max = parseInt($(this).attr('max'));
        var value = $(this).val();

        if (!/^\d+$/.test(value)) {
            $(this).val(min);
        } else if (value < min) {
            $(this).val(min);
        } else if (value > max) {
            $(this).val(max);
        }
    });
});

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
});
//수주일, 납품예정일 검색 데이트피커(나중에 수정하기)
$(function() {
    $("#roDate1").datepicker({
    	dateFormat: "yy-mm-dd"
    });
    $("#roDate2").datepicker({
    	dateFormat: "yy-mm-dd"
    });
    $("#shipSdate1").datepicker({
    	dateFormat: "yy-mm-dd"
    });
    $("#shipSdate2").datepicker({
    	dateFormat: "yy-mm-dd"
    });
});

// 체크박스(삭제용) 전체선택
var selectAllCheckbox = document.getElementById("delete-list-all");
var checkboxes = document.querySelectorAll('[data-group="delete-list"]');
selectAllCheckbox.addEventListener("change", function () {
    checkboxes.forEach(function (checkbox) {
        checkbox.checked = selectAllCheckbox.checked;
    });
});
checkboxes.forEach(function (checkbox) {
    checkbox.addEventListener("change", function () {
        if (!this.checked) {
            selectAllCheckbox.checked = false;
        } else {
            // 모든 체크박스가 선택되었는지 확인
            var allChecked = true;
            checkboxes.forEach(function (c) {
                if (!c.checked) {
                    allChecked = false;
                }
            });
            selectAllCheckbox.checked = allChecked;
        }
    });
});

// 수주상세내용 새창
function openDetails(roCode) {
    var url = '${pageContext.request.contextPath}/receive/receiveDetails?roCode='+roCode;
    var windowWidth = 610;
    var windowHeight = 725;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}
//수주등록 새창
function openInsert() {
    var url = '${pageContext.request.contextPath}/receive/receiveInsert';
    var windowWidth = 500;
    var windowHeight = 675;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}
</script>

</body>
</html>