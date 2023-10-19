<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>발주목록</title>
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
<div class="page-title">발주현황(발주전체목록)
<img src="${pageContext.request.contextPath}/resources/img/icon_reload.png" id="resetFilters" 
        style="height: 1.5rem; width: 1.5rem; cursor: pointer; position: relative; right: 10px; bottom: 3px; margin-left: 10px;" onclick="cancelSearch()">
</div>

<div class="contents2">


<div class="search-bar">

<div class="search-b">
<div class="search-select">
<p>코드</p> <input type="text" id="materialCode" name="materialCode" class="form-control search-input readonly-color" placeholder="자재코드" readonly>
</div>
</div>

<div class="search-b">
<div class="search-select">
<p>자재명</p> <input type="text" id="materialName" name="materialName" class="form-control search-input readonly-color" placeholder="자재명 " readonly>
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
<form action="${pageContext.request.contextPath}/purchase/purchaseList" method="get">
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
<form action="${pageContext.request.contextPath}/purchase/purchaseList" method="get">
<input type="hidden" name="search2" value="발주대기">
<c:choose>
<c:when test="${'발주대기' eq pageDTO.search2}">
<input type="submit" class="btn btn-primary mybutton1 dis-btn" value="발주대기" style="margin-right: 4px;">
</c:when>
<c:otherwise>
<input type="submit" class="btn btn-secondary mybutton1 dis-btn" value="발주대기" style="margin-right: 4px;">
</c:otherwise>
</c:choose>
</form>
<form action="${pageContext.request.contextPath}/purchase/purchaseList" method="get">
<input type="hidden" name="search2" value="발주완료">
<c:choose>
<c:when test="${'발주완료' eq pageDTO.search2}">
<input type="submit" class="btn btn-primary mybutton1 dis-btn" value="발주완료" style="margin-right: 4px;">
</c:when>
<c:otherwise>
<input type="submit" class="btn btn-secondary mybutton1 dis-btn" value="발주완료" style="margin-right: 4px;">
</c:otherwise>
</c:choose>
</form>
</div>
<a style="text-align: right;">총 발주수 : ${purchaseCount}개</a>
</div>



<div>
<table class="table-list">
<tr class="table-head">
<th><input type="checkbox" id="delete-list-all"
								name="delete-list" data-group="delete-list"></th>
	<th>발주코드</th>
    <th>자재코드</th>
    <th>자재명</th>
    <th>발주수량</th>
    <th>발주일자</th>
    <th>납기일자</th>
    <th>자재단가</th>
    <th>발주금액</th>
    <th>담당자</th>
    <th>거래처</th>
    <th>발주상태</th>
    <th>상세내역</th>
</tr>

<c:forEach var="purchaseDTO" items="${purchaseList}">
<tr class="table-body" data-status="${purchaseDTO.poStatus}">
<!-- 	<td><input type="checkbox" id="delete-list" name="delete-list" data-group="delete-list"></td> -->
<td><input type="checkbox" id="delete-list"
									name="delete-list" data-group="delete-list"></td>
    <td>${purchaseDTO.poCode}</td>
    <td>${purchaseDTO.materialCode}</td>
    <td>${purchaseDTO.materialName}</td>
    <td>${purchaseDTO.poCount}EA</td>
    <td>${purchaseDTO.poDate}</td>
    <td>${purchaseDTO.payDate}</td>
    <td>${purchaseDTO.materialPrice}원</td>
    <td>${purchaseDTO.poPrice}원</td>
    <td>${purchaseDTO.poOwner}</td>
    <td>${purchaseDTO.cusName}</td>
    <td>
    	<c:choose>
                <c:when test="${purchaseDTO.poStatus eq '발주완료'}">
                    <span style="color: skyblue;">${purchaseDTO.poStatus}</span>
                </c:when>
                <c:otherwise>${purchaseDTO.poStatus}</c:otherwise>
            </c:choose>
    </td>
    <td><input type="button" value="상세내역" class="btn btn-info mybutton1" onclick="openDetails('${purchaseDTO.poCode}')"></td>
	<!-- + openDetails(가져갈값넣기) -->
</tr>
</c:forEach>
</table>
</div><!-- table -->

<div class="content-bottom">
<div>
<input type="button" value="임시버튼(발주필요목록)" class="btn btn-primary mybutton1" onclick="openNeedPurchaseList()">
<c:choose>    
    <c:when test = "${employeeDTO.empRole >= 2}">

<input type="button" value="발주등록" class="btn btn-primary mybutton1" onclick="openInsert()">
    
    </c:when>
    <c:otherwise>
    </c:otherwise>
</c:choose>

<input type="button" value="엑셀파일다운" class="btn btn-secondary mybutton1 dis-btn" id="excelPurchaseOrder">
<!-- <input type="button" value="삭제" class="btn btn-secondary mybutton1"> -->

</div>


<div class="page-buttons">
<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
    <c:choose>
        <c:when test="${i eq pageDTO.pageNum}">
            <a href="${pageContext.request.contextPath}/purchase/purchaseList?pageNum=${i}&search=${pageDTO.search}&search2=${pageDTO.search2}" class="page-button page-button-active">${i}</a>
        </c:when>
        <c:otherwise>
            <a href="${pageContext.request.contextPath}/purchase/purchaseList?pageNum=${i}&search=${pageDTO.search}&search2=${pageDTO.search2}" class="page-button">${i}</a>
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
	            var width = 500;
	            var height = 500;
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
	            var width = 500;
	            var height = 500;
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

//발주등록 새창
function openInsert() {
    var url = '${pageContext.request.contextPath}/purchase/purchaseInsert';
    var windowWidth = 500;
    var windowHeight = 600;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}

//발수정주등록 새창
function openDetails(poCode) {
    var url = '${pageContext.request.contextPath}/purchase/purchaseDetails?poCode='+poCode;
    var windowWidth = 500;
    var windowHeight = 600;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}

function openNeedPurchaseList() {
    var url = '${pageContext.request.contextPath}/workOrder/needPurchaseList';
    var windowWidth = 1050;
    var windowHeight = 500;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}
</script>


<script>
//검색하기
function doSearch() {
        var query = {"search" : $("#materialCode").val()};
        $.ajax({
            url : "${pageContext.request.contextPath}/purchase/purchaseList",
            type : "get",
            data : query,
            dataType : "text",
            success : function(data){
                if (query.search == "") {
                    location.href = "${pageContext.request.contextPath}/purchase/purchaseList";
                } else {
                    location.href = "${pageContext.request.contextPath}/purchase/purchaseList?search=" + $("#materialCode").val();
                }
            }
        });
}




</script>


<script>
function cancelSearch() {
    location.href = "${pageContext.request.contextPath}/purchase/purchaseList";
}
</script>


<script>
//천 단위 콤마 추가 함수
function addCommas(input) {
    return input.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

// 발주금액, 자재단가 포맷팅
$(document).ready(function() {
    $('.table-body').each(function() {
        var poPriceCell = $(this).find('td:eq(8)'); // 발주금액 셀
        var materialPriceCell = $(this).find('td:eq(7)'); // 자재단가 셀

        var poPrice = parseFloat(poPriceCell.text().replace('원', '').replace(/,/g, '')); // 천 단위 콤마 제거 후 숫자로 변환
        var materialPrice = parseFloat(materialPriceCell.text().replace('원', '').replace(/,/g, '')); // 천 단위 콤마 제거 후 숫자로 변환

        // 숫자 포맷팅 및 설정
        poPriceCell.text(addCommas(poPrice) + '원');
        materialPriceCell.text(addCommas(materialPrice) + '원');
    });
});


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
    if (status === '발주대기') {
      $("tr.table-body[data-status='발주대기']").show();
      $("tr.table-body[data-status!='발주대기']").hide();
    } else if (status === '발주완료') {
      $("tr.table-body[data-status='발주완료']").show();
      $("tr.table-body[data-status!='발주완료']").hide();
    }
  }
});



</script>



<script>
//엑셀 버튼 누를 시 실행되는 함수
$("#excelPurchaseOrder").click(function(){
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
		XLSX.utils.book_append_sheet(workbook, worksheet, "발주리스트");
		
		// 워크북을 blob형태로 변환하고 xlsx 파일로 저장한다
		var workbookOutput = XLSX.write(workbook, { bookType: "xlsx", type: "array" });
		saveAs(
			new Blob([workbookOutput], { type: "application/octet-stream" }),
			"발주리스트.xlsx"
		);
	
});// end function
</script>








</body>
</html>