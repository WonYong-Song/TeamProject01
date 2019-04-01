<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="en">

<head>
  <style>
  /* 모달창 */
	.modal {
		text-align: center;
		padding: 0!important;
	}
	.modal:before {
		content: '';
		display: inline-block;
		height: 100%;
		vertical-align: middle;
		margin-right: -4px;
	}
	.modal-dialog {
		display: inline-block;
		text-align: left;
		vertical-align: middle; 
	}
  </style> 
  
  <!-- 끌어온 스킨의 것 -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  
  <title>Grayscale - Start Bootstrap Theme</title>
  
  <!-- Bootstrap core CSS -->
  <link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template -->
  <link href="../resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="../resources/css/grayscale.min.css" rel="stylesheet">

</head>

<body id="page-top">

  <!-- Nav Bar -->
  <%@ include file="/../resources/DR_common/commonNavTop2.jsp" %>
  <!-- Nav Bar -->
  <!-- Header -->
  <header class="masthead">
    <div class="container d-flex h-100 align-items-center">
      <div class="mx-auto text-center" style="width:550px; height:730px;background-color: white;margin-top:50px;;border-radius: 5px;padding-top: 60px;padding-bottom: 50px; ">
       <!--결제창 컨텐츠  -->
       <%@ include file="/../resources/DR_common/commonPaymentAction.jsp" %>
       <script>
		function f_print(){
		    var initBody = document.body.innerHTML;
		    window.onbeforeprint = function(){
		        // print_area는 인쇄하고자 하는 영역의 ID를 말합니다.( 필수 )
		        document.body.innerHTML = document.getElementById("info").innerHTML;
		    }
		    window.onafterprint = function(){
		        document.body.innerHTML = initBody;
		    }
		    window.print();
		}
		</script>
		<div style="text-align: right;font-weight: bold;padding-right: 10px;"><a href="javascript:f_print()()" title="페이스북으로 가져가기"><img src="../resources/img/프린트.png" alt="" style="width:30px;height: 30px;"/>&nbsp;&nbsp;&nbsp;수강정보 인쇄하기</a></div>
       <!--결제창 컨텐츠  -->
      </div>
    </div>
  </header>
  <section>
  <!-- About Section -->
  <section id="about" class="about-section text-center">
    <div class="container">
     
      <img src="img/ipad.png" class="img-fluid" alt="">
    </div>
  </section>
  <!-- Footer -->
  <footer class="bg-black small text-center text-white-50">
     <%@ include file="/../resources/DR_common/commonBottom.jsp" %>
  </footer>
  </section>
<!-- Bootstrap core JavaScript -->
  <script src="/FinallyProject/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/FinallyProject/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="/FinallyProject/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="/FinallyProject/resources/js/grayscale.min.js"></script>

</body>
</html>
