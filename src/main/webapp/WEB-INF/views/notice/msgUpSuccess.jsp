<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성공</title>
</head>
<body>


<script type="text/javascript">
// // 새창 닫히면서 목록으로 이동(목록도 새로고침)
// alert("처리가 완료되었습니다.");
// if (window.opener && !window.opener.closed) {
//     window.opener.location.href = '${pageContext.request.contextPath}/notice/noticeList';
// }
// window.close();

 
    alert("처리가 완료되었습니다.");
    if (window.opener && !window.opener.closed) {
        window.opener.location.reload();
    }
    window.close();
</script>

</body>
</html>
