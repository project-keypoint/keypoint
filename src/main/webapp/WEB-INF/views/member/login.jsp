<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>키포인트 로그인</title>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary" style=" background: url(${pageContext.request.contextPath}/resources/img/pxfuel.jpg); 
										background-repeat: no-repeat; background-size: 100vw 100vh;">

    <div class="container" style="padding-top: 10.5vh;">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-none my-5" style=" background-color: transparent;">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row" style="justify-content: space-around;">
                            <div class="col-lg-6" >
                                <div class="p-5" style="background-color: white; border-radius: 0.35rem;">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">KEYPOINT</h1>
                                    </div>
                                    <form action="${pageContext.request.contextPath}/employee/loginPro" id="join" method="post" class="user" >
                                        <div class="form-group">
                                            <input type="text" name="empId"  value="${cookie.empId.value}"
                                            class="form-control form-control-user"
                                                id="InputempNum" aria-describedby="emailHelp"
                                                placeholder="사원번호">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="empPass" class="form-control form-control-user"
                                                id="InputempPass" placeholder="비밀번호">
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" ${empty cookie.id.value ? "":"checked" }
                                                class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">아이디 기억하기</label>
                                            </div>
                                        </div>
                                       
                                        <input type="submit" value="로그인" class="btn btn-primary btn-user btn-block">
                                      
                                       
                                    </form>
  
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>

<script type="text/javascript">
// 아이디기억하기
$(document).ready(function(){
  
     
    var key = getCookie("key");
    $("#InputempNum").val(key); 
      
    if($("#InputempNum").val() != ""){
        $("#customCheck").attr("checked", true); 
    }
      
    $("#customCheck").change(function(){ 
        if($("#customCheck").is(":checked")){ 
            setCookie("key", $("#InputempNum").val(), 7); 
        }else{ 
            deleteCookie("key");
        }
    });
      
    
    $("#InputempNum").keyup(function(){ 
        if($("#customCheck").is(":checked")){ 
            setCookie("key", $("#InputempNum").val(), 7); 
        }
    });
});
  
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
  
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
  
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}

</script>

</body>


</html>