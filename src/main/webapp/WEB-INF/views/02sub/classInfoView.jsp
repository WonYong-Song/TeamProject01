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
<title>강의정보 상세보기</title>
<link rel="stylesheet" href="../resources/bs3.3.7/css/bootstrap.css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
body {
 background-color: #409CDE;"
}

.line{border-bottom:1px solid #DDE1E5; padding-left: 10px;}
.line2{border-bottom:1px solid #DDE1E5; border-right:1px solid #DDE1E5; padding-left: 10px;}
.line3{border-right:1px solid #DDE1E5; padding-left: 10px;}
</style>
<script>
function classRegiValidate(c) {
	
	var c = document.classFrm
	
	if(c.acastartdate.value==""){
		alert("강의시작일자를 입력해주세요");
		return false;
	}
	if(c.acaenddate.value==""){
		alert("강의종료일자를 등록해주세요");
		return false;
	}
	if(c.acastarttime.value==""){
		alert("강의시작시간을 입력해주세요");
		return false;
	}
	
	if(c.acaendtime.value==""){
		alert("강의종료시간을 등록해주세요");
		return false;
	}
	 
	if(c.acaclassname.value==""){
		alert("강의명을 입력해주세요");
		c.acaclassname.focus();
		return false;
	}
	if(c.teaidx.value==""){
		alert("강사명을 입력해주세요");
		c.teaidx.focus();
		return false;
	}
	
	if(c.pay.value==""){
		alert("수강료를 입력해주세요");
		c.pay.focus();
		return false;
	}
	if(c.numberofparticipants.value==""){
		alert("수강인원을 입력해주세요");
		c.numberofparticipants.focus();
		return false;
	}
	
	var chk = false;
	for(var i= 0; i<c.acaday.length; i++){
    	if(c.acaday[i].checked==true){   
	        chk=true;
	        break;
	    }
	    else if(chk==false){
	    	alert("강의요일을 선택해주세요");
			return false;
	    }
	}
}
</script>
<script>
$(function(){
	$('#delete').click(function(){
		if(confirm("삭제하시겠습니까?")){
			$.ajax({
				type : "get",
				url : "<c:url value='/catle/classDelete/${classDTO.classidx }'/>",
				success:function(){
					alert("삭제되었습니다");
					window.opener.location.reload(); 
					window.close();
				}
				,error:function(){
				
				}			
			});	
		}
	});
});

$(function(){
	$('#clsup').click(function(){
		if(confirm("수정하시겠습니까?")){
			
		}
		else{
			return false;
		}
	});
});

/* self.location.href = "<c:url value='/catle/classDelete/${classDTO.classidx }'/>";
window.opener.location.reload();
close(); */

$(document).ready(function(){

  $('#selbox').find("option").each(function(){

    if($(this).val()=="${classDTO.teaidx}"){

      $(this).attr("selected","selected");
    }
  });
});


</script>
</head>
<body>
<%
AcaClassDTO acaClassDTO = (AcaClassDTO)request.getAttribute("classDTO");

String day = acaClassDTO.getAcaday();

String[] acaday = day.split(",");
Map<String,String> checkAcaday = new HashMap<String,String>();

for(String in : acaday){
	checkAcaday.put(in, "checked");
}
%>
<div class="container" style="padding-top:40px;" >
	<form name="classFrm" action="classInfoUpdate.do" method="post" onsubmit="classRegiValidate(this);">
	<input type="hidden" name="classidx" value="${classDTO.classidx }" />
	<table style=" width:100%; height:250px; background-color: #ffffff; border-radius: 10px; ">
	      <colgroup>
	          <col width="55%"/>
	          <col width="35%"/>
	          <col width="10%"/>
	</colgroup>
	      <tr>
			<th class="line" colspan="3" style="font-size: 1.5em;">강의정보수정</th>
	      </tr>
	      <tr>
	         <td class="line2"style="padding-top: 20px;"><span style="font-weight: bold;">강의일자 :</span> <input type="date" name="acastartdate" value="${classDTO.startd}"/>~<input type="date" name="acaenddate" value="${classDTO.endd}"/> <br /><br />	
	         <td class="line2"><span style="font-weight: bold;">강의명 :</span> <input type="text" name="acaclassname" value="${classDTO.acaclassname}"/>
	         <td rowspan="3" style="text-align: center;vertical-align: middle">
	         <button type="submit" id="clsup">수정</button><br /><br />
	         <button type="button" id="delete">삭제</button></td>
	      </tr>
	      <tr>
	      	<td class="line2">
	      	 <span style="font-weight: bold;">강의요일</span> <br />
	 		<input type="checkbox" id="exercise"name="acaday" value="월요일" <%=checkAcaday.get("월요일") %>/>
	 		<label for="mon">월</label>
	 		<input type="checkbox" id="music" name="acaday" value="화요일" <%=checkAcaday.get("화요일") %>/>
	       <label for="tue">화</label>
	 		<input type="checkbox" id="art" name="acaday" value="수요일" <%=checkAcaday.get("수요일") %>/>
	       <label for="wed">수</label>
	 		<input type="checkbox" id="kor" name="acaday" value="목요일" <%=checkAcaday.get("목요일") %>/>
	       <label for="thur">목</label>
	 		<input type="checkbox" id="eng" name="acaday" value="금요일" <%=checkAcaday.get("금요일") %>/>
	       <label for="fri">금</label>
	 		<input type="checkbox" id="math" name="acaday" value="토요일" <%=checkAcaday.get("토요일") %>/>
	       <label for="sat">토</label>
	 		<input type="checkbox" id="etc" name="acaday" value="일요일" <%=checkAcaday.get("일요일") %>/>
	       <label for="sun">일</label>
	        	 </td>
	        	 <td class="line2">
	   		<span style="font-weight: bold;">강사명:</span> 
	   			<c:if test="${!empty tealists}">
					<select id="selbox" style="width:100px;" onchange="document.getElementById('teaName').value= this.options[this.selectedIndex].value">					
			   			<option value="">선택</option>
				   		<c:forEach var="tealists" items="${tealists }" >		
			      			<option value="${tealists.teaidx  }"> ${tealists.teaname } </option>
				  		 </c:forEach>
					</select>
				</c:if>
					<input type="hidden" name="teaidx" id="teaName" value="${classDTO.teaidx }"/> 
        		</td>
	        </tr>
	        <tr>
	           <td class="line3"><span style="font-weight: bold;">강의시간 :</span> <br /><input type="time" name="acastarttime" value="${classDTO.startt}"/> ~ <input type="time" name="acaendtime" value="${classDTO.endt}"/></td>
	           <td class="line3"><span style="font-weight: bold;">수강료 :</span> <input type="number" name="pay" style="width: 100px;" value="${classDTO.pay}"/><br /><br /><span style="font-weight: bold;">수강인원 :</span> <input type="number" name="numberofparticipants" style="width: 100px;" value="${classDTO.numberofparticipants}"/></td>
	      </tr>
		</table>
	  </form>
</div>
</body>
</html>