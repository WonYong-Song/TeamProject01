<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사정보 상세보기</title>
<link rel="stylesheet" href="../resources/bs3.3.7/css/bootstrap.css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
body {
 background-color: #409CDE;"
}
.line{border-bottom:1px solid #DDE1E5; padding-left: 10px;}
.line2{border-bottom:1px solid #DDE1E5; border-right:1px solid #DDE1E5; padding-left: 10px;}
.line3{border-right:1px solid #DDE1E5; padding-left: 10px;}
</style>
<script>
function teaRegiValidate(t) {
	
	var t = document.teachFrm;

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
	
	if(t.teaimage.value==""){
		if(t.teaimgOrigin.value!=""){		
			return true;
		}
		alert("강사사진을 첨부해 주세요");
		return false;
	}
}
</script>
<script>
$(function(){
	$('#teadelete').click(function(){
		if(confirm("삭제하시겠습니까?")){
			$.ajax({
				type : "get",
				url : "<c:url value='/catle/teaInfoDelete/${teaDTO.teaidx }'/>",
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
	
	$("#imgInp").on('change', function(){
        readURL(this);
    });
	
	$("#imgInp1").on('change', function(){
        readURL1(this);
    });
	
	$('#teaup').click(function(){
		if(confirm("수정하시겠습니까?")){
		}
		else{
			return false;
		}
	});
});
function readURL(input) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
            $('#blah').attr('src', e.target.result);
        }

      reader.readAsDataURL(input.files[0]);
    }
}
</script>
</head>
<body>
<div class="container" style="padding-top: 30px;">
<!-- 강사정보추가  -->
	<form name="teachFrm" action="teaInfoUpdate.do" method="post" onsubmit="return teaRegiValidate(this)" enctype="multipart/form-data">
		<div>
			<input type="hidden" name="teaimgOriuu" value="${teaDTO.teaimageuu }"/>
			<input type="hidden" name="teaimgOrigin" value="${teaDTO.teaimage }"/>
			<input type="hidden" name="teaidx" value="${teaDTO.teaidx }" />
			<table class="table" style="width:100%; background-color: #fff; border-radius: 10px;" >
				<tr><th colspan="3" style="font-size: 2em; text-align: center; border-radius: 10px;">강사정보수정</th></tr>
				<tr>
					<th style="font-size: 1.2em;">강사이미지</th>
					<td>
					<input type="file" id="imgInp" name="teaimage"/>
					</td>
					<td>
					<c:if test="${not empty teaDTO.teaimageuu}">
						 <span style="font-size: 1.2em;">등록 파일 : ${teaDTO.teaimage }</span> <br />
						<img id="blah" src="../resources/teaUpload/${teaDTO.teaimageuu }" style="width:200px;height:220px;border-radius:5px;"alt="엑스박스" />
					</c:if>		
					</td>
				</tr>
				
				<tr>
					<th style="font-size: 1.2em;">강사명</th>
					<td colspan="3" ><input type="text" name="teaname" placeholder="강사이름"  style="font-size: 1.2em;" value="${teaDTO.teaname }"></td>
				</tr>
				<tr><th style="text-align: center; font-size: 1.2em;" colspan="3">강사소개</th></tr>
				<tr>
					<td colspan="3" style="padding-right: 10px;">
					<textarea name="teaintro" cols="20" rows="8" style="width:100%; font-size: 1.2em;">${teaDTO.teaintro }</textarea>
					</td>
				</tr> 
				<tr>
					<th style="font-size: 1.2em;">강의과목</th>
					<td><input style="font-size: 1.2em;" type="text" name="subject" placeholder="과목명, 과목명 ..." value="${teaDTO.subject }"></td>
					<td><p style="text-align: right;"><button class="btn btn-success" type="submit" id="teaup">수정</button>&nbsp;<button class="btn btn-danger"  type="button" id="teadelete" >삭제</button></p></td>
				</tr>
			</table>
		</div>  
	</form>
</div>
</body>
</html>