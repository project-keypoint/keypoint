<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처상세</title>
	<!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <!-- customer CSS 적용-->
    <link href="${pageContext.request.contextPath}/resources/css/customer.css" rel="stylesheet">
</head>
<body>
<div class="main-details">


<div class="forms-group-customer">
<div class="page-title-popup">거래처 상세</div>


<div class="form-group-customer">
<p>거래처코드</p>
<input type="text" id="cusCode" name="cusCode" class="form-control search-input" placeholder="${custoemrDTO.cusCode}" readonly>
</div>


<div class="form-group-customer">
<p>거래처구분</p>
<input type="text" id="cusCategory" name="cusCategory" class="form-control search-input" placeholder="${customerDTO.cusCategory}">
</div>


<div class="form-group-customer">
<p>사업자번호</p>
<input type="text" id="cusNumber" class="form-control search-input" placeholder="${customerDTO.cusNumber}">
</div>


<div class="form-group-customer">
<p>거래처명</p>
<input type="text" id="cusName" name="cusName" class="form-control search-input" placeholder="${cumstomerDTO.cusName}">
</div>


<div class="form-group-customer">
<p>대표명</p>
<input type="text" id="cusRep" name="cusRep" class="form-control search-input" placeholder="${cumstomerDTO.cusRep}">
</div>


<div class="form-group-customer">
<p>대표전화</p>
<input type="text" id="cusTel" name="cusTel" class="form-control search-input" placeholder="${cumstomerDTO.cusTel}"> 
</div>


<div class="form-group-customer">
<p>업태</p>
<select id="cusType" name="cusType" class="form-control search-input">
        <option value="도매 및 소매업">도매 및 소매업</option>
        <option value="제조업">제조업</option>
</select>
</div>


<div class="form-group-customer">
<p>종목</p>
<select id="cusType" name="cusType" class="form-control search-input">
        <option value="키캡">키캡</option>
        <option value="스위치(적축)">스위치(적축)</option>
        <option value="스위치(청축)">스위치(청축)</option>
        <option value="스위치(갈축)">스위치(갈축)</option>
        <option value="프레임(상부)">프레임(상부)</option>
        <option value="프레임(하부)">프레임(하부)</option>
        <option value="흡음제">흡음제</option>
        <option value="플레이트">플레이트</option>
        <option value="PCB">PCB</option>
        <option value="키보드(적축)">키보드(적축)</option>
        <option value="키보드(청축)">키보드(청축)</option>
        <option value="키보드(갈축)">키보드(갈축)</option>
</select>
</div>


<div class="form-group-customer">
<p>주소</p>
<input type="text" id="cusAddress" name="cusAddress" class="form-control search-input" placeholder="${cumstomerDTO.cusAddress}">
</div>

<div class="form-group-customer">
<p>담당자</p>
<input type="text" id="cusResp" name="cusResp" class="form-control search-input" placeholder="${cumstomerDTO.cusResp}">
</div>

<div class="form-group-customer">
<p>담당자 전화번호</p>
<input type="text" id="cusPhone" name="cusPhone" class="form-control search-input" placeholder="${cumstomerDTO.cusPhone}">
</div>

<div class="form-group-customer">
<p>담당자 이메일</p>
<input type="text" id="cusEmail" name="cusEmail" class="form-control search-input" placeholder="${cumstomerDTO.cusEmail}">
</div>

<div class="form-group-customer">
<p>FAX</p>
<input type="text" id="cusFax" name="cusFax" class="form-control search-input" placeholder="${cumstomerDTO.cusFax}">
</div>

<div class="form-group-customer">
<p>홈페이지</p>
<input type="text" id="cusHome" name="cusHome" class="form-control search-input" placeholder="${cumstomerDTO.cusHome}">
</div>

<div class="form-group-customer">
<p>적요</p>
<input type="text" id="cusMemo" name="cusMemo" class="form-control search-input" style="height: 200px; width:280px;" placeholder="${cumstomerDTO.cusMemo}"><br>
</div>

<br>



<div class="form-group-customer">
<p>상태</p>
<select id="cusStatus" name="cusStatus" class="form-control search-input">
        <option value="거래중">거래중</option>
        <option value="거래중지">거래중지</option>
</select>
</div>
</div>



<div class="details-buttons">
<input type="button" value="수정" class="btn btn-primary mybutton1" onclick="location.href='${pageContext.request.contextPath}/receive/receiveUpdate?roCode=${receiveDTO.roCode}'">
<input type="button" value="삭제" class="btn btn-secondary mybutton1" onclick="confirmDelete()">
</div>
</div><!-- main-details -->






<script>
// 삭제 확인메세지
function confirmDelete() {
    if (confirm("정말로 삭제하시겠습니까?")) {
        location.href = '${pageContext.request.contextPath}/receive/receiveDelete?roCode=${receiveDTO.roCode}';
    } else {
    	
    }
}
</script>
</body>
</html>