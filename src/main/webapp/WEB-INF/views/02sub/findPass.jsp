<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dto.AcaClassDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패스워드찾기</title>
<link rel="stylesheet" href="../resources/bs3.3.7/css/bootstrap.css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
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
</script>
<script>
$(function(){
	$('#cancel').click(function(){		
		window.close();
	});
});

var findPassFrm = p;

function infoRegiValidate(p) {
	
	if(p.id.value==""){
		alert("이름을 입력해주세요");
		p.id.focus();
		return false;
	}
	if(p.name.value==""){
		alert("이름을 입력해주세요");
		p.name.focus();
		return false;
	}
	if(p.emailId.value==""){
		alert("메일주소를 입력해주세요");
		p.emailId.focus();
		return false;
	}
	if(p.emailDomain.value==""){
		alert("메일주소를 입력해주세요");
		p.emailDomain.focus();
		return false;
	}
}
</script>
</head>
<body>
<div class="container" style="padding-top:40px;" >
	<form name="findPassFrm" action="findPassAction.do" method="post" onsubmit="return infoRegiValidate(this);">
	<table>
       <tr>
      	<th style="width: 50px;">아이디</th>
		<td><input type="text" name="id" value="" style="width:150px; height:25px;"/></td>
      </tr>
       <tr>
      	<th style="width: 50px;">이름</th>
		<td><input type="text" name="name" value="" style="width:150px; height:25px;"/></td>
      </tr>
      <tr>
         <th>이메일</th>
         <td >
            <input type="text" name="emailId" style="width:150px; height:25px;" value="" /> @ 
            <input type="text" name="emailDomain" style="width:150px; height:25px;" value="" />
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
	<br />
	<button type="submit">확인</button>
    <button type="button" id="cancel">취소</button>
  </form>
</div>
</body>
</html>