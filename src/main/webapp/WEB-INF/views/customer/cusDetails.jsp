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
<div class="page-title-popup">거래처상세</div>


<div class="form-group-customer">
<p>거래처코드</p>
<input type="text" id="cusCode" name="cusCode" class="form-control search-input" placeholder="${customerDTO.cusCode}" readonly="readonly">
</div>


<div class="form-group-customer">
<p>거래처구분</p>
<input type="text" id="cusCategory" name="cusCategory" class="form-control search-input" placeholder="${customerDTO.cusCategory}" readonly="readonly">
</div>

<div class="form-group-customer">
<p>업태</p>
<input type="text" id="cusBusiness" name="cusBusiness" class="form-control search-input" placeholder="${customerDTO.cusBusiness}" readonly="readonly">
</div>


<div class="form-group-customer">
<p>종목</p>
<input type="text" id="cusType" name="cusType" class="form-control search-input" placeholder="${customerDTO.cusType}" readonly="readonly">
</div>


<div class="form-group-customer">
<p>사업자번호</p>
<input type="text" id="cusNumber" name="cusNumber" class="form-control search-input" placeholder="${customerDTO.cusNumber}" readonly="readonly">
</div>



<div class="form-group-customer">
<p>거래처명</p>
<input type="text" id="cusName" name="cusName" class="form-control search-input" placeholder="${customerDTO.cusName}" readonly="readonly">
</div>


<div class="form-group-customer">
<p>대표명</p>
<input type="text" id="cusRep" name="cusRep" class="form-control search-input" placeholder="${customerDTO.cusRep}" readonly="readonly">
</div>


<div class="form-group-customer">
<p>대표전화</p>
<input type="text" id="cusTel" name="cusTel" class="form-control search-input" placeholder="${customerDTO.cusTel}" readonly="readonly">
</div>


<div class="form-group-customer">
<p>주소</p>
<input type="text" id="cusZonecode" name="cusZonecode" class="form-control search-input" placeholder="${customerDTO.cusZonecode}" readonly="readonly">
</div>

<div class="form-group-customer">
<p></p>
<input type="text" id="cusAddress" name="cusAddress" class="form-control search-input" placeholder="${customerDTO.cusAddress}" readonly="readonly">
</div>

<div class="form-group-customer">
<p></p>
<input type="text" id="cusAddress_dtail" name="cusAddress_dtail" class="form-control search-input" placeholder="${customerDTO.cusAddress_dtail}" readonly="readonly">
</div>

<div class="form-group-customer">
<p>담당자</p>
<input type="text" id="cusResp" name="cusResp" class="form-control search-input" placeholder="${customerDTO.cusResp}" readonly="readonly">
</div>

<div class="form-group-customer">
<p>담당자 전화번호</p>
<input type="text" id="cusPhone" name="cusPhone" class="form-control search-input" placeholder="${customerDTO.cusPhone}" readonly="readonly">
</div>


<div class="form-group-customer">
<p>담당자 이메일</p>
<input type="text" id="cusEmail" name="cusEmail" class="form-control search-input" placeholder="${customerDTO.cusEmail}" readonly="readonly">
</div>

<div class="form-group-customer">
<p>FAX</p>
<input type="text" id="cusFax" name="cusFax" class="form-control search-input" placeholder="${customerDTO.cusFax}" readonly="readonly">
</div>

<div class="form-group-customer">
<p>홈페이지</p>
<input type="text" id="cusHome" name="cusHome" class="form-control search-input" placeholder="${customerDTO.cusHome}" readonly="readonly">
</div>

<div class="form-group-customer">
<p>적요</p>
<textarea id="cusMemo" name="cusMemo" class="form-control search-input" style="height: 200px; resize: none;" placeholder="${customerDTO.cusMemo}" readonly="readonly"></textarea>
</div>

<br>



<div class="form-group-customer">
<p>상태</p>
<input type="text" id="cusStatus" name="cusStatus" class="form-control search-input" placeholder="${customerDTO.cusStatus}" readonly="readonly">
</div>




</div>
<div class="details-buttons">
<c:choose>    
    <c:when test = "${employeeDTO.empRole >= 2}">
<input type="button" value="수정" class="btn btn-primary mybutton1" onclick="location.href='${pageContext.request.contextPath}/customer/cusUpdate?cusCode=${customerDTO.cusCode}'">
    </c:when>
    <c:otherwise>
    </c:otherwise>
</c:choose>
<input type="button" value="확인" class="btn btn-secondary mybutton1" onClick="window.close()">
</div>
</div><!-- main-details -->

<script>



//우편번호(zonecode) 가져오기
var zonecode = document.getElementById("zonecode").value;

// 상세주소(cusAddress_dtail) 가져오기
var cusAddress_dtail = document.getElementById("cusAddress_dtail").value;



</script>
</body>
</html>