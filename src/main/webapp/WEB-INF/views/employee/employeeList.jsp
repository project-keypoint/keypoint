<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원정보</title>

 <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<!--     <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet"> -->

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <!-- 사원 CSS 적용-->
    <link href="${pageContext.request.contextPath}/resources/css/employee2.css" rel="stylesheet">

</head>

<body>
<%@include file="../inc/top-bar.jsp" %>
<%@include file="../inc/side-bar.jsp" %>


<!--  contents start -->
<div class="main">
  <div class="card shadow"><!-- 그림자아니야 영역 -->
    <div class="page-title">사원목록(사원기본정보)
<!--    초기화 이미지 -->
      <img src="${pageContext.request.contextPath}/resources/img/icon_reload.png" id="resetFilters" 
        style="height: 1.5rem; width: 1.5rem; cursor: pointer; position: relative; right: 10px; bottom: 3px; margin-left: 10px;" onclick="reset()">
    </div>
    <div class="contents2">




<!-- 검색부분 -->
    <div class="search-bar">
     <div class="search-b">
      <div class="search-select">

       <form name="search_form" method="get" action="${pageContext.request.contextPath}/employee/employeeList" 
             id="selectBox" name="selectBox2" onsubmit="return fun1()">
           
           
         <div>              
        <div style="float: left;">
         <select id="search" name="search" class="form-control search-input">
          <option value=""> 선택하세요 </option>
          <option value="empName"> 이름 </option>
          <option value="empId"> 사원번호 </option>
          <option value="empTel"> 내선번호 </option>
          <option value="departmentName"> 부서 </option>
         </select>
        </div>
        
         <div style="float:right;">
 	      <span id="text_search"><input class="form-control search-input" type="text" name="search2"></span>
         </div>                     
         <div style="float: left; magin-top: 3px;">
          <span id="icon_search"></span>
         </div>
	     </div>
	                    
       </form>
  
      </div>
     </div>
   
            
      <div class="search-button">
       <input type="button" value="검색" class="btn btn-primary mybutton1" onclick="fun1()" style="margin-top: -30px;">
       <input type="button" value="취소" class="btn btn-secondary mybutton1" onclick="cancelSearch()" style="margin-top: -30px;">
      </div>

    </div>
<!-- // 검색부분 -->


<br>




<!-- 버튼부분 -->
 <div class="dis-select-buttons" style="display: flex; justify-content: space-between;  align-items: flex-end; margin-bottom: 5px;">
 <div style="display: flex; justify-content: flex-start;">
  
<form action="${pageContext.request.contextPath}/employee/employeeList" method="get">
<input type="hidden" name="search3" value="">
<c:choose>
<c:when test="${pageDTO.search3 eq '' or empty pageDTO.search3}">
<input type="submit" class="btn btn-primary mybutton1" value="전체" style="margin-right: 4px;">
</c:when>
<c:otherwise>
<input type="submit" class="btn btn-secondary mybutton1 dis-btn" value="전체" style="margin-right: 4px;">
</c:otherwise>
</c:choose>
</form>

<form action="${pageContext.request.contextPath}/employee/employeeList" method="get">
<input type="hidden" name="search3" value="재직">
<c:choose>
<c:when test="${'재직' eq pageDTO.search3}">
<input type="submit" class="btn btn-primary mybutton1" value="재직" style="margin-right: 4px;">
</c:when>
<c:otherwise>
<input type="submit" class="btn btn-secondary mybutton1 dis-btn" value="재직" style="margin-right: 4px;">
</c:otherwise>
</c:choose>
</form>

<form action="${pageContext.request.contextPath}/employee/employeeList" method="get">
<input type="hidden" name="search3" value="휴직">
<c:choose>
<c:when test="${'휴직' eq pageDTO.search3}">
<input type="submit" class="btn btn-primary mybutton1" value="휴직" style="margin-right: 4px;">
</c:when>
<c:otherwise>
<input type="submit" class="btn btn-secondary mybutton1 dis-btn" value="휴직" style="margin-right: 4px;">
</c:otherwise>
</c:choose>
</form>

<form action="${pageContext.request.contextPath}/employee/employeeList" method="get">
<input type="hidden" name="search3" value="퇴직">
<c:choose>
<c:when test="${'퇴직' eq pageDTO.search3}">
<input type="submit" class="btn btn-primary mybutton1" value="퇴직" style="margin-right: 4px;">
</c:when>
<c:otherwise>
<input type="submit" class="btn btn-secondary mybutton1 dis-btn" value="퇴직" style="margin-right: 4px;">
</c:otherwise>
</c:choose>
</form>
<!-- 버튼부분 -->

     </div>
      <a style="text-align: right;">총 사원수 : ${employeeCount}명</a>
    </div>

    <div>
     <table class="table-list">
      <tr class="table-head">
	   <th><input type="checkbox" id="delete-list-all" name="delete-list" data-group="delete-list"></th>     
	   <th>사원번호</th> 
       <th>이름</th> 
	   <th>부서</th> 
	   <th>직급</th> 
	   <th>내선번호</th>
	   <th>연락처</th> 
	   <th>이메일</th> 
	   <th>입사일</th>
	   <th>재직여부</th>
	   <th>상세내역</th>
      </tr>

       <c:forEach var="employeeDTO1" items="${employeeList}">
        <tr class="table-body" data-status="${employeeDTO1.empStatus}">
		<td><input type="checkbox" id="delete-list" name="delete-list" data-group="delete-list"></td>
         <td>${employeeDTO1.empId}</td>
         <td>${employeeDTO1.empName}</td>
         <td>${employeeDTO1.departmentName}</td>
         <td>${employeeDTO1.empPosition}</td>
         <td>${employeeDTO1.empTel}</td>
         <td>${employeeDTO1.empPhone}</td>
         <td>${employeeDTO1.empEmail}</td>
         <td>${employeeDTO1.empHiredate}</td>
         <td>${employeeDTO1.empStatus}</td>
<c:choose>     
	<c:when test = "${(employeeDTO.empRole >= 1 && employeeDTO.departmentName eq '인사부') || employeeDTO.empRole == 3}">
	<td><input type="button" value="상세내역" class="btn btn-secondary mybutton2" onclick="openDetails('${employeeDTO1.empId}')"></td>
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
	<c:when test = "${(employeeDTO.empRole >= 1 && employeeDTO.departmentName eq '인사부') || employeeDTO.empRole == 3}">
		<input type="button" value="사원등록" class="btn btn-primary mybutton1" onclick="openInsert()">
		<input type="button" value="엑셀파일다운" class="btn btn-secondary mybutton1 dis-btn" id="excelEmployee">
	</c:when>
 <c:otherwise>
 </c:otherwise>
	</c:choose>
	</div>

<!-- -------------- 페이징처리 -------------- -->
      <div class="page-buttons">

       <c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
        <a href="${pageContext.request.contextPath}/employee/employeeList?pageNum=
	             ${pageDTO.startPage - pageDTO.pageBlock}&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}" class="page-button">&lt;</a>
       </c:if>

       <c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
	    <c:choose>
		 <c:when test="${i eq pageDTO.currentPage}">
		  <a href="#" class="page-button page-button-active">${i}</a>
		 </c:when>
          <c:otherwise>
           <a href="${pageContext.request.contextPath}/employee/employeeList?pageNum=
			        ${i}&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}" class="page-button">${i}</a>
          </c:otherwise>
	    </c:choose>
       </c:forEach>

       <c:if test="${pageDTO.endPage < pageDTO.pageCount}">
        <a href="${pageContext.request.contextPath}/employee/employeeList?pageNum=
	             ${pageDTO.startPage + pageDTO.pageBlock}&search2=${pageDTO.search2}&search3=${pageDTO.search3}" class="page-button">&gt;</a>
       </c:if>

      </div><!-- page-button -->
<!-- -------------- // 페이징처리 -------------- -->
    </div>
    
    
    
</div><!-- contents -->
</div><!-- 그림자아니야 영역 -->
</div><!-- main -->
<!-- contents end -->


<!-- 데이트피커 : 날짜선택요소(달력형식) -->
<!-- 데이트피커 타임피커를 사용하기위한 j쿼리 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.7.0.js"></script>
<!-- 엑셀파일다운 관련 -->
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

// 사원 상세내용 새창
function openDetails(empId) {
 	var url = '${pageContext.request.contextPath}/employee/employeeDetails?empId='+empId;
    var windowWidth = 500;
    var windowHeight = 1250;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}

// 사원등록 새창
function openInsert() {
    var url = '${pageContext.request.contextPath}/employee/employeeInsert';
    var windowWidth = 500;
    var windowHeight = 1250;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}

 // 검색부분 - 취소버튼 누르면 검색어 초기화되게(화면 바뀌지x)
function cancelSearch() {
  // 검색 폼 초기화
  document.search_form.search.value = '';
  document.search_form.search2.value = '';
}

 // 검색부분 - 검색어 조건
function fun1() {
	if(document.search_form.search.value=="") {
		alert("검색 조건을 선택하세요")
		document.search_form.search.focus();
		return false;
	}
	if(document.search_form.search2.value==0) {
		alert("검색어를 입력하세요");
		document.search_form.search2.focus();
		return false;
		}
		document.search_form.submit();
}
 
//체크박스 전체선택
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
 
// 엑셀 버튼 누를 시 실행되는 함수
$("#excelEmployee").click(function(){
//	체크박스가 체크된 여부를 확인하기위한 변수선언
	var selectedCheckbox = $("input[name='delete-list']:checked");
	if(selectedCheckbox.length === 0){
		alert("엑셀파일로 다운로드할 행을 선택해주세요")
		return false;
	} 

//	엑셀에 데이터를 삽입하기위한 배열 변수선언
	var excelData = [];
//	엑셀의 헤더가 되는 값을 삽입하기위한 변수선언
	var headers = [];
			
//	table의 th태그만큼 반복문을 실행하되 첫번째 체크박스행은 제외한다
	$("#datatablesSimple th:not(:first)").each(function(){
//		헤더에 텍스트값(th) 삽입
		headers.push($(this).text());
	});

//	엑셀 데이터 변수에 헤더값을 삽입한다
	excelData.push(headers);
			
//		체크박스가 체크된 행 만큼 엑셀 행삽입 반복문을 시행한다
	selectedCheckbox.each(function () {
				
//			엑셀의 행값을 담기위한 배열 변수선언
		var row = [];
//			tr태그를 찾아서 반복문을 실행하되 첫번째 td태그(체크박스)는 제외한다
		$(this).closest("tr").find("td:not(:first-child)").each(function () {
//				행 변수에 테이블 행(td)태그의 텍스트 값을 삽입한다
			row.push($(this).text());
		});
//		엑셀 데이터 변수에 행값을 삽입한다
	excelData.push(row);
	});
				
//		워크북을 생성한다
	var workbook = XLSX.utils.book_new();
//		엑셀 데이터(헤더, 행)값을 시트로 변환한다
	var worksheet = XLSX.utils.aoa_to_sheet(excelData);
//		데이터와 워크북 시트를 워크북에 추가한다
	XLSX.utils.book_append_sheet(workbook, worksheet, "거래처 리스트");
				
//	워크북을 blob형태로 변환하고 xlsx 파일로 저장한다
	var workbookOutput = XLSX.write(workbook, { bookType: "xlsx", type: "array" });
	saveAs(
		new Blob([workbookOutput], { type: "application/octet-stream" }),
		"사원 리스트.xlsx"
	);
			
});



// 초기화 이미지 누르면 실행
function reset() {
    location.href = "${pageContext.request.contextPath}/employee/employeeList";
}
</script>




</body>
</html>