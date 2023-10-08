<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>키포인트</title>

<!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
</head>
<%@include file="../views/inc/top-bar.jsp"%>
<%@include file="../views/inc/side-bar.jsp"%>
<body id="page-top">

	<!--  contents start -->
	<div class="contents"
		style="position: absolute; left: 15rem; height: 100%; overflow: visible;">
		<!-- Main Content -->
		<a href="${pageContext.request.contextPath}/main/testpage"
			class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" style= "float:right;">
			<i class="fas fa-download fa-sm text-white-50"></i> testpage</a>
		<!-- Begin Page Content -->
		<div class="container-fluid">
			<h2>제품 출고 현황</h2>
			<div style="width: 1500px; height: 900px;">
				<!--차트가 그려질 부분-->
				<canvas id="myChart"></canvas>
			</div>

		</div>
		<!-- /.container-fluid -->

		<!-- End of Main Content -->
	</div>
	<!-- contents end -->
	<script type="text/javascript">
		var context = document.getElementById('myChart').getContext('2d');
		var myChart = new Chart(context, {
			type : 'bar', // 차트의 형태
			data : { // 차트에 들어갈 데이터
				labels : [
				//x 축
				'2023/10/19', '2023/10/20', '2023/10/21', '2023/10/22',
						'2023/10/23', '2023/10/24', '2023/10/25' ],
				datasets : [
						{ //데이터1
							label : '키보드1', //차트 제목
							fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
							data : [ 111, 66, 25, 55, 43, 115, 23 //x축 label에 대응되는 데이터 값
							],
							backgroundColor : [
							//색상
							'rgba(230, 0, 8, 0.2)', 'rgba(230, 0, 8, 0.2)',
									'rgba(230, 0, 8, 0.2)',
									'rgba(230, 0, 8, 0.2)',
									'rgba(230, 0, 8, 0.2)',
									'rgba(230, 0, 8, 0.2)',
									'rgba(230, 0, 8, 0.2)'

							],
							borderColor : [
							//경계선 색상
							'rgba(230, 0, 8, 1)', 'rgba(230, 0, 8, 1)',
									'rgba(230, 0, 8, 1)', 'rgba(230, 0, 8, 1)',
									'rgba(230, 0, 8, 1)', 'rgba(230, 0, 8, 1)',
									'rgba(230, 0, 8, 1)', 'rgba(230, 0, 8, 1)'

							//                                 
							],
							borderWidth : 1
						//경계선 굵기
						}// 데이터1끝
						,
						{ //데이터2
							label : '키보드2', //차트 제목
							fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
							data : [ 91, 82, 54, 111, 44, 31, 101 //x축 label에 대응되는 데이터 값
							],
							backgroundColor : [
							//색상

							'rgba(54, 162, 235, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(54, 162, 235, 0.2)'
							//                                 
							],
							borderColor : [
							//경계선 색상

							'rgba(54, 162, 235, 1)', 'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(54, 162, 235, 1)' ],
							borderWidth : 1
						//경계선 굵기
						}// 데이터2끝 
						,
						{ //데이터3
							label : '키보드3', //차트 제목
							fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
							data : [ 121, 119, 95, 88, 81, 66, 25 //x축 label에 대응되는 데이터 값
							],
							backgroundColor : [
							//색상
							'rgba(255, 206, 86, 0.2)',
									'rgba(255, 206, 86, 0.2)',
									'rgba(255, 206, 86, 0.2)',
									'rgba(255, 206, 86, 0.2)',
									'rgba(255, 206, 86, 0.2)',
									'rgba(255, 206, 86, 0.2)',
									'rgba(255, 206, 86, 0.2)' ],
							borderColor : [
							//경계선 색상
							'rgba(255, 206, 86, 1)', 'rgba(255, 206, 86, 1)',
									'rgba(255, 206, 86, 1)',
									'rgba(255, 206, 86, 1)',
									'rgba(255, 206, 86, 1)',
									'rgba(255, 206, 86, 1)',
									'rgba(255, 206, 86, 1)' ],
							borderWidth : 1
						//경계선 굵기
						}// 데이터3끝
						,
						{ //데이터4
							label : '키보드4', //차트 제목
							fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
							data : [ 71, 69, 55, 90, 93, 116, 145 //x축 label에 대응되는 데이터 값
							],
							backgroundColor : [
							//색상
							'rgba(75, 185, 192, 0.2)',
									'rgba(75, 185, 192, 0.2)',
									'rgba(75, 185, 192, 0.2)',
									'rgba(75, 185, 192, 0.2)',
									'rgba(75, 185, 192, 0.2)',
									'rgba(75, 185, 192, 0.2)',
									'rgba(75, 185, 192, 0.2)'

							],
							borderColor : [
							//경계선 색상
							'rgba(75, 185, 192, 1)', 'rgba(75, 185, 192, 1)',
									'rgba(75, 185, 192, 1)',
									'rgba(75, 185, 192, 1)',
									'rgba(75, 185, 192, 1)',
									'rgba(75, 185, 192, 1)',
									'rgba(75, 185, 192, 1)' ],
							borderWidth : 1
						//경계선 굵기
						}// 데이터4끝
						,
						{ //데이터5
							label : '키보드5', //차트 제목
							fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
							data : [ 91, 39, 55, 60, 83, 76, 95 //x축 label에 대응되는 데이터 값
							],
							backgroundColor : [
							//색상
							'rgba(153, 102, 255, 0.2)',
									'rgba(153, 102, 255, 0.2)',
									'rgba(153, 102, 255, 0.2)',
									'rgba(153, 102, 255, 0.2)',
									'rgba(153, 102, 255, 0.2)',
									'rgba(153, 102, 255, 0.2)',
									'rgba(153, 102, 255, 0.2)' ],
							borderColor : [
							//경계선 색상
							'rgba(153, 102, 255, 1)', 'rgba(153, 102, 255, 1)',
									'rgba(153, 102, 255, 1)',
									'rgba(153, 102, 255, 1)',
									'rgba(153, 102, 255, 1)',
									'rgba(153, 102, 255, 1)',
									'rgba(153, 102, 255, 1)' ],
							borderWidth : 1
						//경계선 굵기
						}// 데이터5끝
						,
						{ //데이터6
							label : '키보드6', //차트 제목
							fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
							data : [ 111, 219, 115, 20, 73, 56, 75 //x축 label에 대응되는 데이터 값
							],
							backgroundColor : [
							//색상
							'rgba(255, 166, 64, 0.2)',
									'rgba(255, 166, 64, 0.2)',
									'rgba(255, 166, 64, 0.2)',
									'rgba(255, 166, 64, 0.2)',
									'rgba(255, 166, 64, 0.2)',
									'rgba(255, 166, 64, 0.2)',
									'rgba(255, 166, 64, 0.2)' ],
							borderColor : [
							//경계선 색상
							'rgba(255, 166, 64, 1)', 'rgba(255, 166, 64, 1)',
									'rgba(255, 166, 64, 1)',
									'rgba(255, 166, 64, 1)',
									'rgba(255, 166, 64, 1)',
									'rgba(255, 166, 64, 1)',
									'rgba(255, 166, 64, 1)' ],
							borderWidth : 1
						//경계선 굵기
						}// 데이터6끝
						,
						{ //데이터7
							label : '키보드7', //차트 제목
							fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
							data : [ 121, 119, 215, 120, 123, 216, 45 //x축 label에 대응되는 데이터 값
							],
							backgroundColor : [
							//색상
							'rgba(255, 0, 128, 0.2)', 'rgba(255, 0, 128, 0.2)',
									'rgba(255, 0, 128, 0.2)',
									'rgba(255, 0, 128, 0.2)',
									'rgba(255, 0, 128, 0.2)',
									'rgba(255, 0, 128, 0.2)',
									'rgba(255, 0, 128, 0.2)' ],
							borderColor : [
							//경계선 색상
							'rgba(255, 0, 128, 1)', 'rgba(255, 0, 128, 1)',
									'rgba(255, 0, 128, 1)',
									'rgba(255, 0, 128, 1)',
									'rgba(255, 0, 128, 1)',
									'rgba(255, 0, 128, 1)',
									'rgba(255, 0, 128, 1)' ],
							borderWidth : 1
						//경계선 굵기
						}// 데이터7끝
						,
						{ //데이터8
							label : '키보드8', //차트 제목
							fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
							data : [ 211, 149, 75, 210, 23, 146, 55 //x축 label에 대응되는 데이터 값
							],
							backgroundColor : [
							//색상
							'rgba(0, 255, 213, 0.2)', 'rgba(0, 255, 213, 0.2)',
									'rgba(0, 255, 213, 0.2)',
									'rgba(0, 255, 213, 0.2)',
									'rgba(0, 255, 213, 0.2)',
									'rgba(0, 255, 213, 0.2)',
									'rgba(0, 255, 213, 0.2)' ],
							borderColor : [
							//경계선 색상
							'rgba(0, 255, 213, 1)', 'rgba(0, 255, 213, 1)',
									'rgba(0, 255, 213, 1)',
									'rgba(0, 255, 213, 1)',
									'rgba(0, 255, 213, 1)',
									'rgba(0, 255, 213, 1)',
									'rgba(0, 255, 213, 1)' ],
							borderWidth : 1
						//경계선 굵기
						}// 데이터8끝
						, ]
			// 데이터전체 set 끝
			},
			options : {
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}
			}
		});
	</script>

</body>
</html>