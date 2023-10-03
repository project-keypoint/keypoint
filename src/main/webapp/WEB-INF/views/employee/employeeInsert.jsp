<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원등록</title>

</head>
<body>
<form action="${pageContext.request.contextPath}/employee/add" name="employeeInsert" id="employeeInsert" method="post">
<input type="text" name = "empId" id="empId">
<input type="text" id="empPass">
<input type="text" id="empSalt">
<input type="text" id="empName">
<input type="text" id="empPhoto">
<input type="text" id="empBirth">
<input type="text" id="empPhone">
<input type="text" id="empEmail">
<input type="text" id="empAddress">
<input type="text" id="empStatus">
<input type="text" id="departmentId">
<input type="text" id="departmentName">
<input type="text" id="empPosition">
<input type="text" id="empHiredate">
<input type="text" id="empRole">
<input type="text" id="empLeavedate">
<input type="submit" value="등록" class="btn btn-primary mybutton1">
</form>

</body>
</html>