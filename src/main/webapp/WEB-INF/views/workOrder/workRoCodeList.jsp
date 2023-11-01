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
<h4>수주코드 조회</h4>
<form>
<div class="search-top">
<div>
	<a>수주코드</a><input type="text" name="roCode" style="width:80px;">
	<a>상품코드</a><input type="text" name="productCode" style="width:150px;">
	</div>
	<div>
	<input type="submit" class="btn btn-primary mybutton1" value="조회">
</div>
</div>
</form>
<table>
<tr><th>수주코드</th>
	<th>업체코드</th>
	<th>상품코드</th>
	<th>수주수량</th>
	<th>납품예정일</th>
</tr>
<c:forEach var="workRoCodeList" items="${workRoCodeList}">
<tr onclick="selectWork('${workRoCodeList.roCode}','${workRoCodeList.cusCode}','${workRoCodeList.productCode}'
				,'${workRoCodeList.roCount}','${workRoCodeList.shipSdate}')">
	<td id="con">${workRoCodeList.roCode}</td>
	<td id="con">${workRoCodeList.cusCode}</td>
	<td id="con">${workRoCodeList.productCode}</td>
	<td id="con">${workRoCodeList.roCount}</td>
	<td id="con">${workRoCodeList.shipSdate}</td>
	</tr>

    <script type="text/javascript">

        function selectWork(a,b,c,d,e,f,g){ // 부모창으로 값 넘기기
		  
          opener.document.getElementById("roCode").value = a
          opener.document.getElementById("cusCode").value = b
//           opener.document.getElementById("cusName").value = c
          opener.document.getElementById("productCode").value = c
//           opener.document.getElementById("productName").value = e
          opener.document.getElementById("woCount").value = d
          opener.document.getElementById("shipSdate").value = e
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
	<a href="${pageContext.request.contextPath }/workOrder/workRoCodeList?roCode=${search.roCode}&productCode=${search.productCode}&pageNum=${pageDTO.currentPage-1}"><</a>
	</c:if>

<!-- 10페이지 이전 -->
	 <c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
	<a href="${pageContext.request.contextPath }/workOrder/workRoCodeList?roCode=${search.roCode}&productCode=${search.productCode}&pageNum=${pageDTO.startPage-PageDTO.pageBlock}"><<</a>
	</c:if>
	
	<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
	<a href="${pageContext.request.contextPath }/workOrder/workRoCodeList?roCode=${search.roCode}&productCode=${search.productCode}&pageNum=${i}" <c:if test="${pageDTO.pageNum eq i}">class="active"</c:if>>${i}</a> 
	</c:forEach>

<!-- 1페이지 다음 -->	
	<c:if test="${pageDTO.currentPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath }/workOrder/workRoCodeList?roCode=${search.roCode}&productCode=${search.productCode}&pageNum=${pageDTO.currentPage+1}">></a>
	</c:if>

<!-- 10페이지 다음 -->
 	<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath }/workOrder/workRoCodeList?roCode=${search.roCode}&productCode=${search.productCode}&pageNum=${pageDTO.startPage + pageDTO.pageBlock}">>></a>
	</c:if>
	
</div>
</div>
</body>
</html>