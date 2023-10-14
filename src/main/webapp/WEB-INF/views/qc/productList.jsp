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
</div><div>
<a>제품명</a>
<input type="text" name="productName" id="productName" style="width: 150px;">
</div>
<div>
<input type="submit" class="btn btn-primary mybutton1" value="조회">
<input type="reset" class="btn btn-secondary mybutton1" value="취소">
</div>
</div>
</form>

	<table>
	<tr>
	<th>제품코드</th>
	<th>제품명</th>
	</tr>
	<c:forEach var="productList" items="${productList}">
	<tr	onclick="selectWork('${productList.productCode }','${productList.productName }','${productList.productPrice }')">
	<td id="con">${productList.productCode}</td>
	<td id="con">${productList.productName}</td>
	</tr>
	<input type="hidden" value="${productList.productPrice}" readonly>

<script type="text/javascript">
function selectWork(a, b, c) { // 부모창으로 값 넘기기
opener.document.getElementById("productCode").value = a
opener.document.getElementById("productName").value = b
opener.document.getElementById("productPrice").value = c
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
<a href="${pageContext.request.contextPath }/qc/productList?productCode=${search.productCode}&productName=${search.productName}&pageNum=${pageDTO.currentPage-1}">&lt;</a>
</c:if>
<!-- 10페이지 이전 -->
<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
<a href="${pageContext.request.contextPath }/qc/productList?productCode=${search.productCode}&productName=${search.productName}&pageNum=${pageDTO.startPage-PageDTO.pageBlock}">&lt;&lt;</a>
</c:if>
<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
<a href="${pageContext.request.contextPath }/qc/productList?productCode=${search.productCode}&productName=${search.productName}&pageNum=${i}"
<c:if test="${pageDTO.pageNum eq i}">class="active"</c:if>>${i}</a>
</c:forEach>
<!-- 1페이지 다음 -->
<c:if test="${pageDTO.currentPage < pageDTO.pageCount}">
<a href="${pageContext.request.contextPath }/qc/productList?productCode=${search.productCode}&productName=${search.productName}&pageNum=${pageDTO.currentPage+1}">&gt;</a>
</c:if>
<!-- 10페이지 다음 -->
<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
<a href="${pageContext.request.contextPath }/qc/productList?productCode=${search.productCode}&productName=${search.productName}&pageNum=${pageDTO.startPage + pageDTO.pageBlock}">&gt;&gt;</a>
</c:if>
</div>
</div>
</body>
</html>