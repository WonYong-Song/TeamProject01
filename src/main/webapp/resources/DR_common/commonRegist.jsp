<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>oh gu, oh good!</title>
	
    <link rel="stylesheet" href="../resources/css/join.css">
    <link rel="stylesheet" href="../resources/css/base.css">
    <link rel="stylesheet" href="../resources/css/pdsr.css">
    <link rel="stylesheet" href="../resources/css/button.css">

    <link href='https://cdn.rawgit.com/openhiun/hangul/14c0f6faa2941116bb53001d6a7dcd5e82300c3f/nanumbarungothic.css' rel='stylesheet' type='text/css'>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
	<script src="../resources/jquery/jquery-3.3.1.min.js"></script>   
  </head>

  <body> 
    <center>
  <table width=960px align=center>
    <tr>
    <td align=center>
      <center><div class="stepLine">
        <div title="이용약관" class="stepDot"></div>
        <div title="정보입력" class="stepDot activeStep"></div>
        <div title="가입완료" class="stepDot"></div>
      </div>
      </center><br><br><br>
    </td>
    </tr>


    <style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 20px 10px 20px 10px;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}
input[type=checkbox]{
	margin-top: 20px; margin-bottom:10px  
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

table tr td{
	align:center;
	/* border:1px solid red; */
	margin-right: 100px
}
#Column{
	text-align: left;
}
#extra{
	width:100px
}
strong{

}

</style>


<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 20px 10px 20px 10px;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}
input[type=checkbox]{
   margin-top: 20px; margin-bottom:10px  
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

table tr td{
   align:center;
   /* border:1px solid red; */
   margin-right: 100px
}
#Column{
   text-align: left;
}
#extra{
   width:100px
}
strong{

}

</style>
<script>
function registFrmCheck()
{   
   var fn = document.registFrm;
   
   var frmArray = ["user_id", "user_pw1", "user_pw2", "user_name", "email_id","email_domain",
               "mobile1","mobile2","mobile3","user_brand[0]"];
   var txtArray = ["아이디", "패스워드", "패스워드확인", "이름", "이메일", "이메일도메인",
               "휴대전화번호1","휴대전화번호2","휴대전화번호3","관심분야"];
   
   for(var i=0 ; i<frmArray.length ; i++)
   {
      if(eval("fn."+frmArray[i]+".type")=="text" 
            || eval("fn."+frmArray[i]+".type")=="password" 
            || eval("fn."+frmArray[i]+".type")=="date")
      {

         if(eval("fn."+frmArray[i]+".value")==""){
            alert(txtArray[i]+"를(을) 입력하세요");
            eval("fn."+frmArray[i]+".focus()");
            return false;
         }         
      }
      
      else if(eval("fn."+frmArray[i]+".type")=="radio" || eval("fn."+frmArray[i]+".type")=="checkbox")
      {
         //alert(frmArray[i]+"체크박스");   
         var isRadio = false;
         var radioTxt = frmArray[i].substring(0,frmArray[i].length-3);
         
         for(var j=0 ; j<eval("fn."+radioTxt+".length") ; j++)
         {
            if(eval("fn."+radioTxt+"["+j+"].checked")==true){
               isRadio = true;
               break;
            }
         }
         if(isRadio==false){
            alert(txtArray[i]+"를(을) 선택하세요");
            eval("fn."+radioTxt+"[0].focus()");
            return false;
         }
      }
   }
   //아이디 중복확인을 마쳐야 회원가입을 할수있다.
   if(fn.overFlag.value=="0"){
      alert("아이디 중복확인을 해주세요.");
      return false;
   }
   
}
//공백제거하기
function trimAll(str) {
   a = str.value;
   for (; a.indexOf(" ") != -1 ;){
      a = a.replace(" ","")
   }
   str.value = a;
}
//숫자/영문자만 포함된 문자열인지 검사
function LowerDigitCheck(field) {
   var valid = "abcdefghijklmnopqrstuvwxyz1234567890"
   var ok = "yes";
   var temp;
   for (var i=0; i<field.value.length; i++) {
      temp = "" + field.value.substring(i, i+1);
      if (valid.indexOf(temp) == "-1") ok = "no";
   }
   if (ok == "no") {
      alert("영소문자 or 숫자만 입력할 수 있습니다");
      field.value='';
      field.focus();
      return false;
   }
}
//아스키코드로 숫자인지 여부확인 : 숫자라면 true를 반환한다.
function isNumber(param){      
   for(var i=0 ; i<param.length ; i++){
      if(!(param[i].charCodeAt(0)>=48 && param[i].charCodeAt(0)<=57)){
         return false;
      }      
   }
   return true;
}
//이메일 셀렉트 선택하면 도메인부분에 입력하기
function choiceInput(frm, elem) { 
   for(var i=0; i<elem.length;i++) { 
      if (elem.options[i].selected) {
         if(elem.options[elem.selectedIndex].value!="direct_input"){
            frm.email_domain.value = elem.options[elem.selectedIndex].value   
         }
         else{
            frm.email_domain.value = "";
            frm.email_domain.focus();
         }
      } 
   }
}  
</script>
<script>
$(function(){
	$('#user_id').keyup(function(){
		if(document.registFrm.user_id.value.length==0){
			$('#display').html(' ');
			$('#overFlag').val(0);
		}
		else{
			$.ajax({
				url:"../catle/NormalMemberIdCheck.do",
				dataType : "json",
				type:"get",
				contentType : "text/html;charset:utf-8",
				data : {
					
					user_id : $('#user_id').val()
				},
				success : function(d){
					var msg = ""
					if(d.result==0){
						$('#overFlag').val(1);
						msg += "<font color ='green' size='1'>";
						msg += d.msg;
						msg += "</font>";
					}
					else{
						$('#overFlag').val(0);
						msg += "<font color ='red' size='1'>";
						msg += d.msg;
						msg += "</font>";
					}
					$('#display').html(msg);
				},
				//요청실패시 콜백메소드
				error : function(e){
					alert("오류발생"+e.status+":"+e.statusText);
				}
			});
		}
	});
});
</script>
</head>
<body>
  
<form name="registFrm" action="./registFinish.do" method="post" onsubmit="return registFrmCheck();">
   <input type="hid-den" id="overFlag" name="overFlag" value="0" />
   <table width ="1000" 
      style="border-spacing:20px; width:900px;margin-left: 9%">
      <tr>
      	<td colspan="2" style=" font-size: 24px;"><b>회원정보 <span style="color: gray;"><small>(일반회원)</small></span></b></td>
   	  </tr>
      <tr >
         <td id="Column">아이디</td>
         <td>
            <input type="text" id="user_id" name="user_id" value="" style="width:150px; height:25px;"/>
            <font color ="gray" size="1">아이디 형식에 맞춰주세요(영문,숫자 조합4문자 이상)</font>
            <br />
            <p id="display"></p>
         </td>
      </tr>
      <tr>
         <td id="Column">비밀번호</td>
         <td>
            <input type="text" name="user_pw1" value="" style="width:150px; height:25px;"/>
            <font color ="gray" size="1">8~20자리의 영문, 숫자 조합(영문,숫자,특수기호 조합을 권장합니다.)</font>
         </td>
      </tr>
      <tr>
         <td id="Column">비밀번호 확인</td>
         <td>
            <input type="text" name="user_pw2" value="" style="width:150px; height:25px;"/>
         </td>
      </tr>
      <tr>
      	<td id="Column">이름</td>
		<td><input type="text" name="user_name" value="" style="width:150px; height:25px;"/></td>
      </tr>
      <tr>
         <td id="Column">이메일</td>
         <td >
            <input type="text" name="email_id" style="width:150px; height:25px;" value="" /> @ 
            <input type="text" name="email_domain" style="width:150px; height:25px;" value="" />
            <select name="email_choice" style="height:25px;" onchange="choiceInput(this.form, this)">
               <option value="">-선택하세요-</option>
               <option value="naver.com">네이버</option>
               <option value="hanmail.net">다음</option>
               <option value="gmail.com">구글G메일</option>
               <option value="yahoo.com">야후</option>
               <option value="direct_input">-직접입력-</option>
            </select>
         </td>
      </tr>
      <tr>
         <td id="Column">휴대전화</td>
         <td>
            <input type="text" name="mobile1" value="" placeholder="" class="s50" maxlength="3" style="width:150px; height:25px;" value="" />
            - 
            <input type="text" name="mobile2" value="" placeholder="" class="s70" maxlength="4" style="width:150px; height:25px;" value="" />             
            - 
            <input type="text" name="mobile3" value="" placeholder="" class="s70" maxlength="4" style="width:150px; height:25px;" value="" />
             <br /> 
         </td>
      </tr>
   </table>
   <table width="800" height="200" style="border-spacing:20px;" >
      <colgroup>
         <col width="16%" />
         <col width="28%" />
         <col width="28%" />
         <col width="28%" />
         <!-- *로 대체해도됨 -->
      </colgroup>   
      
      <tr>
      	<td rowspan="3" id="Column">관심분야</td>
      	<td>
      		<input type="checkbox" id="exercise"name="user_brand" value="운동"/><label for="exercise">운동</label>
        </td>
      	<td>
      		<input type="checkbox" id="music" name="user_brand" value="음악"/>
            <label for="music">음악</label>
      	</td>
      	<td>
      		<input type="checkbox" id="art" name="user_brand" value="미술"/>
            <label for="art">미술</label>
      	</td>
      </tr>
      <tr>
      	<td>
      		<input type="checkbox" id="kor" name="user_brand" value="국어"/>
            <label for="kor">국어</label>
      	</td>
      	<td>
      		<input type="checkbox" id="eng" name="user_brand" value="영어"/>
            <label for="eng">영어</label>
      	</td>
      	<td>
      		<input type="checkbox" id="math" name="user_brand" value="수학"/>
            <label for="math">수학</label>
      	</td>
      </tr>
      <tr>
      	<td colspan="3">
      		<input type="checkbox" id="etc" name="user_brand" value="기타" />
            <label for="etc">기타</label>
      	</td>
      </tr>
      
      
      
   </table>
   <p style="margin-top: 20px;margin-bottom: 20px;"> 

      
     <!--  <button type="submit" style="background-color: white; margin-left:3%; margin-top:3% ">
         <img src="../images/가입하기.png" style="width:72px; height:20px;"/>
      </button> -->
   </p>

<br><br>
	<table>
	<tr>
		<td style="font-size: 1em;vertical-align: middle;">
			<button type = "submit"  class="btn_order" style="margin:10px;width:auto;height:auto; ">
				가입하기</button>
	  		<a href="registGroup.do"><button type = "button"  class="btn_cancel1" style="margin:10px;width:auto;height:auto;">
	  			취소하기</button></a>
		</td>
	</tr>
	</table>
	</form>
    </center>
  </body>
</html>