<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라인관리</title>

<!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/line.css"
	rel="stylesheet">
</head>
</head>
<body>
	<%@include file="../inc/top-bar.jsp"%>
	<%@include file="../inc/side-bar.jsp"%>


	<!--  contents start -->
	<div class="main">
<div class="card shadow" > <!-- 그림자아니야 영역 -->
<div class="page-title">라인현황
<img src="${pageContext.request.contextPath}/resources/img/icon_reload.png" 
     style="height: 1.5rem; width: 1.5rem; cursor: pointer; position: relative; right: 10px; bottom: 3px; margin-left: 10px;"
     onclick="window.location.href='${pageContext.request.contextPath}/line/lineList';">

</div>
<div class="contents2">
<div class="search-bar">
<div class="search-b">
<div class="search-select">
<p>라인</p> 
<input type="text" name="search" id="lineCode" class="form-control search-input" placeholder="라인코드" style="width:150px;" readonly>

</div>
<div class="search-select">
<p>담당자</p> 
<input type="text" id="empId" class="form-control search-input" placeholder="담당자코드" style="width:110px;" readonly>
<input type="text" name="search2" id="empName" class="form-control search-input" placeholder="담당자이름" readonly>
</div>
</div>

<div class="search-button">
<input type="button" value="검색" class="btn btn-primary mybutton1" onclick="doSearch()">
<input type="button" value="취소" class="btn btn-secondary mybutton1" onclick="resetSearch()">
</div>
</div><!-- search-bar -->
<br>
<!-- <div class="select-status"> -->
<!-- <a>대기<input type="checkbox" id="select1" name="select1" class="list-select" checked></a> -->
<!-- <a>진행<input type="checkbox" id="select2" name="select2" class="list-select" checked></a> -->
<!-- <a>완료<input type="checkbox" id="select3" name="select3" class="list-select" checked></a> -->
<!-- <a>취소<input type="checkbox" id="select4" name="select4" class="list-select"></a> -->
<!-- <a>( 체크박스 사용여부 보류중 )</a> -->
<!-- <div> -->
<!-- </div> -->
<!-- </div> -->

<div>
<table class="table-list">
<tr class="table-head">
	<th><input type="checkbox" id="delete-list-all" name="delete-list" data-group="delete-list"></th>
	<th>라인코드</th>
    <th>라인명</th>
<!--     <th>작업코드</th> -->
    <th>작업명</th>
    <th>담당자</th>
    <th>상세내역</th>
</tr>
<c:forEach var="LineDTO" items="${lineList}">
<tr class="table-body">
	<td><input type="checkbox" id="delete-list" name="delete-list" data-group="delete-list"></td>
    <td>${LineDTO.lineCode}</td>
    <td>${LineDTO.lineName}</td>
<%--     <td>${LineDTO.woCode}</td> --%>
    <td>${LineDTO.lineMemo}</td>
    <td>${LineDTO.empName}</td>
    
   
<%--     <td><c:out value="${fn:substring(receiveDTO.roDate, 0, 10)}" /></td> --%>
<%--     <td>${receiveDTO.shipSdate}</td> --%>
<%--     <td><c:choose> --%>
<%--             <c:when test="${not empty receiveDTO.shipDate}"> --%>
<%--                 ${receiveDTO.shipDate} --%>
<%--             </c:when> --%>
<%--             <c:otherwise> --%>
<!--                 - -->
<%--             </c:otherwise> --%>
<%--         </c:choose></td><!-- 납품일 null 대신 '-' --> --%>
<%--     <td>${receiveDTO.roStatus}</td> --%>
    <td><input type="button" value="상세내역" class="btn btn-secondary mybutton1" onclick="openDetails('${LineDTO.lineCode}')"></td>
</tr> 
</c:forEach>    
</table>
</div><!-- table -->
<div class="content-bottom">
<div>
<input type="button" value="라인등록" class="btn btn-primary mybutton1" onclick="openInsert()">
<input type="button" value="삭제" class="btn btn-secondary mybutton1" onclick="lineDelete()">
</div>


<div class="page-buttons">
<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
	<a href="${pageContext.request.contextPath}/line/lineList?pageNum=${pageDTO1.startPage - pageDTO1.pageBlock}&search=${pageDTO.search}" class="page-button">&lt;</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
	<c:choose>
		<c:when test="${i eq pageDTO.currentPage}">
			<a href="#" class="page-button page-button-active">${i}</a>
		</c:when>
		<c:otherwise>
			<a href="${pageContext.request.contextPath}/line/lineList?pageNum=${i}&search=${pageDTO.search}" class="page-button">${i}</a>
		</c:otherwise>
	</c:choose>
</c:forEach>

<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath}/line/lineList?pageNum=${pageDTO.startPage + pageDTO.pageBlock}" class="page-button">&gt;</a>
</c:if>
</div><!-- page-button -->

</div>
</div><!-- contents -->
</div><!-- 그림자아니야 영역 -->
</div><!-- main -->

		<!-- contents end -->

<script type="text/javascript">


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
    $("#lineCode, #lineName").click(function() {
        var url = '${pageContext.request.contextPath}/workOrder/workLineList';
        openPopup(url);
    });
    // 담당자 검색 팝업 열기
    $("#empId, #empName").click(function() {
        var url = '${pageContext.request.contextPath}/workOrder/workEmpList';
        openPopup(url);
    });
});

//라인등록 새창
function openInsert() {
    var url = '${pageContext.request.contextPath}/line/lineInsert';
    var windowWidth = 500;
    var windowHeight = 500;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}

//라인상세내용 새창
function openDetails(lineCode) {
    var url = '${pageContext.request.contextPath}/line/lineDetails?lineCode='+lineCode;
    var windowWidth = 500;
    var windowHeight = 500;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}

//체크박스(삭제용) 전체선택
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
//검색하기
function doSearch() {
        var query = {"search" : $("#lineCode").val(), "search2" : $("#empName").val()};
        $.ajax({
            url : "${pageContext.request.contextPath}/line/lineList",
            type : "get",
            data : query,
            dataType : "text",
            success : function(data){
                if (query.search == "" && query.search2 == "") {
                    location.href = "${pageContext.request.contextPath}/line/lineList";
                } else {
                    location.href = "${pageContext.request.contextPath}/line/lineList?search=" + $("#lineCode").val() + "&search2=" + $("#empName").val();
                }
            }
        });
    
}
function resetSearch() {
    // lineCode 입력 필드의 값을 빈 문자열로 설정하여 초기화합니다.
    $("#lineCode").val("");
    // empId 입력 필드의 값을 빈 문자열로 설정하여 초기화합니다.
    $("#empId").val("");
 	// empName 입력 필드의 값을 빈 문자열로 설정하여 초기화합니다.
    $("#empName").val("");
}



$(document).ready(function() {
//초기화 버튼 클릭 시
$("#resetFilters").click(function() {
  // 모든 체크박스 해제
  $("input[name='status']").prop("checked", false);
  $("tr.table-body").show();

  // 검색 필드 초기화
  $("#search").val("");
  $("#search2").val("");
  
  // 페이지 다시 로드
  location.reload();
  
});
})

function lineDelete() {
    var selectedLineCodes = [];
    $("input[name='delete-list']:checked").each(function() {
        selectedLineCodes.push($(this).closest("tr").find("td:eq(1)").text());
    });

    // 선택된 라인이 없다면 알림을 표시하고 함수 종료
    if (selectedLineCodes.length === 0) {
        alert("선택된 라인이 없습니다.");
        return;
    }

    // AJAX를 사용하여 서버로 선택된 라인 코드들을 전송하고, 요청이 성공하면 즉시 페이지를 새로고침합니다.
    $.ajax({
        url: "${pageContext.request.contextPath}/line/deleteLines",
        type: "POST",
        data: JSON.stringify(selectedLineCodes),
        contentType: "application/json",
        dataType: "json"
    });
	alert("라인이 삭제되었습니다");
    // 요청 후 즉시 페이지를 새로고침
    location.reload();
}






</script>

</body>

</html>