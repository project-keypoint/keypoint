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

	<h4>작업지시 조회</h4>
	<form>
		<div class="search-top">
			<div>
				<a>작업지시코드</a> <input type="text" name="woCode" style="width: 80px;">
				<a>수주번호</a><input type="text" name="productCode" style="width:150px;">
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
		</tr>
		<c:forEach var="workList" items="${workList}">
			<tr
				onclick="selectWork('${workList.woCode}','${workList.lineCode}','${workList.productCode}'
				,'${workList.productName}','${workList.woCount}','${workList.roCode}','${workList.cusCode}','${workList.cusName}')">
				<td id="con">${workList.woCode}</td>
				<td id="con">${workList.lineCode}</td>
				<td id="con">${workList.productCode}</td>
				<td id="con">${workList.productName}</td>
				<td id="con">${workList.woCount}</td>
				<td id="con">${workList.roCode}</td>
				<td id="con">${workList.cusCode}</td>
				<td id="con">${workList.cusName}</td>
			</tr>
			<script type="text/javascript">
				function selectWork(a, b, c, d, e, f, g, h) { // 부모창으로 값 넘기기

					opener.document.getElementById("woCode").value = a
					opener.document.getElementById("lineCode").value = b
					opener.document.getElementById("productCode").value = c
					opener.document.getElementById("productName").value = d
					opener.document.getElementById("woCount").value = e
					opener.document.getElementById("roCode").value = f
					opener.document.getElementById("cusCode").value = g
					opener.document.getElementById("cusName").value = h
					window.close();
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