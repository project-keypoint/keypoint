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
		<div id="sessionTimer"></div>
		<a href="${pageContext.request.contextPath}/main/testpage"
			class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"
			style="float: right;"> <i
			class="fas fa-download fa-sm text-white-50"></i> 테스트
		</a>
		<!-- Begin Page Content -->
		<h2>제품 출고 현황</h2> 
		
		<div class="main-chart"
			style="display: flex; flex-direction: row; flex-wrap: wrap;">

			<div style="width: 750px; height: 400px; margin:30px; ">월별출고량
				<!--차트가 그려질 부분-->
				<canvas id="myChart"></canvas>
			</div>
			<div style="width: 750px; height: 400px; margin:30px; ">차트2
				<!--차트가 그려질 부분-->
				<canvas id="myChart2"></canvas>
			</div>
			<div style="width: 750px; height: 400px; margin:30px; ">출고제품비율
				<!--차트가 그려질 부분-->
				<canvas id="myChart3"></canvas>
			</div>
			<div style="width: 750px; height: 400px; margin:30px; ">차트4
				<!--차트가 그려질 부분-->
				<canvas id="myChart4"><canvas>
			</div>
			

		</div>
		<!-- /.container-fluid -->

		<!-- End of Main Content -->
	</div>
	<!-- contents end -->
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
							label : '키보드1', //차트 제목
							fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
							data : [ 111, 66, 25, 55, 43, 115 //x축 label에 대응되는 데이터 값
							],
							backgroundColor : [
							//색상
							'rgba(230, 0, 8, 0.2)', 
							'rgba(54, 162, 235, 0.2)',
							'rgba(255, 206, 86, 0.2)',
							'rgba(75, 185, 192, 0.2)',
							'rgba(153, 102, 255, 0.2)',
							'rgba(255, 166, 64, 0.2)'
							

							],
							borderColor : [
							//경계선 색상
							'rgba(230, 0, 8, 1)', 
							'rgba(54, 162, 235, 1)',
							'rgba(255, 206, 86, 1)', 
							'rgba(75, 185, 192, 1)',
							'rgba(153, 102, 255, 1)', 
							'rgba(255, 166, 64, 1)'
							 
							

							//                                 
							],
							borderWidth : 1
						//경계선 굵기
						}// 데이터1끝

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
							'rgba(230, 0, 8, 0.2)', 'rgba(230, 0, 8, 0.2)',
									'rgba(230, 0, 8, 0.2)',
									'rgba(230, 0, 8, 0.2)',
									'rgba(230, 0, 8, 0.2)',
									'rgba(230, 0, 8, 0.2)'
									

							],
							borderColor : [
							//경계선 색상
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
		});
		// 차트3 pie
		    var context = document
                .getElementById('myChart3')
                .getContext('2d');
            var myChart = new Chart(context, {
                type: 'pie', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: [
                        //x 축
                        '키보드1','키보드2','키보드3','키보드4','키보드5','키보드6',
                    ],
                    datasets: [
                        { //데이터
                            label: 'test1', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: [
                                81,159,265,170,213,156 //x축 label에 대응되는 데이터 값
                            ],
                            backgroundColor: [
                                //색상
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                //경계선 색상
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1 //경계선 굵기
                        }/* ,
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
                options: {
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
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

</body>
</html>