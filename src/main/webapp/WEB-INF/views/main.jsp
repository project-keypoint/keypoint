<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트메인</title>
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
<!-- MAIN CSS 적용-->
<link href="${pageContext.request.contextPath}/resources/css/main.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
</head>
<%@include file="../views/inc/top-bar.jsp"%>
<%@include file="../views/inc/side-bar.jsp"%>
<body>

<!-- Begin Page Content -->
<div class="main">
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                Earnings (Monthly)</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                Earnings (Annual)</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                                </div>
                                                <div class="col">
                                                    <div class="progress progress-sm mr-2">
                                                        <div class="progress-bar bg-info" role="progressbar"
                                                            style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                Pending Requests</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-comments fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Content Row -->

                    <div class="row">

                        <!-- Area Chart -->
                        <div class="col-xl-8 col-lg-7">
                            <div class="card shadow mb-4" style="height: auto;">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">월별 출고량</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body" style="">
                                    <div class="chart-area">
                                        <canvas id="myChart" class="main-chart9"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pie Chart -->
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
						<!--  Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">상품별 출고 비율</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
						<!--  Card Body -->
                                <div class="card-body" style="height: auto;">
                                    <div class="chart-pie pt-4 pb-2">
                                    	<canvas id="myChart2" class="main-chart" style="display: none;"></canvas>
                                        <canvas id="myChart3" class="main-chart"></canvas>
                                    </div>
                                    <div class="mt-4 text-center small">
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-primary"></i> Direct
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-success"></i> Social
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-info"></i> Referral
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <!-- Content Column -->
                        <div class="col-lg-6 mb-4">

                            <!-- Project Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Projects</h6>
                                </div>
                                <div class="card-body">
                                    <h4 class="small font-weight-bold">Server Migration <span
                                            class="float-right">20%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-danger" role="progressbar" style="width: 20%"
                                            aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">Sales Tracking <span
                                            class="float-right">40%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-warning" role="progressbar" style="width: 40%"
                                            aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">Customer Database <span
                                            class="float-right">60%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar" role="progressbar" style="width: 60%"
                                            aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">Payout Details <span
                                            class="float-right">80%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-info" role="progressbar" style="width: 80%"
                                            aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">Account Setup <span
                                            class="float-right">Complete!</span></h4>
                                    <div class="progress">
                                        <div class="progress-bar bg-success" role="progressbar" style="width: 100%"
                                            aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>



            </div>
            <!-- End of Main Content -->



<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/script/jquery-3.7.0.js"></script>
	<script type="text/javascript">
		// 차트1 pie
		var today = new Date(); // 현재 날짜를 얻음
		var labels = [];
		// 함수를 사용하여 날짜를 원하는 형식으로 포맷팅 (yyyy/mm)
		function formatDate(date) {
			var year = date.getFullYear();
			var month = (date.getMonth() + 1).toString().padStart(2, '0'); // 월은 0부터 시작하므로 1을 더하고 2자리로 포맷팅
			return year + '/' + month; // 년/월 형식으로 출력
		}
		// Generating labels for the last 6 months, including this month
		for (var i = 0; i < 6; i++) {
			var date = new Date(today.getFullYear(), today.getMonth() - i, 1); // 이전 달의 첫 번째 날을 얻음
			labels.push(formatDate(date));
		}
		// 배열을 반대로 정렬
		labels.reverse();
		var context = document.getElementById('myChart').getContext('2d');
		var myChart = new Chart(context, {
			type : 'line', // 차트의 형태
			data : { // 차트에 들어갈 데이터
				labels : labels,
				datasets : [
						{ //데이터1
							label : '', //차트 제목
							fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
							data : [ 111, 66, 25, 55, 43, 115 //x축 label에 대응되는 데이터 값
							],
							backgroundColor : [
							//색상
							'#224abe',
							'#4e73df',
							'#224abe',
							'#4e73df',
							'#224abe',
							'#4e73df'
// 							'rgba(230, 0, 8, 0.2)',
// 							'rgba(54, 162, 235, 0.2)',
// 							'rgba(255, 206, 86, 0.2)',
// 							'rgba(75, 185, 192, 0.2)',
// 							'rgba(153, 102, 255, 0.2)',
// 							'rgba(255, 166, 64, 0.2)'
							],
							borderColor : [
							//경계선 색상
							'#224abe',
							'#4e73df',
							'#224abe',
							'#4e73df',
							'#224abe',
							'#4e73df'
// 							'rgba(230, 0, 8, 1)',
// 							'rgba(54, 162, 235, 1)',
// 							'rgba(255, 206, 86, 1)',
// 							'rgba(75, 185, 192, 1)',
// 							'rgba(153, 102, 255, 1)',
// 							'rgba(255, 166, 64, 1)'
							],
							borderWidth : 4
						//경계선 굵기
						}// 데이터1끝
						, ]
			// 데이터전체 set 끝
			},
			options : {
				maintainAspectRatio: false, //
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}
			}
		});
		//차트2
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
		var context = document.getElementById('myChart2').getContext('2d');
		var myChart = new Chart(context, {
			type : 'bar', // 차트의 형태
			data : { // 차트에 들어갈 데이터
				labels : labels,
				datasets : [
						{ //데이터1
							label : '키보드1', //차트 제목
							fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
							data : [ 111, 66, 25, 55, 43, 115 //x축 label에 대응되는 데이터 값
							],
							backgroundColor : [
							//색상
							'red','red','red','red','red','red','red'
// 							'rgba(230, 0, 8, 0.2)',
// 							'rgba(230, 0, 8, 0.2)',
// 							'rgba(230, 0, 8, 0.2)',
// 							'rgba(230, 0, 8, 0.2)',
// 							'rgba(230, 0, 8, 0.2)',
// 							'rgba(230, 0, 8, 0.2)'
							],
							borderColor : [
							//경계선 색상
							'red','red','red','red','red','red','red'
// 							'rgba(230, 0, 8, 1)',
// 							'rgba(230, 0, 8, 1)',
// 							'rgba(230, 0, 8, 1)',
// 							'rgba(230, 0, 8, 1)',
// 							'rgba(230, 0, 8, 1)',
// 							'rgba(230, 0, 8, 1)'
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
							'orange','orange','orange','orange','orange','orange','orange'
// 							'rgba(54, 162, 235, 0.2)',
// 							'rgba(54, 162, 235, 0.2)',
// 							'rgba(54, 162, 235, 0.2)',
// 							'rgba(54, 162, 235, 0.2)',
// 							'rgba(54, 162, 235, 0.2)',
// 							'rgba(54, 162, 235, 0.2)',
// 							'rgba(54, 162, 235, 0.2)'
							],
							borderColor : [
							//경계선 색상
							'orange','orange','orange','orange','orange','orange','orange'
// 							'rgba(54, 162, 235, 1)',
// 							'rgba(54, 162, 235, 1)',
// 							'rgba(54, 162, 235, 1)',
// 							'rgba(54, 162, 235, 1)',
// 							'rgba(54, 162, 235, 1)',
// 							'rgba(54, 162, 235, 1)',
// 							'rgba(54, 162, 235, 1)' 
							],
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
							'yellow','yellow','yellow','yellow','yellow','yellow','yellow'
// 							'rgba(255, 206, 86, 0.2)',
// 							'rgba(255, 206, 86, 0.2)',
// 							'rgba(255, 206, 86, 0.2)',
// 							'rgba(255, 206, 86, 0.2)',
// 							'rgba(255, 206, 86, 0.2)',
// 							'rgba(255, 206, 86, 0.2)',
// 							'rgba(255, 206, 86, 0.2)' 
							],
							borderColor : [
							//경계선 색상
							'yellow','yellow','yellow','yellow','yellow','yellow','yellow'
// 							'rgba(255, 206, 86, 1)',
// 							'rgba(255, 206, 86, 1)',
// 							'rgba(255, 206, 86, 1)',
// 							'rgba(255, 206, 86, 1)',
// 							'rgba(255, 206, 86, 1)',
// 							'rgba(255, 206, 86, 1)',
// 							'rgba(255, 206, 86, 1)' 
							],
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
							'green','green','green','green','green','green','green'
// 							'rgba(75, 185, 192, 0.2)',
// 							'rgba(75, 185, 192, 0.2)',
// 							'rgba(75, 185, 192, 0.2)',
// 							'rgba(75, 185, 192, 0.2)',
// 							'rgba(75, 185, 192, 0.2)',
// 							'rgba(75, 185, 192, 0.2)',
// 							'rgba(75, 185, 192, 0.2)'
							],
							borderColor : [
							//경계선 색상
							'green','green','green','green','green','green','green'
// 							'rgba(75, 185, 192, 1)',
// 							'rgba(75, 185, 192, 1)',
// 							'rgba(75, 185, 192, 1)',
// 							'rgba(75, 185, 192, 1)',
// 							'rgba(75, 185, 192, 1)',
// 							'rgba(75, 185, 192, 1)',
// 							'rgba(75, 185, 192, 1)' 
							],
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
							'blue','blue','blue','blue','blue','blue','blue'
// 							'rgba(153, 102, 255, 0.2)',
// 							'rgba(153, 102, 255, 0.2)',
// 							'rgba(153, 102, 255, 0.2)',
// 							'rgba(153, 102, 255, 0.2)',
// 							'rgba(153, 102, 255, 0.2)',
// 							'rgba(153, 102, 255, 0.2)',
// 							'rgba(153, 102, 255, 0.2)' 
							],
							borderColor : [
							//경계선 색상
							'blue','blue','blue','blue','blue','blue','blue'
// 							'rgba(153, 102, 255, 1)',
// 							'rgba(153, 102, 255, 1)',
// 							'rgba(153, 102, 255, 1)',
// 							'rgba(153, 102, 255, 1)',
// 							'rgba(153, 102, 255, 1)',
// 							'rgba(153, 102, 255, 1)',
// 							'rgba(153, 102, 255, 1)' 
							],
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
							'purple','purple','purple','purple','purple','purple','purple'
// 							'rgba(255, 166, 64, 0.2)',
// 							'rgba(255, 166, 64, 0.2)',
// 							'rgba(255, 166, 64, 0.2)',
// 							'rgba(255, 166, 64, 0.2)',
// 							'rgba(255, 166, 64, 0.2)',
// 							'rgba(255, 166, 64, 0.2)',
// 							'rgba(255, 166, 64, 0.2)' 
							],
							borderColor : [
							//경계선 색상
							'purple','purple','purple','purple','purple','purple','purple'
// 							'rgba(255, 166, 64, 1)',
// 							'rgba(255, 166, 64, 1)',
// 							'rgba(255, 166, 64, 1)',
// 							'rgba(255, 166, 64, 1)',
// 							'rgba(255, 166, 64, 1)',
// 							'rgba(255, 166, 64, 1)',
// 							'rgba(255, 166, 64, 1)' 
							],
							borderWidth : 1
						//경계선 굵기
						}// 데이터6끝
						, ]
			// 데이터전체 set 끝
			},
			options : {
				maintainAspectRatio: false, //
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}
			}
		});
		// 차트3 pie
		var context = document.getElementById('myChart3').getContext('2d');
		var myChart = new Chart(context,
				{
					type : 'pie', // 차트의 형태
					data : { // 차트에 들어갈 데이터
						labels : [
						//x 축
						'키보드1', '키보드2', '키보드3', '키보드4', '키보드5', '키보드6', ],
						datasets : [ { //데이터
							label : 'test1', //차트 제목
							fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
							data : [ 81, 159, 265, 170, 213, 156 //x축 label에 대응되는 데이터 값
							],
							backgroundColor : [
							//색상
							'red','orange','yellow','green','blue','purple'
// 							'rgba(255, 99, 132, 0.2)',
// 							'rgba(54, 162, 235, 0.2)',
// 							'rgba(255, 206, 86, 0.2)',
// 							'rgba(75, 192, 192, 0.2)',
// 							'rgba(153, 102, 255, 0.2)',
// 							'rgba(255, 159, 64, 0.2)' 
							],
							borderColor : [
							//경계선 색상
							'red','orange','yellow','green','blue','purple'
// 							'rgba(255, 99, 132, 1)',
// 							'rgba(54, 162, 235, 1)',
// 							'rgba(255, 206, 86, 1)',
// 							'rgba(75, 192, 192, 1)',
// 							'rgba(153, 102, 255, 1)',
// 							'rgba(255, 159, 64, 1)' 
							],
							borderWidth : 1
						//경계선 굵기
						} /* ,
											                        {
											                            label: 'test2',
											                            fill: false,
											                            data: [
											                                8, 34, 12, 24
											                            ],
											                            backgroundColor: 'rgb(157, 109, 12)',
											                            borderColor: 'rgb(157, 109, 12)'
											                        } */
						]
					},
					options : {
						maintainAspectRatio: false, //
						scales : {
							yAxes : [ {
								ticks : {
									beginAtZero : true
								}
							} ]
						}
					}
				});
		// 차트4
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

		var context = document.getElementById('myChart4').getContext('2d');

		var myChart = new Chart(context, {
			type : 'bar', // 차트의 형태
			data : { // 차트에 들어갈 데이터
				labels : labels,
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
		}); // 차트끝
</script>

	<script type="text/javascript">
$(document).ready(function(){
    // 페이지 로딩 시 자동으로 공지사항 목록을 출력합니다.
    $.ajax({
        url: '${pageContext.request.contextPath}/notice/recentNotice',
        dataType: 'json',
        success: function(result){
            // json 배열 반복, 추가 출력
            $.each(result, function(index, item){
                var date = new Date(item.noticeDate);
                var formattedDate = date.getFullYear() + '.' + (date.getMonth() + 1) + '.' + date.getDate(); // 날짜 형식 수정
                
                // 각 항목을 테이블로 나누어 표시
                var row = $('<tr>', { class: 'contxt' }); // 테이블 행 생성
                
                var categoryCell = $('<td>').text(item.noticeCategory); // 카테고리 셀 생성
                row.append(categoryCell); // 카테고리 셀을 행에 추가
                
                var subjectCell = $('<td>').text(item.noticeSubject); // 제목 셀 생성
                row.append(subjectCell); // 제목 셀을 행에 추가
                
                var readcountCell = $('<td>').text(item.noticeReadcount); // 조회수 셀 생성
                row.append(readcountCell); // 조회수 셀을 행에 추가
                
                var dateCell = $('<td>').text(formattedDate); // 날짜 셀 생성
                row.append(dateCell); // 날짜 셀을 행에 추가
                
                // 행 전체에 링크 걸기
                row.click(function() {
                    window.location.href = '${pageContext.request.contextPath}/notice/noticeContent?noticeNum=' + item.noticeNum;
                });
                
                $('table').append(row); // 행을 테이블에 추가
            });                                                                
        }
    });//ajax
});
</script>
</body>
</html>