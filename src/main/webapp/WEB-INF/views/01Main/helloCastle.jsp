<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="en">

<head>
  
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
  <%@ include file="/../resources/DR_common/commonNavTop.jsp" %>
  <!-- Nav Bar -->
  <!-- Header -->
  <header class="masthead" >
    <div class="container d-flex h-100 align-items-center">
      <div class="mx-auto text-center"  style="margin-top: -5%">
        <h1 class="mx-auto my-0 text-uppercase"><img src="../resources/Images/스터디캐슬 로고.png" alt=""style="height: 240px;width: 800px;" /></h1>
        <div style="margin-top: -8%">
	        <h2 class="text-white-50 mx-auto mt-2 mb-5">' 배움의 품격을 높이다 ,</h2>
	        <div style="margin-left: -1%">
	        	<a href="main.do?" ,target="_blank" class="btn btn-primary js-scroll-trigger" style="font-size:1em;margin-top: -2%">캐슬 시작하기</a>
        	</div>
      	</div>
      </div>
    </div>
  </header>

  <!-- 간단한 소개를 쓸가요? -->
  <!-- <section id="about" class="about-section text-center">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 mx-auto">
          <h2 class="text-white mb-4">Built with Bootstrap 4</h2>
          <p class="text-white-50">Grayscale is a free Bootstrap theme created by Start Bootstrap. It can be yours right now, simply download the template on
            <a href="http://startbootstrap.com/template-overviews/grayscale/">the preview page</a>. The theme is open source, and you can use it for any purpose, personal or commercial.</p>
        </div>
      </div >
      <img src="img/ipad.png" class="img-fluid" alt="">
    </div>
  </section> -->
  <!-- Footer -->
  
  <footer class="bg-black small text-center text-white-50">
    <%@ include file="/../resources/DR_common/commonBottom.jsp" %>
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
