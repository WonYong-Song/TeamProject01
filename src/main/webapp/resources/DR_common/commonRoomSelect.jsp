<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05GoodsSelect1</title>
</head>
<body>
<% 
request.setCharacterEncoding("utf-8");
String gName = request.getParameter("goodsOptionName");
if(gName.equals("op01")){
%>
	<table class="table table-bordered">
		<tr>
			<td>옵션명</td>
			<td>호텔 조식 & 브런치</td>
		</tr>
		<tr>
			<td colspan="2" class="danger" style="background-color: #e5cdbd">추가비용
				: + 10000원</td>
		</tr>
	</table>
<% }else if(gName.equals("op02")){%>
<table class="table table-bordered">
	<tr>
		<td>옵션명</td>
		<td>리무진 픽업</td>
	</tr>
	<tr>
		<td colspan="2" class="danger" style="background-color: #e5cdbd">추가비용
			: + 10000원</td>
	</tr>
</table>
<% } else if(gName.equals("op03")){%>
<table class="table table-bordered">
	<tr>
		<td>옵션명</td>
		<td>숙박일 추가</td>
	</tr>
	<tr>
		<td colspan="2" class="danger" style="background-color: #e5cdbd">추가비용
			: + 70000원</td>
	</tr>
</table>
<% } %>
</body>
</html>
