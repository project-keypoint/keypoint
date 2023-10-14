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
    <link href="${pageContext.request.contextPath}/resources/css/employee.css" rel="stylesheet">

</head>

<body>
<%@include file="../inc/top-bar.jsp" %>
<%@include file="../inc/side-bar.jsp" %>


<!--  contents start -->
<div class="main">
 <div class="card shadow" > <!-- 그림자아니야 영역 -->
  <div class="page-title">사원목록(사원기본정보)</div>
   <div class="contents2">

<!-- 검색부분 -->
    <div class="search-bar">
     <div class="search-b">
      <div class="search-select">

       <form name="search_form" method="get" action="${pageContext.request.contextPath}/employee/employeeList" 
             id="selectBox" name="selectBox2" onsubmit="return fun1()">
                       
        <div style="float: left;">
         <select id="search" name="search" class="form-control search-input">
          <option value=""> 선택하세요 </option>
          <option value="empName"> 이름 </option>
          <option value="empId"> 사원번호 </option>
          <option value="empTel"> 내선번호 </option>
          <option value="departmentName"> 부서 </option>
         </select>
        </div>
        
         <div style="float: left;">
 	      <span id="text_search"><input class="form-control search-input" type="text" name="search2"></span>
         </div>                     
         <div style="float: left; magin-top: 3px;">
          <span id="icon_search"></span>
         </div>
	                    
       </form>
  
      </div>
     </div>
   
            
      <div class="search-button">
       <input type="button" value="검색" class="btn btn-primary mybutton1" onclick="fun1()">
       <input type="button" value="취소" class="btn btn-secondary mybutton1" onclick="cancelSearch()">
      </div>

    </div>
<!-- // 검색부분 -->


<br>

<!-- 체크박스 부분 -->
    <div class="select-status" style="display: flex; justify-content: space-between;">
     <div style="display: flex; justify-content: flex-start;">
      <a>재직<input type="checkbox" id="select1" name="status" class="list-select" value="재직"></a>
      <a>휴직<input type="checkbox" id="select2" name="status" class="list-select" value="휴직"></a>
      <a>퇴직<input type="checkbox" id="select3" name="status" class="list-select" value="퇴직"></a>
	   <!-- 초기화 이미지 추가 -->
       <img src="${pageContext.request.contextPath}/resources/img/icon_reload.png" id="resetFilters" 
        style="height: 1rem; width: 1rem; cursor: pointer; position: relative; top: 2px;">
     </div>
      <a style="text-align: right;">총 사원수 : ${employeeCount}명</a>
    </div>
<!-- // 체크박스 부분 -->

    <div>
     <table class="table-list">
      <tr class="table-head">
<!-- 	<th><input type="checkbox" id="delete-list-all" name="delete-list" data-group="delete-list"></th> -->
	   <th>사원번호</th> 
       <th>이름</th> 
	   <th>부서</th> 
	   <th>직급</th> 
	   <th>내선번호</th> 
	   <th>이메일</th> 
	   <th>입사일</th>
	   <th>재직여부</th>
	   <th>상세내역</th>
      </tr>

       <c:forEach var="employeeDTO" items="${employeeList}">
        <tr class="table-body" data-status="${employeeDTO.empStatus}">
<!-- 	<td><input type="checkbox" id="delete-list" name="delete-list" data-group="delete-list"></td> -->
         <td>${employeeDTO.empId}</td>
         <td>${employeeDTO.empName}</td>
         <td>${employeeDTO.departmentName}</td>
         <td>${employeeDTO.empPosition}</td>
         <td>${employeeDTO.empTel}</td>
         <td>${employeeDTO.empEmail}</td>
         <td>${employeeDTO.empHiredate}</td>
         <td>${employeeDTO.empStatus}</td>
         <td><input type="button" value="상세내역" class="btn btn-secondary mybutton1" onclick="openDetails('${employeeDTO.empId}')"></td>
        </tr>
       </c:forEach>    
     </table>
    </div>
    
    <div class="content-bottom">
     <div>
      <input type="button" value="사원등록" class="btn btn-primary mybutton1" onclick="openInsert()">
<!-- <input type="button" value="삭제" class="btn btn-secondary mybutton1"> -->
     </div>

<!-- -------------- 페이징처리 -------------- -->
      <div class="page-buttons">

       <c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
        <a href="${pageContext.request.contextPath}/employee/employeeList?pageNum=
	             ${pageDTO.startPage - pageDTO.pageBlock}&search=${pageDTO.search}&search2=${pageDTO.search2}" class="page-button">&lt;</a>
       </c:if>

       <c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
	    <c:choose>
		 <c:when test="${i eq pageDTO.currentPage}">
		  <a href="#" class="page-button page-button-active">${i}</a>
		 </c:when>
          <c:otherwise>
           <a href="${pageContext.request.contextPath}/employee/employeeList?pageNum=
			        ${i}&search=${pageDTO.search}&search2=${pageDTO.search2}" class="page-button">${i}</a>
          </c:otherwise>
	    </c:choose>
       </c:forEach>

       <c:if test="${pageDTO.endPage < pageDTO.pageCount}">
        <a href="${pageContext.request.contextPath}/employee/employeeList?pageNum=
	             ${pageDTO.startPage + pageDTO.pageBlock}&search2=${pageDTO.search2}" class="page-button">&gt;</a>
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
	// 연결되는지 보기위해
//     var url = '${pageContext.request.contextPath}/employee/employeeDetails';
 	var url = '${pageContext.request.contextPath}/employee/employeeDetails?empId='+empId;
    var windowWidth = 500;
    var windowHeight = 850;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}

// 사원등록 새창
function openInsert() {
    var url = '${pageContext.request.contextPath}/employee/employeeInsert';
    var windowWidth = 650;
    var windowHeight = 900;
    var windowLeft = (screen.width - windowWidth) / 2;
    var windowTop = (screen.height - windowHeight) / 2;
    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
}


 // 검색부분
function cancelSearch() {
  // 검색 폼 초기화
  document.search_form.search.value = '';
  document.search_form.search2.value = '';
}

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


</script>
 
 
 





<script>
// 체크박스부분
$(document).ready(function() {
  // 페이지 들어오면 아무 체크박스도 선택하지 않고 모든 행을 보이게 설정
  $("tr.table-body").show();

  $("input[name='status']").change(function() {
    // 'status' 그룹 내의 모든 체크박스를 선택 해제
    $("input[name='status']").prop("checked", false);

    // 선택한 체크박스만 체크되게 변경
    $(this).prop("checked", true);

    filterTableByStatus($(this).val());
  });

  // 초기화 버튼 처리
  $("#resetFilters").click(function() {
    // 아무 체크박스도 선택되지 않고 모든 행을 보이게 설정
    $("input[name='status']").prop("checked", false);
    $("tr.table-body").show();
  });

  function filterTableByStatus(status) {
    if (status === '재직') {
      $("tr.table-body[data-status='재직']").show();
      $("tr.table-body[data-status!='재직']").hide();
    } else if (status === '휴직') {
      $("tr.table-body[data-status='휴직']").show();
      $("tr.table-body[data-status!='휴직']").hide();
    } else if (status === '퇴직') {
      $("tr.table-body[data-status='퇴직']").show();
      $("tr.table-body[data-status!='퇴직']").hide();
    }
  }
});













</script>

 

</body>
</html>