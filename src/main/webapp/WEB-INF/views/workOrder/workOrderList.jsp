<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업지시 목록</title>

<!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<!--     <link -->
<!-- Custom styles for this template-->
<link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/css/workOrder2.css" rel="stylesheet">
</head>
<body>
<%@include file="../inc/top-bar.jsp"%>
<%@include file="../inc/side-bar.jsp"%>


	<!--  contents start -->
	<!-- <div class="contents" style="position:fixed; left: 15rem;"> -->

	<div class="main">
		<div class="card shadow">
			<div class="page-title">작업지시 목록
			<!--    초기화 이미지 -->
     		 <img src="${pageContext.request.contextPath}/resources/img/icon_reload.png" id="resetFilters" 
       		    style="height: 1.5rem; width: 1.5rem; cursor: pointer; position: relative; right: 10px; bottom: 3px; margin-left: 10px;" onclick="reset()">
    		 </div>
    		<div class="contents2">
    
			<form action="${pageContext.request.contextPath}/workOrder/workOrderList" method="get">	
				
				
					
					
					<div class="search-b" style="margin-bottom: -25px;">
						<div class="status-check" style="background: #E5E5E5; border: none;">
						<div class="search-date3" style="margin-left: 14px;">
						<a style="font-weight: bold;"> 진행<input type="checkbox" id="select1" name="check1" class="list-select" value="진행"
						<c:if test="${not empty pageDTO.check1}">checked</c:if>></a>
						<a>완료<input type="checkbox" id="select2" name="check2" class="list-select" value="완료"
						<c:if test="${not empty pageDTO.check2}">checked</c:if>></a>
						</div>
						</div>
						</div>
						
						<div class="search-bar" style="align-items: normal;">
						
						<div class="search-b">
						<div style="margin-bottom: 8px;"></div>
						<div class="search-select">
						<p>상품명</p> 
						<input type="text" id="productCode" name="search1" class="form-control search-input readonly-color"
      					 placeholder="${empty pageDTO.search1 ? '상품코드' : ''}" value="${pageDTO.search1}" readonly>
						<input type="text" id="productName" name="search2" class="form-control search-input readonly-color"
     					 placeholder="${empty pageDTO.search2 ? '상품명(클릭)' : ''}" value="${pageDTO.search2}" readonly>
						</div>
						</div>
						
						
						<div class="search-b">
						<div style="margin-bottom: 8px;"></div>
						<div class="search-date">
						<p style="white-space: nowrap; margin-right: 8px;">지시일자</p>
						<input type="text" id="woDate1" name="search3" class="form-control search-input readonly-color" 
      					 placeholder="${empty pageDTO.search3 ? '지시일자' : ''}" value="${pageDTO.search3}" readonly>
						~<input type="text" id="woDate2" name="search4" class="form-control search-input readonly-color" 
       					 placeholder="${empty pageDTO.search4 ? '지시일자' : ''}" value="${pageDTO.search4}" readonly>
						</div>
						</div>
						
						<div class="search-button">
						<div style="margin-bottom: 15px;"></div>
						<input type="submit" value="검색" class="btn btn-primary mybutton1" >
						<input type="button" value="취소" class="btn btn-secondary mybutton1" onclick="resetSearch()">
						</div>
						
						

				</div><!-- search-bar -->
				
				</form>
					<br>
						
			
				<!-- search-bar -->
			

				<div>
					<table class="table-list">
						<tr class="table-head">
							<th><input type="checkbox" id="delete-list-all"
								name="delete-list" data-group="delete-list"></th>
							<th>작업지시번호</th>
							<th>업체명</th>
							<th>업체코드</th>
							<th>수주번호</th>
							<th>지시일자</th>
							<th>지시상태</th>
							<th>상품코드</th>
							<th>상품명</th>
							<th>라인코드</th>
							<th>지시수량</th>
							<th>납품예정일</th>
							<th>작업지시자</th>
							<th>상세내역</th>
						</tr>

						<c:forEach var="workOrderDTO" items="${workOrderList}">
							<tr class="table-body">
							
								<td><input type="checkbox" id="delete-list"
									name="delete-list" data-group="delete-list"></td>
								<td name="woCode">${workOrderDTO.woCode}</td>
								<td>${workOrderDTO.cusName}</td>
								<td>${workOrderDTO.cusCode}</td>
								<td>${workOrderDTO.roCode}</td>
								<td><c:out value="${fn:substring(workOrderDTO.woDate, 0, 16)}" />
								</td>
																
								<!-- 지시상태가 완료면 색상변하게 -->
								 <td>
    								<c:choose>
                						<c:when test="${workOrderDTO.woStatus eq '완료'}">
                    						<span style="color: skyblue;">${workOrderDTO.woStatus}</span>
                						</c:when>
               							 <c:otherwise>${workOrderDTO.woStatus}</c:otherwise>
            						</c:choose>
    							   </td>
    							   
								<td>${workOrderDTO.productCode}</td>
								<td>${workOrderDTO.productName}</td>
								<td>${workOrderDTO.lineCode}</td>
								<td>${workOrderDTO.woCount}</td>
								<td>${workOrderDTO.shipSdate}</td>
								<td>${workOrderDTO.empName}</td>

								<td><input type="button" value="상세내역"
									class="btn btn-info mybutton1"
									onclick="openDetails('${workOrderDTO.woCode}')"></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<!-- table -->
				<div class="content-bottom">
					<div>
						<input type="button" value="작업지시등록"
							class="btn btn-primary mybutton1" onclick="openInsert()">
					<c:choose>    
   						 <c:when test = "${employeeDTO.empRole >= 2}">
							<input type="button" value="삭제"
							class="btn btn-secondary mybutton1" onclick="selectedDel()" >
						 </c:when>
   							<c:otherwise>
   							 <input type="button" value="삭제" class="btn btn-secondary mybutton1" onclick="accessDenied()" style="margin-right: 3px;">
   							</c:otherwise>
					</c:choose>  
					<input type="button" value="엑셀파일다운" id="excelWorkOrder" class="btn btn-secondary mybutton1 dis-btn" id="excelProduction" style="margin-left: 3px;" >
					</div>
					<div id="page_control" class="page-buttons">
  					  <c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
      					  <a href="${pageContext.request.contextPath}/workOrder/workOrderList?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&search=${pageDTO.search}" class="page-button">&lt;</a>
   					 </c:if>
   					 <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
     				   <c:choose>
           			 <c:when test="${i eq pageDTO.pageNum}">
              			  <a href="${pageContext.request.contextPath}/workOrder/workOrderList?pageNum=${i}&search=${pageDTO.search}" class="page-button page-button-active">${i}</a>
          			  </c:when>
         			   <c:otherwise>
             			   <a href="${pageContext.request.contextPath}/workOrder/workOrderList?pageNum=${i}&search=${pageDTO.search}" class="page-button">${i}</a>
         			   </c:otherwise>
        				</c:choose>
   					 </c:forEach>
  					  <c:if test="${pageDTO.endPage < pageDTO.pageCount}">
      					  <a href="${pageContext.request.contextPath}/workOrder/workOrderList?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&search=${pageDTO.search}" class="page-button">&gt;</a>
   						 </c:if>
							</div>
							</div>
				</div>
			</div>
			</div>
			<!-- contents -->
		<!-- 그림자아니야 영역 -->
	<!-- main -->

	<!-- contents end -->

	<!-- 데이트피커 타임피커를 사용하기위한 j쿼리 -->
	<link rel="stylesheet"
		href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!-- 엑셀파일 저장을 위한 스크립트 호출 -->
	<script src="https://unpkg.com/file-saver/dist/FileSaver.min.js"></script>
	<script src="https://unpkg.com/xlsx/dist/xlsx.full.min.js"></script>

	<script type="text/javascript">
		//팝업 창을 열어주는 함수
		function openPopup(url) {
			var width = 590;
			var height = 470;
			var left = (screen.width - width) / 2;
			var top = (screen.height - height) / 2;
			var popupWindow = window.open(url, '_blank', "width=" + width
					+ ", height=" + height + ", left=" + left + ", top=" + top);
			popupWindow.focus();
		}
		$(document).ready(function() {
		
		// 상품명 검색 팝업 열기
		$("#productCode, #productName").click(function() {
		var url = '${pageContext.request.contextPath}/workOrder/workProdList';
		openPopup(url);
			});
		});
		
		$(function() {
			$("#woDate1").datepicker({
				dateFormat : "yy-mm-dd"
			});
			$("#woDate2").datepicker({
				dateFormat : "yy-mm-dd"
			});
			$("#shipSdate1").datepicker({
				dateFormat : "yy-mm-dd"
			});
			$("#shipSdate2").datepicker({
				dateFormat : "yy-mm-dd"
			});
		});

		// 체크박스(삭제용) 전체선택
		var selectAllCheckbox = document.getElementById("delete-list-all");
		var checkboxes = document
				.querySelectorAll('[data-group="delete-list"]');
		selectAllCheckbox.addEventListener("change", function() {
			checkboxes.forEach(function(checkbox) {
				checkbox.checked = selectAllCheckbox.checked;
			});
		});
		checkboxes.forEach(function(checkbox) {
			checkbox.addEventListener("change", function() {
				if (!this.checked) {
					selectAllCheckbox.checked = false;
				} else {
					// 모든 체크박스가 선택되었는지 확인
					var allChecked = true;
					checkboxes.forEach(function(c) {
						if (!c.checked) {
							allChecked = false;
						}
					});
					selectAllCheckbox.checked = allChecked;
				}
			});
		});

		// 작업지시상세내용 새창
		function openDetails(woCode) {
			var url = '${pageContext.request.contextPath}/workOrder/workOrderDetails?woCode='
					+ woCode;
			var windowWidth = 560;
			var windowHeight = 720;
			var windowLeft = (screen.width - windowWidth) / 2;
			var windowTop = (screen.height - windowHeight) / 2;
			var newWindow = window.open(url, '_blank', 'width=' + windowWidth
					+ ', height=' + windowHeight + ', left=' + windowLeft
					+ ', top=' + windowTop);
		}
		//작업지시등록 새창
		function openInsert() {
			var url = '${pageContext.request.contextPath}/workOrder/workOrderInsert';
			var windowWidth = 550;
			var windowHeight = 710;
			var windowLeft = (screen.width - windowWidth) / 2;
			var windowTop = (screen.height - windowHeight) / 2;
			var newWindow = window.open(url, '_blank', 'width=' + windowWidth
					+ ', height=' + windowHeight + ', left=' + windowLeft
					+ ', top=' + windowTop);
		}

		
		//검색취소버튼 입력칸 초기화 및 placeholder값 재지정
		function resetSearch() {
			
		    $("#productCode").val("");
		    $("#productName").val("");		   
		    $("#woDate1").val("");
		    $("#woDate2").val("");

		   
		    $("#productCode").attr("placeholder", "상품코드");
		    $("#productName").attr("placeholder", "상품명(클릭)");
		    $("#woDate1").attr("placeholder", "지시일자");
		    $("#woDate2").attr("placeholder", "지시일자");
		   
		    
		    $('#select1').prop('checked', false);
		    $('#select2').prop('checked', false);
		   
		}
		
		
		
		 $(document).ready(function() {
		        // 전체선택 체크박스 클릭 시
		        $("#delete-list-all").on("click", function() {
		            $("input:checkbox[name=delete-list]").prop("checked", this.checked);
		        });

		        // 개별 체크박스 클릭 시
		        $(document).on("click", "input:checkbox[name=delete-list]", function(e) {
		            var chks = document.getElementsByName("delete-list");
		            var chksChecked = 0;

		            for (var i = 0; i < chks.length; i++) {
		                var cbox = chks[i];

		                if (cbox.checked) {
		                    chksChecked++;
		                }
		            }
		            if (chks.length == chksChecked) {
		                $("#delete-list-all").prop("checked", true);
		            } else {
		                $("#delete-list-all").prop("checked", false);
		            }
		        });

		        // 전체선택 체크박스 상태 변경 시
		        $(document).on("change", "#delete-list-all", function() {
		            // 상황에 맞게 처리
		        });
		    });

		    // 선택삭제
		    function selectedDel() {
		        var postIds = [];
		        var selectedRows = [];

		        // 선택된 체크박스와 해당 행을 찾아서 배열에 추가
				$("[name='delete-list']:checked").each(function() {
					postIds.push($(this).closest("tr").find("[name=woCode]").text())
					console.log("value:" + $(this).closest("tr").find("[name=woCode]").text())
				});


		        if (postIds.length === 0) {
		            alert("삭재할 목록을 선택하세요.");
		            return;
		        }

		        // 사용자에게 삭제 여부를 확인하는 대화 상자 표시
		        var confirmMessage = "선택한 목록을 삭제하시겠습니까?";
		        
		        console.log(postIds);
		        if(confirm(confirmMessage)) {
		        	$.ajax({
		        		type: "POST",
		        		url: "/Keypoint/workOrder/deleteSelected?" + $.param({"postIds": postIds.join("|")}),
//		                data: {
//		                    postIds: postIds.join("|")
//		                },
		        		success: function(result) {
		        			location.reload();
		        		},
		                error: function(xhr, status, error) {
		                    alert(error);
		                }
		        	})
		        }
		

		    }
		
		    //엑셀 버튼 누를 시 실행되는 함수
			$("#excelWorkOrder").click(function(){
//					체크박스가 체크된 여부를 확인하기위한 변수선언
				var selectedCheckbox = $("input[name='delete-list']:checked");
				if(selectedCheckbox.length === 0){
					alert("엑셀파일로 다운로드할 행을 선택해주세요")
					return false;
				} 

				// 엑셀에 데이터를 삽입하기위한 배열 변수선언
				var excelData = [];
				
				// 엑셀의 헤더가 되는 값을 삽입하기위한 변수선언
				var headers = [];
				
					// table의 th태그만큼 반복문을 실행하되 첫번째 체크박스행은 제외한다
					$("#datatablesSimple th:not(:first)").each(function(){
						// 헤더에 텍스트값(th) 삽입
						headers.push($(this).text());
					});
					// 엑셀 데이터 변수에 헤더값을 삽입한다
					excelData.push(headers);
				
					// 체크박스가 체크된 행 만큼 엑셀 행삽입 반복문을 시행한다
					selectedCheckbox.each(function () {
					
						// 엑셀의 행값을 담기위한 배열 변수선언
				    	var row = [];
						// tr태그를 찾아서 반복문을 실행하되 첫번째 td태그(체크박스)는 제외한다
				    	$(this).closest("tr").find("td:not(:first-child)").each(function () {
				    		// 행 변수에 테이블 행(td)태그의 텍스트 값을 삽입한다
				        	row.push($(this).text());
				    	});
						// 엑셀 데이터 변수에 행값을 삽입한다
				   		excelData.push(row);
					});
					
					// 워크북을 생성한다
					var workbook = XLSX.utils.book_new();
					// 엑셀 데이터(헤더, 행)값을 시트로 변환한다
					var worksheet = XLSX.utils.aoa_to_sheet(excelData);
					// 데이터와 워크북 시트를 워크북에 추가한다
					XLSX.utils.book_append_sheet(workbook, worksheet, "작업지시 리스트");
					
					// 워크북을 blob형태로 변환하고 xlsx 파일로 저장한다
					var workbookOutput = XLSX.write(workbook, { bookType: "xlsx", type: "array" });
					saveAs(
						new Blob([workbookOutput], { type: "application/octet-stream" }),
						"작업지시 리스트.xlsx"
					);
				
			});// end function
		
		
			//권한없는 버튼
			function accessDenied() {
			    alert("권한이 없습니다.");
			}
			
			
		
		</script>

<script>
// 초기화 아이콘 누르면 실행
function reset() {
    location.href = "${pageContext.request.contextPath}/workOrder/workOrderList";
}
</script>


</body>
</html>