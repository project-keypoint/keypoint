<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="32x32" href="/resources/image/favicon-32x32.png">
<!-- Custom fonts for this template-->
<link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<!-- Custom styles for this template-->
<link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
<!-- 검색목록 CSS 적용-->
<link href="${pageContext.request.contextPath}/resources/css/searchList.css" rel="stylesheet">

</head>
<body>
<h4>제품 조회</h4>
<form>
<div class="search-top">
<div>
<a>제품코드</a>
<input type="text" name="productCode" id="productCode" style="width: 80px;">
</div>
<div>
<a>제품명</a>
<input type="text" name="productName" id="productName" style="width: 150px;">
</div>
<div>
<input type="submit" class="btn btn-primary mybutton1" value="조회">
</div>
</div>
	</form>
	<table>
		<tr>
			<th>제품코드</th>
			<th>제품명</th>
		</tr>
		<c:forEach var="workProdList" items="${workProdList}">
			<tr
				onclick="selectWork('${workProdList.productCode }','${workProdList.productName }')">
				<!-- ,'${itemList.itemId}' -->
				<td id="con">${workProdList.productCode}</td>
				<td id="con">${workProdList.productName}</td>
			</tr>

			<script type="text/javascript">
				function selectWork(a, b) { // 부모창으로 값 넘기기

					opener.document.getElementById("productCode").value = a
					opener.document.getElementById("productName").value = b
					//           opener.document.getElementById("pid").value = c
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
					href="${pageContext.request.contextPath }/workOrder/workProdList?productCode=${search.productCode}&productName=${search.productName}&pageNum=${pageDTO.currentPage-1}"><</a>
			</c:if>

			<!-- 10페이지 이전 -->
			<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
				<a
					href="${pageContext.request.contextPath }/workOrder/workProdList?productCode=${search.productCode}&productName=${search.productName}&pageNum=${pageDTO.startPage-PageDTO.pageBlock}"><<</a>
			</c:if>

			<c:forEach var="i" begin="${pageDTO.startPage }"
				end="${pageDTO.endPage }" step="1">
				<a
					href="${pageContext.request.contextPath }/workOrder/workProdList?productCode=${search.productCode}&productName=${search.productName}&pageNum=${i}"
					<c:if test="${pageDTO.pageNum eq i}">class="active"</c:if>>${i}</a>
			</c:forEach>

			<!-- 1페이지 다음 -->
			<c:if test="${pageDTO.currentPage < pageDTO.pageCount}">
				<a
					href="${pageContext.request.contextPath }/workOrder/workProdList?productCode=${search.productCode}&productName=${search.productName}&pageNum=${pageDTO.currentPage+1}">></a>
			</c:if>

			<!-- 10페이지 다음 -->
			<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
				<a
					href="${pageContext.request.contextPath }/workOrder/workProdList?productCode=${search.productCode}&productName=${search.productName}&pageNum=${pageDTO.startPage + pageDTO.pageBlock}">>></a>
			</c:if>

		</div>
	</div>
</body>
</html>