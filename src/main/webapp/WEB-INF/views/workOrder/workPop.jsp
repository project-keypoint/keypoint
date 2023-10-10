<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>작업지시 목록</title>
<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cs-skin-elastic.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/order.css">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
</head>
<body>
<!-- 	검색창 search(오브젝트)-->
				<div class="col mt-3">
					<div class="col-lg">
						<div class="card m-0">
							<div class="card-body card-block">
								<form action="${pageContext.request.contextPath}/workOrder/workPop" name="searchWork" class="form-inline" method="get">
									<div class="form-group col-6 mb-1">
										<label for="searchWorkDate" class="pr-1  form-control-label mr-2">지시일자</label>
										<input type="date" id="searchWorkDate1" name="searchWorkDate1" class="form-control" value="${pageDTO.search2 }">
										~
										<input type="date" id="searchWorkDate2" name="searchWorkDate2" class="form-control" value="${pageDTO.search3 }">
									</div>
									<div class="form-group col-6 mb-1">
										<label for="searchLine" class="pr-1 form-control-label mr-2">라인</label>
										<div class="input-group modalP" id="modalP1">
											<input type="text" id="searchLineCd" name="searchLineCd" placeholder="Line Code" class="form-control bg-white" value="${pageDTO.search }">
										</div>
									</div>
									<div class="form-group col-6 mt-1">
										<label class="p  form-control-label" for="woStatus">지시상태</label>
										<div class="form-control border-0" id="woStatus">
											<div class="form-check-inline form-check">
												<label for="searchWork1" class="form-check-label mr-2">
													<!-- 대기 -->
													<c:if test="${! empty pageDTO.search5 }">
													<input style='zoom:1.8;' type="checkbox" id="searchWork1" name="searchWork1" class="form-check-input" checked >대기
													</c:if>
													<c:if test="${empty pageDTO.search5 }">
													<input style='zoom:1.8;' type="checkbox" id="searchWork1" name="searchWork1" class="form-check-input" >대기
													</c:if>
												</label>
												<label for="searchWork2" class="form-check-label mr-2">
													<!-- 진행 -->
													<c:if test="${! empty pageDTO.search6 }">
													<input style='zoom:1.8;' type="checkbox" id="searchWork2" name="searchWork2" class="form-check-input" checked value="진행">진행
													</c:if>
													<c:if test="${empty pageDTO.search6 }">
													<input style='zoom:1.8;' type="checkbox" id="searchWork2" name="searchWork2" class="form-check-input" value="진행">진행
													</c:if>
												</label>
												<label for="searchWork3" class="form-check-label mr-2">
													<!--완료 -->
													<c:if test="${! empty pageDTO.search7 }">
													<input style='zoom:1.8;' type="checkbox" id="searchWork3" name="searchWork3" class="form-check-input" checked value="완료">완료
													</c:if>
													<c:if test="${empty pageDTO.search7 }">
													<input style='zoom:1.8;' type="checkbox" id="searchWork3" name="searchWork3" class="form-check-input" value="완료">완료
													</c:if>
												</label>
											</div>
										</div>									
									</div>
									<div class="form-group col-6 mt-1">
										<label for="searchProd" class="pr-1 form-control-label mr-2">품번</label>
										<input type="text" aria-label="filter" id="productSearchId" name="searchProdCd" placeholder="Prod Code" class="form-control bg-white" value="${pageDTO.search4 }">
										
									</div>
									<div class="col p-0 mt-3">
									<input type="submit" class="btn btn-primary col-2 float-right ml-3" id="searchWork" value="조회">
									<input type="reset" class="btn btn-secondary col-1 float-right reset" value="취소">
									</div>
								</form>
							</div>
						</div>
					</div>
		<div class="col">
			<div class="card">
				<div class="card-body">
								<table id="hover_tb" class="table table-hover table-striped table-bordered table-align-middle mb-0">
									<thead class="thead-dark">
										<tr>
											<th scope="col">지시번호</th>
											<th scope="col">라인</th>
											<th scope="col">라인명</th>
											<th scope="col">상품코드</th>
											<th scope="col">상품명</th>
<!-- 											<th scope="col">단위</th> -->
											<th scope="col">지시상태</th>
											<th scope="col">지시수량</th>
<!-- 											<th scope="col">생산량</th> -->
											<th scope="col">지시날짜</th>
											<th scope="col">수주번호</th>
									</thead>
									<tbody>
										<c:forEach var="workOrderDTO" items="${workOrderList }">
											<tr id="infoWorkTr" class="data-row">
												<td>${workOrderDTO.woCode }</td>
												<td>${workOrderDTO.lineCode }</td>
												<td>${workOrderDTO.lineName }</td>
												<td>${workOrderDTO.productCode }</td>
												<td>${workOrderDTO.productName }</td>
<%-- 												<td>${workOrderDTO.prod_unit }</td> --%>
												<td>${workOrderDTO.woStatus }</td>
												<td>${workOrderDTO.woCount }</td>
<%-- 												<td>${workOrderDTO.inst_fcount }</td> --%>
												<td><fmt:formatDate value="${workOrderDTO.woDate }" pattern="yyyy.MM.dd HH:mm"/></td>
												<td>${workOrderDTO.roCode }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<!-- 페이징 -->
								<div class="col p-0 mt-3">
									<div class="dataTables_paginate paging_simple_numbers float-right">
										<ul class="pagination">
										<!-- 이전 -->
										<c:if test="${pageDTO.startPage <= pageDTO.pageBlock }">
											<li class="paginate_button page-item previous disabled">
												<a href="${pageContext.request.contextPath}/workOrder/workOrderPop?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}&search5=${pageDTO.search5}&search6=${pageDTO.search6}&search7=${pageDTO.search7}"
												class="page-link">Previous</a></li>
										</c:if>
										<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
											<li class="ppaginate_button page-item previous" >
												<a href="${pageContext.request.contextPath}/workOrder/workOrderPop?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}&search5=${pageDTO.search5}&search6=${pageDTO.search6}&search7=${pageDTO.search7}"
												class="page-link">Previous</a>
											</li>
										</c:if>
										<!-- 이전 -->
										<!-- 현재 -->										
										<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
											<c:if test="${i==pageDTO.pageNum }">
												<li class="paginate_button page-item active">
													<a class="page-link" href="#">${i}</a>
												</li>											
											</c:if>
											<c:if test="${i!=pageDTO.pageNum }">
												<li class="paginate_button page-item ">
													<a class="page-link" href="${pageContext.request.contextPath}/workOrder/workOrderPop?pageNum=${i}&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}&search5=${pageDTO.search5}&search6=${pageDTO.search6}&search7=${pageDTO.search7}">${i}</a>
												</li>
											</c:if>
										</c:forEach>
										<!-- 현재 -->										
										<!-- 다음 -->																				
										<c:if test="${pageDTO.endPage >= pageDTO.pageCount }">
											<li class="paginate_button page-item next disabled" id="bootstrap-data-table_next">
												<a href="${pageContext.request.contextPath}/workOrder/workOrderPop?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}&search5=${pageDTO.search5}&search6=${pageDTO.search6}&search7=${pageDTO.search7}" class="page-link">Next</a>
											</li>
										</c:if>
										<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
											<li class="paginate_button page-item next" id="bootstrap-data-table_next">
												<a href="${pageContext.request.contextPath}/workOrder/workOrderPop?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}&search5=${pageDTO.search5}&search6=${pageDTO.search6}&search7=${pageDTO.search7}" class="page-link">Next</a>
											</li>
										</c:if>
										<!-- 다음 -->																				
										</ul>
									</div>
								</div>
								<!-- 페이징 -->
							</div>
		</div>
	</div>
</div>

			
<script
	src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
<script type="text/javascript">	
	$(document).on("click", "#infoWorkTr", function() {
		
		var tr1 = $(this);
		var td1 = tr1.children();
		
		popWoCode = td1.eq(0).text();
		popRoCode = td1.eq(2).text();
		popLineCode = td1.eq(4).text();
		popWoCount = td1.eq(8).text();
		popProductName = td1.eq(11).text();
		
		$('#woCode', opener.document).val(popWoCode);
		$('#roCode', opener.document).val(popRoCode);
		$('#lineCode', opener.document).val(popLineCode);
		$('#woCount', opener.document).val(popWoCount);
		$('#productName', opener.document).val(popproductName);
		
		self.close();
	});
	
	$(document).on("click", "#cancel", function() {
		self.close();
	});
</script>
</body>
</html>