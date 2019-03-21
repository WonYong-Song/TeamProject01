<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/bs3.3.7/css/bootstrap.css" />
</head>
<body>
<div class="container">
<!-- 강사정보추가  -->
	<form name="teachFrm" action="teaInfoInsert.do" method="post" onsubmit="return teaRegiValidate(this)">
		<div>
			<hr />
			<table class="table" style="width:100%; background-color: #EEEEEE;">
				<tr><th colspan="2" style="font-size: 1.5em;">- 강사 등록</th></tr>
				<tr>
					<th>강사이미지</th>
					<td>
					<input type="file" name="teaimage"/>
					</td>
				</tr>
				<tr>
					<th> 강사명 </th>
					<td><input type="text" name="teaname" placeholder="강사이름"></td>
				</tr>
				<tr><th style="text-align: center" colspan="2">강사소개</th></tr>
				<tr>
					<td colspan="2">
					<textarea name="teaintro" cols="30" rows="10" style="width:100%"></textarea>
					</td>
				</tr> 
				<tr>
					<th>강의과목</th>
					<td><input type="text" name="subject" placeholder="과목명, 과목명 ..."></td>
				</tr>
			</table>
			<p style="text-align: right"><button type="submit">등록</button></p>
		</div>  
	</form>
</div>
</body>
</html>