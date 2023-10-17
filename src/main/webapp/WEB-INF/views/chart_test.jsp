<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<body>
	<div class="col-xl-8 col-lg-7">
		<div class="card shadow mb-4" style="height: auto;">
			<!-- Card Header - Dropdown -->
			<div
				class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
				<h6 class="m-0 font-weight-bold text-primary">월별 출고량</h6>
				<div class="dropdown no-arrow">
					<a class="dropdown-toggle" href="#" role="button"
						id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <i
						class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
					</a>
					<div
						class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
						aria-labelledby="dropdownMenuLink">
						<div class="dropdown-header">Dropdown Header:</div>
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div>
				</div>
			</div>
			<!-- Card Body -->
			<div class="card-body" style="">
				<div class="chart-area">
					<canvas id="monthlyShip"></canvas>
				</div>
			</div>
		</div>
	</div>
	
	<div class="col-xl-5 col-lg-5">
					<div class="card shadow mb-4">
						<!--  Card Header - Dropdown -->
						<div
							class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary">상품별 출고 비율</h6>
							<div class="dropdown no-arrow">
								<a class="dropdown-toggle" href="#" role="button"
									id="dropdownMenuLink" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"> <i
									class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
								</a>
								<div
									class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
									aria-labelledby="dropdownMenuLink">
									<div class="dropdown-header">Dropdown Header:</div>
									<a class="dropdown-item" href="#">Action</a> <a
										class="dropdown-item" href="#">Another action</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">Something else here</a>
								</div>
							</div>
						</div>
						<!--  Card Body -->
						<div class="card-body">
							<div class="chart-pie pt-4 pb-2">
								<canvas id="productShipRate" class="main-chart"></canvas>
							</div>
							<div class="mt-4 text-center small">
								<span class="mr-2"> <i class="fas fa-circle text-primary"></i>
									Direct
								</span> <span class="mr-2"> <i
									class="fas fa-circle text-success"></i> Social
								</span> <span class="mr-2"> <i class="fas fa-circle text-info"></i>
									Referral
								</span>
							</div>
						</div>
					</div>
				</div>

<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.7.0.js"></script> --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
//차트 생성 함수 
function monthlyShipChart(data) {

  var context = document.getElementById('monthlyShip').getContext('2d');

  if (data && data.length > 0) { 

    var labels = data.map(function(item) { return item.label; });
    var data   = data.map(function(item) { return item.data; });

    var monthlyShip = new Chart(context, {
      type: 'line',
      data: {
        labels: labels,
        datasets: [{
          label:'',
          fill:false,
          data:data,
          backgroundColor:['#224abe','#4e73df','#224abe','#4e73df','#224abe'],
          borderColor:'#224abe',
          borderWidth : 4
        }]
      },
      options:{
         maintainAspectRatio:false,
         scales:{
            yAxes:[{
               ticks:{
                  beginAtZero:true
               }
            }]
         }
       }
     });
   } else {
     console.error('데이터가 없습니다.');
   }
}

// AJAX 요청을 통해 서버에서 데이터 가져오기 및 차트 생성 시작하기
$.ajax({
  url: '${pageContext.request.contextPath}/main/monthlyShip',
  type: 'GET',
}).done(function(data){
	monthlyShipChart(data);
}).fail(function(xhr, status, error){
	console.error('데이터를 가져오지 못했습니다.', error);
});








//차트 생성 함수 //////////////////////////////////////////////22222222222222222222222222222222222222222222
// 차트 생성 함수
function productShipRateChart(data) {
  var context = document.getElementById('productShipRate').getContext('2d');

  if (data && data.length > 0) {
    var labels = data.map(function(item) { return item.label; });
    var data   = data.map(function(item) { return item.data; });

    var productShipRate = new Chart(context, {
      type: 'pie', // 파이 차트로 변경
      data: {
        labels: labels,
        datasets: [{
          label:'',
          data:data,
          backgroundColor:['#224abe','#4e73df','#224abe','#4e73df','#224abe','#4e73df'],
          borderColor:'#fff',
          borderWidth : 1
        }]
      },
      options:{
         maintainAspectRatio:false,
         scales:{
            yAxes:[{
               ticks:{
                  beginAtZero:true
               }
            }]
         }
       }
     });
   } else {
     console.error('데이터가 없습니다.');
   }
}

// AJAX 요청을 통해 서버에서 데이터 가져오기 및 차트 생성 시작하기
$.ajax({
  url: '${pageContext.request.contextPath}/main/productShipRate',
  type: 'GET',
}).done(function(data){
	productShipRateChart(data);
}).fail(function(xhr, status, error){
	console.error('데이터를 가져오지 못했습니다.', error);
});


</script>
</body>
</html>