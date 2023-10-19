<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>

<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="32x32"
	href="/resources/image/favicon-32x32.png">
<!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<!-- Custom styles for this template-->
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css"
	rel="stylesheet">
<!-- 검색목록 CSS 적용-->
<link
	href="${pageContext.request.contextPath}/resources/css/searchList.css"
	rel="stylesheet">
</head>
<body>

	<h4>발주 필요 현황</h4>
	<form>
		<div class="search-top">
			<div>
				<a>작업지시코드</a> <input type="text" name="woCode" style="width: 80px;">
				<a>수주번호</a><input type="text" name="productCode"
					style="width: 150px;">
			</div>
			<div>
				<input type="submit" class="btn btn-primary mybutton1" value="조회">
			</div>
		</div>
	</form>
	<table style="width: 1000px !important">
		<tr>
			<th>지시코드</th>
			<th>라인코드</th>
			<th>상품코드</th>
			<th>상품명</th>
			<th>지시수량</th>
			<th>수주번호</th>
			<th>거래처코드</th>
			<th>거래처명</th>
			<th>버튼</th>
		</tr>
		<c:forEach var="workList" items="${workList}">
			<tr>
				<td>${workList.woCode}</td>
				<td>${workList.lineCode}</td>
				<td>${workList.productCode}</td>
				<td>${workList.productName}</td>
				<td>${workList.woCount}</td>
				<td>${workList.roCode}</td>
				<td>${workList.cusCode}</td>
				<td>${workList.cusName}</td>
				<td><input type="button" value="버튼" class="btn btn-info mybutton1" onclick="openRequire('${workList.woCode}','${workList.productCode}')"></td>
			</tr>
			<script type="text/javascript">
			function openRequire(woCode, productCode) {
			    var url = '${pageContext.request.contextPath}/purchase/requireList?woCode='+woCode+'&productCode='+productCode;
			    var windowWidth = 660;
			    var windowHeight = 520;
			    var windowLeft = (screen.width - windowWidth) / 2;
			    var windowTop = (screen.height - windowHeight) / 2;
			    var newWindow = window.open(url, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);
			}	
			</script>
		</c:forEach>
	</table>
	<br>
	<div class="center">
		<div id="pagination">

			<!-- 1페이지 이전 -->
			<c:if test="${pageDTO.currentPage > 1}">
				<a
					href="${pageContext.request.contextPath }/workOrder/workList?woCode=${search.woCode}&roCode=${search.roCode}&pageNum=${pageDTO.currentPage-1}"><</a>
			</c:if>

			<!-- 10페이지 이전 -->
			<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
				<a
					href="${pageContext.request.contextPath }/workOrder/workList?woCode=${search.woCode}&roCode=${search.roCode}&pageNum=${pageDTO.startPage-PageDTO.pageBlock}"><<</a>
			</c:if>

			<c:forEach var="i" begin="${pageDTO.startPage }"
				end="${pageDTO.endPage }" step="1">
				<a
					href="${pageContext.request.contextPath }/workOrder/workList?woCode=${search.woCode}&roCode=${search.roCode}&pageNum=${i}"
					<c:if test="${pageDTO.pageNum eq i}">class="active"</c:if>>${i}</a>
			</c:forEach>

			<!-- 1페이지 다음 -->
			<c:if test="${pageDTO.currentPage < pageDTO.pageCount}">
				<a
					href="${pageContext.request.contextPath }/workOrder/workList?woCode=${search.woCode}&roCode=${search.roCode}&pageNum=${pageDTO.currentPage+1}">></a>
			</c:if>

			<!-- 10페이지 다음 -->
			<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
				<a
					href="${pageContext.request.contextPath }/workOrder/workList?woCode=${search.woCode}&roCode=${search.roCode}&pageNum=${pageDTO.startPage + pageDTO.pageBlock}">>></a>
			</c:if>

		</div>
	</div>
</body>
</html>