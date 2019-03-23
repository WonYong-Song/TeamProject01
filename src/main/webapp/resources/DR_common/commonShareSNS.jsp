<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
String str = "Hello JSP~~!";
%>    
<style>
.iimg{width:80px;height: 80px;}
</style>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- SNS공유 스크립트 -->
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
</head>

<body style="background-color:#f0f0f0;">
<div class="sns_wrap" style="padding-left: 13%" id="info10">

<table style="border: ">
	<tr style="height: 50px;">
		<td colspan="10" style="text-align: center;margin-top: 3%;vertical-align: middle">
			<small style="color: #64A19D">공유할 사이트가 있으시면 버튼을, 아니면 URL복사를 눌려주세요</small>
		</td>
	</tr>
	<tr style="text-align: center;width: 100%; margin-top: -5%">
		<td><a href="javascript:toSNS('facebook','공유제목!','${FULLURL}')" title="페이스북으로 가져가기"><img  class="iimg" src="https://upload.wikimedia.org/wikipedia/commons/8/82/Facebook_icon.jpg"></a></td>
		<td><a href="javascript:toSNS('twitter','공유제목!','${FULLURL}')" title="트위터로 가져가기"><img class="iimg" src="https://cdn.pixabay.com/photo/2017/08/23/11/30/twitter-2672572_960_720.jpg"></a></td>
		<td><a href="javascript:toSNS('line','공유제목!','${FULLURL}')" title="라인으로 가져가기"><img class="iimg" src="http://www.stickpng.com/assets/images/580b57fcd9996e24bc43c523.png"></a></td>
		<td><a href="javascript:sendKakaoTalk();" title="카카오톡으로 가져가기"><img class="iimg" src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Kakao_logo.jpg/220px-Kakao_logo.jpg"></a></td>
		<td><a href="javascript:shareStory();" title="카카오스토리로 가져가기"><img class="iimg" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF7CSchfsMjCHmUds5ZRGx_3pEefQtvmzSNpFaMiio7_WK8UhGMw"></a></td>
		<td><a href="javascript:toSNS('pholar','공유제목!','${FULLURL}')" title="폴라로 가져가기"><img class="iimg" src="https://t1.daumcdn.net/cfile/tistory/215D3A4C55E414FF31"></a></td>
		<td><a href="javascript:toSNS('pinterest','공유제목!','${FULLURL}')" title="핀터레스트로 가져가기"><img class="iimg" src="http://innolinx.kr/wp-content/uploads/2019/02/pinterest-logo-CA98998DCB-seeklogo.com_.png"></a></td>
		<td><a href="javascript:toSNS('band','공유제목!','${FULLURL}')" title="밴드로 가져가기"><img class="iimg" src="http://www.nqoon.kr/files/attach/images/272/494/dce2751b9c29ec7115037d41e4c8aab7.jpg"></a></td>
		<td><a href="javascript:toSNS('google','공유제목!','${FULLURL}')" title="구글플러스로 가져가기"><img class="iimg" src="http://www.snsnews1.com/news/photo/201810/2464_3024_1452.jpg"></a></td>
		<td><a href="javascript:toSNS('blog','공유제목!','${FULLURL}')" title="네이버블로그로 가져가기"><img class="iimg" src="https://cdn.smehost.net/sonymusiccokr-45pressprod/wp-content/uploads/2017/03/Blog_96.png"></a></td>
	</tr>
	<tr >
		<td colspan="10" style="text-align: center; padding:3% 0% 0% 3%">
			<!-- <input type="text" value="http://도메인"> -->
			<a href="javascript:copy_clip('${FULLURL}')" style="color:#64A19D ">URL 복사하기</a>
			<!-- <a href="javascript:copy_clip('http://도메인')" style="color:#64A19D ">URL 복사하기</a> -->
			<input type="text" value="${FULLURL}"/>
		</td>
	</tr>
	
</table>

</div>
</body>
