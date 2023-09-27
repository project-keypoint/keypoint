<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>발주등록</title>
    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
</head>

<body>

 	<%
        java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        java.util.Date date = new java.util.Date();
        String formattedDate = dateFormat.format(date);
    %>



    <div class="container">
        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
            
                <!-- Nested Row within Card Body -->
                <div class="row" style="justify-content: space-around;">
                    <div class="col-lg-7">
                        <div class="p-5">
                        
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">발주 등록</h1>
                            </div>
                            
                            <!-- ----------------------------------------------------- -->
                            
                            <form class="user" action="${pageContext.request.contextPath}/purchase/purchaseInsertPro" id="test1" onsubmit="submitForm(event);" method="post">

								<div class="form-group row">
								
								    <div class="col-sm-6 mb-3 mb-sm-0">
								        <div class="input-group">
								            <input type="text" class="form-control form-control-user" name="materialCode" placeholder="자재코드">
								            <div class="input-group-append">
								                <button type="button" class="btn btn-primary" id="searchMaterial">검색</button>
								            </div>
								        </div>
								    </div>
    
								    <div class="col-sm-6">
								        <input type="text" class="form-control form-control-user" name="materialName" placeholder="자재명">
								    </div>
								    
								</div>
                               <!-- ----------------------------------------------------- -->  
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" name="poCount" placeholder="발주수량">
                                </div>
                                <!-- ----------------------------------------------------- --> 
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" name="materialPrice" placeholder="자재단가">
                                </div>
                                 <!-- ----------------------------------------------------- -->
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" name="poPrice" placeholder="발주금액">
                                </div>
                                 <!-- ----------------------------------------------------- -->
                                <div class="form-group">
								    <input type="text" class="form-control form-control-user" name="poDate" id="poDate" placeholder="발주일자">
								</div>
                                 <!-- ----------------------------------------------------- -->
                                <div class="form-group">
						       		 <input type="text" class="form-control form-control-user" name="payDate" id="payDate" placeholder="납기일자">
						    	</div>
						    	 <!-- ----------------------------------------------------- -->
						    	<div class="form-group">
								    <div class="input-group">
								        <input type="text" class="form-control form-control-user" name="poOwner" placeholder="담당자">
								        <div class="input-group-append">
								            <button type="button" class="btn btn-primary" id="searchOwner">검색</button>
								        </div>
								    </div>
								</div>
								 <!-- ----------------------------------------------------- -->
								<div class="form-group">
								    <div class="input-group">
								        <input type="text" class="form-control form-control-user" name="cusName" placeholder="거래처">
								        <div class="input-group-append">
								            <button type="button" class="btn btn-primary" id="searchCustomer">검색</button>
								        </div>
								    </div>
								</div>
								
								
								<div class="form-group">
								    <input type="text" class="form-control" id="poCode" name="poCode" placeholder="발주코드" readonly>
								</div>
							 <!-- ----------------------------------------------------- -->
								<div class="form-group">
								    <input type="text" class="form-control" id="poStatus" name="poStatus" value="발주대기" readonly>
								</div>
								
                                 <!-- ----------------------------------------------------- -->
                                <button type="submit" class="btn btn-primary btn-user btn-block" >발주등록</button>
                                <button type="reset" class="btn btn-secondary btn-user btn-block">초기화</button>
                           
                            </form>
                            
                        </div> <!-- p-5 -->
                    </div> <!-- col-lg-7 -->
                </div> <!-- row -->
                
            </div> <!-- card-body p-0 -->
        </div> <!-- card o-hidden border-0 shadow-lg my-5 -->
    </div> <!-- container -->
    
    
    <!-- 발주날짜 오늘날짜로, 팝업창 j쿼리 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
	<!-- 발주일자 클릭시 현재날짜로 변경 -->
	<script>
	document.addEventListener('DOMContentLoaded', function () {
	    var poDateInput = document.getElementById("poDate");
	
	    poDateInput.addEventListener("click", function () {
	        var today = new Date();
	        var yyyy = today.getFullYear();
	        var mm = String(today.getMonth() + 1).padStart(2, '0');
	        var dd = String(today.getDate()).padStart(2, '0');
	        var hh = String(today.getHours()).padStart(2, '0');
	        var mi = String(today.getMinutes()).padStart(2, '0');
	        var ss = String(today.getSeconds()).padStart(2, '0');
	        var formattedDate = yyyy + "-" + mm + "-" + dd + " " + hh + ":" + mi + ":" + ss;
	        
	        poDateInput.value = formattedDate;
	        poDateInput.readOnly = true;
	        poDateInput.placeholder = "";
	    });
	});
	</script>
	<!-- // 발주일자 클릭시 현재날짜로 변경 -->
	
	<!-- 발주날짜(현재날짜) 이후로 납기일자 선택하게끔 설정 -->
	<script>
	// 발주일자 입력란의 값 가져오기
	var poDateInput = document.getElementById("poDate");
	var poDateValue = poDateInput.value;
	
	// 발주일자를 현재 년월일로 설정 (YYYY-MM-DD 형식)
	var today = new Date();
	var dd = String(today.getDate()).padStart(2, '0');
	var mm = String(today.getMonth() + 1).padStart(2, '0'); // January is 0!
	var yyyy = today.getFullYear();
	var currentDateString = yyyy + '-' + mm + '-' + dd;
	
	// 납기일자 입력란
	var payDateInput = document.getElementById("payDate");
	
	// 발주일자 이후의 날짜만 선택할 수 있도록 Datepicker 설정
	$(function() {
	    $("#payDate").datepicker({
	        minDate: currentDateString, // 현재 날짜 이후로 설정
	        dateFormat: "yy-mm-dd", // MySQL DATE 형식으로 출력
	    });
	});
	</script>
	<!-- // 발주날짜(현재날짜) 이후로 납기일자 선택하게끔 설정 -->
	
	
	<!-- 자재코드 검색기능 -->
	<script>
	    $(document).ready(function() {
	        $("#searchMaterial").click(function() {
	            // 자재코드 입력란의 값을 가져옵니다.
	            var materialCode = $("input[name='materialCode']").val();
	
	            // 여기에서 검색 기능을 구현하고, 필요한 로직을 수행합니다.
	            // 예: 자재코드를 이용하여 검색하고 결과를 표시합니다.
	            
	            $(document).ready(function() {
	    	        $("#searchMaterial").click(function() {
	    	            // 팝업 창 크기 및 위치 설정
	    	            var width = 800;
	    	            var height = 600;
	    	            var left = (screen.width - width) / 2;
	    	            var top = (screen.height - height) / 2;
	    	
	    	            // 팝업 창 열기
	    	            var materialSearchUrl = "${pageContext.request.contextPath}/purchase/test2"; // 자재 검색 페이지의 URL을 입력하세요.
	    	            var popupWindow = window.open(materialSearchUrl, "자재검색", "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
	    	
	    	            // 팝업 창 포커스
	    	            popupWindow.focus();
	    	        });
	    	    });
	        });
	    });
	</script>
	<!-- // 자재코드 검색기능 -->
	
	<!-- 자재코드 검색선택시 팝업창 -->
	<script>
	    $(document).ready(function() {
	        $("#searchMaterial").click(function() {
	            // 팝업 창 크기 및 위치 설정
	            var width = 800;
	            var height = 600;
	            var left = (screen.width - width) / 2;
	            var top = (screen.height - height) / 2;
	
	            // 팝업 창 열기
	            var materialSearchUrl = "${pageContext.request.contextPath}/purchase/test2"; // 자재 검색 페이지의 URL을 입력하세요.
	            var popupWindow = window.open(materialSearchUrl, "자재검색", "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top  + ", location=no");
	
	            // 팝업 창 포커스
	            popupWindow.focus();
	        });
	    });
	</script>
	<!-- // 자재코드 검색선택시 팝업창 -->
	
	<!-- 거래처, 담당자 검색기능 -->
	<script>
	    $(document).ready(function() {
	        $("#searchOwner").click(function() {
	            // 담당자 입력란의 값을 가져옵니다.
	            var owner = $("input[name='poOwner']").val();
	
	            // 여기에서 검색 기능을 구현하고, 필요한 로직을 수행합니다.
	            // 예: 담당자를 이용하여 검색하고 결과를 표시합니다.
	        });
	
	        $("#searchCustomer").click(function() {
	            // 거래처 입력란의 값을 가져옵니다.
	            var customer = $("input[name='cusName']").val();
	
	            // 여기에서 검색 기능을 구현하고, 필요한 로직을 수행합니다.
	            // 예: 거래처를 이용하여 검색하고 결과를 표시합니다.
	        });
	    });
	</script>
	<!-- // 거래처, 담당자 검색기능 -->	
	
				
	<!-- test2 -->
	<script>
	    function setMaterialInfo(materialCode, materialName, materialPrice) {
	        // 전달받은 자재 정보를 원하는 대로 처리
	        // 이 예제에서는 간단하게 값을 입력란에 설정하는 예시를 보여줍니다.
	        document.getElementsByName('materialCode')[0].value = materialCode;
	        document.getElementsByName('materialName')[0].value = materialName;
	        document.getElementsByName('materialPrice')[0].value = materialPrice;
	    }
	</script>
		
		
	<!-- 폼 데이터 서브밋하고 팝업창 닫기 -->
	<script>
	    function submitForm(event) {
	        event.preventDefault(); // 폼 기본 동작 방지
	
	        // 여기에서 폼을 서버로 제출하고 등록 로직을 처리합니다.
	        // ...
	
	        // 팝업 창 닫기
	        window.close();
	    }
	</script>			
	<!-- // 폼 데이터 서브밋하고 팝업창 닫기	 -->
	
	<!-- 발주일자 클릭시 발주코드 자동생성 -->
	<script>
	    document.addEventListener('DOMContentLoaded', function () {
	        var poDateInput = document.getElementById("poDate");
	        var poCodeInput = document.getElementById("poCode");
	
	        poDateInput.addEventListener("click", function () {
	            var today = new Date();
	            var yyyy = today.getFullYear();
	            var mm = String(today.getMonth() + 1).padStart(2, '0');
	            var dd = String(today.getDate()).padStart(2, '0');
	            var hh = String(today.getHours()).padStart(2, '0');
	            var mi = String(today.getMinutes()).padStart(2, '0');
	            var ss = String(today.getSeconds()).padStart(2, '0');
	            var formattedDate = yyyy + "-" + mm + "-" + dd + " " + hh + ":" + mi + ":" + ss;
	
	            // 생성된 발주일자를 입력란에 설정
	            poDateInput.value = formattedDate;
	            poDateInput.readOnly = true;
	            poDateInput.placeholder = "";
	
	            // 발주일자와 함께 poCode를 생성하여 입력란에 설정
	            var poCode = "ORD" + yyyy + mm + dd + hh + mi + ss;
	            poCodeInput.value = poCode;
	        });
	    });
	</script>
	<!-- // 발주일자 클릭시 발주코드 자동생성 -->
	
	<!-- 발주수량 * 자재단가의 곱 -->
	<script>
	    // poCount와 materialPrice 값을 곱하여 poPrice에 설정하는 함수
	    function calculatePoPrice() {
	        // poCount와 materialPrice 입력란의 값을 읽어옴
	        var poCount = parseFloat(document.getElementsByName("poCount")[0].value);
	        var materialPrice = parseFloat(document.getElementsByName("materialPrice")[0].value);
	        
	        // materialPrice 값이 NaN인지 확인
	        if (isNaN(materialPrice)) {
	            // materialPrice가 NaN이면 poPrice 입력란에 빈 문자열 설정
	            document.getElementsByName("poPrice")[0].value = "";
	        } else {
	            // poCount와 materialPrice를 곱함
	            var poPrice = poCount * materialPrice;
	            
	            // 곱한 결과를 poPrice 입력란에 설정
	            document.getElementsByName("poPrice")[0].value = poPrice;
	        }
	    }
	    
	    // poCount와 materialPrice 입력란 값이 변경될 때마다 자동으로 발생하는 이벤트 리스너 등록
	    document.getElementsByName("poCount")[0].addEventListener("input", calculatePoPrice);
	    document.getElementsByName("materialPrice")[0].addEventListener("input", calculatePoPrice);
	</script>
	<!-- //  발주수량 * 자재단가의 곱 -->
	
	
	
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>
</body>
</html>
