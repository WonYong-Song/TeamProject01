<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
  <%-- <%@ include file="/../resources/DR_common/commonNavTop.jsp" %>  --%>
<body id="page-top">


  <!-- Nav Bar -->

  <!-- Nav Bar -->
  <!-- Header -->


	



<!-- 학원 정보 등록 페이지  s -->
<section id="mainImage" class="about-section text-center" style="padding-bottom:5%;background-image: url('../resources/img/bg-signup.jpg');">

<div class="container "style="background-color: white;margin-top: 0px;border-radius:5px;padding-bottom: 30px;width:auto;padding-top: 15px;">

	<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav" style="height:auto;">
    <div class="container">
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
	<div class="tab" style="padding: -10% 30px 0% 30px;margin:0 0 0 2.3%;">
	<div style="padding-top: -53%;padding-left:52%; text-align: center;">
		<ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="main.do" style="color: #64A19D">메인으로</a>
          </li>
  
<% if(session.getAttribute("USER_ID")==null){ %> 
      <!-- 로그인전 -->
          <li class="nav-item">

           <a class="nav-link js-scroll-trigger"  href="Login.do" style="cursor: pointer;color: #64A19D">로그인</a>

          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="registGroup.do" style="color: #64A19D">회원가입</a>
          </li>

<% }else if(Integer.parseInt(session.getAttribute("GRADE").toString())==2){ %>
<%-- <%} else if(session.getAttribute("USER_ID")==null){ %> --%> 
      <!--기업 회원 로그인후 -->
      	 <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="MemberModifyP.do" style="color: #64A19D">학원기본정보 수정</a>
         </li>
         <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="acaInfoRegiEdit.do" style="color: #64A19D">학원부가정보 등록 및 수정</a>
         </li>
         <li class="nav-item">
            <p  class="nav-link js-scroll-trigger" style="color: #64A19D"><%=session.getAttribute("USER_ID")%>님</p>
         </li>
         
         <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="Logout.do" style="color: #64A19D">로그아웃</a>
         </li>
<% }else { %>
      <!--개인 회원 로그인후 -->
      <!-- <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="MemberModifyP.do" style="color: #64A19D">회원정보수정</a>
          </li> -->
           <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="memberMyPage.do" style="color: #64A19D">마이페이지</a>
          </li>
          <li class="nav-item">
            <p  class="nav-link js-scroll-trigger" style="color: #64A19D"><%=session.getAttribute("USER_ID")%>님</p>
         </li>
         
         <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="Logout.do" style="color: #64A19D">로그아웃</a>
         </li>
<% } %>         
          
        </ul>
	</div>
<% if(session.getAttribute("USER_ID")==null){ %> 
	 <ul class="navbar-nav ml-auto" style="margin-top: -4%">
		

          <li class="nav-item">
		  <!-- <a class="nav-link js-scroll-trigger" href="#info01">카테고리</a></li> -->
		  <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#info02">캐슬이름</a></li>
		  <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#info03">캐슬번호</a></li>
		  <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#info04">캐슬위치</a></li>
		  <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#info05">캐슬소개</a></li>
		 <li class="nav-item"> <a class="nav-link js-scroll-trigger" href="#info06">강사진</a></li>
		  <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#info07">오시는길</a></li>
		 <li class="nav-item"> <a class="nav-link js-scroll-trigger" href="#info08">수강신청</a></li>
		  <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#info09">캐슬링후기</a></li>
		  <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#info10">공유하기</a></li>
     </ul>
<% }else { %>
	 <ul class="navbar-nav ml-auto" style="margin-top: -11%">
		

          <li class="nav-item">
		  <!-- <a class="nav-link js-scroll-trigger" href="#info01">카테고리</a></li> -->
		  <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#info02">캐슬이름</a></li>
		  <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#info03">캐슬번호</a></li>
		  <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#info04">캐슬위치</a></li>
		  <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#info05">캐슬소개</a></li>
		 <li class="nav-item"> <a class="nav-link js-scroll-trigger" href="#info06">강사진</a></li>
		  <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#info07">오시는길</a></li>
		 <li class="nav-item"> <a class="nav-link js-scroll-trigger" href="#info08">수강신청</a></li>
		  <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#info09">캐슬링후기</a></li>
		  <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#info10">공유하기</a></li>
     </ul>
<% } %>   
	</div>
	</div>
	</nav>
	<table class="table table-bordered" style="height: auto">
		<colgroup>
			<col width="200px"/>
			<col width="350px"/>
			<col width="*"/>
		</colgroup>
		<tr id="info01" >
			<td style="vertical-align: middle">카테고리</td>
			<td style="vertical-align: middle;text-align: left;height:auto;padding: 30px;">
				전체>${intro.category } </td>
			<td rowspan="4" style="height:400px;">
				<div class="container" style="margin-left: -2%;">
				<%@ include file="/../resources/DR_common/commonPhotoSlide.jsp" %>
			    </div>
			</td>
		</tr>
		<tr id="info02">
			<td style="vertical-align: middle">캐슬명</td>
			<td style="vertical-align: middle;text-align: left;height:auto;padding: 30px;">
			${dto.acaname }</td>

		</tr>
		<tr id="info03">
			<td style="vertical-align: middle">캐슬번호</td>
			<td style="vertical-align: middle;text-align: left;height:auto;padding: 30px;">
				${dto.telephone1 }-${dto.telephone2 }-${dto.telephone3 }</td>

		</tr>
		<tr id="info04">

			<td style="vertical-align: middle">캐슬위치</td>
			<td style="vertical-align: middle;text-align: left;height:auto;padding: 30px;">${dto.address }&nbsp;${dto.detailaddress }</td>

		</tr>
		<tr id="info05">
			<td style="vertical-align: middle">학원소개</td>
			<td colspan="2" style="height:auto;padding: 30px;text-align: left">${intro.introduce }</td>
		</td>
		</tr>
		<tr id="info06">
			<td style="vertical-align: middle;height:auto;padding: 30px;">강사진</td>
			<td style="vertical-align: middle;text-align: left;"colspan="2">
				<!-- 강사 목록 s -->
			  <div class="row" style="padding-left: 30px;">
			  	<!--  -->
			  	 <c:forEach items="${teachers }" var="row2" varStatus="loopStatus">
				<div>
				<table class="table" style="width:150px;margin:5px 15px 10px 0px;">
					<tr style="width:80px;">
						<td style="padding:3px;height:170px;width:70px;text-align: center;">
		             		<img src="../resources/img/bg-masthead.jpg" style="width:100%;height:100%"
		             		alt="엑스박스" />
             			</td>
					</tr>
				 	<tr style="width:100px;text-align: center;">
				 		<td>${row2.teaname }-${row2.subject }</td>
				 	</tr>
				 	<tr style="width:100px;height:70px;text-align: center;">
				 		<td>${row2.teaintro }</td>
				 	</tr>
				</table>
				</div>
				</c:forEach>
				<!--  -->
				
			  </div>
			</td>
		</tr>
		<!-- 강사 목록 e -->
		<!-- 오시는길 -->
		<tr id="info07">
			<td style="vertical-align: middle">오시는길</td>
			<td colspan="2" style="height:auto;padding: 30px;text-align: left">
				<div id="map" style="width:100%;height:400px;"></div>
			</td>
		</tr>
		<!-- 오시는길 -->
		<!-- 수강신청 s -->
		<tr id="info08">
			<td style="vertical-align: middle;height:auto;padding: 30px;">수강신청</td>
			<td style="vertical-align: middle;text-align: left;height:auto;padding: 30px;"colspan="2">
			<c:forEach items="${classInfo }" var="row3" varStatus="loopStatus">
				<table class="table table-bordered" style="text-align: center;vertical-align:middle">
					<colgroup>
						<col width="auto"/>
						<col width="10%"/>
						<col width="17%"/>
						<col width="auto"/>
						<col width="11%"/>
						<col width="11%"/>
						<col width="auto"/>
					</colgroup>
					<h6 style="color: #64A19D">수강정보${loopStatus.index+1 }-
						<c:choose>
							<c:when test="${row3.numberofparticipants eq row3.numberofapplicants }">
								<span style="color: #F15041">신청불가</sapn>
							</c:when>
							<c:otherwise>
								<span style="color: #2556C9">신청가능</sapn>
							</c:otherwise>
						</c:choose>
					</h6>
					<tr>
						<th style="vertical-align: middle">강의명</th>
						<th style="vertical-align: middle">강사명</th>
						<th style="vertical-align: middle">강의기간</th>
						<th style="vertical-align: middle">강의시간</th>
						<th style="vertical-align: middle">수강인원 <br /> <small>(단위:명)</small></th>
						<th style="vertical-align: middle">수강료 <br /> <small>(단위:원)</small></th>
						<th style="vertical-align: middle">결제 <br /> <small></small></th>
						
					</tr>
					<tr><div id="paypal-button-container"></div>
						<form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
						<td style="vertical-align: middle">${row3.acaclassname }</td>
						<td style="vertical-align: middle">${row3.teaname }</td>
						<td style="vertical-align: middle">${row3.acastartdate }~<br />${row3.acaenddate }</td>
						<td style="vertical-align: middle">매주&nbsp;${row3.acaday }&nbsp;&nbsp;${row3.acastarttime }~${row3.acaendtime }</td>
						<td style="vertical-align: middle">${row3.numberofapplicants}/${row3.numberofparticipants } <br /> </td>
						<td style="vertical-align: middle"><fmt:formatNumber value="${row3.pay }" /></td>
						<td  rowspan="2" style="text-align: center;vertical-align: middle;color:#F15041 "
						>
						<c:choose>
							<c:when test="${row3.numberofparticipants eq row3.numberofapplicants }">
								수강만원
							</c:when>
							<c:otherwise>
								<input type="image" name="submit" border="0" 
									src="https://www.paypalobjects.com/en_US/i/btn/btn_buynow_LG.gif" 
									alt="PayPal - The safer, easier way to pay online">
							</c:otherwise>
						</c:choose>
						</td>
						<input type="hidden" name="cmd" value="_xclick">
						<input type="hidden" name="business" value="beholderstar-facilitator@gmail.com">
						<input type="hidden" name="custom" value="${dto.idx }">
						<input type="hidden" name="charset" value="UTF-8">
						<input type="hidden" name="item_name" value="${dto.idx}">
						<input type="hidden" name="item_number" value="${row3.classidx }">
						<input type="hidden" name="currency_code" value="USD">
						<input type="hidden" name="amount" value="${row3.pay/1132.71 }">
						<%-- <input type="hidden" name="user_id" value="${user_id}"> --%>
						</form>
					</tr>			
				</table>
				<hr class="my-4">
				</c:forEach>
		<!-- 수강신청 n-->		

				
			</td>
		</tr>
		<tr id="info09">
			<td style="vertical-align: middle" colspan="4">
			<div>
			
			<%@ include file="/../resources/DR_common/commonComment.jsp" %>
			</div>
			
			<div class="row text-center" style="padding-left: 44%;margin:auto;">
				<!-- 페이지번호 부분 -->
				<!-- <ul class="pagination" style="text-align: center; ">	
					<li><a href="#"><span class="glyphicon glyphicon-hand-left"></span><<</a></li>&nbsp;
					<li><a href="#"><span class="glyphicon glyphicon-fast-backward"></span><</a></li>&nbsp;
					<li><a href="#">1</a></li>&nbsp;		
					<li class="active"><a href="#">2</a></li>&nbsp;
					<li><a href="#">3</a></li>&nbsp;
					<li><a href="#">4</a></li>&nbsp;	
					<li><a href="#">5</a></li>&nbsp;
					<li><a href="#"><span class="glyphicon glyphicon-fast-forward"></span>></a></li>&nbsp;
					<li><a href="#"><span class="glyphicon glyphicon-hand-right"></span>>></a></li>
				</ul>	 -->${pagingImg }
			</div>
					</td>
			</tr>
			<script type="text/javascript">
			function writeValidate(f)
			{
				if(f.acaScore.value=="0"){
					alert("별점을 입력해 주세요");
					f.acaScore.focus();
					return false;
				}
				if(f.reviewContents.value==""){
					alert("내용을 입력하세요");
					f.reviewContents.focus();
					return false;
				} 
			}
			/* 폼값 전송 */
			function writeValidate2(){
			    /* document.getElementById('btn').onclick = function() {
			        
			    }; */
			    
			    document.getElementById("editF").submit();
		        return false;
			};
			</script>
			
			
			<tr><td colspan="4">
			<!-- 학원 후기 댓글 폼 -->
			<div id="editR">
			<form name="writeFrm" method="post" 
				onsubmit="return writeValidate(this);"
				action="reviewAction.do" >
				
                <div class="media" style=" padding: 0px 30px 10px 43px;margin-bottom: 80px;">
                  <input type="hidden" name="acaidx" value="${dto.idx }"/>
                  
                  <a class="media-left" href="#" style="width:80px;height:80px;margin-top: 4%">
                    <img src="http://lorempixel.com/40/40/people/1/" style="width:100%;height:100%;">
                  </a>
                  
                  <div class="media-body text-left" style="width:200px;height:100px;padding-left: 40px;">
                      <input type="hidden" name="memberId" value="${user_id }"/>
                      <span class="media-heading user_name">${user_id }</span>
                      <select class="form-control" name="acaScore">			
							<option value="0">별점 매기기</option>
							<option value="1">1점</option>
							<option value="2">2점</option>
							<option value="3">3점</option>
							<option value="4">4점</option>
							<option value="5">5점</option>
					</select>
                    
                    <div style="width:100%;height: 100%;">
                    <textarea rows="10" class="form-control" style="width:100%;height: 100%" name="reviewContents"></textarea>
                    </div>
                    <p><small style="color: #64A19D">꺠끗하고 정확한 후기는 다른회원들의 캐슬 선택에 많이 도움이 됩니다.</small></p>
                  </div>
                  <p class="pull-right" ><small></small></p>
                  <button type="submit" class="btn btn-danger" style="margin-top: 5%;margin-left: 2%;background: #699F9B">
                  후기작성</button>
                </div>
                
                
                
            </form> 
            </div>
            </td></tr>

            <!-- 학원 후기 댓글 폼 -->	
		
	</table>
		<%@ include file="/../resources/DR_common/commonShareSNS.jsp" %>
		<br />
		<a href="#page-top"><button type = "button"  class="btn btn-info " style="margin:10px;width:auto;height:auto;vertical-align: middle;background-color: #699F9B;margin-left: 3.3%">위로가기</button></a>
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
  <!-- 추가s -->


  <!-- Bootstrap core JavaScript -->
  <script src="/FinallyProject/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/FinallyProject/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="/FinallyProject/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for this template -->
<<<<<<< HEAD
  <script src="js/grayscale.min.js"></script>
  
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2ec06b0333644bd4771e72d23ed5395f&libraries=services"></script>
<input type="hidden" id ="adress" value="${dto.address }" />
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

var adress = 
	document.getElementById("adress").value;
// 주소로 좌표를 검색합니다
geocoder.addressSearch(adress, function(result, status) {

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
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${dto.name }</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
=======
  <script src="/FinallyProject/resources/js/grayscale.min.js"></script>

</body>
</html>
