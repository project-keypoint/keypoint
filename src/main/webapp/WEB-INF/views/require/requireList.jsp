<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소요량목록</title>
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
    <div class="page-title">소요량목록
<!-- 초기화 이미지 -->
<img src="${pageContext.request.contextPath}/resources/img/icon_reload.png" id="resetFilters" 
        style="height: 1.5rem; width: 1.5rem; cursor: pointer; position: relative; right: 10px; bottom: 3px; margin-left: 10px;" onclick="reset()">
 </div>
<div class="contents2">


<input type="button" value="엑셀파일다운" id="excelWorkOrder"> <br><br>
<div class="search-bar">
<div class="search-b">
<div class="search-select">
<p style="width:65px;">완제품명</p> 
<input type="text" name="search" id="productCode" class="form-control search-input" placeholder="완제품코드" style="width:110px;" readonly>
<input type="text" id="productName" class="form-control search-input" placeholder="완제품명(클릭)" readonly>
</div>
</div>

<div class="search-b">
<div class="search-select">
<p style="width:50px;">자재명</p> 
<input type="text" name="search2" id="materialCode" class="form-control search-input" placeholder="자재코드" style="width:110px;" readonly>
<input type="text" id="materialName" class="form-control search-input" placeholder="자재명(클릭)" readonly>
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
	<th><input type="checkbox" id="delete-list-all" name="delete-list" data-group="delete-list">
<!-- 		<input type="hidden" name="requireCode" id="requireCode" class="form-control search-input" value=""> -->
	</th>
    <th>완제품코드</th>
    <th>완제품명</th>
    <th>자재코드</th>
    <th>자재명</th>
    <th>자재소요량</th>
    <th>자재단위</th>
    <th>관리</th>
</tr>

<c:forEach var="requireDTO" items="${requireList}">
<tr class="table-body">
	<td>
		<input type="checkbox" id="delete-list-require" name="delete-list-require" data-group="delete-list">
		<input type="hidden" name="requireCode" id="requireCode" value="${requireDTO.productCode}|${requireDTO.materialCode}">
<%-- 		<input type="hidden" name="rematerialCode" id="rematerialCode" class="form-control search-input" value="${requireDTO.materialCode}"> --%>
	</td>
    <td>${requireDTO.productCode}</td>
    <td>${requireDTO.productName}</td>
    <td>${requireDTO.materialCode}</td>
    <td>${requireDTO.materialName}</td>
    <td>${requireDTO.reqCount}</td>
    <td>${requireDTO.materialUnit}</td>
<c:choose>    
    <c:when test = "${employeeDTO.empRole >= 2}">
    <td><input type="button" value="수정" class="btn btn-primary mybutton1" onclick="openUpdate('${requireDTO.productCode}', '${requireDTO.materialCode}')">
    	<input type="button" value="삭제" class="btn btn-secondary mybutton1" onclick="confirmDelete('${requireDTO.productCode}', '${requireDTO.materialCode}')"></td>
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
		<input type="button" value="삭제" class="btn btn-secondary mybutton1" onclick="deleteRequire()">
    </c:when>
    <c:otherwise>
    </c:otherwise>
</c:choose>
</div>

<div class="page-buttons">
<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
	<a href="${pageContext.request.contextPath}/require/requireList?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&search=${pageDTO.search}&search2=${pageDTO.search2}" class="page-button">&lt;</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
    <c:choose>
        <c:when test="${i eq pageDTO.pageNum}">
            <a href="${pageContext.request.contextPath}/require/requireList?pageNum=${i}&search=${pageDTO.search}&search2=${pageDTO.search2}" class="page-button page-button-active">${i}</a>
        </c:when>
        <c:otherwise>
            <a href="${pageContext.request.contextPath}/require/requireList?pageNum=${i}&search=${pageDTO.search}&search2=${pageDTO.search2}" class="page-button">${i}</a>
        </c:otherwise>
    </c:choose>
</c:forEach>
<!-- 끝페이지번호  전체페이지수 비교 => 전체페이지수 크면 => Next보임 -->
<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath}/require/requireList?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&search=${pageDTO.search}&search2=${pageDTO.search2}" class="page-button">&gt;</a>
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
    var width = 500;
    var height = 500;
    var left = (screen.width - width) / 2;
    var top = (screen.height - height) / 2;
    var popupWindow = window.open(url, '_blank', "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
    popupWindow.focus();
}
$(document).ready(function() {
    // 상품명 검색 팝업 열기
    $("#productCode, #productName").click(function() {
        var url = '${pageContext.request.contextPath}/workOrder/workProdList';
        openPopup(url);
    });
});
$(document).ready(function() {
    // 자재명 검색 팝업 열기
    $("#materialCode, #materialName").click(function() {
        var url = '${pageContext.request.contextPath}/material/purchaseMaterialList2';
        openPopup(url);
    });
});

//다중삭제
function deleteRequire() {
  // 선택된 체크박스 요소들을 가져옵니다.
  var checkboxes = $('input[name="delete-list-require"]:checked');
  // 선택된 체크박스가 없는 경우, 경고 메시지를 표시하고 함수를 종료합니다.
  if (checkboxes.length === 0) {
    alert("삭제할 항목을 선택해주세요.");
    return;
  }
//   var userInput = prompt("소요량 목록을 삭제합니다. 삭제하려면 '삭제'라고 입력하세요.");
  
//   if (userInput !== "삭제") {
//     return;
//   }
  
// 선택된 체크박스의 requireCode 값을 배열에 저장합니다.
var requireCodes = [];

checkboxes.each(function() {
  var row = $(this).closest('.table-body');
  var requireCode = String(row.find('input[name="requireCode"]').val());
  requireCodes.push(requireCode);

});
	
  // requireCodes 배열을 JSON 문자열로 변환합니다.
  var requireCodesJson = JSON.stringify({ requireCodes: requireCodes });
  
  alert(requireCodesJson);
  
  //확인용 로그 출력
  console.log("전송 데이터:", requireCodesJson);
  
   // Ajax 요청을 보냅니다.
   $.ajax({
     type: "POST",
     url: '${pageContext.request.contextPath}/require/requireDeleteChecked',
     contentType: "application/json",
     data: requireCodesJson,
     success: function(result) {
       console.log(result);
       alert("삭제가 완료되었습니다.");
       location.reload();
     },
     error: function(xhr, status, error) {
    	   console.error('Error:', xhr.responseText);
    	   alert('Error: ' + xhr.responseText);
    	}
   });
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

// 소요량등록 새창
function openInsert() {
    var url = '${pageContext.request.contextPath}/require/requireInsert';
    var windowWidth = 500;
    var windowHeight = 600;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}
// 소요량수정 새창
function openUpdate(productCode,materialCode) {
    var url = '${pageContext.request.contextPath}/require/requireUpdate?productCode='+productCode+'&materialCode='+materialCode;
    var windowWidth = 500;
    var windowHeight = 600;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}
// 열 바로 삭제 버튼(ajax로 처리)
function confirmDelete(productCode,materialCode) {
    if (confirm("정말로 삭제하시겠습니까?")) {
    	var query = {"productCode" : productCode, "materialCode" : materialCode};
    	$.ajax({
        	url : "${pageContext.request.contextPath}/require/requireDelete",
    		type : "get",
    		data : query,
    		dataType : "text",
    		success : function(data){
    			alert("삭제가 완료되었습니다.");
    			location.reload();
    		}
    	});
    } 
}

//초기화 아이콘 누르면 초기화
function reset() {
 location.href = "${pageContext.request.contextPath}/require/requireList";
}

//검색취소버튼 입력칸 초기화 및 placeholder값 재지정
function resetSearch() {
	$("#productCode").val("");
    $("#productName").val("");

    $("#productCode").attr("placeholder", "완제품코드");
    $("#productName").attr("placeholder", "완제품명(클릭)");
    
	$("#materialCode").val("");
    $("#materialName").val("");

    $("#materialCode").attr("placeholder", "자재코드");
    $("#materialName").attr("placeholder", "자재명(클릭)");
}

//검색하기
function doSearch() {
        var query = {"search" : $("#productCode").val(), "search2" : $("#materialCode").val()};
        $.ajax({
            url : "${pageContext.request.contextPath}/require/requireList",
            type : "get",
            data : query,
            dataType : "text",
            success : function(data){
                if (query.search == "" && query.search2 == "") {
                    location.href = "${pageContext.request.contextPath}/require/requireList";
                } else {
                    location.href = "${pageContext.request.contextPath}/require/requireList?search=" + $("#productCode").val() + "&search2=" + $("#materialCode").val();
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
		XLSX.utils.book_append_sheet(workbook, worksheet, "소요량 리스트");
		
		// 워크북을 blob형태로 변환하고 xlsx 파일로 저장한다
		var workbookOutput = XLSX.write(workbook, { bookType: "xlsx", type: "array" });
		saveAs(
			new Blob([workbookOutput], { type: "application/octet-stream" }),
			"소요량 리스트.xlsx"
		);
	
});// end function


</script>

</body>
</html>