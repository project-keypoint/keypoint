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

</head>
<body>
<%@include file="../inc/top-bar.jsp" %>
<%@include file="../inc/side-bar.jsp" %>

<!--  시작 start --> 
<div class="contents" style="position:fixed; left: 33rem;">
	
	<!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4" >
                    
                        <div class="card-header py-3">
                            <h3 class="m-0 font-weight-bold text-primary">발주현황</h6>
                            <button class="btn btn-primary btn-user btn-block" style="width: 10%; height: 10%; float: right;" onclick="openOrderPage()">발주등록</button>
                        </div>
                        
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>발주코드</th>
                                            <th>자재코드</th>
                                            <th>자재명</th>
                                            <th>발주수량</th>
                                            <th>발주일자</th>
                                            <th>납기일자</th>
                                            <th>자재단가</th>
                                            <th>발주금액</th>
                                            <th>담당자</th>
                                            <th>거래처</th>
                                            <th>발주현황</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                        <tr>
                                            <td>ORD20231019121539</td>
                                            <td>M001</td>
                                            <td>키캡</td>
                                            <td>100</td>
                                            <td>2023/09/20</td>
                                            <td>2023/09/30</td>
                                            <td>10</td>
                                            <td>1000</td>
                                            <td>이홍렬</td>
                                            <td>키보드나라</td>
                                            <td>발주대기</td>
                                        </tr>
                                    </tbody>
                                    
                                </table>
                                
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->
            
                
	<!-- 수정 삭제버튼 -->
	<button class="btn btn-secondary btn-user" style="width: 7%; height: 7%; margin-right: 10px; float: left;">수정</button>
	<button class="btn btn-secondary btn-user" style="width: 7%; height: 7%; float: left;">삭제</button>
	<!-- // 수정 삭제버튼 -->


</div>
<!-- End of Main Content -->
	
	
 <!-- 발주등록 팝업창 -->
	<script>
    function openOrderPage() {
        // 팝업 창 크기 및 위치 설정
        var width = 800;
        var height = 600;
        var left = (screen.width - width) / 2;
        var top = (screen.height - height) / 2;

        // 팝업 창 열기
        var orderPageUrl = "${pageContext.request.contextPath}/purchase/test1"; // 발주 페이지의 URL을 입력하세요.
        var popupWindow = window.open(orderPageUrl, "발주 페이지", "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top + ", location=no");

        // 팝업 창 포커스
        popupWindow.focus();

    }
	</script>
 <!-- // 발주등록 팝업창 -->	
	
	
	
	
	
</div> 
<!-- 끝 end -->
	
</body>
</html>
