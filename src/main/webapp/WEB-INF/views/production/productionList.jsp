<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실적관리</title>

<!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<!--     <link -->
<!--         href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" -->
<!--         rel="stylesheet"> -->
<link
	href="${pageContext.request.contextPath}/resources/css/workOrder.css"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css"
	rel="stylesheet">

<style type="text/css">
.lineCode {
	width: 180px;
}

.search-select {
	width: 480px;
}
</style>
</head>
<body>
	<%@include file="../inc/top-bar.jsp"%>
	<%@include file="../inc/side-bar.jsp"%>


	<!--  contents start -->
	<!-- <div class="contents" style="position:fixed; left: 15rem;"> -->

	<div class="main">
		<div class="card shadow">
			<!-- 그림자아니야 영역 -->
			<div class="page-title">실적관리</div>
			<div class="contents2">
			<form action="${pageContext.request.contextPath}/production/productionList" method="get">	
			
			
			
			
				<div class="search-bar">
					<div class="search-b">
						<div class="search-select">				 		
							<p>상품명</p> 
						<input type="text" id="productCode" name="search1" class="form-control search-input readonly-color"
      					 placeholder="${empty pageDTO.search1 ? '상품코드' : ''}" value="${pageDTO.search1}" readonly>
						<input type="text" id="productName" name="search2" class="form-control search-input readonly-color"
     					 placeholder="${empty pageDTO.search2 ? '상품명(클릭)' : ''}" value="${pageDTO.search2}" readonly>
						</div>
						</div>
						
						
						<div class="search-b">
						<div class="search-date">
						<p>실적일자</p>
						<input type="text" id="poDate1" name="search3" class="form-control search-input readonly-color" 
      					 placeholder="${empty pageDTO.search3 ? '실적일자' : ''}" value="${pageDTO.search3}" readonly>
						~<input type="text" id="poDate2" name="search4" class="form-control search-input readonly-color" 
       					 placeholder="${empty pageDTO.search4 ? '실적일자' : ''}" value="${pageDTO.search4}" readonly>
						</div>
						</div>
						
						
						<div style="display: flex; flex-direction: column; width: 145px; margin-top: -20px;">
				<div class="search-button" style="margin-bottom: 5px;">
				<input type="submit" value="검색하기" class="btn btn-primary mybutton1" style="width: 100%;">
				</div>
				<div class="search-button" style="display: flex; justify-content: space-between;">
				<input type="button" value="초기화" class="btn btn-secondary mybutton1" onclick="window.location.href = '${pageContext.request.contextPath}/production/productionList'" style="width: 48.6%;">
				<input type="button" value="지우기" class="btn btn-secondary mybutton1" onclick="resetSearch()" style="width: 48.6%;">
				</div>
				</div>
				</div><!-- search-bar -->
				
				</form>
						<!-- <input type="button" value="등록" class="btn btn-primary mybutton1" onclick="openInsert()"> -->
						<!-- <input type="button" value="삭제" class="btn btn-secondary mybutton1"> -->

				<div class="page-title">생산실적등록</div>


				<div>
					<table class="table-list">
						<tr class="table-head">
							<th><input type="checkbox" id="delete-list-all"
								name="delete-list" data-group="delete-list"></th>
							<th>실적코드</th>
							<th>지시번호</th>
							<th>실적일자</th>
							<th>라인코드</th>
							<th>상품코드</th>
							<th>상품명</th>
							<th>지시수량(EA)</th>
							<th>양품</th>
							<th>불량</th>
							<th>불량사유</th>
							<th>수주번호</th>
							<th>거래처</th>
							<th>상세내역</th>
						</tr>

						<c:forEach var="productionDTO" items="${productionList}">
							<tr class="table-body">
								<td><input type="checkbox" id="delete-list"
									name="delete-list" data-group="delete-list"></td>
								<td>${productionDTO.poCode}</td>
								<td>${productionDTO.woCode}</td>
								<td><c:out
										value="${fn:substring(productionDTO.poDate, 0, 10)}" /></td>
								<td>${productionDTO.lineCode}</td>
								<td>${productionDTO.productCode}</td>
								<td>${productionDTO.productName}</td>
								<td>${productionDTO.poCount}</td>
								<td>${productionDTO.poGood}</td>
								<td>${productionDTO.poErr}</td>
								<td>${productionDTO.poCause}</td>
								<%-- 									<td><c:out value="${fn:substring(productionDTO.woDate, 0, 10)}" /></td> --%>
								<%-- 								<td>${productionDTO.woStatus}</td> --%>
								<%-- 								<td>${productionDTO.productCode}</td> --%>
								<td>${productionDTO.roCode}</td>
								<td>${productionDTO.cusCode}</td>
								<%-- 								<td>${productionDTO.empName}</td> --%>

								<td><input type="button" value="상세내역"
									class="btn btn-secondary mybutton1"
									onclick="openDetails('${productionDTO.poCode}')"></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<!-- table -->
				<div class="content-bottom">
				<div>
						<input type="button" value="생산실적등록"
							class="btn btn-primary mybutton1" onclick="openInsert()">
						<input type="button" value="삭제"
							class="btn btn-secondary mybutton1">
					</div>
					<div id="page_control" class="page-buttons">
  					  <c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
      					  <a href="${pageContext.request.contextPath}/production/productionList?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&search=${pageDTO.search}" class="page-button">&lt;</a>
   					 </c:if>
   					 <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
     				   <c:choose>
           			 <c:when test="${i eq pageDTO.pageNum}">
              			  <a href="${pageContext.request.contextPath}/production/productionList?pageNum=${i}&search=${pageDTO.search}" class="page-button page-button-active">${i}</a>
          			  </c:when>
         			   <c:otherwise>
             			   <a href="${pageContext.request.contextPath}/production/productionList?pageNum=${i}&search=${pageDTO.search}" class="page-button">${i}</a>
         			   </c:otherwise>
        				</c:choose>
   					 </c:forEach>
  					  <c:if test="${pageDTO.endPage < pageDTO.pageCount}">
      					  <a href="${pageContext.request.contextPath}/production/productionList?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&search=${pageDTO.search}" class="page-button">&gt;</a>
   						 </c:if>
							</div>
</div>
</div><!-- contents -->
</div><!-- 그림자아니야 영역 -->
</div><!-- main -->

	<!-- contents end -->

	<!-- 데이트피커 타임피커를 사용하기위한 j쿼리 -->
	<link rel="stylesheet"
		href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<script type="text/javascript">
		//팝업 창을 열어주는 함수
		function openPopup(url) {
			var width = 500;
			var height = 500;
			var left = (screen.width - width) / 2;
			var top = (screen.height - height) / 2;
			var popupWindow = window.open(url, '_blank', "width=" + width
					+ ", height=" + height + ", left=" + left + ", top=" + top);
			popupWindow.focus();
		}
		$(document)
				.ready(
						function() {							
							// 상품명 검색 팝업 열기
							$("#productCode, #productName")
									.click(
											function() {
												var url = '${pageContext.request.contextPath}/workOrder/workProdList';
												openPopup(url);
											});
						});
		

		$(function() {
			$("#poDate1").datepicker({
				dateFormat : "yy-mm-dd"
			});
			$("#poDate2").datepicker({
				dateFormat : "yy-mm-dd"
			});
		});

		// 체크박스(삭제용) 전체선택
		var selectAllCheckbox = document.getElementById("delete-list-all");
		var checkboxes = document
				.querySelectorAll('[data-group="delete-list"]');
		selectAllCheckbox.addEventListener("change", function() {
			checkboxes.forEach(function(checkbox) {
				checkbox.checked = selectAllCheckbox.checked;
			});
		});
		checkboxes.forEach(function(checkbox) {
			checkbox.addEventListener("change", function() {
				if (!this.checked) {
					selectAllCheckbox.checked = false;
				} else {
					// 모든 체크박스가 선택되었는지 확인
					var allChecked = true;
					checkboxes.forEach(function(c) {
						if (!c.checked) {
							allChecked = false;
						}
					});
					selectAllCheckbox.checked = allChecked;
				}
			});
		});
		// 작업지시상세내용 새창
		function openDetails(poCode) {
		    var url = '${pageContext.request.contextPath}/production/productionDetails?poCode=' + poCode;
		    var windowWidth = 560;
		    var windowHeight = 720;
		    var windowLeft = (screen.width - windowWidth) / 2;
		    var windowTop = (screen.height - windowHeight) / 2;
		    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
		}
		//작업지시등록 새창
		function openInsert() {
		    var url = '${pageContext.request.contextPath}/production/productionInsert';
		    var windowWidth = 550;
		    var windowHeight = 710;
		    var windowLeft = (screen.width - windowWidth) / 2;
		    var windowTop = (screen.height - windowHeight) / 2;
		    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
		}
		
		
		//검색취소버튼 입력칸 초기화 및 placeholder값 재지정
		function resetSearch() {
			
		    $("#productCode").val("");
		    $("#productName").val("");		   
		    $("#poDate1").val("");
		    $("#poDate2").val("");

		   
		    $("#productCode").attr("placeholder", "상품코드");
		    $("#productName").attr("placeholder", "상품명(클릭)");
		    $("#poDate1").attr("placeholder", "지시일자");
		    $("#poDate2").attr("placeholder", "지시일자");
		   
		    
		   
		}
		
		
		</script>
	




</body>
</html>