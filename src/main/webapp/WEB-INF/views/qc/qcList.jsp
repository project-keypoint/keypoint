<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>품질검사</title>
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
<div class="card shadow" > <!-- 그림자아니야 영역 -->
<div class="page-title">품질검사목록
<!-- 초기화 이미지 -->
<img src="${pageContext.request.contextPath}/resources/img/icon_reload.png" id="resetFilters" 
        style="height: 1.5rem; width: 1.5rem; cursor: pointer; position: relative; right: 10px; bottom: 3px; margin-left: 10px;" onclick="cancelSearch()">
 </div>
<div class="contents2">

<form action="${pageContext.request.contextPath}/qc/qcList" method="get">
<input type="button" value="엑셀파일다운" id="excelWorkOrder"> <br><br>
<div class="search-b" style="margin-bottom: -25px;">
<div class="status-check" style="background: #E5E5E5; border: none;">
<div class="search-date3">
<a style="font-weight: bold;">　미등록<input type="checkbox" id="select4" name="check4" class="list-select" value="미등록"
<c:if test="${not empty pageDTO.check4}">checked</c:if>></a>
<a>대기<input type="checkbox" id="select1" name="check1" class="list-select" value="대기"
<c:if test="${not empty pageDTO.check1}">checked</c:if>></a>
<a>진행<input type="checkbox" id="select2" name="check2" class="list-select" value="진행"
<c:if test="${not empty pageDTO.check2}">checked</c:if>></a>
<a>완료<input type="checkbox" id="select3" name="check3" class="list-select" value="완료"
<c:if test="${not empty pageDTO.check3}">checked</c:if>></a>
</div>
</div>
</div>
<div class="search-bar" style="align-items: normal;">
<!-- <div class="search-b"> -->
<!-- <div style="margin-bottom: 0px;"></div> -->
<!-- <div class="status-check"> -->
<!-- <div class="search-date3"> -->
<!-- <a style="font-weight: bold;">미등록<input type="checkbox" id="select4" name="check4" class="list-select" value="미등록" -->
<%-- <c:if test="${not empty pageDTO.check4}">checked</c:if>></a> --%>
<!-- <a>대기<input type="checkbox" id="select1" name="check1" class="list-select" value="대기" -->
<%-- <c:if test="${not empty pageDTO.check1}">checked</c:if>></a> --%>
<!-- </div> -->
<!-- <div class="search-date3"> -->
<!-- <a>　진행<input type="checkbox" id="select2" name="check2" class="list-select" value="진행" -->
<%-- <c:if test="${not empty pageDTO.check2}">checked</c:if>></a> --%>
<!-- <a>완료<input type="checkbox" id="select3" name="check3" class="list-select" value="완료" -->
<%-- <c:if test="${not empty pageDTO.check3}">checked</c:if>></a> --%>
<!-- </div> -->
<!-- </div> -->
<!-- </div> -->

<div class="search-b">
<div style="margin-bottom: 8px;"></div>
<div class="search-select">
<p>상품명</p> 
<input type="text" id="productCode" name="search3" class="form-control search-input readonly-color"
       placeholder="${empty pageDTO.search3 ? '상품코드' : ''}" value="${pageDTO.search3}" readonly>
<input type="text" id="productName" name="search4" class="form-control search-input readonly-color"
       placeholder="${empty pageDTO.search4 ? '상품명(클릭)' : ''}" value="${pageDTO.search4}" readonly>
</div>
</div>

<div class="search-b">
<div style="margin-bottom: 8px;"></div>
<div class="search-date2">
<p>납품예정일</p>
<input type="text" id="shipSdate1" name="search5" class="form-control search-input readonly-color" 
       placeholder="${empty pageDTO.search5 ? '납품예정일' : ''}" value="${pageDTO.search5}" readonly>
~<input type="text" id="shipSdate2" name="search6" class="form-control search-input readonly-color" 
        placeholder="${empty pageDTO.search6 ? '납품예정일' : ''}" value="${pageDTO.search6}" readonly>
</div>
</div>
<div class="search-button">
<div style="margin-bottom: 15px;"></div>
<input type="submit" value="검색" class="btn btn-primary mybutton1">
<input type="button" value="취소" class="btn btn-secondary mybutton1" onclick="resetSearch()">
</div>
<!-- <div style="display: flex; flex-direction: column; width: 145px; margin-top: -14px;"> -->
<!-- <div class="search-button" style="margin-bottom: 5px;"> -->
<!-- <input type="submit" value="검색하기" class="btn btn-primary mybutton1" style="width: 100%;"> -->
<!-- </div> -->
<!-- <div class="search-button" style="display: flex; justify-content: space-between;"> -->
<%-- <input type="button" value="초기화" class="btn btn-secondary mybutton1" onclick="window.location.href = '${pageContext.request.contextPath}/qc/qcList'" style="width: 48.6%;"> --%>
<!-- <input type="button" value="지우기" class="btn btn-secondary mybutton1" onclick="resetSearch()" style="width: 48.6%;"> -->
<!-- </div> -->
<!-- </div> -->
</div><!-- search-bar -->
</form>
<br>
<!-- <div class="select-status"> -->
<!-- <a>대기<input type="checkbox" id="select1" name="select1" class="list-select" checked></a> -->
<!-- <a>진행<input type="checkbox" id="select2" name="select2" class="list-select" checked></a> -->
<!-- <a>완료<input type="checkbox" id="select3" name="select3" class="list-select"></a> -->
<!-- <a>( 체크박스 사용여부 보류중 )</a> -->
<!-- <div> -->
<div>
<table class="table-list">
<tr class="table-head">
	<th>
	<input type="checkbox" id="delete-list-qcAll" name="delete-list-qc" data-group="delete-list-qc">
	<input type="hidden" name="poCode" value="">
	</th>
	<th>품질검사코드</th>
	<th>납품예정일</th>
    <th>상품코드</th>
    <th>상품명</th>
    <th>전체수량</th>
    <th>1차</th>
    <th>2차</th>
    <th>3차</th>
    <th>합격</th>
    <th>불량</th>
    <th>최종불량률</th>
    <th>상태</th>
    <th>품질검사원</th>
    <th>검사완료일</th>
    <th>검사진행</th>
    <th>완료처리</th>
    <th>상태</th>
</tr>

<c:forEach var="qualityDTO" items="${qcList}">
<tr class="table-body">
	<td>
	<input type="checkbox" id="delete-list-qc" name="delete-list-qc" data-group="delete-list-qc">
	<input type="hidden" id="poCode" name="poCode" value="${qualityDTO.poCode}">
	</td>
	<td>
	<c:choose>
        <c:when test="${empty qualityDTO.qcCode}">-</c:when>
        <c:otherwise>${qualityDTO.qcCode}</c:otherwise>
    </c:choose>
    </td>
	<td>${qualityDTO.shipSdate}</td>
    <td>${qualityDTO.productCode}</td>
    <td>${qualityDTO.productName}</td>
    <td>${qualityDTO.poCount}</td>
    <td>
    <c:choose>
        <c:when test="${empty qualityDTO.qcTest1}">-</c:when>
        <c:otherwise>${qualityDTO.qcTest1}</c:otherwise>
    </c:choose>
    </td>
    <td>
    <c:choose>
        <c:when test="${empty qualityDTO.qcTest2}">-</c:when>
        <c:otherwise>${qualityDTO.qcTest2}</c:otherwise>
    </c:choose>
    </td>
    <td>
    <c:choose>
        <c:when test="${empty qualityDTO.qcTest3}">-</c:when>
        <c:otherwise>${qualityDTO.qcTest3}</c:otherwise>
    </c:choose>
    </td>
    <td>${qualityDTO.qcPass}
    </td>
    <td>${qualityDTO.qcDefect}
    </td>
    <td>
    <c:choose>
        <c:when test="${empty qualityDTO.qcDefectRate}">-</c:when>
        <c:otherwise>${qualityDTO.qcDefectRate}</c:otherwise>
    </c:choose>
    </td>
    <td>
	<c:choose>
        <c:when test="${empty qualityDTO.qcStatus}">-</c:when>
        <c:otherwise>${qualityDTO.qcStatus}</c:otherwise>
    </c:choose>
	</td>
    <td>
    <c:choose>
        <c:when test="${empty qualityDTO.qcEmpName}">-</c:when>
        <c:otherwise>${qualityDTO.qcEmpName}</c:otherwise>
    </c:choose>
    </td>
    <td>
    <c:choose>
        <c:when test="${empty qualityDTO.qcEndDate}">-</c:when>
        <c:otherwise><c:out value="${fn:substring(qualityDTO.qcEndDate, 0, 10)}" /></c:otherwise>
    </c:choose>
    </td>
    <td><input type="button" value="진행(상세)" class="btn btn-info mybutton1" onclick="openDetails('${qualityDTO.poCode}')"></td>
	<c:choose>
    <c:when test="${qualityDTO.qcPass + qualityDTO.qcDefect == qualityDTO.poCount && qualityDTO.qcTest1 == '완료' && qualityDTO.qcTest2 == '완료' && qualityDTO.qcTest3 == '완료' && qualityDTO.qcTransfer == '미완료'}">
<td>
  <input type="button" value="창고" class="btn btn-primary mybutton1" onclick="confirmQcTransfer('${qualityDTO.qcCode}', '${qualityDTO.productCode}', '${qualityDTO.qcPass}', '${qualityDTO.qcDefect}', '${qualityDTO.qcEmpId}')">
</td>
    </c:when>
    <c:otherwise>
        <td><input type="button" value="창고" class="btn btn-secondary mybutton1"></td>
    </c:otherwise>
	</c:choose>
	<td>${qualityDTO.qcTransfer}</td>
</tr>
</c:forEach>
</table>
</div><!-- table -->
<div class="content-bottom">
<div>
<input type="button" value="삭제" class="btn btn-secondary mybutton1" onclick="deleteQc()">
</div>

<div id="page_control" class="page-buttons">
    <c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
        <a href="${pageContext.request.contextPath}/qc/qcList?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&check1=${pageDTO.check1}&check2=${pageDTO.check2}&check3=${pageDTO.check3}&check4=${pageDTO.check4}&search3=${pageDTO.search3}&search4=${pageDTO.search4}&search5=${pageDTO.search5}&search6=${pageDTO.search6}" class="page-button">&lt;</a>
    </c:if>
    <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
        <c:choose>
            <c:when test="${i eq pageDTO.pageNum}">
                <a href="${pageContext.request.contextPath}/qc/qcList?pageNum=${i}&check1=${pageDTO.check1}&check2=${pageDTO.check2}&check3=${pageDTO.check3}&search3=${pageDTO.search3}&check4=${pageDTO.check4}&search4=${pageDTO.search4}&search5=${pageDTO.search5}&search6=${pageDTO.search6}" class="page-button page-button-active">${i}</a>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/qc/qcList?pageNum=${i}&check1=${pageDTO.check1}&check2=${pageDTO.check2}&check3=${pageDTO.check3}&search3=${pageDTO.search3}&check4=${pageDTO.check4}&search4=${pageDTO.search4}&search5=${pageDTO.search5}&search6=${pageDTO.search6}" class="page-button">${i}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:if test="${pageDTO.endPage < pageDTO.pageCount}">
        <a href="${pageContext.request.contextPath}/qc/qcList?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&check1=${pageDTO.check1}&check2=${pageDTO.check2}&check3=${pageDTO.check3}&check4=${pageDTO.check4}&search3=${pageDTO.search3}&search4=${pageDTO.search4}&search5=${pageDTO.search5}&search6=${pageDTO.search6}" class="page-button">&gt;</a>
    </c:if>
</div>

</div>
</div><!-- contents -->
</div><!-- 그림자아니야 영역 -->

<!-- 리스트 -->

</div><!-- main -->
<!-- </div> -->
<!-- </div> -->
<!-- contents end -->

<!-- 데이트피커 타임피커를 사용하기위한 j쿼리 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
// 품질검사 후 합격상품 재고이동, 상태 완료처리
function confirmQcTransfer(qcCode, productCode, qcPass, qcDefect, qcEmpId) {
    if (confirm('확인하시겠습니까?')) {
        $.ajax({
            type: "POST",
            url: '${pageContext.request.contextPath}/qc/qcTransfer',
            data: {
                "qcCode": qcCode,
                "productCode": productCode,
                "qcPass": qcPass,
                "qcDefect": qcDefect,
                "qcEmpId": qcEmpId
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
    }
}

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
// 상품 검색 팝업
    $("#productCode, #productName").click(function() {
        var url = '${pageContext.request.contextPath}/workOrder/workProdList';
        openPopup(url);
    });
});

// 납품예정일 검색 (수정예정)
$(function() {
    $("#shipSdate1").datepicker({
    	dateFormat: "yy-mm-dd"
    });
    $("#shipSdate2").datepicker({
    	dateFormat: "yy-mm-dd"
    });
});

// 체크박스(삭제용) 전체선택
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
var selectAllReceive = document.getElementById("delete-list-qcAll");
var checkReceive = document.querySelectorAll('[data-group="delete-list-qc"]');
handleCheckboxGroup(selectAllReceive, checkReceive); //수주체크

//다중삭제(품질검사)
function deleteQc() {
  // 선택된 체크박스 요소들을 가져옵니다.
  var checkboxes = $('input[name="delete-list-qc"]:checked');
  // 선택된 체크박스가 없는 경우, 경고 메시지를 표시하고 함수를 종료합니다.
  if (checkboxes.length === 0) {
    alert("삭제할 항목을 선택해주세요.");
    return;
  }
  
  var userInput = prompt("품질검사 목록을 삭제합니다. 삭제하려면 '삭제'라고 입력하세요.");
  
  if (userInput !== "삭제") {
    return;
  }
  
  // 선택된 체크박스의 poCode 값을 배열에 저장합니다.
  var poCodes = [];
  
  checkboxes.each(function() {
    var row = $(this).closest('.table-body');
    var poCode = row.find('input[name="poCode"]').val(); // input 요소에서 value 값 가져오기
    poCodes.push(poCode);
  });
   // 확인용 로그 출력
   console.log("전송 데이터:", JSON.stringify({ poCodes: poCodes }));
   // Ajax 요청을 보냅니다.
   $.ajax({
     type: "POST",
     url: '${pageContext.request.contextPath}/qc/qcDeleteChecked',
     contentType: "application/json",
     data: JSON.stringify({ poCodes: poCodes }),
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


// 품질상세내용 새창
function openDetails(poCode) {
    var url = '${pageContext.request.contextPath}/qc/qcDetails?poCode='+poCode;
    var windowWidth = 600;
    var windowHeight = 890;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}

// 수주등록 새창
function openInsert() {
    var url = '${pageContext.request.contextPath}/receive/receiveInsert';
    var windowWidth = 500;
    var windowHeight = 600;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}

//검색취소버튼 입력칸 초기화 및 placeholder값 재지정
function resetSearch() {
    $("#productCode").val("");
    $("#productName").val("");
    $("#shipSdate1").val("");
    $("#shipSdate2").val("");

    $("#productCode").attr("placeholder", "상품코드");
    $("#productName").attr("placeholder", "상품명(클릭)");
    $("#shipSdate1").attr("placeholder", "납품예정일");
    $("#shipSdate2").attr("placeholder", "납품예정일");
    
    $('#select1').prop('checked', false);
    $('#select2').prop('checked', false);
    $('#select3').prop('checked', false);
}


//엑셀 버튼 누를 시 실행되는 함수
$("#excelWorkOrder").click(function(){
//		체크박스가 체크된 여부를 확인하기위한 변수선언
	var selectedCheckbox = $("input[name='delete-list-qc']:checked");
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
		XLSX.utils.book_append_sheet(workbook, worksheet, "품질검사 리스트");
		
		// 워크북을 blob형태로 변환하고 xlsx 파일로 저장한다
		var workbookOutput = XLSX.write(workbook, { bookType: "xlsx", type: "array" });
		saveAs(
			new Blob([workbookOutput], { type: "application/octet-stream" }),
			"품질검사 리스트.xlsx"
		);
	
});// end function
</script>

<script>
//초기화 아이콘 누르면 초기화
function cancelSearch() {
 location.href = "${pageContext.request.contextPath}/qc/qcList";
}
</script>




</body>
</html>