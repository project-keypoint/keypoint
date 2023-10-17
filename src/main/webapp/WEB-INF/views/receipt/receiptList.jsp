<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입고목록</title>
	<!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<!--     <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet"> -->

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <!-- 수주 CSS 적용-->
    <link href="${pageContext.request.contextPath}/resources/css/receive.css" rel="stylesheet">
    
    
        
    <style type="text/css">
    
    /* 일반 페이지 버튼 스타일 */
.page-button {
    color: black;
    background-color: white;
    border: 1px solid #ccc;
    padding: 5px 10px;
    text-decoration: none;
}
.page-button-active {
    color: black;
    background-color: #ccc; /* 회색 배경색 사용 */
    border: 1px solid #ccc; /* 원하는 테두리 스타일로 변경 가능 */
    padding: 5px 10px;
    text-decoration: none;
}
    
    
    </style>
    
    
    
</head>

<body>
<%@include file="../inc/top-bar.jsp" %>
<%@include file="../inc/side-bar.jsp" %>

<!--  contents start -->
<!-- <div class="contents" style="position:fixed; left: 15rem;"> -->
<div class="main">
<div class="card shadow" > <!-- 그림자아니야 영역 -->
<div class="page-title">입고현황(입고전체목록)
<img src="${pageContext.request.contextPath}/resources/img/icon_reload.png" id="resetFilters" 
        style="height: 1.5rem; width: 1.5rem; cursor: pointer; position: relative; right: 10px; bottom: 3px; margin-left: 10px;" onclick="cancelSearch()">
</div>

<div class="contents2">


<div class="search-bar">

<div class="search-b">
<div class="search-select">
<p>코드</p> <input type="text" id="materialCode" name="materialCode" class="form-control search-input" placeholder="자재코드" readonly>
</div>
</div>

<div class="search-b">
<div class="search-select">
<p>자재명</p> <input type="text" id="materialName" name="materialName" class="form-control search-input" placeholder="자재명 " readonly>
</div>
</div>

<div class="search-button">
<input type="button" value="검색" class="btn btn-primary mybutton1" onclick="doSearch()">
<input type="button" value="취소" class="btn btn-secondary mybutton1" onclick="resetSearch()">
</div>
</div><!-- search-bar -->
<br>

<div class="dis-select-buttons">
<div style="display: flex;">
<form action="${pageContext.request.contextPath}/receipt/receiptList" method="get">
<input type="hidden" name="search2" value="">
<c:choose>
<c:when test="${pageDTO.search2 eq '' or empty pageDTO.search2}">
<input type="submit" class="btn btn-primary mybutton1 dis-btn" value="전체" style="margin-right: 4px;">
</c:when>
<c:otherwise>
<input type="submit" class="btn btn-secondary mybutton1 dis-btn" value="전체" style="margin-right: 4px;">
</c:otherwise>
</c:choose>
</form>
<form action="${pageContext.request.contextPath}/receipt/receiptList" method="get">
<input type="hidden" name="search2" value="입고대기">
<c:choose>
<c:when test="${'입고대기' eq pageDTO.search2}">
<input type="submit" class="btn btn-primary mybutton1 dis-btn" value="입고대기" style="margin-right: 4px;">
</c:when>
<c:otherwise>
<input type="submit" class="btn btn-secondary mybutton1 dis-btn" value="입고대기" style="margin-right: 4px;">
</c:otherwise>
</c:choose>
</form>
<form action="${pageContext.request.contextPath}/receipt/receiptList" method="get">
<input type="hidden" name="search2" value="입고완료">
<c:choose>
<c:when test="${'입고완료' eq pageDTO.search2}">
<input type="submit" class="btn btn-primary mybutton1 dis-btn" value="입고완료" style="margin-right: 4px;">
</c:when>
<c:otherwise>
<input type="submit" class="btn btn-secondary mybutton1 dis-btn" value="입고완료" style="margin-right: 4px;">
</c:otherwise>
</c:choose>
</form>
</div>
<a style="text-align: right;">총 입고수 : ${receiptCount}개</a>
</div>






<div>
<table class="table-list">
<tr class="table-head">
<th><input type="checkbox" id="delete-list-all"
								name="delete-list" data-group="delete-list"></th>
	<th>입고코드</th>
    <th>발주코드</th>
    <th>자재명</th>
    <th>발주수량</th>
    <th>입고예정수량</th>
    <th>미입고수량</th>
    <th>입고완료수량</th>
    <th>입고예정일</th>
    <th>담당자</th>
    <th>입고상태</th>
    <th>관리</th>
</tr>

<c:forEach var="receiptDTO" items="${receiptList}">
<tr class="table-body" data-status="${receiptDTO.grStatus}">
<td><input type="checkbox" id="delete-list"
									name="delete-list" data-group="delete-list"></td>
    <td>${receiptDTO.grCode}</td>
    <td>${receiptDTO.poCode}</td>
    <td>${receiptDTO.materialName}</td>
    <td>${receiptDTO.poCount}EA</td>
    <td>${receiptDTO.grCount}EA</td>
    <td>${receiptDTO.grEcount == 0 ? '-' : (receiptDTO.grCount - receiptDTO.grEcount)}</td>
    <td>
     <c:choose>
	    <c:when test="${receiptDTO.grEcount == 0}">
	        <span style="color: black;">-</span>
	    </c:when>
	    <c:otherwise>
	        <span style="color: skyblue;">${receiptDTO.grEcount}</span>
	    </c:otherwise>
	</c:choose>
    </td>
    <td>${receiptDTO.grDate}</td>
    <td>${receiptDTO.grOwner}</td>
    <td>
    <c:choose>
                <c:when test="${receiptDTO.grStatus eq '입고완료'}">
                    <span style="color: skyblue;">${receiptDTO.grStatus}</span>
                    <c:if test="${not empty receiptDTO.grEdate}">
                        <br>
                        <span style="color: skyblue;">(${receiptDTO.grEdate})</span>
                    </c:if>
                </c:when>
                <c:otherwise>
                    ${receiptDTO.grStatus}
                    <c:if test="${not empty receiptDTO.grEdate}">
                        <br>
                        (${receiptDTO.grEdate})
                    </c:if>
                </c:otherwise>
            </c:choose>
    </td>
    <c:choose>
    <c:when test="${receiptDTO.grStatus eq '입고대기'}">
        <td>
            <input type="button" value="상세내역" class="btn btn-info mybutton1" onclick="openDetails('${receiptDTO.grCode}')">
            <input type="button" value="입고처리" class="btn btn-secondary mybutton1" onclick="openComplete('${receiptDTO.grCode}')">
        </td>
    </c:when>
    <c:otherwise>
        <td>
            <input type="button" value="상세내역" class="btn btn-info mybutton1" onclick="openDetails('${receiptDTO.grCode}')">
            <input type="button" value="입고완료" class="btn btn-danger mybutton1">
        </td>
    </c:otherwise>
</c:choose>
    
	<!-- + openDetails(가져갈값넣기) -->
</tr>
</c:forEach>
</table>
</div><!-- table -->

<div class="content-bottom">
<div>
<input type="button" value="입고등록" class="btn btn-primary mybutton1" onclick="openInsert()">
 <img src="${pageContext.request.contextPath}/resources/img/excel.png" id="excelReceiptOrder" 
        style="height: 3rem; width: 3rem; cursor: pointer; margin-right: 10px;">
<!-- <input type="button" value="삭제" class="btn btn-secondary mybutton1"> -->
</div>


<div class="page-buttons">
<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
    <c:choose>
        <c:when test="${i eq pageDTO.pageNum}">
            <a href="${pageContext.request.contextPath}/receipt/receiptList?pageNum=${i}&search=${pageDTO.search}&search2=${pageDTO.search2}" class="page-button page-button-active">${i}</a>
        </c:when>
        <c:otherwise>
            <a href="${pageContext.request.contextPath}/receipt/receiptList?pageNum=${i}&search=${pageDTO.search}&search2=${pageDTO.search2}" class="page-button">${i}</a>
        </c:otherwise>
    </c:choose>
</c:forEach>

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

<!-- 자재코드, 자재명 검색 팝업 -->
$(document).ready(function() {
    $("#materialCode").click(function() {
        // 업체코드 입력란의 값을 가져옵니다.
        var poCode = $("input[name='materialCode']").val();
        // 여기에서 검색 기능을 구현하고, 필요한 로직을 수행합니다.
        // 예: 업체코드를 이용하여 검색하고 결과를 표시합니다.
        
        $(document).ready(function() {
	        $("#materialCode").click(function() {
	            // 팝업 창 크기 및 위치 설정
	            var width = 400;
	            var height = 400;
	            var left = (screen.width - width) / 2;
	            var top = (screen.height - height) / 2;
	            // 팝업 창 열기
	            var url = '${pageContext.request.contextPath}/material/purchaseMaterialList2'; // 업체 검색 페이지의 URL.
	            var popupWindow = window.open(url, '_blank', "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
	            // 팝업 창 포커스
	            popupWindow.focus();
	        });
	    });
    });
});

$(document).ready(function() {
    $("#materialName").click(function() {
        // 상품코드 입력란의 값을 가져옵니다.
        var materialName = $("input[name='materialName']").val();
        // 여기에서 검색 기능을 구현하고, 필요한 로직을 수행합니다.
        // 예: 상품코드를 이용하여 검색하고 결과를 표시합니다.
        
        $(document).ready(function() {
	        $("#materialName").click(function() {
	            // 팝업 창 크기 및 위치 설정
	            var width = 400;
	            var height = 400;
	            var left = (screen.width - width) / 2;
	            var top = (screen.height - height) / 2;
	            // 팝업 창 열기
	            var url = '${pageContext.request.contextPath}/material/purchaseMaterialList2'; // 상품 검색 페이지의 URL.
	            var popupWindow = window.open(url, '_blank', "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
	            // 팝업 창 포커스
	            popupWindow.focus();
	        });
	    });
    });
});
<!-- // 자재코드, 자재명 검색 팝업 -->

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

//입고등록 새창
function openInsert() {
    var url = '${pageContext.request.contextPath}/receipt/receiptInsert';
    var windowWidth = 500;
    var windowHeight = 600;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}

//입고수정 새창
function openUpdate() {
    var url = '${pageContext.request.contextPath}/receipt/receiptUpdate';
    var windowWidth = 500;
    var windowHeight = 600;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}

//입고처리 새창
function openComplete(grCode) {
    var url = '${pageContext.request.contextPath}/receipt/receiptComplete?grCode='+grCode;
    var windowWidth = 500;
    var windowHeight = 600;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}

//발수정주등록 새창
function openDetails(grCode) {
	var url = '${pageContext.request.contextPath}/receipt/receiptDetails?grCode='+grCode;
    var windowWidth = 500;
    var windowHeight = 600;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}
</script>


<script type="text/javascript">
    // 이 함수는 'grEcount' 값을 업데이트할 때 호출됩니다.
    function updateGrEcount(grCode, newGrEcount) {
        // 'grEcount' 업데이트 로직을 수행한 후에
        // 특정 'grCode'의 'grEcount' 값을 'newGrEcount'로 업데이트한 경우,
        // 해당 행의 텍스트 색상을 변경합니다.
        
        // 예를 들어, jQuery를 사용하여 해당 업데이트를 수행할 수 있습니다.
        // 아래는 예시 코드입니다:
        
        // 예시: 'grCode'가 'yourGrCode'이고 'newGrEcount'가 5라면
        var yourGrCode = 'yourGrCode';
        var newGrEcount = 5;
        
        if (grCode === yourGrCode) {
            var grEcountElement = document.getElementById('grEcount_' + yourGrCode); // 해당 행의 'grEcount' 엘리먼트
            if (grEcountElement) {
                grEcountElement.style.color = 'skyblue'; // 색상을 하늘색으로 변경
                grEcountElement.textContent = newGrEcount; // 텍스트 업데이트
            }
        }
    }
</script>

<script>
//검색하기
function doSearch() {
        var query = {"search" : $("#materialCode").val()};
        $.ajax({
            url : "${pageContext.request.contextPath}/receipt/receiptList",
            type : "get",
            data : query,
            dataType : "text",
            success : function(data){
                if (query.search == "") {
                    location.href = "${pageContext.request.contextPath}/receipt/receiptList";
                } else {
                    location.href = "${pageContext.request.contextPath}/receipt/receiptList?search=" + $("#materialCode").val();
                }
            }
        });
}




</script>

<script>
function cancelSearch() {
    location.href = "${pageContext.request.contextPath}/receipt/receiptList";
}
</script>


<script>
//검색취소버튼 입력칸 초기화 및 placeholder값 재지정
function resetSearch() {
	$("#materialCode").val("");
    $("#materialName").val("");

    $("#materialCode").attr("placeholder", "자재코드");
    $("#materialName").attr("placeholder", "자재명");
}
</script>

<script>

// 체크박스부분

$(document).ready(function() {
  // 페이지 로딩 시 초기 설정
  $("tr.table-body").show();

  $("input[name='status']").change(function() {
    // 'status' 그룹 내의 모든 체크박스를 선택 해제
    $("input[name='status']").prop("checked", false);

    // 선택한 체크박스만 체크되게 변경
    $(this).prop("checked", true);

    filterTableByStatus($(this).val());
  });

  
  // 체크박스 누르면 해당하는 리스트 나오게
  function filterTableByStatus(status) {
    if (status === '입고대기') {
      $("tr.table-body[data-status='입고대기']").show();
      $("tr.table-body[data-status!='입고대기']").hide();
    } else if (status === '입고완료') {
      $("tr.table-body[data-status='입고완료']").show();
      $("tr.table-body[data-status!='입고완료']").hide();
    } 
  }
});

</script>

<script>
//엑셀 버튼 누를 시 실행되는 함수
$("#excelReceiptOrder").click(function(){
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
		XLSX.utils.book_append_sheet(workbook, worksheet, "입고리스트");
		
		// 워크북을 blob형태로 변환하고 xlsx 파일로 저장한다
		var workbookOutput = XLSX.write(workbook, { bookType: "xlsx", type: "array" });
		saveAs(
			new Blob([workbookOutput], { type: "application/octet-stream" }),
			"입고리스트.xlsx"
		);
	
});// end function
</script>

</body>
</html>