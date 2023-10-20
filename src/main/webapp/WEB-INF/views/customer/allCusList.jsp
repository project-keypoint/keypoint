<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
<h4>거래처조회</h4>
<form>
<div class="search-top">
<div>
<a>거래처코드</a>
<input type="text" name="cusCode" id="cusCode" style="width: 80px;">
</div><div>
<a>거래처명</a>
<input type="text" name="cusName" id="cusName" style="width: 150px;">
</div>
<div>
<input type="submit" class="btn btn-primary mybutton1" value="조회">
</div>
</div>
	</form>
	<table>
<tr><th>거래처코드</th><th>거래처명</th></tr>
<c:forEach var="allCusList" items="${allCusList}">
<tr onclick="selectWork('${allCusList.cusCode }','${allCusList.cusName }')"> <!-- ,'${itemList.itemId}' -->
	<td id="con">${allCusList.cusCode}</td>
	<td id="con">${allCusList.cusName}</td>
	</tr>

    <script type="text/javascript">

        function selectWork(a,b){ // 부모창으로 값 넘기기
		  
          opener.document.getElementById("cusCode").value = a
          opener.document.getElementById("cusName").value = b
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
	<a href="${pageContext.request.contextPath}/customer/allCusList?cusCode=${search.cusCode}&cusName=${search.cusName}&pageNum=${pageDTO.currentPage-1}"><</a>
	</c:if>

<!-- 10페이지 이전 -->
	 <c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
	<a href="${pageContext.request.contextPath}/customer/allCusListcusCode=${search.cusCode}&cusName=${search.cusName}&pageNum=${pageDTO.startPage-pageDTO.pageBlock}"><<</a>
	</c:if>
	
	<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage }" step="1">
	<a href="${pageContext.request.contextPath}/customer/allCusList?cusCode=${search.cusCode}&cusName=${search.cusName}&pageNum=${i}" <c:if test="${pageDTO.pageNum eq i}">class="active"</c:if>>${i}</a>

	</c:forEach>

<!-- 1페이지 다음 -->	
	<c:if test="${pageDTO.currentPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath}/customer/allCusList?cusCode=${search.cusCode}&cusName=${search.cusName}&pageNum=${pageDTO.currentPage+1}">></a>
	</c:if>

<!-- 10페이지 다음 -->
 	<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath}/customer/allCusList?cusCode=${search.cusCode}&cusName=${search.cusName}&pageNum=${pageDTO.startPage + pageDTO.pageBlock}">>></a>
	</c:if>
	
</div>
</div>
</body>
</html>