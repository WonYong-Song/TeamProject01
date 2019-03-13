<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Grayscale - Start Bootstrap Theme</title>

  <!-- Bootstrap core CSS -->
  <link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="./resources/bs3.3.7/css/bootstrap.css" />	
  <!-- Custom fonts for this template -->
  <link href="../resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="../resources/css/grayscale.min.css" rel="stylesheet">
  
</head>
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
/* 이미지 크기 고정 */
.selector img{
position: absolute; top:0; left: 0;
width: 100%;
height: 100%;
}
</style>

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
<!-- 
	<i class="fas fa-envelope text-primary mb-2"></i>  이메일 아이콘
    <i class="fas fa-map-marked-alt text-primary mb-2"></i> 주소 아이콘
	<hr class="my-4">  하단 바 
	  <h4 class="text-uppercase m-0">학원 주소</h4> 카테고리
             
      <div class="small text-black-50">4923 Market Street, Orlando FL</div>
-->
	 
  <!-- Contact Section -->
  <section class="contact-section bg-black">
    <div class="container" >
      <div class="row">
        <div class="col-md-12 " style="margin-bottom: -45px;">
         <a href="academyInfo.do" target="_blank">
          <div class="card py-4 h-60" style="width:900px;height:167px; margin-left: 10%;">
          	<div style="padding: 0px 6px 0px 6px">
             <table class="table table-bordered " style="margin-bottom: 30px; margin-top: -2%; border-top: none;">
             <colgroup>
					<col width="120px"/>
					<col width="60px"/>
					<col width="120px"/>
					<col width="60px"/>
					<col width="100px"/>
			</colgroup>
             <tr>
             	<td rowspan="3" style="padding: 3px;height:150px;wieth:200px;">
             		<img src="../resources/img/bg-masthead.jpg" style="width:100%;height:100%"
             		alt="엑스박스" /> 
             	<td>분류</td>
             	<td colspan="3">전체>학원>예체능>피아노</td>
             </tr>
             <tr>
             	<td>캐슬 이름</td>
             	<td>위드유 성인 피아노 학원</td>
             	<td>캐슬 평점</td>
             	<td>★★★★★</td>
             </tr>
             <tr>
             	<td>캐슬 주소</td>
             	<td colspan="3">서울특별시 노원구 상계로 518-2 3층</td>
             </tr>
             </table>
             </div>
           	</div>
          </a>
        </div>
      </div>
    </div>
  </section>
   <section class="contact-section bg-black">
    <div class="container" >
      <div class="row">
        <div class="col-md-12 " style="margin-bottom: -45px;">
          <div class="card py-4 h-100 " style="width:900px; height:200px;margin-left: 10%  ">
          	<a href="list.do" target="_blank">
            <div class="card-body text-center">
              <i class="fas fa-map-marked-alt text-primary mb-2"></i>
              <h4 class="text-uppercase m-0">Address</h4>
              <hr class="my-4">
              <div class="small text-black-50">4923 Market Street, Orlando FL</div>
              </a>
            </div>
          </div>
        </div>
      </div>
  </section>
   <section class="contact-section bg-black">
    <div class="container" >
      <div class="row">
        <div class="col-md-12 " style="margin-bottom: -45px;">
          <div class="card py-4 h-100 " style="width:900px; height:200px;margin-left: 10%  ">
          	<a href="list.do" target="_blank">
            <div class="card-body text-center">
              <i class="fas fa-map-marked-alt text-primary mb-2"></i>
              <h4 class="text-uppercase m-0">Address</h4>
              <hr class="my-4">
              <div class="small text-black-50">4923 Market Street, Orlando FL</div>
              </a>
            </div>
          </div>
        </div>
      </div>
  </section>
   <section class="contact-section bg-black">
    <div class="container" >
      <div class="row">
        <div class="col-md-12 " style="margin-bottom: -45px;">
          <div class="card py-4 h-100 " style="width:900px; height:200px;margin-left: 10%  ">
          	<a href="list.do" target="_blank">
            <div class="card-body text-center">
              <i class="fas fa-map-marked-alt text-primary mb-2"></i>
              <h4 class="text-uppercase m-0">Address</h4>
              <hr class="my-4">
              <div class="small text-black-50">4923 Market Street, Orlando FL</div>
              </a>
            </div>
          </div>
        </div>
      </div>
  </section>
   <section class="contact-section bg-black">
    <div class="container" >
      <div class="row">
        <div class="col-md-12 " style="margin-bottom: -45px;">
          <div class="card py-4 h-100 " style="width:900px; height:200px;margin-left: 10%  ">
          	<a href="list.do" target="_blank">
            <div class="card-body text-center">
              <i class="fas fa-map-marked-alt text-primary mb-2"></i>
              <h4 class="text-uppercase m-0">Address</h4>
              <hr class="my-4">
              <div class="small text-black-50">4923 Market Street, Orlando FL</div>
              </a>
            </div>
          </div>
        </div>
      </div>
  </section>
   <section class="contact-section bg-black">
    <div class="container" >
      <div class="row">
        <div class="col-md-12 " style="margin-bottom: -45px;">
          <div class="card py-4 h-100 " style="width:900px; height:200px;margin-left: 10%  ">
          	<a href="list.do" target="_blank">
            <div class="card-body text-center">
              <i class="fas fa-map-marked-alt text-primary mb-2"></i>
              <h4 class="text-uppercase m-0">Address</h4>
              <hr class="my-4">
              <div class="small text-black-50">4923 Market Street, Orlando FL</div>
              </a>
            </div>
          </div>
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
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="js/grayscale.min.js"></script>

</body>

</html>
