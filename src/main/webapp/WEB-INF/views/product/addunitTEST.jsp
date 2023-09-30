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



<form action="${pageContext.request.contextPath}/product/addunitPro" method="post">
<table id="notice">
<tr><td>단위</td>
	<td><input type="text" name="paddunit"></td></tr>
	
</table>

<div id="table_search">
<input type="submit" value="추가" class="btn">
</div>
</form>


</div>
<!-- contents end -->


</body>
</html>