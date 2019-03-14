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
    /* #mainImage{

		-webkit-filter: grayscale(100%);
		filter: gray;

    } */
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
<section id="mainImage" class="about-section text-center" style="padding-bottom:5%;background-image: url('../resources/img/bg-signup.jpg');">
<div  class="container "style="background-color: white;margin-top: 0px;border-radius:5px;height:auto;padding-bottom: 30px;width:auto;">
	<div class="tab" style="padding: 3% 30px 5% 30px;">
	  <a class="tablinks" href="#info01">카테고리</a>
	  <a class="tablinks" href="#info02">캐슬이름</a>
	  <a class="tablinks" href="#info03">캐슬번호</a>
	  <a class="tablinks" href="#info04">캐슬위치</a>
	  <a class="tablinks" href="#info05">캐슬소개</a>
	  <a class="tablinks" href="#info06">강사진</a>
	  <a class="tablinks" href="#info07">오시는길</a>
	  <a class="tablinks" href="#info08">수강신청</a>
	  <a class="tablinks" href="#info09">캐슬링후기</a>
	  
	</div>
	<table class="table table-bordered" >
		<colgroup>
			<col width="200px"/>
			<col width="350px"/>
			<col width="*"/>
		</colgroup>
		<tr id="info01" >
			<td style="vertical-align: middle">카테고리</td>
			<td style="vertical-align: middle;text-align: left;height:auto;padding: 30px;">
				전체>예체능>피아노 </td>
			<td rowspan="4" style="height:400px;">
				<div class="container">
				<%@ include file="/../resources/DR_common/commonPhotoSlide.jsp" %>
			    </div>
			</td>
		</tr>
		<tr id="info02">
			<td style="vertical-align: middle">캐슬명</td>
			<td style="vertical-align: middle;text-align: left;height:auto;padding: 30px;">
			${dto.acaName }</td>

		</tr>
		<tr id="info03">
			<td style="vertical-align: middle">캐슬번호</td>
			<td style="vertical-align: middle;text-align: left;height:auto;padding: 30px;">
				${dto.acaHPNumber }</td>

		</tr>
		<tr id="info04">

			<td style="vertical-align: middle">캐슬위치</td>
			<td style="vertical-align: middle;text-align: left;height:auto;padding: 30px;">${dto.acaAddress }&nbsp;${dto.acaDetailAddress }</td>

		</tr>
		<tr id="info05">
			<td style="vertical-align: middle">학원소개</td>
			<td colspan="2" style="height:auto;padding: 30px;text-align: left"></td>
		</td>
		</tr>
		<tr id="info06">
			<td style="vertical-align: middle;height:auto;padding: 30px;">강사진</td>
			<td style="vertical-align: middle;text-align: left;"colspan="2">
				<!-- 강사 목록 s -->
			  <div class="row" style="padding-left: 30px;">
			  	<!--  -->
				<div>
				<table class="table" style="width:150px;margin:5px 15px 10px 0px;">
					<tr style="width:80px;">
						<td style="padding:3px;height:170px;width:70px;text-align: center;">
		             		<img src="../resources/img/bg-masthead.jpg" style="width:100%;height:100%"
		             		alt="엑스박스" />
             			</td>
					</tr>
				 	<tr style="width:100px;text-align: center;">
				 		<td>강사이름</td>
				 	</tr>
				 	<tr style="width:100px;height:70px;text-align: center;">
				 		<td>국어,듣기,웅변<br />모의고사 특강</td>
				 	</tr>
				</table>
				</div>
				<!--  -->
				<div>
				<table class="table" style="width:150px;margin:5px 15px 10px 0px;">
					<tr style="width:80px;">
						<td style="padding:3px;height:170px;width:70px;text-align: center;">
		             		<img src="../resources/img/bg-masthead.jpg" style="width:100%;height:100%"
		             		alt="엑스박스" />
             			</td>
					</tr>
				 	<tr style="width:100px;text-align: center;">
				 		<td>강사이름</td>
				 	</tr>
				 	<tr style="width:100px;height:70px;text-align: center;">
				 		<td>국어,듣기,웅변<br />모의고사 특강</td>
				 	</tr>
				</table>
				</div><div>
				<table class="table" style="width:150px;margin:5px 15px 10px 0px;">
					<tr style="width:80px;">
						<td style="padding:3px;height:170px;width:70px;text-align: center;">
		             		<img src="../resources/img/bg-masthead.jpg" style="width:100%;height:100%"
		             		alt="엑스박스" />
             			</td>
					</tr>
				 	<tr style="width:100px;text-align: center;">
				 		<td>강사이름</td>
				 	</tr>
				 	<tr style="width:100px;height:70px;text-align: center;">
				 		<td>국어,듣기,웅변<br />모의고사 특강</td>
				 	</tr>
				</table>
				</div>
				<div>
				<table class="table" style="width:150px;margin:5px 15px 10px 0px;">
					<tr style="width:80px;">
						<td style="padding:3px;height:170px;width:70px;text-align: center;">
		             		<img src="../resources/img/bg-masthead.jpg" style="width:100%;height:100%"
		             		alt="엑스박스" />
             			</td>
					</tr>
				 	<tr style="width:100px;text-align: center;">
				 		<td>강사이름</td>
				 	</tr>
				 	<tr style="width:100px;height:70px;text-align: center;">
				 		<td>국어,듣기,웅변<br />모의고사 특강</td>
				 	</tr>
				</table>
				</div>
				<div>
				<table class="table" style="width:150px;margin:5px 15px 10px 0px;">
					<tr style="width:80px;">
						<td style="padding:3px;height:170px;width:70px;text-align: center;">
		             		<img src="../resources/img/bg-masthead.jpg" style="width:100%;height:100%"
		             		alt="엑스박스" />
             			</td>
					</tr>
				 	<tr style="width:100px;text-align: center;">
				 		<td>강사이름</td>
				 	</tr>
				 	<tr style="width:100px;height:70px;text-align: center;">
				 		<td>국어,듣기,웅변<br />모의고사 특강</td>
				 	</tr>
				</table>
				</div>
				
			  </div>
			</td>
		</tr>
		<!-- 강사 목록 e -->
		<!-- 오시는길 -->
		<tr id="info07">
			<td style="vertical-align: middle">오시는길</td>
			<td colspan="2" style="height:auto;padding: 30px;text-align: left">
				<div id="map" style="width:100%;height:350px;"></div>
			</td>
		</tr>
		<!-- 오시는길 -->
		<!-- 수강신청 -->
		<tr id="info08">
			<td style="vertical-align: middle;height:auto;padding: 30px;">수강신청</td>
			<td style="vertical-align: middle;text-align: left;height:auto;padding: 30px;"colspan="2">
				<form action="paymentAction.do" method="post">
				<table class="table">
					<colgroup>
						<col width="25%"/>
						<col width="25%"/>
						<col width="25%"/>
						<col width="25%"/>
					</colgroup>
					<h6>수강정보1</h6>
					<tr>
						<td>g</td>
						<td>g</td>
						<td rowspan="2">g</td>
						<td rowspan="2" style="text-align: center;vertical-align: middle"
						><button class="btn btn-success" value="" style="font-size: 1em;">수강신청</button></td>
					</tr>
					<tr>
						<td>g</td>
						<td>g</td>
					</tr>
					<hr class="my-4">
				</table>
				</form>
				<form action="paymentAction.do" method="post">
				<table class="table">
					<colgroup>
						<col width="25%"/>
						<col width="25%"/>
						<col width="25%"/>
						<col width="25%"/>
					</colgroup>
					<h6>수강정보1</h6>
					<tr>
						<td>g</td>
						<td>g</td>
						<td rowspan="2">g</td>
						<td rowspan="2" style="text-align: center;vertical-align: middle"
						><button class="btn btn-success" value="" style="font-size: 1em;">수강신청</button></td>
					</tr>
					<tr>
						<td>g</td>
						<td>g</td>
					</tr>
					<hr class="my-4">
				</table>
				</form>
				<form action="payment.do" method="post">
				<table class="table">
					<colgroup>
						<col width="25%"/>
						<col width="25%"/>
						<col width="25%"/>
						<col width="25%"/>
					</colgroup>
					<h6>수강정보1</h6>
					<tr>
						<td>g</td>
						<td>g</td>
						<td rowspan="2">g</td>
						<td rowspan="2" style="text-align: center;vertical-align: middle"
						><button class="btn btn-success" value="" style="font-size: 1em;">수강신청</button></td>
					</tr>
					<tr>
						<td>g</td>
						<td>g</td>
					</tr>
					<hr class="my-4">
				</table>
				</form>
				<form action="payment.do" method="post">
				<table class="table">
					<colgroup>
						<col width="25%"/>
						<col width="25%"/>
						<col width="25%"/>
						<col width="25%"/>
					</colgroup>
					<h6>수강정보1</h6>
					<tr>
						<td>g</td>
						<td>g</td>
						<td rowspan="2">g</td>
						<td rowspan="2" style="text-align: center;vertical-align: middle"
						><button class="btn btn-success" value="" style="font-size: 1em;">수강신청</button></td>
					</tr>
					<tr>
						<td>g</td>
						<td>g</td>
					</tr>
					<hr class="my-4">
				</table>
				</form>
				<form action="payment.do" method="post">
				<table class="table">
					<colgroup>
						<col width="25%"/>
						<col width="25%"/>
						<col width="25%"/>
						<col width="25%"/>
					</colgroup>
					<h6>수강정보1</h6>
					<tr>
						<td>g</td>
						<td>g</td>
						<td rowspan="2">g</td>
						<td rowspan="2" style="text-align: center;vertical-align: middle"
						><button class="btn btn-success" value="" style="font-size: 1em;">수강신청</button></td>
					</tr>
					<tr>
						<td>g</td>
						<td>g</td>
					</tr>
					<hr class="my-4">
				</table>
				</form>
				<form action="payment.do" method="post">
				<table class="table">
					<colgroup>
						<col width="25%"/>
						<col width="25%"/>
						<col width="25%"/>
						<col width="25%"/>
					</colgroup>
					<h6>수강정보1</h6>
					<tr>
						<td>g</td>
						<td>g</td>
						<td rowspan="2">g</td>
						<td rowspan="2" style="text-align: center;vertical-align: middle"
						><button class="btn btn-success" value="" style="font-size: 1em;">수강신청</button></td>
					</tr>
					<tr>
						<td>g</td>
						<td>g</td>
					</tr>
					<hr class="my-4">
				</table>
				</form>

				
			</td>
		</tr>
		<tr id="info09">
			<td style="vertical-align: middle" colspan="4">
			<div>
			<%@ include file="/../resources/DR_common/commonComment.jsp" %>
			</div>
			<div class="row text-center" style="padding-left: 44%">
				<!-- 페이지번호 부분 -->
				<ul class="pagination" style="text-align: center; ">	
					<li><a href="#"><span class="glyphicon glyphicon-hand-left"></span><<</a></li>&nbsp;
					<li><a href="#"><span class="glyphicon glyphicon-fast-backward"></span><</a></li>&nbsp;
					<li><a href="#">1</a></li>&nbsp;		
					<li class="active"><a href="#">2</a></li>&nbsp;
					<li><a href="#">3</a></li>&nbsp;
					<li><a href="#">4</a></li>&nbsp;	
					<li><a href="#">5</a></li>&nbsp;
					<li><a href="#"><span class="glyphicon glyphicon-fast-forward"></span>></a></li>&nbsp;
					<li><a href="#"><span class="glyphicon glyphicon-hand-right"></span>>></a></li>
				</ul>	
			</div>	
			</td>
		</tr>
	</table>
		<a href="#info01"><button type = "button"  class="btn btn-info" style="margin:10px;width:auto;height:auto;vertical-align: middle;">위로가기</button></a>
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
<<<<<<< HEAD
  <script src="js/grayscale.min.js"></script>
  
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2ec06b0333644bd4771e72d23ed5395f&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표입니다!!adasd
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('서울특별시 노원구 하계동 256', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {

        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new daum.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${dto.acaName }</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
=======
  <script src="/FinallyProject/resources/js/grayscale.min.js"></script>
>>>>>>> refs/remotes/origin/master

</body>
</html>
