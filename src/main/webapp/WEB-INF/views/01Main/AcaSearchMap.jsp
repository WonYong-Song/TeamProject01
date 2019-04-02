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
.checked {
  color: orange;
}
</style>
<!-- 다음지도 스타일 s-->
<style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:600px;}

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
				<col width="*"/>
				<col width="15%"/>
			</colgroup>
			<thead>
			          <!-- <h2 class="text-white mb-5" style="color: blue">Subscribe to receive updates!</h2> -->
			<tr>
				<th colspan="6" style="font-size: 1.5em; height: 30px; text-align: center;">
				<br />
				 검색된 캐슬 목록<br />
				 <div class="text-right" style="width:100%;height:auto;margin-right: 30%">
			        
				 </div>
				 <br />
				</th>
			</tr>
			<tr class="default">
				<th class="text-center">번호</th>
				<th class="text-center">캐슬이름</th>
				<th class="text-center">캐슬주소</th>
				<th class="text-center">캐슬번호</th>
				<th class="text-center">캐슬평점</th>
				<th class="text-center">상세보기</th>
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
							<td class="text-center" style="text-align:center;vertical-align: middle;">${row.acaname }</td>
							<td class="text-left" style="vertical-align:middle;"><span class="maps" id="MapList${loop.index }">${row.address }</span></td>
							<td class="text-center" style="text-align:center;vertical-align: middle;">${row.mobile1 }-${row.mobile2 }-${row.mobile3 }</td>
							<c:choose>
								<c:when test="${not empty row.ratingStar }">
									<td class="text-center" style="text-align:center;vertical-align: middle;">${row.ratingStar }</td>
								</c:when>
								<c:otherwise>
									<td><span style="color: #2556C9">평점이 없습니다<br />첫 평점을 남겨주세요! </sapn></td>
								</c:otherwise>
							</c:choose>
						 	<td class="text-center" style="text-align:center;vertical-align: middle;">
						 		<a href="academyInfo.do?acaIdx=${row.idx } " target="_blank"><button type="submit" class="btn btn-primary mx-auto">상세보기</button></a>
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
     <%@ include file="/../resources/DR_common/commonBottom.jsp" %>
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
    <style>
 
</style>
<script>
var mapContainer = document.getElementById('map'),
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667),
        level: 9
    };     
  
var map = new daum.maps.Map(mapContainer, mapOption); 
var geocoder = new daum.maps.services.Geocoder();
<%

ArrayList<AcademyMemberDTO> acaList = (ArrayList<AcademyMemberDTO>)request.getAttribute("acaList");
String[] array = new String[acaList.size()];
for(int i=0; i<acaList.size(); i++){
	  array[i] = acaList.get(i).getAcaname();
}%>
<%

String[] array2 = new String[acaList.size()];
String[] array3 = new String[acaList.size()];
for(int i=0; i<acaList.size(); i++){
	  array2[i] = acaList.get(i).getAddress();
	  array3[i] = acaList.get(i).getRatingStar();
}%>
<%for(int i=0; i<acaList.size(); i++){%>
geocoder.addressSearch('<%=array2[i] %>', function(result, status) {
     if (status === daum.maps.services.Status.OK) {
        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
        var yyy = result[0].y;
        var xxx = result[0].x;
        var marker = new daum.maps.Marker({
            map: map,
            position: coords    
        });
        var iwContent = '<div style="padding:5px;"><div style="padding-bottom:5px;margin-left:15%">&nbsp;<%=array[i]%> <br /></div> &nbsp;&nbsp;&nbsp;<a href="#MapList<%=i%>" style="color:#64A19D" target="_blank">정보보기</a> - <a href="http://map.daum.net/link/to/<%=array[i]%>,'+yyy+','+xxx+'" style="color:#64A19D" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
        iwPosition = new daum.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다
    var infowindow = new daum.maps.InfoWindow({
        position : iwPosition, 
        content : iwContent 
    });

        
    infowindow.open(map, marker); 
    } 
})
<%}%>

</script>

  <!-- 다음지도 관련 스크립트 e -->	
</body>

</html>
