
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
body, html {
  height: 100%;
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.hero-image {
  background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('../images/Wommen.jpg');
 
  height: 100%;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;
}

.hero-text {
  text-align: center;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  color: white;
}

.hero-text button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 10px 25px;
  color: black;
  background-color: #ddd;
  text-align: center;
  cursor: pointer;
}

.hero-text button:hover {
  background-color: #e5cdbd;
  color: white;
}
</style>
<script>
$(function(){
	$('#info').click(function(){		
		$.ajax({
			/* url : "./mypage.jsp", */
			url : "../DR_common/ViewMyInfo",
			type : "get",
			data : {
				/* searchName : $('#searchName').val() */
			},
			dataType : "html",
			contentType : "text/html; charset:utf-8",
			success:function(responseData){			
				
				$('#infoR').html(responseData);
			},
			error:function(errorData){
				alert("오류발생:"+errorData.status+":"
					+errorData.statusText);
			}
		});
		
	});
});

	
function on() {

  document.getElementById("overlay").style.display = "block";
  
}

function off() {
  document.getElementById("overlay").style.display = "none";
}
$(function(){
	$('#reserInfo').click(function(){		
		$.ajax({
			/* url : "./mypage.jsp", */
			url : "../DR_common/MyReservation",
			type : "get",
			data : {
				/* searchName : $('#searchName').val() */
			},
			dataType : "html",
			contentType : "text/html; charset:utf-8",
			success:function(responseData){			
				
				$('#infoR2').html(responseData);
			},
			error:function(errorData){
				alert("오류발생:"+errorData.status+":"
					+errorData.statusText);
			}
		});
		
	});
});

	
function on3() {

  document.getElementById("overlay3").style.display = "block";
  
}

function off3() {
  document.getElementById("overlay3").style.display = "none";
}
</script>
</head>
<body>
<div id="overlay" onclick="off()">
  <div id="text">
  <span >My Info</span><br />
  	  <div id="infoR" style="font-size: 20px; text-align: left; margin-top: 15px;padding: 15px;color:#F2F4F7;">
		  아이디:  <br />
		  이름:    <br />
		  주소:    <br />
		  성별:    <br />
		  생일:    <br />
		  메일:    <br />
		  연락처:  <br />
		  직업:    <br />
		  주소:    <br />
		  내관심:  <br />
	  </div>
  </div>
</div>
<div id="overlay3" onclick="off3()" >
  <div id="text3">
  <span >My Info</span><br />
  	  <div id="infoR2" style="font-size: 20px; text-align: left; margin-top: 15px;padding: 15px; color:#F2F4F7; ">
		  아이디:  <br />
		  이름:    <br />
		  주소:    <br />
		  성별:    <br />
		  생일:    <br />
		  메일:    <br />
		  연락처:  <br />
		  직업:    <br />
		  주소:    <br />
		  내관심:  <br />
	  </div>
  </div>
</div>

<div class="hero-image" ">
  <div class="hero-text">
    <h1 style="font-size:50px">
    <%
    if(request.getParameter("name")==null){
   	%>
    	 <%=request.getAttribute("memInfo")%> 
    <%
    }
    else{
    %>
    	 <%=request.getParameter("name") %>
   
	<%     
	}
    %>
    <small style="color:#F2F3F7">님 별일없죠?</small></h1>
    <p>And I'm a Photographer</p>
    <button id="info" onclick="on();"  >내정보</button>
    <a href="../DR_common/MemberUpdate"><button>정보수정</button></a>
    <button id="reserInfo" onclick="on3();" >예약정보</button>
  </div>
</div>

<!-- 
<div class="hero-image" ;">
  <div class="hero-text">
    <h1 style="font-size:50px">I am John Doe</h1>
    <p>And I'm a Photographer</p>
    <form  class="hero-text" action="../DR_common/ViewMyInfo">
    <button onclick="on()"  >내정보</button>
    <button>정보수정</button>
    <button >예약정보</button>
    </form>
  </div>
</div>
 -->
<!-- <p>Page Content..</p> -->

</body>
</html>