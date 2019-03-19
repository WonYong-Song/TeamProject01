<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Grayscale - Start Bootstrap Theme</title>

  <!-- Bootstrap core CSS -->
  <link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
 
  <!-- Custom fonts for this template -->
  <link href="../resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="../resources/css/grayscale.min.css" rel="stylesheet">
  
</head>
<style>

/* 모달창 */
.modal {
text-align: center;
padding: 0!important;

}

.modal:before {
content: '';
display: inline-block;
height: 100%;
vertical-align: middle;
margin-right: -4px;
}

.modal-dialog {
display: inline-block;
text-align: left;
vertical-align: middle; 

}
/* 이미지 크기 고정 */
.selector img{
position: absolute; top:0; left: 0;
width: 100%;
height: 100%;
}
</style>

<body id="page-top">
 <!-- Nav Bar -->
 <%@ include file="/../resources/DR_common/commonNavTop.jsp" %>
 <!-- Nav Bar -->
  <!-- Contact Section -->
  <section class="signup-section">
    <div class="container">
		<div class="row" style="background-color: #ffffff; border-radius: 10px 10px 0 0;">
			<h4 style="font-family: sans-serif; ">&nbsp;&nbsp;&nbsp; ■ 마이페이지  </h4>
			<br /><br />
			<table class="table table-striped" style="width: 80%; height: 200px; padding: 0 ; margin-left: 80px;" >
				<colgroup>
	                <col width="25%"/>
	                <col width="25%"/>
	                <col width="25%"/>
	                <col width="25%"/>
	            </colgroup>
				<tr>
					<th colspan="2" style="font-size: 1.5em; height: 30px; text-align: center;">
						내정보
					</th>
				</tr>
				<tr>
					<td>이름 : &nbsp;&nbsp;${dto.name }</td>
					<td></td>
				</tr>
				<tr>
					<td>아이디 : &nbsp;&nbsp;${dto.memberId }</td>
					<td>이메일 : &nbsp;&nbsp;${dto.emailId }@${dto.emailDomain}</td>
				</tr>
				<tr>
					<td>휴대전화번호: &nbsp;&nbsp;${dto.phoneNumber}</td>
					<td>관심사: &nbsp;&nbsp;${dto.interest}</td>
				</tr>
				<tr>
					<td colspan="2" bgcolor="#ffffff" height="50px;"><p style="text-align: right">
					<button type="button">정보수정</button></p>
					</td>
				</tr>
			</table>
			
		</div>
		<hr />
		<div class="row" style="background-color: #ffffff; border-radius: 0 0 10px 10px;">
			<table class="table table-bordered" style="width: 100%; height: 100%;">
			<colgroup>
				<col width="60px"/>
				<col width="*"/>
				<col width="150px"/>
				<col width="150px"/>
				<col width="100px"/>
			</colgroup>
			<thead>
			<tr>
				<th colspan="5" style="font-size: 1.5em; height: 30px; text-align: center;">
				 등록한 수강목록
				</th>
			</tr>
			<tr class="default">
				<th class="text-center">번호</th>
				<th class="text-left">강의명</th>
				<th class="text-center">수강일자</th>
				<th class="text-center">수강시간</th>
				<th class="text-center">강사명</th>
			</tr>
			</thead>	
			<tbody>
			<c:choose>
				<c:when test="${empty myClass }">
					<tr>
						<td colspan="5" class="text-center">
							수강중인 강의가 없습니다.
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${myClass }" var="row" varStatus="loop">
						<!-- 리스트반복 시작 -->
						<tr>
							<td class="text-center">${loop.index+1 }</td>
							<td class="text-left">${row.acaclassname }</td>
							<td class="text-center">${row.acastartdate }~${row.acaenddate }</td>
							<td class="text-center">${row.acastarttime }~</td>
							<td class="text-center">${row.teaname }</td>
						</tr>
						<!-- 리스트반복 끝 -->
					</c:forEach>
				</c:otherwise>
				</c:choose>
			</tbody>
			</table>
		</div>
	</div>
</section>
  <!-- Footer -->
  <footer class="bg-black small text-center text-white-50">
    <div class="container">
      Copyright &copy; Your Website 2019
    </div>
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="/FinallyProject/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/FinallyProject/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="/FinallyProject/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="/FinallyProject/resources/js/grayscale.min.js"></script>

</body>

</html>
