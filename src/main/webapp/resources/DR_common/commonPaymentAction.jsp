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

  <table style="width:550px;hieght:700px;" align=center>
    <tr>
    <td align=center>
 <div class="stepLine">
        <div title="결제완료" class="stepDot activeStep"></div>
      </div>

<br/><br/><br />
    </td>
    </tr>
  </table>

  <div style="text-align: center;margin-bottom: 20%;margin:10%">

	<h4>수강 결제가 완료되었습니다.</h4>
	<h6>-캐슬로 배움의 품격을 높혀보세요-</h6>
	<table class="table table-border">
		<tr>
			<th style="text-align: center;vertical-align: middle">아이디</th>
			<td style="text-align: center;vertical-align: middle">${user_id }</td>
		</tr>
		<tr>
			<th style="text-align: center;vertical-align: middle">수강클래스</th>
			<td style="text-align: center;vertical-align: middle">${classDTO.acaclassname }</td>
		</tr>
		<tr>
			<th style="text-align: center;vertical-align: middle">결제 금액</th>
			<td style="text-align: center;vertical-align: middle">${classDTO.pay }(단위:원)</td>
		</tr>
		<tr>
			<th style="text-align: center;vertical-align: middle">수강 기간</th>
			<td style="text-align: center;vertical-align: middle">${classDTO.acastartdate }~${classDTO.acaenddate }<br />매주&nbsp;${classDTO.acaday }&nbsp;&nbsp;${classDTO.acastarttime }~${classDTO.acaendtime }</td>
		</tr>
		<tr>
		<td style="font-size: 1em;vertical-align: middle;" colspan="2">
			<br /><br />
			<img src="../resources/img/도장.png" alt="" style="width:100;height: 50"/>
			<a href="memberMyPage.do"><button type = "button"  class="btn_order" style="margin:10px;width:auto;vertical-align: middle">마이페이지</button></a>
	  		<a href="helloCastle.do"><button type = "button"  class="btn_cancel1" style="margin:10px;width:auto;vertical-align: middle">홈으로</button></a>
		</td>
	</tr>
	</table>
  </div>
	
<br/><br/> 
	<table>
	
	</table>

  </body>
</html>