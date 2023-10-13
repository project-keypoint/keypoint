<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항수정</title>
	<!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <!-- customer CSS 적용-->
    <link href="${pageContext.request.contextPath}/resources/css/notice.css" rel="stylesheet">
</head>

<body>
<div class="main-details">
<form action="${pageContext.request.contextPath}/notice/noticeUpdatePro" method="post" onsubmit="return validateForm()">

<div class="forms-group-customer">
<div class="page-title-popup">공지사항수정</div>





<div class="form-group-customer" style="display: none;">
<p>글번호</p>
<input type="text" id="noticeNum" name="noticeNum" class="form-control search-input" value="${noticeDTO.noticeNum}">
</div>

<div class="form-group-customer">
<p>제목</p>
<input type="text" id="noticeSubject" name="noticeSubject" class="form-control search-input" value="${noticeDTO.noticeSubject}">
</div>

<div class="form-group-customer">
<p>구분</p>
<input type="text" id="noticeCategory" name="noticeCategory" class="form-control search-input" value="${noticeDTO.noticeCategory}" readonly="readonly">
</div>

<div class="form-group-customer">
<p>내용</p>
<textarea id="noticeContent" name="noticeContent" class="form-control search-input"  style="height: 300px; resize: none;">${noticeDTO.noticeContent}</textarea>
</div>

<!-- <div class="form-group-customer"> -->
<!-- <p>첨부파일</p> -->
<!-- <input type="text" id="noticeFile" name="noticeFile" class="form-control search-input"> -->
<!-- </div> -->
<br>
</div>


<div class="details-buttons">
<input type="submit" id="noticeSubmit" value="수정" class="btn btn-primary mybutton1">
<input type="button" value="취소" class="btn btn-secondary mybutton1" onClick="window.close()">
</div>
</form><!-- form 끝 -->
</div><!-- main-details -->





<!-- 데이트피커 타임피커를 사용하기위한 j쿼리 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">







</script>
</body>
</html>