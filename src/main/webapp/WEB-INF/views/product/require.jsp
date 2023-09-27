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

<input type="button" id="productjoin" value="상품추가" onclick ="window.open('${pageContext.request.contextPath}/product/addreq', '상품추가', 'width = 800, height = 600, left = (screen.width - width) / 2, top = (screen.height - height) / 2');">


<table border="1">
<tr><td>상품유형</td><td>상품코드</td><td>상품명</td><td>단가</td><td>재고량</td><td>단위</td><td>거래처</td></tr>


<%-- <c:forEach var="memberDTO" items="${memberList }">
<tr><td>${memberDTO.id }</td>
    <td>${memberDTO.pass }</td>
    <td>${memberDTO.name }</td>
    <td>${memberDTO.date }</td></tr>	
</c:forEach> --%>

</table>


</div>
<!-- contents end -->


</body>
</html>