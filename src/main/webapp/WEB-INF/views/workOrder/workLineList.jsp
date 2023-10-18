<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<h4>라인코드 조회</h4>
<form>
<div class="search-top" style="display: flex; justify-content: center;">
	<div>
	<a>라인코드</a><input type="text" name="lineCode" style="width:200px;">
	</div>
	<div>
	<input type="submit" class="btn btn-primary mybutton1" value="조회" style="margin-left: 5px;">
	</div>
</div>

</form>
<table class="line-table">
<tr><th>라인코드</th></tr>
<c:forEach var="workLineList" items="${workLineList}">
<tr onclick="selectWork('${workLineList.lineCode }')"> <!-- ,'${itemList.itemId}' -->
	<td id="con">${workLineList.lineCode}</td>
	</tr>

    <script type="text/javascript">

        function selectWork(a){ // 부모창으로 값 넘기기
		  
          opener.document.getElementById("lineCode").value = a
//           opener.document.getElementById("lineCode").value = b
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
	<a href="${pageContext.request.contextPath }/workOrder/workLineList?lineCode=${search.lineCode}&pageNum=${pageDTO.currentPage-1}"><</a>
	</c:if>

<!-- 10페이지 이전 -->
	 <c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
	<a href="${pageContext.request.contextPath }/workOrder/workLineList?lineCode=${search.lineCode}&pageNum=${pageDTO.startPage-PageDTO.pageBlock}"><<</a>
	</c:if>
	
	<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
	<a href="${pageContext.request.contextPath }/workOrder/workLineList?lineCode=${search.lineCode}&pageNum=${i}" <c:if test="${pageDTO.pageNum eq i}">class="active"</c:if>>${i}</a> 
	</c:forEach>

<!-- 1페이지 다음 -->	
	<c:if test="${pageDTO.currentPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath }/workOrder/workLineList?lineCode=${search.lineCode}&pageNum=${pageDTO.currentPage+1}">></a>
	</c:if>

<!-- 10페이지 다음 -->
 	<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath }/workOrder/workLineList?lineCode=${search.lineCode}&pageNum=${pageDTO.startPage + pageDTO.pageBlock}">>></a>
	</c:if>
	
</div>
</div>
</body>
</html>