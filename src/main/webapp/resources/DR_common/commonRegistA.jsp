<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script type="text/javascript">
function registFrmCheck()
{   
   var fn = document.registFrm;
   
   var frmArray = ["user_id", "user_pw1", "user_pw2", "user_name", "gender[0]",
               "birthday",   "birthLS[0]","email_id","email_domain","email_yn[0]",
               "mobile1","mobile2","mobile3","sms_yn[0]","phone1","phone2","phone3",
               "zipcode","address1","address2","job","user_brand[0]","user_part[0]",/* "user_part_txt" */];
   var txtArray = ["아이디", "패스워드", "패스워드확인", "이름", "성별", 
               "생년월일", "양력/음력", "이메일", "이메일도메인", "이메일수신확인",
               "휴대전화번호1","휴대전화번호2","휴대전화번호3","휴대전화수신확인",
               "전화번호1","전화번호2","전화번호3","우편번호","주소1","상세주소","직업",
               "관심브랜드","관심분야"];
   
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
         //alert(frmArray[i]+"라디오박스");   
         var isRadio = false;
         var radioTxt = frmArray[i].substring(0,frmArray[i].length-3);
         var isGender = false;
         
         
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
      alert("아이디 중복확인을 해주세요.")
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
//아이디 중복체크하기
function id_overlapping(fn)
{
   var iForm = fn.user_id;
   
   //공백제거
   trimAll(iForm);
   //아이디 입력후 중복확인 누를수 있음
   if(iForm.value.length==0) {
   /* 위 조건은 fn.user_id.value=="" 과 동일함 */
      alert('아이디를 기입하신다음 중복확인을 누르세요.') ;
      iForm.focus();
      return ;
   } 
   //아이디는 8자이상
   if(8 > iForm.value.length)
   {
      alert('아이디는 8자이상이어야 합니다.');
      iForm.value='';
      iForm.focus();
      return ;
   }
   //숫자로 시작할수 없음 : kosmo31(허용됨), 31kosmo(허용안됨)
   if(isNumber(iForm.value.substring(0,1))==true){
      alert("아이디는 숫자로 시작할수 없습니다.");
      iForm.value='';
      iForm.focus();
      return ;
   }      
   //숫자,영소문자 조합만 가능함.
   var result = LowerDigitCheck(iForm);
   if(result==false) return ;

   /* 아이디중복확인 팝업창을 띄워줌 : 
      user_id에 입력한 값을 get방식으로 받음 */
   window.open ('IdOverlap.jsp?user_id=' + iForm.value, 'IDWin', 'width=580, height=270, toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no');
   
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function postOpen()
{
    new daum.Postcode({
        oncomplete: function(data) {
         
           var f = document.registFrm;
           f.zipcode.value = data.zonecode;
           f.address1.value = data.address;
           
           f.sido.value = data.sido;
           f.gugun.value = data.sigungu;
           
           f.address2.focus();
        }
    }).open();
}
</script>
</head>
<body>
  
<form name="registFrm" action="../DataRoom/MemberRegist" method="post" onsubmit="return registFrmCheck();">
   <input type="hidden" name="overFlag" value="0" />
   <table width ="1000" 
      style="border-spacing:20px; width:900px;margin-left: 9%">
      <tr>
    	  <td colspan="2" style=" font-size: 24px;"><b>회원정보 <span style="color: grat;">(학원회원)</span></b></td>
      </tr>
      <tr >
         <td id="Column">아이디</td>
         <td>
            <input type="text" name="user_id" value="" style="width:150px; height:25px;"/>
            <input type="image" src="../images/아이디.png" width ="120" align="center" onclick="id_overlapping(this.form);"/>
            <font color ="gray" size="1">아이디 형식에 맞춰주세요(영문,숫자 조합4문자 이상)</font>
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
         <td id="Column">기업명(학원명)</td>
         <td><input type="text" name="user_name" value="" style="width:150px; height:25px;"/></td>
      </tr>
      <tr>
         <td id="Column">기업(학원)대표번호</td>
         <td colspan="3">
            <input type="text" name="phone1" value="" placeholder="" class="s50" maxlength="3" style="width:150px; height:25px;"/>
            - 
            <input type="text" name="phone2" value="" placeholder="" class="s70" maxlength="4" style="width:150px; height:25px;"/>             
            - 
            <input type="text" name="phone3" value="" placeholder="" class="s70" maxlength="4" style="width:150px; height:25px;" />
         </td>
      </tr>      
      <tr>
         <td id="Column">대표자 성함</td>
         <td><input type="text" name="user_name" value="" style="width:150px; height:25px;"/></td>
      </tr>      
      <tr>
         <td id="Column">대표자 휴대전화</td>
         <td>
            <input type="text" name="mobile1" value="" placeholder="" class="s50" maxlength="3" style="width:150px; height:25px;" value="" />
            - 
            <input type="text" name="mobile2" value="" placeholder="" class="s70" maxlength="4" style="width:150px; height:25px;" value="" />             
            - 
            <input type="text" name="mobile3" value="" placeholder="" class="s70" maxlength="4" style="width:150px; height:25px;" value="" />
             <br /> 
         </td>
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
   </table>

   <table width="800" height="300" style="border-spacing:20px;"  >
   <tr>
      <colgroup>
         <col width="21%" />
         <col width="28%" />
         <col width="28%" />
         <col width="28%" />
         <!-- *로 대체해도됨 -->
      </colgroup>   
         <tr>
         <td id="Column">기업(학원)주소</td>
         <td colspan="3">
            <input type="text" name="zipcode" value="" placeholder="" class="s50" maxlength="5" style="width:150px; height:25px;"/>
            <input type="image" src="../images/우편번호 검색.png"  height="30px;"width="120px" align="center" onclick="postOpen();" /><br />
            <input type="text" name="address1" value="" placeholder="" class="input2 s300" style="width:300px; height:25px;"/>
            <input type="text" name="address2" value="" placeholder="" class="input2 s400" style="width:400px; height:25px;"/>
            
            <input type="hidden" name="sido" />
            <input type="hidden" name="gugun" />
         </td>
       </tr>
</form>
  <!--  <table>
      <p style="margin-top: 20px;margin-bottom: 20px;"> 
        <button type="submit" style="background-color: white; margin-left:3%; margin-top:3% ">
           <img src="../images/가입하기.png" style="width:72px; height:20px;"/>
         </button>
      </p> 
   </table> -->

   <p style="margin-top: 20px;margin-bottom: 20px;"> 

      
     <!--  <button type="submit" style="background-color: white; margin-left:3%; margin-top:3% ">
         <img src="../images/가입하기.png" style="width:72px; height:20px;"/>
      </button> -->
   </p>
</form>
<br><br>
	<table>
	<tr>
		<td style="font-size: 1em;vertical-align: middle;">
			<a href="registFinish.do" ><button type = "button"  class="btn_order" style="margin:10px;width:auto;height:auto; ">
				가입하기</button></a>
	  		<a href="registGroup.do"><button type = "button"  class="btn_cancel1" style="margin:10px;width:auto;height:auto;">
	  			취소하기</button></a>
		</td>
	</tr>
	</table>
    </center>
  </body>
</html>