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

<style type="text/css">

@import
	url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css)
	;
	
	
body{
	font-family: 'NanumSquare', sans-serif;
}



/* 페이징 */


#pagination {
  display: inline-block;
}

#pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
  border: 1px solid #ddd;
}



#pagination a.active {
	background-color: #b9b9b9;
  color: white;
  border: 1px solid #b9b9b9;
}

#pagination a:hover:not(.active,.none) {background-color: #ddd;}

.center {
  text-align: center;
}


table {
	margin : 0px auto;
	border: 1px #a39485 solid;
	font-size: .9em;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
	width: 425px;
	border-collapse: collapse;
	border-radius: 5px;
	overflow: hidden;
	
}

th {
	text-align: center;
	background: #b9b9b9;
	font-weight: 700;
}


td, th {
	padding: 1em .5em;
	
	vertical-align: middle;
}

td {
	border-bottom: 1px solid rgba(0, 0, 0, .1);
	background: #fff;
	text-align: center;
}
h2{
	text-align: center;
}

#con:hover{
	background-color : #e1e1e1;
	cursor:pointer;
}

</style>
</head>
<body>
<h2>
자재코드 조회
</h2>
<br>
<form>
<table>
<tr>
	<td>코드</td><td><input type="text" name="materialCode" style="width:100px;"></td>
	<td>자재</td><td><input type="text" name="materialName" style="width:100px;"></td>
	<td><input type="submit" value="조회"></td></tr>
</table>
<br>
</form>
<table>
<tr>
<th>자재코드</th>
<th>자재명</th>
<!-- <th>자재단가</th> -->
</tr>
<c:forEach var="materialList" items="${materialList}">
<tr onclick="selectWork('${materialList.materialCode }','${materialList.materialName }','${purchaseMaterialList.materialPrice }')"> <!-- ,'${itemList.itemId}' -->
	<td id="con">${materialList.materialCode}</td>
	<td id="con">${materialList.materialName}</td>
<%-- 	<td id="con">${materialList.materialPrice}</td> --%>
	</tr>

    <script type="text/javascript">

        function selectWork(a,b){ // 부모창으로 값 넘기기
		  
          opener.document.getElementById("materialCode").value = a
          opener.document.getElementById("materialName").value = b
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
	<a href="${pageContext.request.contextPath }/material/purchaseMaterialList?materialCode=${search.materialCode}&materialName=${search.materialName}&materialPrice=${search.materialPrice}&pageNum=${pageDTO.currentPage-1}"><</a>
	</c:if>

<!-- 10페이지 이전 -->
	 <c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
	<a href="${pageContext.request.contextPath }/material/purchaseMaterialList?materialCode=${search.materialCode}&materialName=${search.materialName}&materialPrice=${search.materialPrice}&pageNum=${pageDTO.startPage-PageDTO.pageBlock}"><<</a>
	</c:if>
	
	<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
	<a href="${pageContext.request.contextPath }/material/purchaseMaterialList?materialCode=${search.materialCode}&materialName=${search.materialName}&materialPrice=${search.materialPrice}&pageNum=${i}" <c:if test="${pageDTO.pageNum eq i}">class="active"</c:if>>${i}</a> 
	</c:forEach>

<!-- 1페이지 다음 -->	
	<c:if test="${pageDTO.currentPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath }/material/purchaseMaterialList?materialCode=${search.materialCode}&materialName=${search.materialName}&materialPrice=${search.materialPrice}&pageNum=${pageDTO.currentPage+1}">></a>
	</c:if>

<!-- 10페이지 다음 -->
 	<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath }/material/purchaseMaterialList?materialCode=${search.materialCode}&materialName=${search.materialName}&materialPrice=${search.materialPrice}&pageNum=${pageDTO.startPage + pageDTO.pageBlock}">>></a>
	</c:if>
	
</div>
</div>
</body>
</html>