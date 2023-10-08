<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

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
<link href="${pageContext.request.contextPath}/resources/css/line.css"
	rel="stylesheet">
</head>
</head>
<body>
	<%@include file="../inc/top-bar.jsp"%>
	<%@include file="../inc/side-bar.jsp"%>


	<!--  contents start -->
	<div class="main">
		<div class="card shadow">
			<!-- 그림자아니야 영역 -->
			<div class="page-title">공지사항</div>
			<div class="contents2">
				<div class="search-bar">
					<div class="search-b">
						<div class="search-select">
							<div class="dropdown">
								<select name="language" id="language" style="padding-top:5px; padding-bottom:5px; border-radius: 0.35rem;">
									<option value="noticeSubject">제목</option>
									<option value="noticeSub+Con">제목+내용</option>
								</select>
							</div>
							<input type="text" id="noticeSubject"
								class="form-control search-input">

						</div>
					</div>

					<div class="search-button">
						<input type="button" value="검색" class="btn btn-primary mybutton1">
						<input type="button" value="취소"
							class="btn btn-secondary mybutton1">
					</div>
				</div>
				<!-- search-bar -->
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
							<th><input type="checkbox" id="delete-list-all"
								name="delete-list" data-group="delete-list"></th>
							<th>번호</th>
							<th>제목</th>
							<th>작성날짜</th>
							<th>조회수</th>
							<th>담당자</th>
						</tr>
						<c:forEach var="NoticeDTO" items="${noticeList}">
							<tr class="table-body">
								<td><input type="checkbox" id="delete-list"
									name="delete-list" data-group="delete-list"></td>
								<td>${noticeDTO.noticeNum}</td>
								<td>${noticeDTO.noticeSubject}</td>
								<td>${noticeDTO.noticeDate}</td>
								<td>${noticeDTO.noticeReadcount}</td>
<%-- 								<td>${noticeDTO.lineEmp}</td> --%>


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
								
							</tr>
						</c:forEach>
					</table>
				</div>
				<!-- table -->
				<div class="content-bottom">
					<div>
						<input type="button" value="글쓰기" class="btn btn-primary mybutton1"
							onclick="openInsert()"> <input type="button" value="삭제"
							class="btn btn-secondary mybutton1">
					</div>
					<div class="page-buttons">
						<a href="#" class="page-button">&lt;</a> <a href="#"
							class="page-button page-button-active">1</a> <a href="#"
							class="page-button">2</a> <a href="#" class="page-button">3</a> <a
							href="#" class="page-button">4</a> <a href="#"
							class="page-button">5</a> <a href="#" class="page-button">&gt;</a>
					</div>
					<!-- page-button -->
				</div>
			</div>
			<!-- contents -->
		</div>
		<!-- 그림자아니야 영역 -->
	</div>
	<!-- main -->

	<!-- contents end -->

	<script type="text/javascript">
		//수주등록 새창
		function openInsert() {
			var url = '${pageContext.request.contextPath}/notice/noticeInsert';
			var windowWidth = 500;
			var windowHeight = 675;
			var windowLeft = (screen.width - windowWidth) / 2;
			var windowTop = (screen.height - windowHeight) / 2;
			var newWindow = window.open(url, '_blank', 'width=' + windowWidth
					+ ', height=' + windowHeight + ', left=' + windowLeft
					+ ', top=' + windowTop);
		}

		//수주상세내용 새창
		function openDetails(roCode) {
			var url = '${pageContext.request.contextPath}/receive/receiveDetails?roCode='
					+ roCode;
			var windowWidth = 500;
			var windowHeight = 675;
			var windowLeft = (screen.width - windowWidth) / 2;
			var windowTop = (screen.height - windowHeight) / 2;
			var newWindow = window.open(url, '_blank', 'width=' + windowWidth
					+ ', height=' + windowHeight + ', left=' + windowLeft
					+ ', top=' + windowTop);
		}

		//체크박스(삭제용) 전체선택
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
	</script>
</body>

</html>