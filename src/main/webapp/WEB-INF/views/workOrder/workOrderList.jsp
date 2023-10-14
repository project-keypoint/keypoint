<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업지시 목록</title>

<!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<!--     <link -->
<!--         href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" -->
<!--         rel="stylesheet"> -->
<link href="${pageContext.request.contextPath}/resources/css/workOrder.css" rel="stylesheet">
<!-- Custom styles for this template-->
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css"
	rel="stylesheet">

</head>
<body>
<%@include file="../inc/top-bar.jsp"%>
<%@include file="../inc/side-bar.jsp"%>


	<!--  contents start -->
	<!-- <div class="contents" style="position:fixed; left: 15rem;"> -->

	<div class="main">
		<div class="card shadow">
			<div class="page-title">작업지시 목록</div>
			<div class="contents2">
			<form action="${pageContext.request.contextPath}/workOrder/workOrderList" method="get">			
					<div class="search-b" style="margin-bottom: -15px;">
						<div class="status-check" style="background: #E5E5E5; border: none;">
						<div class="search-date3">
						<a style="font-weight: bold;"> 진행<input type="checkbox" id="select1" name="check1" class="list-select" value="진행"
						<c:if test="${not empty pageDTO.check1}">checked</c:if>></a>
						<a>완료<input type="checkbox" id="select2" name="check2" class="list-select" value="완료"
						<c:if test="${not empty pageDTO.check2}">checked</c:if>></a>
						</div>
						</div>
						</div>
						
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
						<p>지시일자</p>
						<input type="text" id="woDate1" name="search3" class="form-control search-input readonly-color" 
      					 placeholder="${empty pageDTO.search3 ? '지시일자' : ''}" value="${pageDTO.search3}" readonly>
						~<input type="text" id="woDate2" name="search4" class="form-control search-input readonly-color" 
       					 placeholder="${empty pageDTO.search4 ? '지시일자' : ''}" value="${pageDTO.search4}" readonly>
						</div>
						</div>
						
						
						<div style="display: flex; flex-direction: column; width: 145px; margin-top: -20px;">
				<div class="search-button" style="margin-bottom: 5px;">
				<input type="submit" value="검색하기" class="btn btn-primary mybutton1" style="width: 100%;">
				</div>
				<div class="search-button" style="display: flex; justify-content: space-between;">
				<input type="button" value="초기화" class="btn btn-secondary mybutton1" onclick="window.location.href = '${pageContext.request.contextPath}/workOrder/workOrderList'" style="width: 48.6%;">
				<input type="button" value="지우기" class="btn btn-secondary mybutton1" onclick="resetSearch()" style="width: 48.6%;">
				</div>
				</div>
				</div><!-- search-bar -->
				
				</form>
						
						
<!-- 						<div class="search-select"> -->
<!-- 							<p> -->
<!-- 								라인 <select id="LineCode" name="LineCode" -->
<!-- 									class="custom-select form-control lineCode"> -->
<%-- 									<c:forEach var="LineDTO" items="${lineList}"> --%>
<%-- 										<option value="${LineDTO.lineCode}">${LineDTO.lineCode}</option> --%>
<%-- 									</c:forEach> --%>
<!-- 								</select> -->
<!-- 							</p> -->
<!-- 						</div> -->
			
				<!-- search-bar -->
				<br>


				<div>
					<table class="table-list">
						<tr class="table-head">
							<th><input type="checkbox" id="delete-list-all"
								name="delete-list" data-group="delete-list"></th>
							<th>작업지시번호</th>
							<th>업체명</th>
							<th>업체코드</th>
							<th>수주번호</th>
							<th>지시일자</th>
							<th>지시상태</th>
							<th>상품코드</th>
							<th>상품명</th>
							<th>라인코드</th>
							<th>지시수량</th>
							<th>납품예정일</th>
							<th>작업지시자</th>
							<th>상세내역</th>
						</tr>

						<c:forEach var="workOrderDTO" items="${workOrderList}">
							<tr class="table-body">
								<td><input type="checkbox" id="delete-list"
									name="delete-list" data-group="delete-list"></td>
								<td>${workOrderDTO.woCode}</td>
								<td>${workOrderDTO.cusName}</td>
								<td>${workOrderDTO.cusCode}</td>
								<td>${workOrderDTO.roCode}</td>
								<td>${workOrderDTO.woDate}</td>
								<%--     <td><c:out value="${fn:substring(workOrderDTO.woDate, 0, 10)}" /></td> --%>
								<td>${workOrderDTO.woStatus}</td>
								<td>${workOrderDTO.productCode}</td>
								<td>${workOrderDTO.productName}</td>
								<td>${workOrderDTO.lineCode}</td>
								<td>${workOrderDTO.woCount}</td>
								<td>${workOrderDTO.shipSdate}</td>
								<td>${workOrderDTO.empName}</td>

								<td><input type="button" value="상세내역"
									class="btn btn-secondary mybutton1"
									onclick="openDetails('${workOrderDTO.woCode}')"></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<!-- table -->
				<div class="content-bottom">
					<div>
						<input type="button" value="작업지시등록"
							class="btn btn-primary mybutton1" onclick="openInsert()">
						<input type="button" value="삭제"
							class="btn btn-secondary mybutton1">
					</div>
					<div id="page_control" class="page-buttons">
  					  <c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
      					  <a href="${pageContext.request.contextPath}/workOrder/workOrderList?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&search=${pageDTO.search}" class="page-button">&lt;</a>
   					 </c:if>
   					 <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
     				   <c:choose>
           			 <c:when test="${i eq pageDTO.pageNum}">
              			  <a href="${pageContext.request.contextPath}/workOrder/workOrderList?pageNum=${i}&search=${pageDTO.search}" class="page-button page-button-active">${i}</a>
          			  </c:when>
         			   <c:otherwise>
             			   <a href="${pageContext.request.contextPath}/workOrder/workOrderList?pageNum=${i}&search=${pageDTO.search}" class="page-button">${i}</a>
         			   </c:otherwise>
        				</c:choose>
   					 </c:forEach>
  					  <c:if test="${pageDTO.endPage < pageDTO.pageCount}">
      					  <a href="${pageContext.request.contextPath}/workOrder/workOrderList?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&search=${pageDTO.search}" class="page-button">&gt;</a>
   						 </c:if>
							</div>
							</div>
				</div>
			</div>
			</div>
			<!-- contents -->
		<!-- 그림자아니야 영역 -->
	<!-- main -->

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
							// 업체명 검색 팝업 열기
							$("#cusCode, #cusName")
									.click(
											function() {
												var url = '${pageContext.request.contextPath}/workOrder/workCusList';
												openPopup(url);
											});
							// 상품명 검색 팝업 열기
							$("#productCode, #productName")
									.click(
											function() {
												var url = '${pageContext.request.contextPath}/workOrder/workProdList';
												openPopup(url);
											});
						});
		
		$(function() {
			$("#woDate1").datepicker({
				dateFormat : "yy-mm-dd"
			});
			$("#woDate2").datepicker({
				dateFormat : "yy-mm-dd"
			});
			$("#shipSdate1").datepicker({
				dateFormat : "yy-mm-dd"
			});
			$("#shipSdate2").datepicker({
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
		function openDetails(woCode) {
			var url = '${pageContext.request.contextPath}/workOrder/workOrderDetails?woCode='
					+ woCode;
			var windowWidth = 560;
			var windowHeight = 720;
			var windowLeft = (screen.width - windowWidth) / 2;
			var windowTop = (screen.height - windowHeight) / 2;
			var newWindow = window.open(url, '_blank', 'width=' + windowWidth
					+ ', height=' + windowHeight + ', left=' + windowLeft
					+ ', top=' + windowTop);
		}
		//작업지시등록 새창
		function openInsert() {
			var url = '${pageContext.request.contextPath}/workOrder/workOrderInsert';
			var windowWidth = 550;
			var windowHeight = 710;
			var windowLeft = (screen.width - windowWidth) / 2;
			var windowTop = (screen.height - windowHeight) / 2;
			var newWindow = window.open(url, '_blank', 'width=' + windowWidth
					+ ', height=' + windowHeight + ', left=' + windowLeft
					+ ', top=' + windowTop);
		}

		
		//검색취소버튼 입력칸 초기화 및 placeholder값 재지정
		function resetSearch() {
			
		    $("#productCode").val("");
		    $("#productName").val("");		   
		    $("#woDate1").val("");
		    $("#woDate2").val("");

		   
		    $("#productCode").attr("placeholder", "상품코드");
		    $("#productName").attr("placeholder", "상품명(클릭)");
		    $("#woDate1").attr("placeholder", "지시일자");
		    $("#woDate2").attr("placeholder", "지시일자");
		   
		    
		    $('#select1').prop('checked', false);
		    $('#select2').prop('checked', false);
		   
		}
		
		
		
		</script>




</body>
</html>