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
  
  <title>로그인하기</title>
  
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
  <%@ include file="/../resources/DR_common/commonNavTop.jsp" %>
  <!-- Nav Bar -->
  <!-- Header -->
  <header class="masthead">
    <div class="container d-flex h-100 align-items-center">
      <div class="mx-auto text-center" style="width:550px; height:700px;background-color: white;margin-top: 5%;margin-left: 37%;border-radius: 5px; ">
        <%@ include file="/../resources/DR_common/commonLogin.jsp" %>
      </div>
    </div>
  </header>

  <!-- About Section -->
  <section id="about" class="about-section text-center">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 mx-auto">
        </div>
      </div>
      <img src="img/ipad.png" class="img-fluid" alt="">
    </div>
  </section>
  <!-- Footer -->
  <footer class="bg-black small text-center text-white-50" >
	<div class="row">
    	<div class="col-lg-2">
 			<img src="../resources/Images/스터디캐슬로고4.png" alt=""style="height: 70px;width: 210px;" />
    	</div>
    	<div class="col-lg-8">
    		 <p>주)미라클포포 서울시 금천구 가산동 426-5 월드메르디앙 2차 410호<br /></p>
	 	 	<p>대표이사 : 송원용 사업자등록번호 : 000-00-00000  TEL : 02-0000-0000 FAX : 02-0000-0000 E-mail : beholderstar@gmail.com</p>
	  		<p>Copyright &copy; MiraclePoPo 2019. All rights reserved.</p>
    	</div>
    	<div class="col-lg-2"></div>
    </div>
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="/FinallyProject/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/FinallyProject/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="/FinallyProject/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="/FinallyProject/resources/js/grayscale.min.js"></script>

</body>
</html>
