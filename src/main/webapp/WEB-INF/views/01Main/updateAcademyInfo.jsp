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

    .nav-tabs li a {
        color: #777;
    }
    /* 이미지 흑백 처리 */
    #mainImage{

		-webkit-filter: grayscale(100%);
		filter: gray;

    }
    .tablinks{
    	padding-right: 20px;
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
  <%@ include file="/../resources/DR_common/commonNavTop.jsp" %>
  <!-- Nav Bar -->
  <!-- Header -->



<!-- 학원 정보 등록 페이지  s -->
<section id="mainImage" class="about-section text-center" style="background-image: url('../resources/img/bg-signup.jpg');">
<div  class="container "style="background-color: white;margin-top: 0px;border-radius:5px;height:2000px;padding-bottom: 30px;">
	<div class="tab" style="padding: 3% 30px 5% 30px;">
	  <a class="tablinks" href="#info1">정보1</a>
	  <a class="tablinks" href="#info2">정보2</a>
	  <a class="tablinks" href="#info3">정보3</a>
	  <a class="tablinks" href="#info4">정보4</a>
	  <a class="tablinks" href="#info5">정보5</a>
	  <a class="tablinks" href="#info6">정보6</a>
	  <a class="tablinks" href="#info7">정보7</a>
	  <a class="tablinks" href="#info7">캐슬 후기</a>
	  <a class="tablinks" href="#info7">캐슬 결제</a>
	  
	</div>
	<table class="table table-bordered"style="border: solid blue 1px;width:auto;">
		<colgroup>
			<col width="200px"/>
			<col width="*"/>
		</colgroup>
		<tr id="info1">
			<td>정보1</td>
			<td>내용1</td>
		</tr>
		<tr id="info2">
			<td>정보2</td>
			<td>내용2</td>
		</tr>
		<tr id="info3">
			<td>정보3</td>
			<td>내용3</td>
		</tr>
		<tr id="info4">
			<td>정보4</td>
			<td>내용4</td>
		</tr>
		<tr id="info5">
			<td>정보5</td>
			<td>내용5</td>
		</tr>
		<tr id="info6">
			<td>정보6</td>
			<td>내용6</td>
		</tr>
		<tr id="info7">
			<td>정보7</td>
			<td>내용7</td>
		</tr>
	</table>
	
	<!-- Tab content
	<div id="London" class="tabcontent">
	  <h3>London</h3>
	  <p>London is the capital city of England.</p>
	</div>
	
	<div id="Paris" class="tabcontent">
	  <h3>Paris</h3>
	  <p>Paris is the capital of France.</p> 
	</div>
	
	<div id="Tokyo" class="tabcontent">
	  <h3>Tokyo</h3>
	  <p>Tokyo is the capital of Japan.</p>
	</div> -->
	</div>
</section>

<!-- 학원 정보 등록 페이지  e -->
  <!-- About Section -->
  <!-- <section id="about" class="about-section text-center">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 mx-auto">
          <h2 class="text-white mb-4">Built with Bootstrap 4</h2>
          <p class="text-white-50">Grayscale is a free Bootstrap theme created by Start Bootstrap. It can be yours right now, simply download the template on
            <a href="http://startbootstrap.com/template-overviews/grayscale/">the preview page</a>. The theme is open source, and you can use it for any purpose, personal or commercial.</p>
        </div>
      </div>
      <img src="img/ipad.png" class="img-fluid" alt="">
    </div>
  </section> -->
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
