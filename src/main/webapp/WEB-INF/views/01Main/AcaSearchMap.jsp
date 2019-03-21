<%@page import="mybatis01.AcademyMemberDTO"%>
<%@page import="java.util.ArrayList"%>
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

#holder::placeholder {
	color: red;
}
</style>
<!-- 다음지도 스타일 s-->
<style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>
<!-- 다음지도 스타일 e-->
<body id="page-top">
 <!-- Nav Bar -->
 <%@ include file="/../resources/DR_common/commonNavTop.jsp" %>
 <!-- Nav Bar -->
  <!-- Contact Section -->
  
  <section class="signup-section">
<!--   <div style="text-align: center;margin-top: -3%">
  		<h2 class="text-white mb-5">캐슬링 결과 </h2>
  		<h4 class="text-white mb-5">' 배움의 품격을 높이다 '</h2>
  </div> -->
  <!-- 정보검색 폼 Start -->

    <div class="container" style="margin-bottom: 3%;margin-top:-1% ">
      <div class="row">
        <div class="col-md-10 col-lg-8 mx-auto text-center" style="margin-top: -5%;">

          <i class="far fa-paper-plane fa-2x mb-2 text-white"></i>
          <h2 class="text-white mb-5">' 배움의 품격을 높이다.'</h2>
			
          <form class="form-inline d-flex" action="acaSearchMap.do">
			<div style="width:1000px;">
			<select name="keyField" class="form-control" style="height:59px;padding-right: 10px;">
				<option value="acaname">캐슬 이름</option>
				<option value="address" >캐슬 위치</option>
				<!-- <option value="contents">이름+위치</option> -->
			</select>
			<%-- <input type="hidden" value="${cateB }" name="cateB"/> --%>
            <input type="text" name="keyString"  class="form-control" placeholder="캐슬정보를 입력해주세요"  
            	style="width:400px;"/>
            <button type="submit" class="btn btn-primary mx-auto">캐슬찾기</button>
            </div>
          </form>

        </div>
      </div>
    </div>

  <!-- 정보 검색폼 End -->
    <div class="container">
		<div class="row" style="background-color: #ffffff; border-radius: 10px 10px 10px 10px;padding: 10px; ">
		<div class="map_wrap">
		    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
		
		    <div>
			       
			        <hr>

			    </div>
			</div>
		</div>
		<hr />
		
		<div class="row" style="background-color: #ffffff; border-radius: 10px 10px 10px 10px;margin-top: -1.5%;">
			<table class="table table-bordered" style="width: 100%; height: 100%; margin:10px;;">
			<colgroup>
				<col width="7%"/>
				<col width="*"/>
				<col width="15%"/>
				<col width="15%"/>
				<col width="15%"/>
			</colgroup>
			<thead>
			          <!-- <h2 class="text-white mb-5" style="color: blue">Subscribe to receive updates!</h2> -->
			<tr>
				<th colspan="5" style="font-size: 1.5em; height: 30px; text-align: center;">
				<br />
				 검색된 캐슬 목록<br />
				 <div class="text-right" style="width:100%;height:auto;margin-right: 30%">
			        
				 </div>
				 <br />
				</th>
			</tr>
			<tr class="default">
				<th class="text-center">번호</th>
				<th class="text-center">학원주소</th>
				<th class="text-center">학원전화번호</th>
				<th class="text-center">학원카테고리</th>
				<th class="text-center">학원카테고리</th>
			</tr>
			</thead>	
			<tbody>
			<c:choose>
				<c:when test="${empty acaList }">
					<tr>
						<td colspan="5" class="text-center">
							검색된 캐슬이 없습니다.
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${acaList }" var="row" varStatus="loop">
						<!-- 리스트반복 시작 -->
						<tr style="text-align:center;vertical-align: middle;">
							<td class="text-center" style="text-align:center;vertical-align: middle;">${loop.index+1}</td>
							<td class="text-left" style="vertical-align:middle;"><span class="maps">${row.address }</span></td>
							<td class="text-center" style="text-align:center;vertical-align: middle;">${row.acaname }</td>
						 	<td class="text-center" style="text-align:center;vertical-align: middle;">${row.mobile1 }-${row.mobile2 }-${row.mobile3 }</td>
						 	<td class="text-center" style="text-align:center;vertical-align: middle;">
						 		<a href="academyInfo.do?acaIdx=${row.idx }" target="_blank"><button type="submit" class="btn btn-primary mx-auto">상세보기</button></a>
						 	</td>
						</tr>
						<!-- 리스트반복 끝 -->
					</c:forEach>
				</c:otherwise>
				</c:choose>
			</tbody>
			</table>
			<section class="contact-section bg-white" style="margin-left: 49%">
		    <div class="container" >
		      <div class="text-center " >
					<ul class="pagination">
						${pagingImg }
					</ul>
		      </div>
		    </div>
   </section>
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
  <!-- 다음지도 관련 스크립트 s -->	
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2ec06b0333644bd4771e72d23ed5395f&libraries=services"></script>

<%-- <input type="hid-den" id ="adress" value="${acaList.address }" /> --%>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 7 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

var listData = [
	<%
	ArrayList<AcademyMemberDTO> acaList = (ArrayList<AcademyMemberDTO>)request.getAttribute("acaList");
	
	%>
	<%for(int i=0; i<acaList.size(); i++){%>
    {
        groupAddress: '<%=acaList.get(i).getAddress()%>'
    } <%= i==acaList.size() ? "" : "," %>
    
    <%}%>
];
	<%
	String[] array = new String[acaList.size()];
	for(int i=0; i<acaList.size(); i++){
		

		  array[i] = acaList.get(i).getName();
		 
	}%>
for (var i=0; i < listData.length ; i++) {

// 주소로 좌표를 검색합니다

geocoder.addressSearch(listData[i].groupAddress, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {

        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: coords
        });

       /*  // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new daum.maps.InfoWindow({
            content: result[0].y + "하이욤" + result[0].x
        });
        infowindow.open(map, marker); */
        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new daum.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;"></div>'
        });
        infowindow.open(map, marker);
        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
})


};    
</script>


  <!-- 다음지도 관련 스크립트 e -->	
</body>

</html>
