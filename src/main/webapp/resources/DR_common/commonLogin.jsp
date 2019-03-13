<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box}
form{
	margin:50px 50px 50px 50px;
	width:450px;
	height:600px;
}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for all buttons */
button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

button:hover {
  opacity:1;
}

/* Extra styles for the cancel button */
.cancelbtn {
  padding: 14px 20px;
  background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
  float: left;
  width: 50%;
}

/* Add padding to container elements */
.container {
  padding: 16px;
}

/* Clear floats */
.clearfix::after {
  content: "";
  clear: both;
  display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
  .cancelbtn, .signupbtn {
     width: 100%;
  }
}
#Regist_title{
	text-align: center;
}
#Regist_form{
	margin:40px
}
</style>
<body>

<form action="../DR_MemberRegist/LoginProcess.jsp" style="border:1px solid #ccc; border-radius: 5px;">
	<!-- 돌아갈 페이지를 위한 hidden -->
	<%-- <input type="hid den" name="returnPage" value="<%=request.getParameter("returnPage")%>" /> --%>
	<div id="Regist_form">
		<div id="Regist_title" >
		    <h2 style="color:black;font-size:2em; 2em;text-align:center;padding: 5px;">로그인</h1>
		    <p>회원 가입을 완료하고 로그인해주세요.</p>
		    <hr>
	    </div>
	    <div style="text-align:left;width:420px">
	    <label for="email"><b style="text-align: left;">아이디</b></label>
	    </div>
	    <input type="text" placeholder="Enter Email" name="user_id" required>
	    <div style="text-align:left;width:420px">
	    <label for="psw"><b>비밀번호</b></label>
	    </div>
	    <input type="password" placeholder="Enter Password" name="user_pw" required>
	
	   <!--  <label for="psw-repeat"><b>Repeat Password</b></label>
	    <input type="password" placeholder="Repeat Password" name="psw-repeat" required> -->
	    
	    <label>
	      <div style="text-align:right;width:350px">
	      
	      <input type="checkbox" checked="checked" name="remember" style="margin-bottom:15px;">아이디 저장
	      </div>
	    </label>
	    
	    <p>회원이 아니시라면 <a href="#" style="color:dodgerblue">이곳을 눌려주세요</a>.</p>
		
	    <div class="clearfix">
	    <!--   <button type="button" class="cancelbtn" onclick="">Cancel</button> -->
	      <button type="submit" style="background-color: #F1F1F1;"><img src="../resources/Images/로그인2.png" style="width:80px;height:20px;"/></button>
	    </div>
	</div>
</form>

</body>
</html>