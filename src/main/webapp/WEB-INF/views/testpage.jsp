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
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
</head>
<body>
<%@include file="../views/inc/top-bar.jsp" %>
<%@include file="../views/inc/side-bar.jsp" %>


<!--  contents start -->
<div class="contents" style="position: absolute;; left: 15rem;">

<div class="page-title">제품 출고 현황</div>
<div style="width: 1500px; height: 900px;">
	<!--차트가 그려질 부분-->
	<canvas id="myChart"></canvas>
</div>


</div>
<!-- contents end -->
<script type="text/javascript">
    var today = new Date();
    var labels = [];
    
    // 함수를 사용하여 날짜를 원하는 형식으로 포맷팅
    function formatDate(date) {
        var year = date.getFullYear();
        var month = (date.getMonth() + 1).toString().padStart(2, '0'); // 월은 0부터 시작하므로 1을 더하고 2자리로 포맷팅
        var day = date.getDate().toString().padStart(2, '0'); // 일을 2자리로 포맷팅
        return year + '.' + month + '.' + day;
    }

    // Generating labels for 3 days before today
    for (var i = 3; i >= 1; i--) {
        var date = new Date(today);
        date.setDate(today.getDate() - i);
        labels.push(formatDate(date));
    }

    // Adding today's label
    labels.push(formatDate(today));

    // Generating labels for 3 days after today
    for (var i = 1; i <= 3; i++) {
        var date = new Date(today);
        date.setDate(today.getDate() + i);
        labels.push(formatDate(date));
    }

    var context = document
        .getElementById('myChart')
        .getContext('2d');
    
    var myChart = new Chart(context, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: 'test1',
                fill: false,
                data: [21, 19, 25, 20, 23, 26, 25],
                backgroundColor: 'rgba(255, 99, 132, 0.2)',
                borderColor: 'rgba(255, 99, 132, 1)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
</script>
</body>
</html>

</body>
</html>
    </body>
</html>
</body>
</html>