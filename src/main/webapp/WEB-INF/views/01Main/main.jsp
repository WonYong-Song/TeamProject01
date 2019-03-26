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

/* 공유, 플친 로고 css */
.iimg{width:50px;height: 50px;border-radius: 100%}
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
          <h2 class="text-white mb-5">' 배움의 품격을 높이다 '</h2>
			<!-- 지역기반 검색 폼 -->
			<form class="form-inline d-flex" name="SearchMap" 
				method="post"  action="acaSearchMap.do">
				<div style="width:1000px;">
				<select name="keyField" class="form-control" style="height:59px;padding-right: 10px;">
					<option value="ACANAME">캐슬 이름</option>
					<option value="address" >캐슬 위치</option>
					<!-- <option value="contents">이름+위치</option> -->
				</select>
				<input type="hidden" value="${cateB }" name="cateB"/>
	            <input type="text" name="keyString"  class="form-control" placeholder="이곳에 입력하시면 지도에서 보여집니다."  
	            	style="width:400px;"/>
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
              <h4 class="text-uppercase m-0" style="font-size: 1em; padding-top: 10px;">기타</h4>
              <hr class="my-4">
              <div class="small text-black-50">컴퓨터,바리스타,제과제빵,기타 직업교육</div>
              </a>
            </div>
          </div>
        </div>
    </div>
  </section>

    <section class="contact-section bg-black">
    <!-- SNS공유 스크립트  s-->
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type="text/javascript">
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	    Kakao.init('2ec06b0333644bd4771e72d23ed5395f');
	 
	    // 카카오톡 공유하기
	    function sendKakaoTalk()
	    {
	    Kakao.Link.sendTalkLink({
	      label: '공유 제목',
	      image: {
	        src: 'http://이미지경로',
	        width: '300',
	        height: '200'
	      },
	      webButton: {
	        text: '공유제목',
	        url: '${FULLURL}' // 앱 설정의 웹 플랫폼에 등록한 도메인의 URL이어야 합니다.
	      }
	    });
	    }
	 
	    // 카카오스토리 공유하기
	      function shareStory() {
	        Kakao.Story.share({
	          url: decodeURIComponent('${FULLURL}'),
	          text: '${dto.acaname}'
	        });
	      }
	 
	  
	 
	    // send to SNS
	    function toSNS(sns, strTitle, strURL) {
	    	
	        var snsArray = new Array();
	        var strMsg = strTitle + " " + strURL;
	        
	var image = "이미지경로";
	 
	        snsArray['twitter'] = "http://twitter.com/home?status=" + encodeURIComponent(strTitle) + ' ' + encodeURIComponent(strURL);
	        snsArray['facebook'] = "http://www.facebook.com/share.php?u=" + encodeURIComponent(strURL);
	snsArray['pinterest'] = "http://www.pinterest.com/pin/create/button/?url=" + encodeURIComponent(strURL) + "&media=" + image + "&description=" + encodeURIComponent(strTitle);
	snsArray['band'] = "http://band.us/plugin/share?body=" + encodeURIComponent(strTitle) + "  " + encodeURIComponent(strURL) + "&route=" + encodeURIComponent(strURL);
	        snsArray['blog'] = "http://blog.naver.com/openapi/share?url=" + encodeURIComponent(strURL) + "&title=" + encodeURIComponent(strTitle);
	        snsArray['line'] = "http://line.me/R/msg/text/?" + encodeURIComponent(strTitle) + " " + encodeURIComponent(strURL);
	snsArray['pholar'] = "http://www.pholar.co/spi/rephol?url=" + encodeURIComponent(strURL) + "&title=" + encodeURIComponent(strTitle);
	snsArray['google'] = "https://plus.google.com/share?url=" + encodeURIComponent(strURL) + "&t=" + encodeURIComponent(strTitle);
			alert(encodeURIComponent(strURL));
	
			window.open(snsArray[sns]);
	    }
	 
	    function copy_clip(url) {
	        var IE = (document.all) ? true : false;
	        if (IE) {
	            window.clipboardData.setData("Text", url);
	            alert("이 글의 단축url이 클립보드에 복사되었습니다.");
	        } else {
	            temp = prompt("이 글의 단축url입니다. Ctrl+C를 눌러 클립보드로 복사하세요", url);
	        }
	    }
	</script>
	<!-- SNS공유 스크립트  E-->
    <div class="container">

      <div class="row" style="margin-left: 27%;margin-top: -8%">

      <div class="social d-flex justify-content-center"">
        <table style="bor ">
			<tr style="height: 50px;">
				<td colspan="10" style="text-align: center;margin-top: 3%;vertical-align: middle">
					<small style="color: #8B8984">스터디 캐슬 공유하기</small>
				</td>
			</tr>
			<tr style="text-align: center;width: 100%; margin-top: -5%">
				<td><a href="javascript:toSNS('facebook','공유제목!','${FULLURL}')" title="페이스북으로 가져가기"><img  class="iimg" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR63r5qFKZbLnP6nYUzFGpAy81B6aXali0mqYh3UX3ihkuxFIKo"></a></td>
				<td><a href="javascript:toSNS('twitter','공유제목!','${FULLURL}')" title="트위터로 가져가기"><img class="iimg" src="http://img.hani.co.kr/imgdb/resize/2018/0504/00501429_20180504.JPG"></a></td>
				<td><a href="javascript:toSNS('line','공유제목!','${FULLURL}')" title="라인으로 가져가기"><img class="iimg" src="http://www.stickpng.com/assets/images/580b57fcd9996e24bc43c523.png"></a></td>
				<td><a href="javascript:sendKakaoTalk();" title="카카오톡으로 가져가기"><img class="iimg" src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Kakao_logo.jpg/220px-Kakao_logo.jpg"></a></td>
				<td><a href="javascript:shareStory();" title="카카오스토리로 가져가기"><img class="iimg" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF7CSchfsMjCHmUds5ZRGx_3pEefQtvmzSNpFaMiio7_WK8UhGMw"></a></td>
				<td><a href="javascript:toSNS('pholar','공유제목!','${FULLURL}')" title="폴라로 가져가기"><img class="iimg" src="https://t1.daumcdn.net/cfile/tistory/215D3A4C55E414FF31"></a></td>
				<td><a href="javascript:toSNS('pinterest','공유제목!','${FULLURL}')" title="핀터레스트로 가져가기"><img class="iimg" src="http://innolinx.kr/wp-content/uploads/2019/02/pinterest-logo-CA98998DCB-seeklogo.com_.png"></a></td>
				<td><a href="javascript:toSNS('band','공유제목!','${FULLURL}')" title="밴드로 가져가기"><img class="iimg" src="http://www.nqoon.kr/files/attach/images/272/494/dce2751b9c29ec7115037d41e4c8aab7.jpg"></a></td>
				<td><a href="javascript:toSNS('google','공유제목!','${FULLURL}')" title="구글플러스로 가져가기"><img class="iimg" src="http://www.snsnews1.com/news/photo/201810/2464_3024_1452.jpg"></a></td>
				<td><a href="javascript:toSNS('blog','공유제목!','${FULLURL}')" title="네이버블로그로 가져가기"><img class="iimg" src="https://cdn.smehost.net/sonymusiccokr-45pressprod/wp-content/uploads/2017/03/Blog_96.png"></a></td>
			</tr>
			<tr style="height: 50px;">
				<td colspan="10" style="text-align: center;padding-top:5%;vertical-align: middle">
					 <!-- 플러스친구 추가기능s-->
				      <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
					  <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
				      <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
				      <span id="plusfriend-addfriend-button"></span>
					  <script type='text/javascript'>
					    Kakao.init('2ec06b0333644bd4771e72d23ed5395f');
					    Kakao.PlusFriend.createAddFriendButton({
					      container: '#plusfriend-addfriend-button',
					      plusFriendId: '_xjZfLj'
					    });
					  </script>
					  <!-- 플러스친구 추가기능 e-->
					  <!-- 플러스친와 1:1 채팅 기능 s-->
				       <a href="javascript:void plusFriendChat()">
						  <img src="https://developers.kakao.com/assets/img/about/logos/plusfriend/consult_small_yellow_pc.png"/>
						</a>
						<script type='text/javascript'>
						    Kakao.init('YOUR APP KEY');
						    function plusFriendChat() {
						      Kakao.PlusFriend.chat({
						        plusFriendId: '_xjZfLj' 
						      });
						    }
					
						</script>
					  <!-- 플러스친와 1:1 채팅 기능 e-->	
				</td>
			</tr>
		</table>
      </div>
      </div> 
    </div>
     
	
  </section>
  <!-- Footer S-->
  <footer class="bg-black small text-center text-white-50" >
    <div class="container">
    	<div>
    	Copyright &copy; 2019
    	</div>
    		
    		<img src="../resources/Images/스터디캐슬 로고.png" alt="" style="height: 80px;width: 350px;"/>
    	
      
     
    </div>
  </footer>
  <!-- Footer E-->
  <!-- Bootstrap core JavaScript -->
  <script src="/FinallyProject/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/FinallyProject/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="/FinallyProject/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="/FinallyProject/resources/js/grayscale.min.js"></script>
  
</body>

</html>
