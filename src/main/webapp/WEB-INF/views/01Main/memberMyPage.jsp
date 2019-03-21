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

#holder::placeholder {
	color: red;
}
</style>

<body id="page-top">
 <!-- Nav Bar -->
 <%@ include file="/../resources/DR_common/commonNavTop.jsp" %>
 <!-- Nav Bar -->
  <!-- Contact Section -->
  <section class="signup-section">
    <div class="container">
		<div class="row" style="background-color: #ffffff; border-radius: 10px 10px 10px 10px;padding-top: 5% ">

			<h4 style="font-family: sans-serif; ">&nbsp;&nbsp;&nbsp; ■ 마이페이지  </h4>
			<br /><br />
			<table class="table table-striped table-bordered" style="width: 100%; height: 100%; margin: 2%;" >
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
					<td>이름 : &nbsp;&nbsp;${memberInfo.name }</td>
					<td>아이디 : &nbsp;&nbsp;${memberInfo.id }</td>
				</tr>
				<tr>
					<td>이메일 : &nbsp;&nbsp;${memberInfo.emailId }@${memberInfo.emailDomain}</td>
					<td>휴대전화번호: &nbsp;&nbsp;${memberInfo.mobile1}-${memberInfo.mobile2}-${memberInfo.mobile3}</td>
				</tr>
				<tr>
					<td>관심사: &nbsp;&nbsp;${memberInfo.interest}</td>
					<td>
						<form action="passConfirm.do" style="text-align: left;">
						
							<c:if test="${not empty msg }">
							<input id="holder" type="text" name="pass" style="width: 220px;" placeholder="${msg }"/>
							</c:if>
							<c:if test="${empty msg }">
							<input type="text" name="pass" style="width: auto"placeholder="비밀번호를 입력후 클릭"/>
							</c:if>
							<button type="submit" class="btn btn-primary" style="margin-left:2%;height:35px;padding-bottom:10px;font-size:  1em;vertical-align: middle">
				            <div style="margin-top: -20%">수정하기</div></button>
				            </div>
						</form>
					</td>
				</tr>
			</table>
			
		</div>
		<hr />
		
		<div class="row" style="background-color: #ffffff; border-radius: 10px 10px 10px 10px;">
			<table class="table table-bordered" style="width: 100%; height: 100%; margin: 2%">
			<colgroup>
				<col width="10%"/>
				<col width="*"/>
				<col width="25%"/>
				<col width="15%"/>
				<col width="10%"/>
			</colgroup>
			<thead>

			          <!-- <h2 class="text-white mb-5" style="color: blue">Subscribe to receive updates!</h2> -->
			

			<tr>
				<th colspan="5" style="font-size: 1.5em; height: 30px; text-align: center;">
				<br />
				 등록한 수강목록<br /><br /><br />
				 <div class="text-right" style="width:100%;height:auto;margin-right: 30%">
			          <form class="form-inline d-flex" style="text-align: right;margin-left: 40%;">
						<div style="width:1000px;">
						<select name="keyField" class="form-control" style="height:40px;padding-right: 10px;">
							<option value="acaday">강의요일</option>
							<option value="acaclassname">강의이름</option>
							<option value="teaname">강사이름</option>
							<!-- <option value="contents">이름+위치</option> -->
						</select>
			
			            <input type="text" name="keyString"  class="form-control" placeholder="캐슬링 정보를 입력해주세요"  
			            	style="width:400px;height: 40px;font-size: 0.6em"/>
			            
			            <button type="submit" class="btn btn-primary" style="height:40px;padding-bottom:10px;font-size:  0.6em;vertical-align: middle">
			            <div style="margin-top: -25%">검색</div></button>
			            </div>
			          </form>
				 </div>
				 <br />
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
							<td class="text-center">${row.setVirtualNum}</td>
							<td class="text-left">${row.acaclassname }</td>
							<td class="text-center">${row.acastartdate }~${row.acaenddate }</td>
							<td class="text-center">${row.acastarttime }~${row.acaendtime }</td>
							<td class="text-center">${row.teaname }</td>
						</tr>
						<!-- 리스트반복 끝 -->
					</c:forEach>
				</c:otherwise>
				</c:choose>
			</tbody>
			</table>
			<section class="contact-section bg-white" style="margin-left: 49%">
		    <div class="container" >
		      <div class="text-center " >
					<ul class="pagination">
						${pagingImg }
					</ul>
		      </div>
		    </div>
   </section>
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
