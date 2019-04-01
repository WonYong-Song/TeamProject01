<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title></title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.1/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<script>
$(function(){
	$('#exit').click(function(){		
		window.close();
	});
});
</script>
  <body>
  <div style="text-align: center; margin-top: 5%;margin-bottom: 20%">
	<h3>귀하의 아이디는 " ${fiddto.id } " 입니다.</h3>
	 <button type ="button" id="exit" style="width: 70px; height: 50px; font-size: 15px; font-weight: bold;">확인</button>
  </div>
  </body>
</html>