<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트페이지입니다</title>

 <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>
<body>
<%@include file="../inc/top-bar.jsp" %>
<%@include file="../inc/side-bar.jsp" %>


<!--  contents start -->
<div class="contents" style="position:fixed; left: 15rem;">



<form action="${pageContext.request.contextPath}/product/addPro" method="post">
<table id="notice">
<tr><td>상품유형</td>
	<td><select name="pcategory" class="form-control" required="required">
		<option value="자재" selected="selected">자재</option>
		<option value="완제품">완제품</option>
		</select></td></tr>
<!-- 	<td>상품코드</td>  자재인지 완제품인지에 따라 코드가 자동으로 다르게 붙는다. -->
<tr><td>상품명</td>
	<td><input type="text" name="pname"></td></tr>
<tr><td>단가</td>
	<td><input type="text" name="pprice">원</td></tr>
<tr><td>초기입고량</td>
	<td><input type="text" name="pcount"></td>
	<td><select name="punit" class="form-control" required="required">
		<option value="EA" selected="selected">EA</option>
		</select></td>
	<td><input type="button" name="paddunit" value="단위추가" onclick ="window.open('${pageContext.request.contextPath}/product/addunit', '단위추가', 'width = 800, height = 600, left = (screen.width - width) / 2, top = (screen.height - height) / 2');"></td></tr>
	
<!-- <tr><td>거래처</td></tr> 검색해서 가지고 올것-->
	
</table>

<div id="table_search">
<input type="submit" value="상품추가" class="btn">
</div>
</form>


</div>
<!-- contents end -->


</body>
</html>