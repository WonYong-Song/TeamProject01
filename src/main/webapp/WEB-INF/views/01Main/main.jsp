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



  <!-- 끌어다온 스킨 s -->
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
  <!-- 끌어다온 스킨 e -->
</head>

<body id="page-top">

  <!-- Nav Bar -->
  <%@ include file="/../resources/DR_common/commonNavTop.jsp" %>
  <!-- Nav Bar -->

   <!-- Signup Section -->
  <section id="signup" class="signup-section" style="height:300px;">
    <div class="container">
      <div class="row">
        <div class="col-md-10 col-lg-8 mx-auto text-center" style="margin-top: -5%;">

          <i class="far fa-paper-plane fa-2x mb-2 text-white"></i>
          <h2 class="text-white mb-5">Subscribe to receive updates!</h2>

          <form class="form-inline d-flex">
			<div style="width:1000px;">
			<select name="keyField" class="form-control" style="height:59px;padding-right: 10px;">
				<option value="title">캐슬 이름</option>
				<option value="name">캐슬 위치</option>
				<option value="contents">이름+위치</option>
			</select>

            <input type="email" class="form-control " id="inputEmail" placeholder="캐슬정보를 입력해주세요."
            	style="width:400px;">
            <button type="submit" class="btn btn-primary mx-auto">캐슬찾기</button>
            </div>
          </form>

        </div>
      </div>
    </div>
  </section>

  <!-- Contact Section -->
  <section class="contact-section bg-black">
    <div class="container">
      <div class="row">
        <div class="col-md-4 mb-3 mb-md-0">
          <div class="card py-4 h-100">
          	<a href="list.do?cateB=입시&" target="_blank">
            <div class="card-body text-center">
              <i class="fas fa-map-marked-alt text-primary mb-2" ></i>
              <h4 class="text-uppercase m-0" style="font-size: 1em; padding-top: 10px;">대입</h4>
              <hr class="my-4">
              <div class="small text-black-50">작곡,피아노,노래,기타 악기</div>
              </a>
            </div>
          </div>
        </div>

        <div class="col-md-4 mb-3 mb-md-0">
          <div class="card py-4 h-100">
          	<a href="list.do?cateB=예체능&" target="_blank">
            <div class="card-body text-center">
              <i class="fas fa-map-marked-alt text-primary mb-2" ></i>
              <h4 class="text-uppercase m-0" style="font-size: 1em; padding-top: 10px;">예체능</h4>
              <hr class="my-4">
              <div class="small text-black-50">태권도,합기도,유도,체대입시,기타 운동</div>
              </a>
            </div>
          </div>
        </div>

        <div class="col-md-4 mb-3 mb-md-0">
          <div class="card py-4 h-100">
          	<a href="list.do" target="_blank">
            <div class="card-body text-center">
              <i class="fas fa-map-marked-alt text-primary mb-2" ></i>
              <h4 class="text-uppercase m-0" style="font-size: 1em; padding-top: 10px;">직업교육</h4>
              <hr class="my-4">
              <div class="small text-black-50">컴퓨터,바리스타,제과제빵,기타 직업교육</div>
              </a>
            </div>
          </div>
        </div>
    </div>
  </section>

    <section class="contact-section bg-black">
    <div class="container">

      <div class="row" style="margin-left: 41%">

      

      <div class="social d-flex justify-content-center">
        <a href="#" class="mx-2">
          <i class="fab fa-twitter"></i>
        </a>
        <a href="#" class="mx-2">
          <i class="fab fa-facebook-f"></i>
        </a>
        <a href="#" class="mx-2">
          <i class="fab fa-github"></i>
        </a>
      </div>

    </div>
  </section>
  <!-- Footer -->
  <footer class="bg-black small text-center text-white-50">
    <div class="container">
      Copyright &copy; Your Website 2019
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
