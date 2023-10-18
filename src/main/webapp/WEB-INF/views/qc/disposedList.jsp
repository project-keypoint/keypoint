<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>폐기</title>
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
<div class="page-title">폐기목록
<!-- 초기화 이미지 -->
<img src="${pageContext.request.contextPath}/resources/img/icon_reload.png" id="resetFilters" 
        style="height: 1.5rem; width: 1.5rem; cursor: pointer; position: relative; right: 10px; bottom: 3px; margin-left: 10px;" onclick="reset()">
 </div>
<div class="contents2">

<form action="${pageContext.request.contextPath}/qc/disposedList" method="get">
<div class="search-bar">
<!-- <div class="search-b"> -->
<!-- <!-- <div style="margin-bottom: -15px;"></div> -->
<!-- <div class="status-check"> -->
<!-- <div class="search-date3"> -->
<!-- <a>품질<input type="checkbox" id="select2" name="check2" class="list-select" value="진행" -->
<%-- <c:if test="${not empty pageDTO.check2}">checked</c:if>></a> --%>
<!-- </div> -->
<!-- <div class="search-date3"> -->
<!-- <a>상품<input type="checkbox" id="select3" name="check3" class="list-select" value="완료" -->
<%-- <c:if test="${not empty pageDTO.check3}">checked</c:if>></a> --%>
<!-- </div> -->
<!-- <div class="search-date3"> -->
<!-- <a>자재<input type="checkbox" id="select4" name="check4" class="list-select" value="취소" -->
<%-- <c:if test="${not empty pageDTO.check4}">checked</c:if>></a> --%>
<!-- </div> -->
<!-- </div> -->
<!-- </div> -->

<div class="search-b">
<div class="search-select">
<p>상품명</p> 
<input type="text" id="productCode" name="search3" class="form-control search-input readonly-color"
       placeholder="${empty pageDTO.search3 ? '상품코드' : ''}" value="${pageDTO.search3}" readonly>
<input type="text" id="productName" name="search4" class="form-control search-input readonly-color"
       placeholder="${empty pageDTO.search4 ? '상품명(클릭)' : ''}" value="${pageDTO.search4}" readonly>
</div>
<div class="search-select">
<p>자재명</p> 
<input type="text" id="materialCode" name="search7" class="form-control search-input readonly-color"
       placeholder="${empty pageDTO.search7 ? '자재코드' : ''}" value="${pageDTO.search7}" readonly>
<input type="text" id="materialName" name="search8" class="form-control search-input readonly-color"
       placeholder="${empty pageDTO.search8 ? '자재명(클릭)' : ''}" value="${pageDTO.search8}" readonly>
       
</div>
</div>

<div class="search-b">
<div class="search-date2">
<p>폐기일</p>
<input type="text" id="disDate1" name="search5" class="form-control search-input readonly-color" 
       placeholder="${empty pageDTO.search5 ? '폐기일' : ''}" value="${pageDTO.search5}" readonly>
~<input type="text" id="disDate2" name="search6" class="form-control search-input readonly-color" 
        placeholder="${empty pageDTO.search6 ? '폐기일' : ''}" value="${pageDTO.search6}" readonly>
</div>
</div>
<div class="search-button" style="margin-bottom: 7px;">
<input type="submit" value="검색" class="btn btn-primary mybutton1">
<input type="button" value="취소" class="btn btn-secondary mybutton1" onclick="resetSearch()">
</div>

<!-- <div style="display: flex; flex-direction: column; width: 145px;"> -->
<!-- <div class="search-button" style="margin-bottom: 5px;"> -->
<!-- <input type="submit" value="검색" class="btn btn-primary mybutton1" style="width: 100%;"> -->
<!-- </div> -->
<!-- <div class="search-button" style="display: flex; justify-content: space-between;"> -->
<!-- <input type="submit" value="검색" class="btn btn-secondary mybutton1" > -->
<!-- <input type="button" value="취소" class="btn btn-secondary mybutton1" onclick="resetSearch()"> -->
<!-- </div> -->
<!-- </div> -->

</div><!-- search-bar -->
<input type="hidden" name="search" value="${pageDTO.search}">
</form>
<br>
<div class="dis-select-buttons">
<div style="display: flex;">
<form action="${pageContext.request.contextPath}/qc/disposedList" method="get">
<input type="hidden" name="search" value="">
<c:choose>
<c:when test="${pageDTO.search eq '' or empty pageDTO.search}">
<input type="submit" class="btn btn-primary mybutton1 dis-btn" value="전체" style="margin-right: 4px;">
</c:when>
<c:otherwise>
<input type="submit" class="btn btn-secondary mybutton1 dis-btn" value="전체" style="margin-right: 4px;">
</c:otherwise>
</c:choose>
</form>
<form action="${pageContext.request.contextPath}/qc/disposedList" method="get">
<input type="hidden" name="search" value="DISQ">
<c:choose>
<c:when test="${'DISQ' eq pageDTO.search}">
<input type="submit" class="btn btn-primary mybutton1 dis-btn" value="품질" style="margin-right: 4px;">
</c:when>
<c:otherwise>
<input type="submit" class="btn btn-secondary mybutton1 dis-btn" value="품질" style="margin-right: 4px;">
</c:otherwise>
</c:choose>
</form>
<form action="${pageContext.request.contextPath}/qc/disposedList" method="get">
<input type="hidden" name="search" value="DISP">
<c:choose>
<c:when test="${'DISP' eq pageDTO.search}">
<input type="submit" class="btn btn-primary mybutton1 dis-btn" value="상품" style="margin-right: 4px;">
</c:when>
<c:otherwise>
<input type="submit" class="btn btn-secondary mybutton1 dis-btn" value="상품" style="margin-right: 4px;">
</c:otherwise>
</c:choose>
</form>
<form action="${pageContext.request.contextPath}/qc/disposedList" method="get">
<input type="hidden" name="search" value="DISM">
<c:choose>
<c:when test="${'DISM' eq pageDTO.search}">
<input type="submit" class="btn btn-primary mybutton1 dis-btn" value="자재">
</c:when>
<c:otherwise>
<input type="submit" class="btn btn-secondary mybutton1 dis-btn" value="자재">
</c:otherwise>
</c:choose>
</form>
</div>
<div>
<input type="button" class="btn btn-info mybutton1" value="상품" onclick="toggleTable('hide1', 'hide2')" >
<input type="button" class="btn btn-info mybutton1" value="자재" onclick="toggleTable('hide2', 'hide1')">
</div>
</div>
<div style="display: flex; justify-content: space-between;">
<div style="width: 74%;">
<table class="table-list">
<tr class="table-head">
<th><input type="checkbox" id="delete-list-all"
	name="delete-list" data-group="delete-list"></th>
	<th>폐기코드</th>
	<th>상품코드</th>
    <th>　　　상품명　　　</th>
    <th>폐기수량</th>
    <th>담당자</th>
    <th>이름</th>
    <th>폐기일자</th>
    <th>　　　폐기내용　　　</th>
</tr>
<c:forEach var="qualityDTO" items="${disposedList}">
<tr class="table-body">
<td><input type="checkbox" id="delete-list"
	name="delete-list" data-group="delete-list"></td>
	<td>${qualityDTO.disCode}</td>
	<td>${qualityDTO.disItemCode}</td>
	<td>
	<c:choose>
    <c:when test="${empty qualityDTO.productName}">
        ${qualityDTO.materialName}
    </c:when>
    <c:when test="${empty qualityDTO.materialName}">
        ${qualityDTO.productName}
    </c:when>
    </c:choose>
	</td>
	<td>${qualityDTO.disCount}</td>
	<td>${qualityDTO.disEmpId}</td>
	<td>${qualityDTO.disEmpName}</td>
	<td><c:out value="${fn:substring(qualityDTO.disDate, 0, 16)}" /></td>
	<td>${qualityDTO.disMemo}</td>
</tr>
</c:forEach>  
</table><!-- table1 -->
<div class="content-bottom">
<div>
<input type="button" value="추가(상품)" class="btn btn-primary mybutton1" onclick="openDisPInsert()">
<input type="button" value="추가(자재)" class="btn btn-primary mybutton1" onclick="openDisMInsert()">
<input type="button" value="엑셀파일다운" class="btn btn-secondary mybutton1 dis-btn" id="excelWorkOrder" style="margin-left: 3px;">
</div>
<div id="page_control" class="page-buttons">
    <c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
        <a href="${pageContext.request.contextPath}/qc/disposedList?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&check1=${pageDTO.check1}&check2=${pageDTO.check2}&check3=${pageDTO.check3}&check4=${pageDTO.check4}&search=${pageDTO.search}&search3=${pageDTO.search3}&search4=${pageDTO.search4}&search5=${pageDTO.search5}&search6=${pageDTO.search6}&search7=${pageDTO.search7}&search8=${pageDTO.search8}" class="page-button">&lt;</a>
    </c:if>
    <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
        <c:choose>
            <c:when test="${i eq pageDTO.pageNum}">
                <a href="${pageContext.request.contextPath}/qc/disposedList?pageNum=${i}&check1=${pageDTO.check1}&check2=${pageDTO.check2}&check3=${pageDTO.check3}&check4=${pageDTO.check4}&search=${pageDTO.search}&search3=${pageDTO.search3}&search4=${pageDTO.search4}&search5=${pageDTO.search5}&search6=${pageDTO.search6}&search7=${pageDTO.search7}&search8=${pageDTO.search8}" class="page-button page-button-active">${i}</a>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/qc/disposedList?pageNum=${i}&check1=${pageDTO.check1}&check2=${pageDTO.check2}&check3=${pageDTO.check3}&check4=${pageDTO.check4}&search=${pageDTO.search}&search3=${pageDTO.search3}&search4=${pageDTO.search4}&search5=${pageDTO.search5}&search6=${pageDTO.search6}&search7=${pageDTO.search7}&search8=${pageDTO.search8}" class="page-button">${i}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:if test="${pageDTO.endPage < pageDTO.pageCount}">
        <a href="${pageContext.request.contextPath}/qc/disposedList?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&check1=${pageDTO.check1}&check2=${pageDTO.check2}&check3=${pageDTO.check3}&check4=${pageDTO.check4}&search=${pageDTO.search}&search3=${pageDTO.search3}&search4=${pageDTO.search4}&search5=${pageDTO.search5}&search6=${pageDTO.search6}&search7=${pageDTO.search7}&search8=${pageDTO.search8}" class="page-button">&gt;</a>
    </c:if>
</div>
</div>
</div>
<div class="yoko" style="width: 24%;">
<div id="hide1" style="width: 100%;">
<table id="content1" class="table-list">
<tr class="table-head">
	<th>상품코드</th>
	<th>　상품명　</th>
    <th>총폐기수량</th>
</tr>
<c:forEach var="qualityDTO" items="${disposedSum}">
<tr class="table-body">
	<td>${qualityDTO.productCode}</td>
	<td>${qualityDTO.productName}</td>
	<td>${qualityDTO.disSum}</td>
</tr>
</c:forEach>
</table><!-- 상품 disSum -->
</div>
<div id="hide2" style="display: none; width: 100%;">
<table id="content2" class="table-list">
<tr class="table-head">
	<th>자재코드</th>
	<th>　자재명　</th>
    <th>총폐기수량</th>
</tr>
<c:forEach var="qualityDTO" items="${disposedSumMat}">
<tr class="table-body">
	<td>${qualityDTO.materialCode}</td>
	<td>${qualityDTO.materialName}</td>
	<td>${qualityDTO.disSum}</td>
</tr>
</c:forEach>
</table><!-- 자재 disSum -->
</div>
</div>


</div>
</div><!-- contents -->
</div><!-- 그림자아니야 영역 -->

<!-- 리스트 -->

</div><!-- main -->
<!-- contents end -->

<!-- 데이트피커 타임피커를 사용하기위한 j쿼리 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 엑셀파일 저장을 위한 스크립트 호출 -->
	<script src="https://unpkg.com/file-saver/dist/FileSaver.min.js"></script>
	<script src="https://unpkg.com/xlsx/dist/xlsx.full.min.js"></script>

<script type="text/javascript">
//팝업 창을 열어주는 함수
function openPopup(url) {
    var width = 590;
    var height = 470;
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
// 자재명 검색 팝업 열기
    $("#materialCode, #materialName").click(function() {
        var url = '${pageContext.request.contextPath}/qc/materialList';
        openPopup(url);
    });
});
//폐기등록 새창(상품)
function openDisPInsert() {
    var url = '${pageContext.request.contextPath}/qc/disInsertP';
    var windowWidth = 500;
    var windowHeight = 425;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}
//폐기등록 새창(자재)
function openDisMInsert() {
    var url = '${pageContext.request.contextPath}/qc/disInsertM';
    var windowWidth = 500;
    var windowHeight = 425;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}
// disSum 스위치
function toggleTable(showId, hideId) {
	  var showTable = document.getElementById(showId);
	  var hideTable = document.getElementById(hideId);

	  showTable.style.display = "block";
	  hideTable.style.display = "none";
	}

//납품예정일 검색 (수정예정)
$(function() {
    $("#disDate1").datepicker({
    	dateFormat: "yy-mm-dd"
    });
    $("#disDate2").datepicker({
    	dateFormat: "yy-mm-dd"
    });
});

//검색취소버튼 입력칸 초기화 및 placeholder값 재지정
function resetSearch() {
    $("#productCode").val("");
    $("#productName").val("");
    $("#materialCode").val("");
    $("#materialName").val("");
    $("#disDate1").val("");
    $("#disDate2").val("");

    $("#productCode").attr("placeholder", "상품코드");
    $("#productName").attr("placeholder", "상품명(클릭)");
    $("#materialCode").attr("placeholder", "자재코드");
    $("#materialName").attr("placeholder", "자재명(클릭)");
    $("#disDate1").attr("placeholder", "폐기일");
    $("#disDate2").attr("placeholder", "폐기일");
    
    $('#select1').prop('checked', false);
    $('#select2').prop('checked', false);
    $('#select3').prop('checked', false);
    $('#select4').prop('checked', false);
}

$(document).ready(function() {
    // 전체선택 체크박스 클릭 시
    $("#delete-list-all").on("click", function() {
        $("input:checkbox[name=delete-list]").prop("checked", this.checked);
    });

    // 개별 체크박스 클릭 시
    $(document).on("click", "input:checkbox[name=delete-list]", function(e) {
        var chks = document.getElementsByName("delete-list");
        var chksChecked = 0;

        for (var i = 0; i < chks.length; i++) {
            var cbox = chks[i];

            if (cbox.checked) {
                chksChecked++;
            }
        }
        if (chks.length == chksChecked) {
            $("#delete-list-all").prop("checked", true);
        } else {
            $("#delete-list-all").prop("checked", false);
        }
    });

    // 전체선택 체크박스 상태 변경 시
    $(document).on("change", "#delete-list-all", function() {
        // 상황에 맞게 처리
    });
});



//엑셀 버튼 누를 시 실행되는 함수
$("#excelWorkOrder").click(function(){
//		체크박스가 체크된 여부를 확인하기위한 변수선언
	var selectedCheckbox = $("input[name='delete-list']:checked");
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
		XLSX.utils.book_append_sheet(workbook, worksheet, "작업지시 리스트");
		
		// 워크북을 blob형태로 변환하고 xlsx 파일로 저장한다
		var workbookOutput = XLSX.write(workbook, { bookType: "xlsx", type: "array" });
		saveAs(
			new Blob([workbookOutput], { type: "application/octet-stream" }),
			"작업지시 리스트.xlsx"
		);
	
});// end function


</script>


<script>
// 초기화 아이콘 누르면 초기화
function reset() {
    location.href = "${pageContext.request.contextPath}/qc/disposedList";
}


// 상품, 자재 버튼 색상 변화할 수 있게..
function changeButtonColor(button, buttonClass) {
    var buttons = document.querySelectorAll('.' + buttonClass);
    
    // 모든 버튼의 클래스 초기화
    buttons.forEach(function(btn) {
        btn.classList.remove('active');
    });
    
    // 클릭한 버튼에 클래스 추가
    button.classList.add('active');
}

</script>

</body>
</html>