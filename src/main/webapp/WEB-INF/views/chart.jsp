<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Custom fonts for this template-->
<link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template-->
<link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
<!-- MAIN CSS 적용-->
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>


<!-- Chart.js Datalabels 플러그인 -->
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
<!-- 캘린더, 차트 자바스크립트 -->
<script src="${pageContext.request.contextPath }/resources/js/calendar.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/side.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/calendar.css" rel="stylesheet" type="text/css">

<!-- SweetAlert  -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<title>차트테스트</title>

<style type="text/css">
body {
	background-color: #f5f6fa;
}
#con {
	display: flex;
	flex-direction: column;
	width: 80%;
	margin-left: auto;
	margin-right: auto;
}
#con_1, #con_2 {
	display: flex;
	flex-direction: row;
	width: 100%;
	margin-top: 2em;
	margin-bottom: 2em;
	margin-left: auto;
	margin-right: auto;
	justify-content: space-evenly;
	align-items: center;
	text-align: center;
}
#con_2{
	gap:2%;
}
#con_1>#calendar {
	width: 37%;
}
#chart_1, #chart_2, #chart_3 {
	width: 37%;
}
#pie_chart_size {
	margin : 0 auto;
	width: 70%;
	height: 70%;
}
.flex-container {
    display: flex;
    flex-direction: row; /* 기본값이므로 생략해도 됩니다. */
    justify-content: center;
    text-align: center;
 	gap: 1%;
}
</style>
</head>
<body>
	<!-- 사이드바 -->
	<%@include file="../views/inc/top-bar.jsp"%>
	<%@include file="../views/inc/side-bar.jsp"%>
	<!-- 사이드바 -->
<div class="main">
	<div id="con">
		<div id="con_1">
			<div id="chart_1">
				<h3>거래처별 매출 비율</h3>
				<div id="pie_chart_size">
					<canvas id="pie_chart" width="70%"></canvas>
				</div>
			</div>
		</div>
<!-- ////////////////////////////////////////////////////////////////////// -->		
		<div id="con_2">
			<div id="chart_2">
				<h3>창고별 재고</h3>
				<canvas id="stockList"></canvas>
			</div>
<!-- ////////////////////////////////////////////////////////////////////// -->			
			<div id="chart_2">
				<h3>라인별 생산량</h3>
			       <canvas id="linePerfList"></canvas>
			</div>
<!-- ////////////////////////////////////////////////////////////////////// -->
			<div  id="chart_2">
				<h3>최근 생산량</h3>
		    	<canvas id="perfList"></canvas>
			</div>
<!-- ////////////////////////////////////////////////////////////////////// -->			
		</div>
	</div>
</div>
	<script type="text/javascript">
		$(document).ready(function() {
			var calendar_compare = null; // 달력 비교 함수 
			var sales_compare = null; // 매출 차트와 비교할 변수
			var stock_compare = null; // 재고 차트와 비교할 변수
			var perf_compare = null; // 실적 차트와 비교할 변수
			var line_compare = null; // 라인 실적 차트와 비교할 변수
			
			var currentDate = new Date(); // 초기 currentDate 설정
			
			document.addEventListener('click', function(event) {
			    // 이벤트가 발생한 요소가 .fc-prev-button 클래스를 가지고 있는지 확인합니다.
			    if (event.target.classList.contains('fc-prev-button') || event.target.classList.contains('fc-icon-chevron-left')) {
			        currentDate.setMonth(currentDate.getMonth() - 1); // 이전 달로 이동
			        console.log(currentDate);
			    }
			    if (event.target.classList.contains('fc-next-button') || event.target.classList.contains('fc-icon-chevron-right')) {
			    	currentDate.setMonth(currentDate.getMonth() + 1); // 다음 달로 이동
			        console.log(currentDate);
			    }
			    if (event.target.classList.contains('fc-today-button')) {
			    	currentDate = new Date(); // 현재 날짜로 설정
			        console.log(currentDate);
			    }
			});
			
			// 캘린더정보 처음 로드될 때 데이터를 가져옴
			loadCalendar();
			// 4초마다 실행될 데이터를 가져오는 함수
			setInterval(loadCalendar, 4000);
			function loadCalendar() {
				$.ajax({
					url : '${pageContext.request.contextPath}/main/calendarList',
					type : 'POST',
					dataType : 'json',
					success : function(result) {
						if(!jsonObjectsAreEqual(result, calendar_compare)){
							
							calendar_compare = result;
							
							initializeCalendar(result, currentDate);
						}
					}
				});
			}
			
			// 매출 차트 초기 로드
	        loadSalesChart();
	        // 페이지가 처음 로드된 후, 4초마다 업데이트를 요청하는 함수를 호출
	        setInterval(loadSalesChart, 4000);
	        function loadSalesChart() {
	            $.ajax({
	                url: '${pageContext.request.contextPath}/main/salesList',
	                type: 'POST',
	                dataType: 'json',
	                success: function(result) {
	                    if (!jsonObjectsAreEqual(result, sales_compare)) {
	                        // 데이터가 변경된 경우에만 차트를 그립니다.
	                        // 이전 데이터 업데이트
	                        sales_compare = result; // 데이터 배열을 복사하여 참조 문제 해결
	                        createPieChart(result, "pie_chart");
	                    }
	                }
	            });
	        }
	        
	        // 재고 차트 초기 로드
	        loadStockChart();
	        // 페이지가 처음 로드된 후, 4초마다 업데이트를 요청하는 함수를 호출
	        setInterval(loadStockChart, 4000);
	        function loadStockChart() {
	            $.ajax({
	                url: '${pageContext.request.contextPath}/main/stockList',
	                type: 'POST',
	                dataType: 'json',
	                success: function(result) {
	                    if (!jsonObjectsAreEqual(result, stock_compare)) {
	                        // 데이터가 변경된 경우에만 차트를 그립니다.
	                        // 이전 데이터 업데이트
	                        stock_compare = result; // 데이터 배열을 복사하여 참조 문제 해결
	                        createBarChart(result, "stockList");
	                    }
	                }
	            });
	        }
	        
	        // 실적 차트 초기 로드
	        loadPerfChart();
	        // 페이지가 처음 로드된 후, 4초마다 업데이트를 요청하는 함수를 호출
	        setInterval(loadPerfChart, 4000);
	        function loadPerfChart() {
	            $.ajax({
	                url: '${pageContext.request.contextPath}/main/perfList',
	                type: 'POST',
	                dataType: 'json',
	                success: function(result) {
	                    if (!jsonObjectsAreEqual(result, perf_compare)) {
	                        // 데이터가 변경된 경우에만 차트를 그립니다.
	                        // 이전 데이터 업데이트
	                        perf_compare = result; // 데이터 배열을 복사하여 참조 문제 해결
	                        createBarChart(result, "perfList");
	                    }
	                }
	            });
	        }
	        
	        // 라인별 실적 차트 초기 로드
	        loadLinePerfChart();
	        // 페이지가 처음 로드된 후, 4초마다 업데이트를 요청하는 함수를 호출
	        setInterval(loadLinePerfChart, 4000);
	        function loadLinePerfChart() {
	            $.ajax({
	                url: '${pageContext.request.contextPath}/main/linePerfList',
	                type: 'POST',
	                dataType: 'json',
	                success: function(result) {
	                    if (!jsonObjectsAreEqual(result, line_compare)) {
	                        // 데이터가 변경된 경우에만 차트를 그립니다.
	                        // 이전 데이터 업데이트
	                        line_compare = result; // 데이터 배열을 복사하여 참조 문제 해결
	                        createBarChart(result, "linePerfList");
	                    }
	                }
	            });
	        }
		});
	</script>
	
<script type="text/javascript">

//두 JSON 객체를 비교하여 변경 여부를 확인하는 함수
function jsonObjectsAreEqual(obj1, obj2) {
// obj1 또는 obj2가 null 또는 undefined인 경우, 변경된 것으로 간주
if (!obj1 || !obj2) {
 return false;
}
// JSON 객체의 길이가 다르면 변경된 것으로 간주
if (Object.keys(obj1).length !== Object.keys(obj2).length) {
 return false;
}
// 각 항목을 비교
for (var key in obj1) {
 if (!obj2.hasOwnProperty(key)) {
   // 두 번째 객체에 같은 키가 없으면 변경된 것으로 간주
   return false;
 }
 if (obj1[key].label !== obj2[key].label || obj1[key].data !== obj2[key].data) {
   // 레이블(label) 또는 데이터(data) 값 중 하나라도 다르면 변경된 것으로 간주
   return false;
 }
}
// 모든 비교를 통과하면 두 객체는 동일하다고 간주
return true;
}

//파이 차트를 그리는 함수
function createPieChart(data, chartId) {
console.log(data); // 데이터가 어떻게 읽혀왔는지 확인

var colors = ["#4b77a9", "#5f255f", "#d21243", "#ff5733", "#ffcc29", "#6bf178", "#854c6f", "#ff9933", "#6699cc", "#ff6666"];
 // 이전 차트를 제거합니다.
 var existingChart = Chart.getChart(chartId);
 if (existingChart) {
   existingChart.destroy();
 }
 var pie_ctx = document.getElementById(chartId).getContext("2d");

 var pie_data = {
   datasets: [
     {
       data: data.map(function (item) {
         return item.data;
       }),
       backgroundColor: colors.slice(0, data.length)
     }
   ],
   labels: data.map(function (item) {
     return item.label;
   }),
   borderColor: "#fff"
 };

 var pie_options = {
 	cutout: '30%', // 중앙 빈 원의 크기 (백분율로 설정)
   plugins: {
     tooltip: {
       titleFont: {
         size: 20
       },
       bodyFont: {
         size: 20
       },
       footerFont: {
         size: 20
       },
       mode: "nearest",
       intersect: true
     },
     datalabels: {
       formatter: function (value, context) {
         return Math.round(value / context.chart.getDatasetMeta(0).total * 100) + "%";
       },
       color: "#fff",
       anchor: "center",
       align: "start",
       offset: 0,
       font: {
         size: 20
       }
     },
     legend: {
       display: true,
       position: "bottom",
       labels: {
         font: {
           size: 16
         }
       }
     }
   },
   layout: {
 	padding: {
  		left: 0,
   		right: 0,
   		top: 0,
   		bottom: 0
 		}
		}
 };

 new Chart(pie_ctx, {
   type: "pie",
   data: pie_data,
   options: pie_options,
   plugins: [ChartDataLabels]
 });

}


//bar형 차트 그리는 함수

function createBarChart(data, chartId) {
 var colors = ["#4b77a9", "#5f255f", "#d21243", "#ff5733", "#ffcc29", "#6bf178", "#854c6f", "#ff9933", "#6699cc", "#ff6666"];

 var bar_ctx = document.getElementById(chartId).getContext('2d');

	// 이전 차트를 제거합니다.
 var existingChart = Chart.getChart(chartId);
 if (existingChart) {
   existingChart.destroy();
 }

	// JSON 형태의 데이터 배열에서 최대 값을 찾습니다.
	var maxDataValue = Math.max.apply(null, data.map(function (item) {
 					return item.data;
						}));
						
	var max = Math.ceil(maxDataValue * 1.2); // 최대 값을 1.2배로 설정					

	var stepSize = Math.ceil(maxDataValue / 10); // 원하는 눈금 간격 설정

 var bar_data = {
     datasets: [{
         data: data.map(function (item) {
             return item.data;
         }),
         backgroundColor: colors.slice(0, data.length)
     }],
     labels: data.map(function (item) {
     return item.label;
   }),
     borderColor: "#fff"
 };
 
	var bar_options = {
     plugins: {
         tooltip: {
             titleFont: {
                 size: 20
             },
             bodyFont: {
                 size: 20
             },
             footerFont: {
                 size: 20
             },
             mode: 'nearest',
             intersect: true
         },
         datalabels: {
             color: '#black',
             anchor: 'end',
             align: 'top',
             offset: 0,
             font: {
                 size: 20
             }
         },
         legend: {
             display: false
         }
     },
     scales: {
         y: {
             beginAtZero: true,
             max: max,
             stepSize: stepSize
         },
         x: {}
     }
 };

	// 새로운 차트를 생성하고 이전 차트를 업데이트합니다.
	 new Chart(bar_ctx, {
     type: 'bar',
     data: bar_data,
     options: bar_options,
     plugins: [ChartDataLabels]
 });
}



</script>
</body>
</html>