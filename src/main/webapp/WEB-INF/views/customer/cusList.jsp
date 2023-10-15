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
<div class="page-title">거래처 목록</div>
<div class="contents2">
<div class="search-bar">
<div class="search-b">
<div class="search-select">
<p>업체명</p> 
<input type="text" id="cusCode" class="form-control search-input" placeholder="업체코드" style="width:110px;" readonly>
<input type="text" id="cusName" class="form-control search-input" placeholder="업체명(클릭)" readonly>
</div>
</div>

<div class="search-b">
<div class="search-select">
<p>상품명</p> 
<input type="text" id="productCode" class="form-control search-input" placeholder="상품코드" style="width:110px;" readonly>
<input type="text" id="productName" class="form-control search-input" placeholder="상품명(클릭)" readonly>
</div>

</div>


<div class="search-button">
<input type="button" value="검색" class="btn btn-primary mybutton1">
<input type="button" value="취소" class="btn btn-secondary mybutton1">
</div>
</div><!-- search-bar -->
<br>








<div class="select-status" style="display: flex; justify-content: space-between;">
<div style="display: flex; justify-content: flex-start;">
<div>
      <input type="button" class="btn btn-secondary mybutton2" value="전체" data-tab="hide1" onclick="updateTotalCount('hide1')">
      <input type="button" class="btn btn-secondary mybutton2 clicked"" value="거래중" data-tab="hide2" onclick="updateTotalCount('hide2')">
      <input type="button" class="btn btn-secondary mybutton2" value="거래중지" data-tab="hide3" onclick="updateTotalCount('hide3')">
</div>
</div>
 <a id="totalCount" style="text-align: right;">총 ${insertCount}건</a>

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
                <td><input type="button" value="상세내역" class="btn btn-secondary mybutton1" onclick="openDetails('${customerDTO.cusCode}')"></td>
            </tr>
        </c:forEach>    
    </table>
</div><!-- table -->

<!-- -------------------------------------------------------거래중-------------------------------------------------------------------------------- -->
<div id="hide2" class="tab-content" active-tab>
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
        <c:forEach var="customerDTO" items="${insertcusList}">
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
                <td><input type="button" value="상세내역" class="btn btn-secondary mybutton1" onclick="openDetails('${customerDTO.cusCode}')"></td>
            </tr>
        </c:forEach>    
    </table>
    
</div><!-- table -->

<!-- -------------------------------------------------------거래중지-------------------------------------------------------------------------------- -->
<div id="hide3" class="tab-content">
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
        <c:forEach var="customerDTO" items="${deletecusList}">
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
                <td><input type="button" value="상세내역" class="btn btn-secondary mybutton1" onclick="openDetails('${customerDTO.cusCode}')"></td>
            </tr>
        </c:forEach>    
    </table>
</div><!-- table -->








<div class="content-bottom">
<div>
<input type="button" value="거래처 등록" class="btn btn-primary mybutton1" onclick="openInsert()">
</div>



<!-- ---------------------페이징---------------- -->
<div class="page-buttons">
<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
	<a href="${pageContext.request.contextPath}/customer/cusList?pageNum=${pageDTO1.startPage - pageDTO1.pageBlock}&search=${pageDTO.search}" class="page-button">&lt;</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
	<c:choose>
		<c:when test="${i eq pageDTO.currentPage}">
			<a href="#" class="page-button page-button-active">${i}</a>
		</c:when>
		<c:otherwise>
			<a href="${pageContext.request.contextPath}/customer/cusList?pageNum=${i}&search=${pageDTO.search}" class="page-button">${i}</a>
		</c:otherwise>
	</c:choose>
</c:forEach>

<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath}/customer/cusList?pageNum=${pageDTO.startPage + pageDTO.pageBlock}" class="page-button">&gt;</a>
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
    // 업체명 검색 팝업 열기
    $("#cusCode, #cusName").click(function() {
        var url = '${pageContext.request.contextPath}/workOrder/workCusList';
        openPopup(url);
    });
    // 상품명 검색 팝업 열기
    $("#productCode, #productName").click(function() {
        var url = '${pageContext.request.contextPath}/workOrder/workProdList';
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


// 거래처 상세내용 새창
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



//	탭으로 이동하기
function showTab(tabId) {
    const tabs = document.querySelectorAll(".tab-content");
    tabs.forEach(tab => {
      tab.style.display = "none";
    });
    
    const selectedTab = document.getElementById(tabId);
    if (selectedTab) {
      selectedTab.style.display = "block";
    }
  }

  // 초기로드 시 첫 번째 탭 표시
  showTab("hide2");

  // 버튼 클릭 이벤트 처리
  const buttons = document.querySelectorAll(".mybutton2");
  buttons.forEach(button => {
    button.addEventListener("click", function() {
      const tabId = this.getAttribute("data-tab");
      showTab(tabId);
    });
  });

  
  
//	탭에 따른 총 건수
  function updateTotalCount(selectedTab) {
    const totalCount = document.getElementById("totalCount");

    if (selectedTab === "hide1") {
      totalCount.textContent = `총 ${cusCount}건`;
    } else if (selectedTab === "hide2") {
      totalCount.textContent = `총 ${insertCount}건`;
    } else if (selectedTab === "hide3") {
      totalCount.textContent = `총 ${deletetCount}건`;
    }
  }
  
  
  
  
//버튼 클릭 이벤트를 처리하는 JavaScript
  document.querySelectorAll('.btn.btn-secondary.mybutton2').forEach(function(button) {
      button.addEventListener('click', function() {
          // 모든 버튼의 'clicked' 클래스를 제거
          document.querySelectorAll('.btn.btn-secondary.mybutton2').forEach(function(btn) {
              btn.classList.remove('clicked');
          });

          // 클릭된 버튼에 'clicked' 클래스 추가
          this.classList.add('clicked');
      });
  });
  
  
  
  

  
  
</script>

</body>
</html>