<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사정보 상세보기</title>
<link rel="stylesheet" href="./resources/bs3.3.7/css/bootstrap.css" />
<script>
function teaRegiValidate(t) {
	
	var t = document.teachFrm;
	
	if(t.teaimage.value==""){
		alert("강사사진을 첨부해 주세요");
		return false;
	}	
	
	if(t.teaname.value==""){
		alert("강사이름을 입력해주세요");
		t.teaname.focus();
		return false;
	}
	
	if(t.teaintro.value.length==0){
		alert("강사 소개를 입력해주세요");
		t.teaintro.focus();
		return false;
	}
	
	if(t.subject.value==""){
		alert("강사담당 과목을 입력해주세요");
		t.subject.focus();
		return false;
	}
}
</script>
<script>
$(function(){
	$('#btn-delete').click(function(){
		if(confirm("삭제하시겠습니까?")){
			self.location.href = "/catle/teaInfoDelete.do?teaidx=${teaDTO.teaidx }";
		}
	});
});
</script>
</head>
<body>
<div class="container">
<!-- 강사정보추가  -->
	<form name="teachFrm" action="teaInfoUpdate.do" method="post" onsubmit="return teaRegiValidate(this)">
		<div>
			<hr />
			<input type="hid den" name="teaimage" value="${teaDTO.teaimage }"/>
			<input type="hid den" name="teaidx" value="${param.teaidx }" />
			<table class="table" style="width:100%; background-color: #EEEEEE;">
				<tr><th colspan="2" style="font-size: 1.5em;">- 강사 등록</th></tr>
				<tr>
					<th>강사이미지</th>
					<td>
					파일명 : ${teaDTO.teaimage }<input type="file" name="teaimage" />
					</td>
				</tr>
				<tr>
					<th> 강사명 </th>
					<td><input type="text" name="teaname" placeholder="강사이름" value="${acaTeacherDTO.teaname }"></td>
				</tr>
				<tr><th style="text-align: center" colspan="2">강사소개</th></tr>
				<tr>
					<td colspan="2">
					<textarea name="teaintro" cols="30" rows="10" style="width:100%">${acaTeacherDTO.teaintro }</textarea>
					</td>
				</tr> 
				<tr>
					<th>강의과목</th>
					<td><input type="text" name="subject" placeholder="과목명, 과목명 ..." value="${acaTeacherDTO.subject }"></td>
				</tr>
			</table>
			<p style="text-align: right"><button type="submit">수정</button><button>삭제</button></p>
		</div>  
	</form>
</div>
</body>
</html>