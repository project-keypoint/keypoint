<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>lineList</title> -->

<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="32x32"
	href="/resources/image/favicon-32x32.png">

<style type="text/css">
@import
	url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css)
	;

body {
	font-family: 'NanumSquare', sans-serif;
}

table.lineSearch {
	margin: 0px auto;
	margin-bottom: 10px;
	border: 1px #a39485 solid;
	font-size: .9em;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
	width: 425px;
	border-collapse: collapse;
	border-radius: 5px;
	overflow: hidden;
}

table.lineList {
	margin: 0px auto;
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

h2 {
	text-align: center;
}

#con:hover {
	background-color: #e1e1e1;
	cursor: pointer;
}
</style>
</head>

<body>
	<!-- <header> -->
	<!-- </header> -->

	<h2>작업지시 조회</h2>
	<form>
		<table class="workSearch">
			<tr>
				<td>작업지시코드</td>
				<td><input type="text" name="woCode" style="width: 100px;"></td>
				<td>수주번호</td>
				<td><input type="text" name="woCode" style="width: 100px;"></td>
				<td><input type="submit" value="조회"></td>
			</tr>
		</table>
	</form>
	<table class="workList">
		<tr>
			<th>지시코드</th>
			<th>라인코드</th>
			<th>상품코드</th>
			<th>상품명</th>
			<th>지시수량</th>
			<th>수주번호</th>
			<th>거래처</th>
		</tr>
		<c:forEach var="workList" items="${workList}">
			<tr id="con"
				onclick="selectwork('${workList.woCode}','${workList.lineCode}','${workList.productCode}','${workList.productName}'
				,'${workList.woCount}','${workList.roCode}','${workList.cusCode}')">
				<td>${workList.woCode}</td>
				<td>${workList.lineCode}</td>
				<td>${workList.productCode}</td>
				<td>${workList.productName}</td>
				<td>${workList.woCount}</td>
				<td>${workList.roCode}</td>
				<td>${workList.cusCode}</td>
			</tr>
			<input type="hidden" value="${workList.woCode}">
		</c:forEach>
	</table>
</body>
<script type="text/javascript">
	function selectwork(a, b, c, d, e, f, g) { // 부모창으로 값 넘기기

		opener.document.getElementById("woCode").value = a
		opener.document.getElementById("lineCode").value = b
		opener.document.getElementById("productCode").value = c
		opener.document.getElementById("productName").value = d
		opener.document.getElementById("woCount").value = e
		opener.document.getElementById("lineId").value = f
		opener.document.getElementById("roCode").value = g
		opener.document.getElementById("cusCode").value = h
		window.close();
	}
</script>
</html>