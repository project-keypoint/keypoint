<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수주&amp;납품</title>
	<!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <!-- 수주 CSS 적용-->
    <link href="${pageContext.request.contextPath}/resources/css/receive.css" rel="stylesheet">
</head>
<body>
<%@include file="../inc/top-bar.jsp" %>
<%@include file="../inc/side-bar.jsp" %>
<!--  contents start -->
<div class="main">
<!-- 수주영역 [시작] =================================================== -->
<div class="card shadow" > <!-- 그림자아니야 영역 -->
<div class="page-title">수주현황(전체수주목록)</div>
<div class="contents2">
<input type="button" value="엑셀파일다운" id="excelWorkOrder"> <br><br>
<form action="${pageContext.request.contextPath}/receive/receiveShipList" method="get">
<div class="search-b" style="margin-bottom: -15px;">
<div class="status-check" style="background: #E5E5E5; border: none;">
<div class="search-date3">
<a style="font-weight: bold;">　대기<input type="checkbox" id="select1" name="check1" class="list-select" value="대기"
<c:if test="${not empty pageDTO.check1}">checked</c:if>></a>
<a>진행<input type="checkbox" id="select2" name="check2" class="list-select" value="진행"
<c:if test="${not empty pageDTO.check2}">checked</c:if>></a>
<a>완료<input type="checkbox" id="select3" name="check3" class="list-select" value="완료"
<c:if test="${not empty pageDTO.check3}">checked</c:if>></a>
<a>취소<input type="checkbox" id="select4" name="check4" class="list-select" value="취소"
<c:if test="${not empty pageDTO.check4}">checked</c:if>></a>
</div>
</div>
</div>
<div class="search-bar">
<!-- <div class="search-b"> -->
<!-- <div style="margin-bottom: -15px;"></div> -->
<!-- <div class="status-check"> -->
<!-- <div class="search-date3"> -->
<!-- <a style="font-weight: bold;">대기<input type="checkbox" id="select1" name="check1" class="list-select" value="대기" -->
<%-- <c:if test="${not empty pageDTO.check1}">checked</c:if>></a> --%>
<!-- <a>진행<input type="checkbox" id="select2" name="check2" class="list-select" value="진행" -->
<%-- <c:if test="${not empty pageDTO.check2}">checked</c:if>></a> --%>
<!-- </div> -->
<!-- <div class="search-date3"> -->
<!-- <a>완료<input type="checkbox" id="select3" name="check3" class="list-select" value="완료" -->
<%-- <c:if test="${not empty pageDTO.check3}">checked</c:if>></a> --%>
<!-- <a>취소<input type="checkbox" id="select4" name="check4" class="list-select" value="취소" -->
<%-- <c:if test="${not empty pageDTO.check4}">checked</c:if>></a> --%>
<!-- </div> -->
<!-- </div> -->
<!-- </div> -->

<div class="search-b">
<div class="search-select">
<p>업체명</p> 
<input type="text" id="cusCode" name="search" class="form-control search-input readonly-color"
       placeholder="${empty pageDTO.search ? '업체코드' : ''}" value="${pageDTO.search}" readonly>
<input type="text" id="cusName" name="search7" class="form-control search-input readonly-color" 
       placeholder="${empty pageDTO.search8 ? '업체명(클릭)' : ''}" value="${pageDTO.search7}" readonly>
</div>
<div class="search-select">
<p>상품명</p> 
<input type="text" id="productCode" name="search2" class="form-control search-input readonly-color"
       placeholder="${empty pageDTO.search2 ? '상품코드' : ''}" value="${pageDTO.search2}" readonly>
<input type="text" id="productName" name="search8" class="form-control search-input readonly-color"
       placeholder="${empty pageDTO.search8 ? '상품명(클릭)' : ''}" value="${pageDTO.search8}" readonly>
       
</div>
</div>

<div class="search-b">
<div class="search-date">
<p>수주일자</p>
<input type="text" id="roDateStart" name="search3" class="form-control search-input readonly-color" 
       placeholder="${empty pageDTO.search3 ? '수주일자' : ''}" value="${pageDTO.search3}" readonly>
~<input type="text" id="roDate2" name="search4" class="form-control search-input readonly-color" 
        placeholder="${empty pageDTO.search4 ? '수주일자' : ''}" value="${pageDTO.search4}" readonly>
</div>
<div class="search-date">
<p>납품예정일</p>
<input type="text" id="shipSdate1" name="search5" class="form-control search-input readonly-color" 
       placeholder="${empty pageDTO.search5 ? '납품예정일' : ''}" value="${pageDTO.search5}" readonly>
~<input type="text" id="shipSdate2" name="search6" class="form-control search-input readonly-color" 
        placeholder="${empty pageDTO.search6 ? '납품예정일' : ''}" value="${pageDTO.search6}" readonly>
</div>
</div>
<!-- <div class="search-button"> -->
<!-- <input type="submit" value="검색" class="btn btn-primary mybutton1"> -->
<!-- <input type="button" value="취소" class="btn btn-secondary mybutton1" onclick="resetSearch()"> -->
<!-- </div> -->
<div style="display: flex; flex-direction: column; width: 145px; margin-top: -20px;">
<div class="search-button" style="margin-bottom: 5px;">
<input type="submit" value="검색하기" class="btn btn-primary mybutton1" style="width: 100%;">
</div>
<div class="search-button" style="display: flex; justify-content: space-between;">
<input type="button" value="초기화" class="btn btn-secondary mybutton1" onclick="window.location.href = '${pageContext.request.contextPath}/receive/receiveShipList'" style="width: 48.6%;">
<input type="button" value="지우기" class="btn btn-secondary mybutton1" onclick="resetSearch()" style="width: 48.6%;">
</div>
</div>
</div><!-- search-bar -->
</form>

<br>
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
	<th><input type="checkbox" id="delete-list-receiveAll" name="delete-list-receive" data-group="delete-list-receive"></th>
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
    <th>상태</th>
    <th>상세내역</th>
    <th>납품</th>
</tr>
<c:forEach var="receiveDTO" items="${receiveList}">
<tr class="table-body">
	<td><input type="checkbox" id="delete-list-receive" name="delete-list-receive" data-group="delete-list-receive"></td>
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
<input type="button" value="삭제" class="btn btn-secondary mybutton1" onclick="deleteReceive()">
</div>

<div id="page_control_receive" class="page-buttons">
    <c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
        <a href="${pageContext.request.contextPath}/receive/receiveShipList?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&pageNum1=${pageDTO1.pageNum}&check1=${pageDTO.check1}&check2=${pageDTO.check2}&check3=${pageDTO.check3}&check4=${pageDTO.check4}&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}&search5=${pageDTO.search5}&search6=${pageDTO.search6}&search7=${pageDTO.search7}&search8=${pageDTO.search8}" class="page-button">&lt;</a>
    </c:if>
    <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
        <c:choose>
            <c:when test="${i eq pageDTO.currentPage}">
                <a href="#" class="page-button page-button-active">${i}</a>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/receive/receiveShipList?pageNum=${i}&pageNum1=${pageDTO1.pageNum}&check1=${pageDTO.check1}&check2=${pageDTO.check2}&check3=${pageDTO.check3}&check4=${pageDTO.check4}&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}&search5=${pageDTO.search5}&search6=${pageDTO.search6}&search7=${pageDTO.search7}&search8=${pageDTO.search8}" class="page-button">${i}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:if test="${pageDTO.endPage < pageDTO.pageCount}">
        <a href="${pageContext.request.contextPath}/receive/receiveShipList?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&pageNum1=${pageDTO1.pageNum}&check1=${pageDTO.check1}&check2=${pageDTO.check2}&check3=${pageDTO.check3}&check4=${pageDTO.check4}&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}&search5=${pageDTO.search5}&search6=${pageDTO.search6}&search7=${pageDTO.search7}&search8=${pageDTO.search8}" class="page-button">&gt;</a> 
    </c:if> 
</div>

</div>
</div><!-- contents -->
</div><!-- 그림자아니야 영역 -->
<!-- 수주영역 [끝] ==================================================== -->

<!-- 납품영역 [시작] =================================================== -->
<div class="card shadow" > <!-- 그림자아니야 영역 -->
<div class="page-title">납품현황(전체납품목록)</div>
<div class="contents2">
<div>
<table class="table-list">
<tr class="table-head">
	<th><input type="checkbox" id="delete-list-shipmentAll" name="delete-list" data-group="delete-list-shipment"></th>
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
    <th>상세내역</th>
</tr>
<c:forEach var="receiveDTO" items="${shipmentList}">
<tr class="table-body">
	<td><input type="checkbox" id="delete-list-shipment" name="delete-list-shipment" data-group="delete-list-shipment"></td>
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
<div id="pagination_control_shipment" class="page-buttons">
    <c:if test="${pageDTO1.startPage > pageDTO1.pageBlock}">
        <a href="${pageContext.request.contextPath}/receive/receiveShipList?pageNum=${pageDTO.pageNum}&pageNum1=${pageDTO1.startPage - pageDTO1.pageBlock}&check1=${pageDTO.check1}&check2=${pageDTO.check2}&check3=${pageDTO.check3}&check4=${pageDTO.check4}&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}&search5=${pageDTO.search5}&search6=${pageDTO.search6}&search7=${pageDTO.search7}&search8=${pageDTO.search8}" class="page-button">&lt;</a>
    </c:if>
    <c:forEach var="i" begin="${pageDTO1.startPage}" end="${pageDTO1.endPage}" step="1">
        <c:choose>
            <c:when test="${i eq pageDTO1.currentPage}">
                <a href="#" class="page-button page-button-active">${i}</a>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/receive/receiveShipList?pageNum=${pageDTO.pageNum}&pageNum1=${i}&check1=${pageDTO.check1}&check2=${pageDTO.check2}&check3=${pageDTO.check3}&check4=${pageDTO.check4}&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}&search5=${pageDTO.search5}&search6=${pageDTO.search6}&search7=${pageDTO.search7}&search8=${pageDTO.search8}" class="page-button">${i}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
	<c:if test="${pageDTO1.endPage < pageDTO1.pageCount}">
        <a href="${pageContext.request.contextPath}/receive/receiveShipList?pageNum=${currentPage}&pageNum1=${pageDTO1.startPage + pageDTO1.pageBlock}&check1=${pageDTO.check1}&check2=${pageDTO.check2}&check3=${pageDTO.check3}&check4=${pageDTO.check4}&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}&search5=${pageDTO.search5}&search6=${pageDTO.search6}&search7=${pageDTO.search7}&search8=${pageDTO.search8}" class="page-button">&gt;</a> 
    </c:if> 
</div>
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

<!-- 엑셀파일 저장을 위한 스크립트 호출 -->
	<script src="https://unpkg.com/file-saver/dist/FileSaver.min.js"></script>
	<script src="https://unpkg.com/xlsx/dist/xlsx.full.min.js"></script>

<!-- 행 추가 관련 -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->

<script type="text/javascript">
//수주일, 납품예정일 검색 데이트피커(나중에 수정하기)
$(function() {
    $("#roDateStart").datepicker({
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

// 다중삭제
function deleteReceive() {
  // 선택된 체크박스 요소들을 가져옵니다.
  var checkboxes = $('input[name="delete-list-receive"]:checked');
  // 선택된 체크박스가 없는 경우, 경고 메시지를 표시하고 함수를 종료합니다.
  if (checkboxes.length === 0) {
    alert("삭제할 항목을 선택해주세요.");
    return;
  }
  // 선택된 체크박스의 ${receiveDTO.roCode} 값을 배열에 저장합니다.
  var roCodes = [];
  checkboxes.each(function() {
    var row = $(this).closest('.table-body');
    var roCode = row.find('td:nth-child(2)').text(); // 두 번째 열에 해당하는 값
    roCodes.push(roCode);
  });
   // 확인용 로그 출력
   console.log("전송 데이터:", JSON.stringify({ roCodes: roCodes }));
   // Ajax 요청을 보냅니다.
   $.ajax({
     type: "POST",
     url: '${pageContext.request.contextPath}/receive/receiveDeleteChecked',
     contentType: "application/json",
     data: JSON.stringify({ roCodes: roCodes }),
     success: function(result) {
       console.log(result);
       alert("성공");
       location.reload();
     },
     error: function(xhr, status, error) {
    	   console.error('Error:', xhr.responseText);
    	   alert('Error: ' + xhr.responseText);
    	}
   });
}

// 납품 ajax처리
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

//체크박스 전체선택하는 코드(수주&납품)
function handleCheckboxGroup(selectAllCheckbox, checkboxes) {
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
}
var selectAllReceive = document.getElementById("delete-list-receiveAll");
var checkReceive = document.querySelectorAll('[data-group="delete-list-receive"]');
handleCheckboxGroup(selectAllReceive, checkReceive); //수주체크

var selectAllShipment = document.getElementById("delete-list-shipmentAll");
var checkShipment = document.querySelectorAll('[data-group="delete-list-shipment"]');
handleCheckboxGroup(selectAllShipment, checkShipment); //납품체크

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

//검색취소버튼 입력칸 초기화 및 placeholder값 재지정
function resetSearch() {
	$("#cusCode").val("");
    $("#cusName").val("");
    $("#productCode").val("");
    $("#productName").val("");
    $("#roDate1").val("");
    $("#roDate2").val("");
    $("#shipSdate1").val("");
    $("#shipSdate2").val("");

    $("#cusCode").attr("placeholder", "업체코드");
    $("#cusName").attr("placeholder", "업체명(클릭)");
    $("#productCode").attr("placeholder", "상품코드");
    $("#productName").attr("placeholder", "상품명(클릭)");
    $("#roDate1").attr("placeholder", "수주일자");
    $("#roDate2").attr("placeholder", "수주일자");
    $("#shipSdate1").attr("placeholder", "납품예정일");
    $("#shipSdate2").attr("placeholder", "납품예정일");
    
    $('#select1').prop('checked', false);
    $('#select2').prop('checked', false);
    $('#select3').prop('checked', false);
    $('#select4').prop('checked', false);
}

//엑셀 버튼 누를 시 실행되는 함수
$("#excelWorkOrder").click(function(){
//		체크박스가 체크된 여부를 확인하기위한 변수선언
	var selectedCheckbox = $("input[name='delete-list-receive']:checked");
	if(selectedCheckbox.length === 0){
		alert("엑셀파일로 다운로드할 행을 선택해주세요")
		return false;
	} 

	// 엑셀에 데이터를 삽입하기위한 배열 변수선언
	var excelData = [];
	
	// 엑셀의 헤더가 되는 값을 삽입하기위한 변수선언
	var headers = [];
	
		// table의 th태그만큼 반복문을 실행하되 첫번째 체크박스행은 제외한다
		$("#datatablesSimple th:not(:first)").each(function(){
			// 헤더에 텍스트값(th) 삽입
			headers.push($(this).text());
		});
		// 엑셀 데이터 변수에 헤더값을 삽입한다
		excelData.push(headers);
	
		// 체크박스가 체크된 행 만큼 엑셀 행삽입 반복문을 시행한다
		selectedCheckbox.each(function () {
		
			// 엑셀의 행값을 담기위한 배열 변수선언
	    	var row = [];
			// tr태그를 찾아서 반복문을 실행하되 첫번째 td태그(체크박스)는 제외한다
	    	$(this).closest("tr").find("td:not(:first-child)").each(function () {
	    		// 행 변수에 테이블 행(td)태그의 텍스트 값을 삽입한다
	        	row.push($(this).text());
	    	});
			// 엑셀 데이터 변수에 행값을 삽입한다
	   		excelData.push(row);
		});
		
		// 워크북을 생성한다
		var workbook = XLSX.utils.book_new();
		// 엑셀 데이터(헤더, 행)값을 시트로 변환한다
		var worksheet = XLSX.utils.aoa_to_sheet(excelData);
		// 데이터와 워크북 시트를 워크북에 추가한다
		XLSX.utils.book_append_sheet(workbook, worksheet, "수주 리스트");
		
		// 워크북을 blob형태로 변환하고 xlsx 파일로 저장한다
		var workbookOutput = XLSX.write(workbook, { bookType: "xlsx", type: "array" });
		saveAs(
			new Blob([workbookOutput], { type: "application/octet-stream" }),
			"수주 리스트.xlsx"
		);
	
});// end function

</script>

</body>
</html>