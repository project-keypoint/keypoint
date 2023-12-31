<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>완제품목록</title>
	<!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<!--     <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet"> -->

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <!-- 수주 CSS 적용-->
    <link href="${pageContext.request.contextPath}/resources/css/product.css" rel="stylesheet">




</head>
<body>
<%@include file="../inc/top-bar.jsp" %>
<%@include file="../inc/side-bar.jsp" %>
<!--  contents start -->
<!-- <div class="contents" style="position:fixed; left: 15rem;"> -->
<div class="main">
<div class="card shadow" > <!-- 그림자아니야 영역 -->
<div class="page-title">완제품목록(재고현황)

<!-- 초기화 이미지 -->
<img src="${pageContext.request.contextPath}/resources/img/icon_reload.png" id="resetFilters" 
        style="height: 1.5rem; width: 1.5rem; cursor: pointer; position: relative; right: 10px; bottom: 3px; margin-left: 10px;" onclick="reset()">
 </div>
<div class="contents2">


					
<div class="search-bar">
<div class="search-b">
<div class="search-select">
<p style="width:65px;">완제품명</p> 
<input type="text" name="search" id="productCode" class="form-control search-input  readonly-color" placeholder="완제품코드" style="width:110px;" readonly>
<input type="text" id="productName" class="form-control search-input  readonly-color" placeholder="완제품명(클릭)" readonly>
</div>
</div>

<div class="search-button">
<input type="button" value="검색" class="btn btn-primary mybutton1" onclick="doSearch()">
<input type="button" value="취소" class="btn btn-secondary mybutton1" onclick="resetSearch()">
</div>
</div><!-- search-bar -->
<br>



<div>
<table class="table-list">
<tr class="table-head">
	<th><input type="checkbox" id="delete-list-all" name="delete-list" data-group="delete-list"></th>
    <th>완제품코드</th>
    <th>완제품명</th>
    <th>거래처코드</th>
    <th>매출단가</th>
    <th>수량</th>
    <th>단위</th>
    <th>비고</th>
    <th>관리</th>
</tr>

<c:forEach var="productDTO" items="${productList}">
<tr class="table-body">
	<td><input type="checkbox" id="delete-list" name="delete-list" data-group="delete-list"></td>
    <td>${productDTO.productCode}</td>
    <td>${productDTO.productName}</td>
    <td>${productDTO.cusCode}</td>
    <td><fmt:formatNumber value="${productDTO.productPrice}" groupingUsed="true"/>원</td>
    <td>${productDTO.productCount}</td>
    <td>${productDTO.productUnit}</td>
    <td>${productDTO.productMemo}</td>
<c:choose>    
    <c:when test = "${employeeDTO.empRole >= 2}">
    <td><input type="button" value="수정" class="btn btn-primary mybutton1" onclick="openUpdate('${productDTO.productCode}')">
    	<input type="button" value="삭제" class="btn btn-secondary mybutton1" onclick="confirmDelete('${productDTO.productCode}')"></td>
    </c:when>
    <c:when test="${employeeDTO.empRole == 1}">
    <td><input type="button" value="수정" class="btn btn-primary mybutton1" onclick="openUpdate('${productDTO.productCode}')"></td>
    </c:when>
    <c:otherwise>
    <td></td>
    </c:otherwise>
</c:choose>    
</tr>
</c:forEach>      

</table>
</div><!-- table -->
<div class="content-bottom">
<div>
<c:choose>    
    <c:when test = "${employeeDTO.empRole >= 2}">
		<input type="button" value="등록" class="btn btn-primary mybutton1" onclick="openInsert()">
		<input type="button" value="엑셀파일다운" id="excelWorkOrder" class="btn btn-secondary mybutton1 dis-btn" style="margin-left: 3px;">
    </c:when>
    <c:when test="${employeeDTO.empRole == 1}">
		<input type="button" value="등록" class="btn btn-primary mybutton1" onclick="openInsert()">
    </c:when>
    <c:otherwise>
    </c:otherwise>
</c:choose>
</div>
<div class="page-buttons">
<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
	<a href="${pageContext.request.contextPath}/product/productList?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&search=${pageDTO.search}">Prev</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
    <c:choose>
        <c:when test="${i eq pageDTO.pageNum}">
            <a href="${pageContext.request.contextPath}/product/productList?pageNum=${i}" class="page-button page-button-active">${i}</a>
        </c:when>
        <c:otherwise>
            <a href="${pageContext.request.contextPath}/product/productList?pageNum=${i}" class="page-button">${i}</a>
        </c:otherwise>
    </c:choose>
</c:forEach>
<!-- 끝페이지번호  전체페이지수 비교 => 전체페이지수 크면 => Next보임 -->
<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath}/product/productList?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&search=${pageDTO.search}">Next</a>
</c:if>
</div><!-- page-button -->
</div>
</div><!-- contents -->
</div><!-- 그림자아니야 영역 -->
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
    // 상품명 검색 팝업 열기
    $("#productCode, #productName").click(function() {
        var url = '${pageContext.request.contextPath}/product/workProdList';
        openPopup(url);
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

// 완제품등록 새창
function openInsert() {
    var url = '${pageContext.request.contextPath}/product/productInsert';
    var windowWidth = 500;
    var windowHeight = 600;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}
// 완제품수정 새창
function openUpdate(productCode) {
    var url = '${pageContext.request.contextPath}/product/productUpdate?productCode='+productCode;
    var windowWidth = 500;
    var windowHeight = 600;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}
// 열 바로 삭제 버튼(ajax로 처리)
function confirmDelete(productCode) {
    if (confirm("정말로 삭제하시겠습니까?")) {
    	var query = {"productCode" : productCode};
    	$.ajax({
        	url : "${pageContext.request.contextPath}/product/productDelete",
    		type : "get",
    		data : query,
    		dataType : "text",
    		success : function(data){
    			location.reload();
    		}
    	});
    } 
}

//초기화 아이콘 누르면 초기화
function reset() {
location.href = "${pageContext.request.contextPath}/product/productList";
}

//검색취소버튼 입력칸 초기화 및 placeholder값 재지정
function resetSearch() {
	$("#productCode").val("");
    $("#productName").val("");

    $("#productCode").attr("placeholder", "완제품코드");
    $("#productName").attr("placeholder", "완제품명(클릭)");
}

//검색하기
function doSearch() {
        var query = {"search" : $("#productCode").val()};
        $.ajax({
            url : "${pageContext.request.contextPath}/product/productList",
            type : "get",
            data : query,
            dataType : "text",
            success : function(data){
                if (query.search == "") {
                    location.href = "${pageContext.request.contextPath}/product/productList";
                } else {
                    location.href = "${pageContext.request.contextPath}/product/productList?search=" + $("#productCode").val();
                }
            }
        });
}


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
		XLSX.utils.book_append_sheet(workbook, worksheet, "완제품 리스트");
		
		// 워크북을 blob형태로 변환하고 xlsx 파일로 저장한다
		var workbookOutput = XLSX.write(workbook, { bookType: "xlsx", type: "array" });
		saveAs(
			new Blob([workbookOutput], { type: "application/octet-stream" }),
			"완제품 리스트.xlsx"
		);
	
});// end function	    

</script>

</body>
</html>