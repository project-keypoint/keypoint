<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>자재검색</title>
    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h1>자재검색</h1>
        <!-- 자재 검색 결과를 표시할 테이블 -->
        <table class="table">
            <thead>
                <tr>
                    <th>자재코드</th>
                    <th>자재명</th>
                    <th>자재단가</th>
                </tr>
            </thead>
            <tbody>
                <!-- 자재 정보를 포함하는 각 행 -->
                <tr class="material-row">
                    <td class="material-code">M001</td>
                    <td class="material-name">자재1</td>
                    <td class="material-price">1000원</td>
                </tr>
                <tr class="material-row">
                    <td class="material-code">M002</td>
                    <td class="material-name">자재2</td>
                    <td class="material-price">2000원</td>
                </tr>
                <!-- 필요한 만큼 자재 정보를 추가하세요. -->
            </tbody>
        </table>
    </div>
    
    
    <script>
	    $(document).ready(function() {
	        $("tr.material-row").click(function() {
	            var materialCode = $(this).find(".material-code").text();
	            var materialName = $(this).find(".material-name").text();
	            var materialPrice = $(this).find(".material-price").text();
	
	            // 부모 창으로 정보 전달
	            if (window.opener && !window.opener.closed) {
	                window.opener.setMaterialInfo(materialCode, materialName, materialPrice);
	            }
	            window.close(); // 팝업 창 닫기
	        });
	    });
	</script>
    
    
    
</body>
</html>
