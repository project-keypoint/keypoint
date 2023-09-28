<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/receive/insertPro" method="post">
testCode : <input type="text" name="testCode"><br>
testString : <input type="text" name="testString"><br>
testInt : <input type="text" name="testInt"><br>
testDate : (우선NULL)<br>
<input type="submit" value="insert"><br>
</form>
</body>
</html>