<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<!-- MAIN CSS 적용-->
<link href="${pageContext.request.contextPath}/resources/css/main.css"
	rel="stylesheet">

<%-- 	<script src="${pageContext.request.contextPath }/resources/js/chart.js"></script> --%>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</head>
<%@include file="../views/inc/top-bar.jsp"%>
<%@include file="../views/inc/side-bar.jsp"%>
<body>
	<div class="main">
		<div class="container-fluid">
			<!-- Begin Page Content -->
			<!-- Page Heading -->
			<!-- 			<div -->
			<!-- 				class="d-sm-flex align-items-center justify-content-between mb-4"> -->
			<!-- 				<h1 class="h3 mb-0 text-gray-800">Dashboard</h1> -->
			<!-- 				<a href="#" -->
			<!-- 					class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i -->
			<!-- 					class="fas fa-download fa-sm text-white-50"></i> Generate Report</a> -->
			<!-- 			</div> -->


			<div class="row" style="">
				<!-- in row -->
				<!-- total score start -->

				<!-- 1 -->
				<div class="my-row-all col-xl-4 col-lg-4 h-100"
					style="margin-bottom: 10px;">
					<!-- oya -->
					<div class="my-row row50">
						<div class="card border-left-primary shadow h-100 py-2"
							style="width: 50%; margin-right: 10px;">
							<div class="card-body">
								<div class="row no-gutters align-items-center">
									<div class="col mr-2">
										<div class="font-weight-bold text-primary text-uppercase mb-1">
											전체 납품액</div>
										<div class="h5 mb-0 font-weight-bold text-gray-800">
<c:set var="totalShipPrice" value="${chartDTO.totalShipPrice}" />

<c:choose>
  <c:when test="${totalShipPrice >= 100000000}">
    <c:set var="unit">억</c:set>
    <c:set var="divisor">100000000</c:set>
    <fmt:formatNumber value="${totalShipPrice / divisor}" pattern="#,##0 억" var="formattedTotalShipPrice" />
    ${formattedTotalShipPrice}
    <c:set var="totalShipPrice" value="${totalShipPrice % divisor}" />
  </c:when>
</c:choose>

<c:choose>
  <c:when test="${totalShipPrice >= 10000}">
    <c:set var="unit">원</c:set>
    <fmt:formatNumber value="${totalShipPrice / 10000}" pattern="#,##0 만" var="formattedRemainingAmount"/>
    ${formattedRemainingAmount}
    <c:set var="totalShipPrice" value="${totalShipPrice % 10000}" />
   </c:when>
</c:choose>

<fmt:formatNumber value="${totalShipPrice}" pattern="#,##0 원" var="formattedRemainingAmount"/>
${formattedRemainingAmount}
										</div>
									</div>
									<div class="col-auto">
										<!-- 									<i class="fas fa-calendar fa-2x text-gray-300"></i> -->
									</div>
								</div>
							</div>
						</div>

						<div class="card border-left-primary shadow h-100 py-2"
							style="width: 50%">
							<div class="card-body">
								<div class="row no-gutters align-items-center">
									<div class="col mr-2">
										<div class="font-weight-bold text-primary text-uppercase mb-1">
											전체 납품량</div>
										<div class="h5 mb-0 font-weight-bold text-gray-800">${chartDTO.totalProductRate}</div>
									</div>
									<div class="col-auto">
										<!-- 									<i class="fas fa-calendar fa-2x text-gray-300"></i> -->
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 2 -->
					<div class="my-row row50">
						<div class="card border-left-primary shadow h-100 py-2"
							style="width: 50%; margin-right: 10px;">
							<div class="card-body">
								<div class="row no-gutters align-items-center">
									<div class="col mr-2">
										<div class="font-weight-bold text-primary text-uppercase mb-1">
											이번달 납품액</div>
										<div class="h5 mb-0 font-weight-bold text-gray-800">${chartDTO.monthlyShipPrice}</div>
									</div>
									<div class="col-auto">
										<!-- 									<i class="fas fa-calendar fa-2x text-gray-300"></i> -->
									</div>
								</div>
							</div>
						</div>

						<div class="card border-left-primary shadow h-100 py-2"
							style="width: 50%">
							<div class="card-body">
								<div class="row no-gutters align-items-center">
									<div class="col mr-2">
										<div class="font-weight-bold text-primary text-uppercase mb-1">
											이번달 납품량</div>
										<div class="h5 mb-0 font-weight-bold text-gray-800">${chartDTO.monthlyProductRate}</div>
									</div>
									<div class="col-auto">
										<!-- 									<i class="fas fa-calendar fa-2x text-gray-300"></i> -->
									</div>
								</div>
							</div>
						</div>

					</div>

				</div>
				<!-- total score end -->


				<!-- notice table start -->
				<div class="col-xl-8 col-lg-8" style="margin-bottom: 10px;">
					<div class="card shadow mb-4">
						<div class="right">
							<div class="sbtw">
								<a style="margin: 5px; font-weight: bold;">[ 공지사항 ]</a> <a
									href="${pageContext.request.contextPath}/notice/noticeList"
									class="d-none d-sm-inline-block btn btn-sm btn-secondary shadow-sm btn-more">더보기</a>
							</div>
							<table class="h-100">
								<tr>
									<th class="row-1">분류</th>
									<th class="row-2">제목</th>
									<th class="row-3">조회수</th>
									<th class="row-4">작성일</th>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<!-- notice table end -->
				<!-- in row -->
			</div>


			<div class="row">
				<!-- Area Chart -->
				<div class="col-xl-7 col-lg-7">
					<div class="card shadow mb-4">
						<!-- Card Header - Dropdown -->
						<div
							class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary">월별 출고량</h6>
							<div class="dropdown no-arrow">
								<!-- 								<a class="dropdown-toggle" href="#" role="button" -->
								<!-- 									id="dropdownMenuLink" data-toggle="dropdown" -->
								<!-- 									aria-haspopup="true" aria-expanded="false"> <i -->
								<!-- 									class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i> -->
								<!-- 								</a> -->
								<!-- 								<div -->
								<!-- 									class="dropdown-menu dropdown-menu-right shadow animated--fade-in" -->
								<!-- 									aria-labelledby="dropdownMenuLink"> -->
								<!-- 									<div class="dropdown-header">Dropdown Header:</div> -->
								<!-- 									<a class="dropdown-item" href="#">Action</a> <a -->
								<!-- 										class="dropdown-item" href="#">Another action</a> -->
								<!-- 									<div class="dropdown-divider"></div> -->
								<!-- 									<a class="dropdown-item" href="#">Something else here</a> -->
								<!-- 								</div> -->
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

				<!-- Pie Chart -->
				<div class="col-xl-5 col-lg-5">
					<div class="card shadow mb-4">
						<!--  Card Header - Dropdown -->
						<div
							class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary">상품별 출고 비율</h6>
							<div class="dropdown no-arrow">
								<!-- 								<a class="dropdown-toggle" href="#" role="button" -->
								<!-- 									id="dropdownMenuLink" data-toggle="dropdown" -->
								<!-- 									aria-haspopup="true" aria-expanded="false"> <i -->
								<!-- 									class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i> -->
								<!-- 								</a> -->
								<!-- 								<div -->
								<!-- 									class="dropdown-menu dropdown-menu-right shadow animated--fade-in" -->
								<!-- 									aria-labelledby="dropdownMenuLink"> -->
								<!-- 									<div class="dropdown-header">Dropdown Header:</div> -->
								<!-- 									<a class="dropdown-item" href="#">Action</a> <a -->
								<!-- 										class="dropdown-item" href="#">Another action</a> -->
								<!-- 									<div class="dropdown-divider"></div> -->
								<!-- 									<a class="dropdown-item" href="#">Something else here</a> -->
								<!-- 								</div> -->
							</div>
						</div>
						<!--  Card Body -->
						<div class="card-body">
							<div class="chart-area">
								<canvas id="productShipRate" class="main-chart"></canvas>
							</div>
							<!-- 							<div class="mt-4 text-center small"> -->
							<!-- 								<span class="mr-2">  -->
							<!-- 								<i class="fas fa-circle text-primary"></i> -->
							<!-- 									여기 -->
							<!-- 								</span> <span class="mr-2"> <i -->
							<!-- 									class="fas fa-circle text-success"></i> 상품명 -->
							<!-- 								</span> <span class="mr-2"> <i class="fas fa-circle text-info"></i> -->
							<!-- 									넣으려고 -->
							<!-- 								</span> -->
							<!-- 							</div> -->
						</div>
					</div>
				</div>
			</div>
			<!-- End of Main Content -->
		</div>
	</div>








	<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.7.0.js"></script> --%>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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



	<script type="text/javascript">
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
          backgroundColor:['#224abe','#4e73df','#224abe','#4e73df','#224abe','#4e73df'],
          borderColor:['#224abe','#4e73df','#224abe','#4e73df','#224abe','#4e73df'],
          borderWidth : 4
        }]
      },
      options:{
         maintainAspectRatio:false,
         legend: {
             display: false // label 제거
          },
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


//차트 생성 함수
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
          backgroundColor:['#F2D388','#E97777','#87A8D0','#F7E1AE','#D35D6E','#9AD0EC'],
          borderColor:'#fff',
          borderWidth : 1
        }]
      },
      options:{
         maintainAspectRatio:false,
         legend: {
             display: true,
             position: 'right',
             labels: {
            	  usePointStyle: true // 범례 아이콘을 점 모양으로 변경
             }
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