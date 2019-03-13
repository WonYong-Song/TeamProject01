<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
 /* Remove the navbar's default margin-bottom and rounded borders */ 
  .navbar {
    margin-bottom: 0;
    border-radius: 0;
	  height:auto;
  }
  
  /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
  .row.content {height: 450px}
  
  /* Set gray background color and 100% height */
  .sidenav {
    padding-top: 20px;
    background-color: #f1f1f1;
    height: 100%;
  }
  #myNavbar2{
  	margin-top: 45px;
  }
  #myNavbar3{
  	text-align: center;
  }
  
  /* Set black background color, white text and some padding */
  footer {
    background-color: #555;
    color: white;
    padding: 15px;
  }
  
  /* On small screens, set height to 'auto' for sidenav and grid */
  @media screen and (max-width: 767px) {
    .sidenav {
      height: auto;
      padding: 15px;
    }
    .row.content {height:auto;} 
  }
  #title{
	  	vertical-align: middle;
	  	/* border: 1px solid white; */
		margin-left: 50px;
	
  }
  #logo{
  	  vertical-align:bottom;
	   margin-left: 750px;
  }
  .nav{
  /* 	border: 1px solid white; */
  }
  #menu{
  	align:center;
  	vertical-align: center;
  	margin-right: 1%;


  }
  #menu ul{
  	margin-right: 30px;
  }
  #join li{
  	font-size: 0.8em;

  }
  #join {

  	margin-right: 10px;
  }
  div{
  /* 	border: 1px solid white; */
  }
  .navbar-brand{
 	 vertical-align: middle;
  }
  
  
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
  .menu:hover{
  	color:black;
  }
  /* 객실정보 overay창 css */
  #overlay2 {
  position: fixed;
  display: none;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(0,0,0,0.5);
  z-index: 2;
  cursor: pointer;

}

#text2{
  position: absolute;
  top: 50%;
  left: 50%;
  font-size: 50px;
  color: white;
  transform: translate(-50%,-50%);
  -ms-transform: translate(-50%,-50%);
 
}
.btn1 {
  background-color:black;

  color: white;
  padding: auto;
  text-align: center;
  font-size: 50px;
  margin: auto;
  opacity: 0.6;
  transition: 0.3s;
  
  
}
.btn1:hover {
opacity: 0.8;

text-decoration: underline;

}
.menu{
  width:72px;height:20px;
  color: white;
  padding: auto;
  text-align: center;
  font-size: 50px;
  margin: auto;
   opacity: 0.8;
  transition: 0s;
}
.menu:hover{
	opacity:1.0;
	text-decoration: underline;
}
.menu2{
  width:65px;height:16px;
  color: white;
  padding: auto;
  text-align: center;
  font-size: 50px;
  margin: auto;
   opacity: 0.8;
  transition: 0s;
}
.menu2:hover{
	opacity:1.0;
	text-decoration: underline;
}

</style>
<nav class="navbar navbar-inverse" style="background-color:#aa6d5d;">
	<div class="container-fluid" >		
		<!-- 좌상단 로고 영역 -->

		<!-- <a href="../DR_Skin/SkinMain.jsp" class="navbar-brand"><h1 id=title>Hotel</h1></a> -->
		
		<a href="#"><img src="../resources/Images/세렌디피티 로고1.png" 
			id="logo"style=";width:400px;height:120px; margin-top:18px;margin-left:40%; margin-bottom:-4%;" /></a>
		<!-- 상단 메뉴 -->
		<div class="row">
		<ul class="nav navbar-nav navbar-right"  id="join" style="align:center;margin-right:1%">
<% if(session.getAttribute("USER_ID")==null){ %>
			<!-- 로그인전 -->
			<li ><a href="../catle/regist.do" 
				style="font-size: 1.3em;">
				<img src="../resources/Images/회원가입.png" alt="" class="menu2"/>
				</a>
			</li>
			<li><a data-toggle="modal" data-target="#myModal" style="font-size: 1.3em; cursor: pointer;">
				<img src="../resources/Images/로그인.png" alt="" class="menu2"/>
				</a>
			</li>
			
			<!-- Modal -->
			<div id="myModal" class="modal fade" role="dialog" style="align:middle">
			  <div class="modal-dialog" >	
			    <!-- Modal content-->
			    <div class="modal-content">
			      <div class="modal-header">
			       
			        <h4 class="modal-title">
			        	
			        </h4>
			      </div>
			      <div class="modal-body">
			        <%@ include file="../DR_common/commonLogin.jsp" %>
			      </div>
			    
			    </div>
			
			  </div>
			</div>
  
   
      
<% }else{ %>			
			<!-- 로그인후 -->
			<li><a href="../DR_common/ViewMyInfo_S" style="font-size: 1.3em;">
				<img src="../Images2/마이페이지.png"  class="menu2" />
				</a>
			</li>
			<li><a href="../DR_MemberRegist/LogoutProcess.jsp" style="font-size: 1.3em;">
				<img src="../Images2/로그아웃.png" class="menu2";/>
				</a>
			</li>
<% } %>			
		</ul>
		</div>
		<!-- 하단 메뉴 -->
		<div class="row" >
		<ul class=" nav navbar-nav navbar-right"  id="menu" style="text-align: right: ;">

			<li><a href="../DR_HotelInfo/About.jsp" style="font-size: 1.5em;class="menu"">목록1</a></li>
			<li><a href="../DR_HotelInfo/About.jsp" style="font-size: 1.5em;class="menu"">목록2</a></li>
			<li><a href="../DR_HotelInfo/About.jsp" style="font-size: 1.5em;class="menu"">목록3</a></li>
		</ul>
		</div>	
		




<script>
function on2() {
  document.getElementById("overlay2").style.display = "block";
  
}

function off2() {
  document.getElementById("overlay2").style.display = "none";
}
</script>
	</div>
</nav>


