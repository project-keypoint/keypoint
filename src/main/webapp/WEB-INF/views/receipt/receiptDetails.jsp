<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입고상세</title>
	<!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <!-- 수주 CSS 적용-->
    <link href="${pageContext.request.contextPath}/resources/css/receive.css" rel="stylesheet">
</head>
<body>

<div class="main-details">

<div class="forms-group-receive">
<div class="page-title-popup">입고상세</div>

<div class="form-group-receive">
<p>입고코드</p>
<input type="text" id="grCode" name="grCode" class="form-control search-input" placeholder="${receiptDTO.grCode}" readonly>
</div>

<div class="search-bar-popup">
<div class="form-group-receive">
<p>발주서</p>
<input type="text" id="poCode" name="poCode" class="form-control search-input inputcode" placeholder="${receiptDTO.poCode}" readonly>
<!-- <input type="text" id="materialName" name="materialName" class="form-control search-input inputname" placeholder="자재명" readonly> -->
</div>
</div>

<div class="form-group-receive">
<p>입고수량</p>
<input type="number" id="grCount" name="grCount" class="form-control search-input" placeholder="${receiptDTO.grCount}" min="0" readonly>
</div>

<div class="search-bar-popup">
<div class="form-group-receive">
<p>당담자</p>
<input type="text" id="empName" name="empName" class="form-control search-input inputcode" placeholder="${receiptDTO.grOwner}" readonly>
</div>
</div>


<!-- <div class="form-group-receive"> -->
<!-- <p>담당자</p> -->
<!-- <input type="text" id="grOwner" name="grOwner" class="form-control search-input inputcode" placeholder="담당자검색"> -->
<!-- </div> -->

<div class="form-group-receive">
<p>입고등록</p>
<input type="text" id="grSdate" name="grSdate" class="form-control search-input" placeholder="${receiptDTO.grSdate}" readonly>
</div>

<div class="form-group-receive">
<p>입고예정</p>
<input type="text" id="grDate" name="grDate" class="form-control search-input" placeholder="${receiptDTO.grDate}" readonly>
</div>

<div class="form-group-receive">
<p>입고상태</p>
<input type="text" id="grStatus" name="grStatus" class="form-control search-input" value="${receiptDTO.grStatus}" readonly>
</div>

</div>
<div class="details-buttons">
<input type="button" value="수정" class="btn btn-primary mybutton1" onclick="location.href='${pageContext.request.contextPath}/receipt/receiptUpdate?grCode=${receiptDTO.grCode}'">
</div>

</div><!-- main-details -->





</body>
</html>