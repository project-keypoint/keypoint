<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 목록</title>
	<!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<!--     <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet"> -->
    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <!-- 수주 CSS 적용-->
    <link href="${pageContext.request.contextPath}/resources/css/customer.css" rel="stylesheet">
    

</head>
<body>
<%@include file="../inc/top-bar.jsp" %>
<%@include file="../inc/side-bar.jsp" %>
<!--  contents start -->
<!-- <div class="contents" style="position:fixed; left: 15rem;"> -->
<div class="main">
<div class="card shadow" > <!-- 그림자아니야 영역 -->
<div class="page-title">거래처 목록
<img src="${pageContext.request.contextPath}/resources/img/icon_reload.png" id="resetFilters" 
style="height: 1.5rem; width: 1.5rem; cursor: pointer; position: relative; right: 10px; bottom: 3px; margin-left: 10px;">
</div>
<div class="contents2" >
<div class="search-bar">
<div class="search-b">
<div class="search-select">
<p>업체명</p> 
<input type="text" id="cusCode" name="cusCode" class="form-control search-input" placeholder="업체코드" style="width:110px;" readonly>
<input type="text" id="cusName" class="form-control search-input" placeholder="업체명(클릭)" readonly>
</div>
</div>

<!-- <div class="search-b"> -->
<!-- <div class="search-select"> -->
<!-- <p>상품명</p>  -->
<!-- <input type="text" id="productCode" name="productCode" class="form-control search-input" placeholder="상품코드" style="width:110px;" readonly> -->
<!-- <input type="text" id="productName" class="form-control search-input" placeholder="상품명(클릭)" readonly> -->
<!-- </div> -->

<!-- </div> -->


<div class="search-button">
<input type="button" value="검색" class="btn btn-primary mybutton1" onclick="doSearch()">
<input type="button" value="취소" class="btn btn-secondary mybutton1" onclick="cancelSearch()">
</div>
</div><!-- search-bar -->
<br>



<div class="select-status" style="display: flex; justify-content: space-between;">
<div style="display: flex; justify-content: flex-start;">
<form action="${pageContext.request.contextPath}/customer/cusList" method="get">
<input type="hidden" name="search2" value="">
<c:choose>
<c:when test="${pageDTO.search2 eq '' or empty pageDTO.search2}">
<input type="submit" class="btn btn-primary mybutton1" value="전체" style="margin-right: 4px;">
</c:when>
<c:otherwise>
<input type="submit" class="btn btn-secondary mybutton1 dis-btn" value="전체" style="margin-right: 4px;">
</c:otherwise>
</c:choose>
</form>

<form action="${pageContext.request.contextPath}/customer/cusList" method="get">
<input type="hidden" name="search2" value="거래중">
<c:choose>
<c:when test="${'거래중' eq pageDTO.search2}">
<input type="submit" class="btn btn-primary mybutton1" value="거래중" style="margin-right: 4px;">
</c:when>
<c:otherwise>
<input type="submit" class="btn btn-secondary mybutton1 dis-btn" value="거래중" style="margin-right: 4px;">
</c:otherwise>
</c:choose>
</form>

<form action="${pageContext.request.contextPath}/customer/cusList" method="get">
<input type="hidden" name="search2" value="거래정지">
<c:choose>
<c:when test="${'거래정지' eq pageDTO.search2}">
<input type="submit" class="btn btn-primary mybutton1" value="거래정지" style="margin-right: 4px;">
</c:when>
<c:otherwise>
<input type="submit" class="btn btn-secondary mybutton1 dis-btn" value="거래정지" style="margin-right: 4px;">
</c:otherwise>
</c:choose>
</form>
</div>
 <a style="text-align: right;">총 ${cusCount}건</a>
</div>


<!-- -------------------------------------------------------전체-------------------------------------------------------------------------------- -->

<div id="hide1" class="tab-content">
    <table class="table-list">
        <tr class="table-head">
            <th><input type="checkbox" id="delete-list-all" name="delete-list" data-group="delete-list"></th>
            <th onclick="openDetails('${customerDTO.cusCode}')">거래처코드</th>
            <th>구분</th>
            <th>　거래처명　</th>
            <th>　대표자명</th>
            <th>대표전화</th>
            <th>업태</th>
            <th>종목</th>
            <th>담당자명</th>
            <th>　　　담당자이메일　　</th>
            <th>　상태　</th>
            <th>상세</th>
        </tr>
        <c:forEach var="customerDTO" items="${cusList}">
            <tr class="table-body" data-status="${customerDTO.cusStatus}">
                <td><input type="checkbox" id="delete-list" name="delete-list" data-group="delete-list"></td>
                <td>${customerDTO.cusCode}</td>
                <td>${customerDTO.cusCategory}</td>
                <td>${customerDTO.cusName}</td>
                <td>${customerDTO.cusRep}</td>
                <td>${customerDTO.cusTel}</td>
                <td>${customerDTO.cusBusiness}</td>
                <td>${customerDTO.cusType}</td>
                <td>${customerDTO.cusResp}</td>
                <td>${customerDTO.cusEmail}</td>
                <td>${customerDTO.cusStatus}</td>
                <td><input type="button" value="상세내역" class="btn btn-secondary mybutton2" onclick="openDetails('${customerDTO.cusCode}')"></td>
            </tr>
        </c:forEach>    
    </table>
  
    
</div><!-- table -->



<div class="content-bottom">
<div>
<input type="button" value="거래처 등록" class="btn btn-primary mybutton1" onclick="openInsert()">
<input type="button" value="엑셀파일다운" class="btn btn-secondary mybutton1 dis-btn" id="excelWorkOrder">
</div>



<!-- ---------------------페이징---------------- -->
<div class="page-buttons">
<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
    <c:choose>
        <c:when test="${i eq pageDTO.pageNum}">
            <a href="${pageContext.request.contextPath}/customer/cusList?pageNum=${i}&search=${pageDTO.search}&search2=${pageDTO.search2}" class="page-button page-button-active">${i}</a>
        </c:when>
        <c:otherwise>
            <a href="${pageContext.request.contextPath}/customer/cusList?pageNum=${i}&search=${pageDTO.search}&search2=${pageDTO.search2}" class="page-button">${i}</a>
        </c:otherwise>
    </c:choose>
</c:forEach>
</div>
<!-- ---------------------페이징---------------- -->

</div>
</div><!-- contents -->
</div><!-- 그림자아니야 영역 -->
</div><!-- main -->

<!-- contents end -->







<!-- 데이트피커 타임피커를 사용하기위한 j쿼리 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.7.0.js"></script>
<script src="https://unpkg.com/file-saver/dist/FileSaver.min.js"></script>
<script src="https://unpkg.com/xlsx/dist/xlsx.full.min.js"></script>
<script type="text/javascript">

//	팝업 창을 열어주는 함수
	function openPopup(url) {
	    var width = 500;
	    var height = 500;
	    var left = (screen.width - width) / 2;
	    var top = (screen.height - height) / 2;
	    var popupWindow = window.open(url, '_blank', "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
	    popupWindow.focus();
	}
	$(document).ready(function() {
//		업체명 검색 팝업 열기
	    $("#cusCode, #cusName").click(function() {
	        var url = '${pageContext.request.contextPath}/workOrder/workCusList';
	        openPopup(url);
	    });
//		상품명 검색 팝업 열기
	    $("#productCode, #productName").click(function() {
	        var url = '${pageContext.request.contextPath}/workOrder/workProdList';
	        openPopup(url);
	    });
	});



//	검색하기
	function doSearch() {
		if (confirm($("#cusCode").val())) {
		var query = {"search" : $("#cusCode").val(), "search2" : $("#productCode").val()};
		$.ajax({
			url : "${pageContext.request.contextPath}/customer/cusList",
			type : "get",
			data : query,
			dataType : "text",
			success : function(data){
				if (query.search == "" && query.search2 == "") {
					location.href = "${pageContext.request.contextPath}/customer/cusList";
				} else {
					location.href = "${pageContext.request.contextPath}/customer/cusList?search=" + $("#cusCode").val();
				}
			}
		});
		} 
	}






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
//	모든 체크박스가 선택되었는지 확인
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


//	거래처 상세내용 새창
	function openDetails(cusCode) {
	    var url = '${pageContext.request.contextPath}/customer/cusDetails?cusCode='+cusCode;
	    var windowWidth = 650;
	    var windowHeight = 900;
	    var windowLeft = (screen.width - windowWidth) / 2;
	    var windowTop = (screen.height - windowHeight) / 2;
	    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
	}
//	거래처등록 새창
	function openInsert() {
	    var url = '${pageContext.request.contextPath}/customer/cusInsert';
	    var windowWidth = 650;
	    var windowHeight = 900;
	    var windowLeft = (screen.width - windowWidth) / 2;
	    var windowTop = (screen.height - windowHeight) / 2;
	    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
	}

//	초기화 버튼 이미지 클릭 시,
	$("#resetFilters").click(function() {
		location.href = "${pageContext.request.contextPath}/customer/cusList";
	});
  
  
  
//	검색의 [취소] 버튼 누르면 입력 된 값 초기화
	function cancelSearch() {
//		업체명 입력 필드 초기화
		document.getElementById("cusCode").value = "";
		document.getElementById("cusName").value = "";
//		상품명 입력 필드 초기화
		document.getElementById("productCode").value = "";
		document.getElementById("productName").value = "";
	}

  

//엑셀 버튼 누를 시 실행되는 함수
	$("#excelWorkOrder").click(function(){
//		체크박스가 체크된 여부를 확인하기위한 변수선언
		var selectedCheckbox = $("input[name='delete-list']:checked");
		if(selectedCheckbox.length === 0){
			alert("엑셀파일로 다운로드할 행을 선택해주세요")
			return false;
		} 

//		엑셀에 데이터를 삽입하기위한 배열 변수선언
		var excelData = [];
//		엑셀의 헤더가 되는 값을 삽입하기위한 변수선언
		var headers = [];
				
//		table의 th태그만큼 반복문을 실행하되 첫번째 체크박스행은 제외한다
		$("#datatablesSimple th:not(:first)").each(function(){
//			헤더에 텍스트값(th) 삽입
			headers.push($(this).text());
		});

//		엑셀 데이터 변수에 헤더값을 삽입한다
		excelData.push(headers);
				
// 		체크박스가 체크된 행 만큼 엑셀 행삽입 반복문을 시행한다
		selectedCheckbox.each(function () {
					
// 			엑셀의 행값을 담기위한 배열 변수선언
			var row = [];
// 			tr태그를 찾아서 반복문을 실행하되 첫번째 td태그(체크박스)는 제외한다
			$(this).closest("tr").find("td:not(:first-child)").each(function () {
// 				행 변수에 테이블 행(td)태그의 텍스트 값을 삽입한다
				row.push($(this).text());
			});
// 		엑셀 데이터 변수에 행값을 삽입한다
		excelData.push(row);
		});
					
// 		워크북을 생성한다
		var workbook = XLSX.utils.book_new();
// 		엑셀 데이터(헤더, 행)값을 시트로 변환한다
		var worksheet = XLSX.utils.aoa_to_sheet(excelData);
// 		데이터와 워크북 시트를 워크북에 추가한다
		XLSX.utils.book_append_sheet(workbook, worksheet, "거래처 리스트");
					
//		워크북을 blob형태로 변환하고 xlsx 파일로 저장한다
		var workbookOutput = XLSX.write(workbook, { bookType: "xlsx", type: "array" });
		saveAs(
			new Blob([workbookOutput], { type: "application/octet-stream" }),
			"거래처 리스트.xlsx"
		);
				
	});
  
  
 
//	---------------------------------------------------------------------------------------------------------------------











  
  
</script>

</body>
</html>