<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>oh gu, oh good!</title>
	
    <link rel="stylesheet" href="../resources/css/join.css">
    <link rel="stylesheet" href="../resources/css/pdsr.css">
    <link rel="stylesheet" href="../resources/css/button.css">

    <link href='https://cdn.rawgit.com/openhiun/hangul/14c0f6faa2941116bb53001d6a7dcd5e82300c3f/nanumbarungothic.css' rel='stylesheet' type='text/css'>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="/FinallyProject/resources/jquery/jquery-3.3.1.min.js"></script>
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
  font-size: 13px;
  font-family: 'NanumBarunGothic',Arial,sans-serif;
  z-index: 0;
}
input[type=checkbox]{
	margin-top: 20px; margin-bottom:10px;
	font-size: 13px;
	font-family: 'NanumBarunGothic',Arial,sans-serif;
	z-index: 0;  
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
  font-size: 13px;
  font-family: 'NanumBarunGothic',Arial,sans-serif;
  z-index: 0;
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
	font-size: 20px;
	font-family: 'NanumBarunGothic',Arial,sans-serif;
	z-index: 0;
}
#extra{
	width:100px
}
strong{

}

</style>

<center>
  <table width=960px align=center>
    <tr>
    <td align=center>
      <div class="stepLine">
        <div title="이용약관" class="stepDot"></div>
        <div title="정보입력" class="stepDot activeStep"></div>
        <div title="가입완료" class="stepDot"></div>
      </div>
  </center><br><br><br>
    </td>
    </tr>
    </table>
</head>
<script>
function registFrmCheck()
{   
   var fn = document.registFrm;
   
   var frmArray = ["id", "pass", "passcheck", "acaName", "telephone1","telephone2","telephone3",
               "name","mobile1","mobile2","mobile3","emailId","emailDomain",
               "주소","상세주소"];
   var txtArray = ["아이디", "패스워드", "패스워드확인", "기업명(학원명)", "학원대표번호1", "학원대표번호2", "학원대표번호3",
               "대표자 성함","대표자 휴대전화번호1","대표자 휴대전화번호2","대표자 휴대전화번호3","이메일아이디","이메일도메인",
               "address","addressDetail"];
   
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
   
   //아이디 중복체크 및 유효성 검사
   if(id_overlapping(fn)==false){
		return false;   
   }
   
   //패스워드 유효성 검사
   if(fnCheckPassword(fn.id.value, fn.pass.value)==false){
	   return false;
   }
   //패스워드1,2 일치 여부 확인
   if(fn.pass.value!=fn.passcheck.value){
	   alert("비밀번호가 일치하지 않습니다.");
	   fn.user_pw2.value="";
	   fn.user_pw1.focus();
	   return false;
   }
   
   
}

//아이디 중복체크하기
function id_overlapping(fn)
{
	var iForm = fn.id;
	
	//공백제거
	trimAll(iForm);
	//아이디 입력후 중복확인 누를수 있음
	
	//아이디는 8자이상
	if(8 > iForm.value.length)
	{
		alert('아이디는 8자이상이어야 합니다.');
		iForm.value='';
		iForm.focus();
		return false;
	}
	//숫자로 시작할수 없음 : kosmo31(허용됨), 31kosmo(허용안됨)
	if(isNumber(iForm.value.substring(0,1))==true){
		alert("아이디는 숫자로 시작할수 없습니다.");
		iForm.value='';
		iForm.focus();
		return false;
	}		
	//숫자,영소문자 조합만 가능함.
	var result = LowerDigitCheck(iForm);
	if(result==false) return false;
	
	var chk_num = iForm.value.search(/[0-9]/g); 
	var chk_eng = iForm.value.search(/[a-z]/ig);
	
	if(chk_num < 0 || chk_eng < 0){ 
	    alert('아이디는 숫자와 영문자를 혼용하여야 합니다.'); 
	    return false;
	}
	
	return true;
	
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
   var valid = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890"
   var ok = "yes";
   var temp;
   for (var i=0; i<field.value.length; i++) {
      temp = "" + field.value.substring(i, i+1);
      if (valid.indexOf(temp) == "-1") ok = "no";
   }
   if (ok == "no") {
      alert("영대소문자 or 숫자만 입력할 수 있습니다");
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
        	frm.emailDomain.readOnly = true;
        	frm.emailDomain.value = elem.options[elem.selectedIndex].value   
         }
         else{
            frm.emailDomain.value = "";
            frm.emailDomain.readOnly = false;
            frm.emailDomain.focus();
         }
      } 
   }
}  

//비밀번호 체크
function fnCheckPassword(uid, upw){
	
	if(!/^[a-zA-Z0-9]{8,20}$/.test(upw)){ 
	    alert('비밀번호는 숫자와 영문자 조합으로 8~12자리를 사용해야 합니다.'); 
	    return false;
	}
	
	var chk_num = upw.search(/[0-9]/g); 
	var chk_eng = upw.search(/[a-z]/ig);
	
	if(chk_num < 0 || chk_eng < 0){ 
	    alert('비밀번호는 숫자와 영문자를 혼용하여야 합니다.'); 
	    return false;
	}
	
	if(/(\w)\1\1\1/.test(upw)){
	    alert('비밀번호에 같은 문자를 4번 이상 사용하실 수 없습니다.'); 
	    return false;
	}
	
	if(upw.search(uid)>-1){
	    alert('ID가 포함된 비밀번호는 사용하실 수 없습니다.'); 
	    return false;
	}
	return true;

}

</script>
<script>
$(function(){
	
	$('#pass').keyup(function(){
		//패스워드1 공백제거
		$('#pass').val($('#pass').val().replace(/ /g, ''));
	});
	$('#passcheck').keyup(function(){
		//패스워드2 공백제거
		$('#passcheck').val($('#passcheck').val().replace(/ /g, ''));
	});
});
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function postOpen()
{
    new daum.Postcode({
        oncomplete: function(data) {
         
           var f = document.registFrm;
           f.zipcode.value = data.zonecode;
           f.address.value = data.address;
           
           f.sido.value = data.sido;
           f.gugun.value = data.sigungu;
           
           f.detailAddress.focus();
        }
    }).open();
}
</script>
<body>
  
<form name="registFrm" action="./ModifyAAction.do" method="post" onsubmit="return registFrmCheck();">
   <table width ="1000" 
      style="border-spacing:20px; width:900px;margin-left: 9%">
      <tr>
    	  <td colspan="2" style=" font-size: 24px;"><b>회원정보 <span style="color: grat;">(학원회원)</span></b></td>
      </tr>
      <tr >
         <td id="Column">아이디</td>
         <td>
            <input type="text" id="id" name="id" value="${dto.id }" style="width:150px; height:25px;" readonly="readonly"/>
            <font color ="gray" size="1">아이디 형식에 맞춰주세요(영문,숫자 조합8문자 이상)</font>
            <br />
            <p id="display"></p>
         </td>
      </tr>
      <tr>
         <td id="Column">비밀번호</td>
         <td>
            <input type="password" id="pass" name="pass" value="" style="width:150px; height:25px;"/>
            <font color ="gray" size="1">8~20자리의 영문, 숫자 조합(영문,숫자,특수기호 조합을 권장합니다.)</font>
         </td>
      </tr>
      <tr>
         <td id="Column">비밀번호 확인</td>
         <td>
            <input type="password" id="passcheck"name="passcheck" value="" style="width:150px; height:25px;"/>
         </td>
      </tr>
      <tr>
         <td id="Column">기업명(학원명)</td>
         <td><input type="text" name="acaName" value="${dto.acaName }" style="width:150px; height:25px;"/></td>
      </tr>
      <tr>
         <td id="Column">기업(학원)대표번호</td>
         <td colspan="3">
            <input type="text" name="telephone1" value="${dto.telephone1 }" placeholder="" class="s50" maxlength="3" style="width:150px; height:25px;"/>
            - 
            <input type="text" name="telephone2" value="${dto.telephone2 }" placeholder="" class="s70" maxlength="4" style="width:150px; height:25px;"/>             
            - 
            <input type="text" name="telephone3" value="${dto.telephone3 }" placeholder="" class="s70" maxlength="4" style="width:150px; height:25px;" />
         </td>
      </tr>      
      <tr>
         <td id="Column">대표자 성함</td>
         <td><input type="text" name="name" value="${dto.name }" style="width:150px; height:25px;"/></td>
      </tr>      
      <tr>
         <td id="Column">대표자 휴대전화</td>
         <td>
            <input type="text" name="mobile1" value="${dto.mobile1 }" placeholder="" class="s50" maxlength="3" style="width:150px; height:25px;" value="" />
            - 
            <input type="text" name="mobile2" value="${dto.mobile2 }" placeholder="" class="s70" maxlength="4" style="width:150px; height:25px;" value="" />             
            - 
            <input type="text" name="mobile3" value="${dto.mobile3 }" placeholder="" class="s70" maxlength="4" style="width:150px; height:25px;" value="" />
             <br /> 
         </td>
      </tr>      
      <tr>
         <td id="Column">이메일</td>
         <td >
            <input type="text" name="emailId" style="width:150px; height:25px;" value="${dto.emailId }" /> @ 
            <input type="text" name="emailDomain" style="width:150px; height:25px;" value="${dto.emailDomain }"  readonly="readonly"/>
            <select name="email_choice" style="height:25px;" onchange="choiceInput(this.form, this)">
               <option value="">-선택하세요-</option>
               <option value="naver.com">네이버</option>
               <option value="hanmail.net">다음</option>
               <option value="gmail.com">구글G메일</option>
               <option value="nate.com">네이트</option>
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
         	<button type="button" class="btn btn-primary" onclick="postOpen();">주소검색</button>
            <input type="hidden" name="zipcode" value="" placeholder="" class="s50" maxlength="5" style="width:150px; height:25px;" readonly="readonly"/>
            <!-- <input type="image" src="../images/우편번호 검색.png"  height="30px;"width="120px" align="center" onclick="postOpen();" /><br /> -->
            <input type="text" name="address" value="${dto.address }" placeholder="" class="input2 s300" style="width:300px; height:25px;"/>
            <input type="text" name="detailAddress" value="${dto.detailAddress }" placeholder="" class="input2 s400" style="width:400px; height:25px;"/>
            
            <input type="hidden" name="sido" />
            <input type="hidden" name="gugun" />
         </td>
       </tr>

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
<br><br>
	<table>
	<tr>
		<td style="font-size: 1em;vertical-align: middle;">
			<button type = "submit"  class="btn_order" style="margin:10px;width:auto;height:auto; ">
				수정하기</button>
	  		<a href="registGroup.do"><button type = "button"  class="btn_cancel1" style="margin:10px;width:auto;height:auto;">
	  			취소하기</button></a>
		</td>
	</tr>
	</table>
	
    </center>
</form>
</body>
</html>