<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<a>${woCodeTitle}, ${productCodeTitle}</a>
<table style="width: 550px !important">
		<tr>
			<th>자재코드</th>
			<th>자재명</th>
			<th>재고수량(EA)</th>
			<th>총소요량(EA)</th>
			<th>발주수량(EA)</th>
		</tr>
		<c:forEach var="requireDTO" items="${requireList}">
			<tr>
				<td>${requireDTO.materialCode}</td>
				<td>${requireDTO.materialName}</td>
				<td>${requireDTO.materialCount}</td>
				<td>${requireDTO.totalReqCount}</td>
				<td>
				<c:choose>
  				<c:when test="${requireDTO.totalReqCount - requireDTO.materialCount < 0}">
				-
				</c:when>
				<c:otherwise>
				${requireDTO.totalReqCount - requireDTO.materialCount}
				</c:otherwise>
				</c:choose>
				
				
				</td>
			</tr>
		</c:forEach>
		
	</table>
</body>
</html>