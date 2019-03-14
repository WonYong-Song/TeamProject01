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
  <link href="../resources/css/acaregiedit.css" rel="stylesheet">
  	
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
    <div class="container" id="vtab" >
    <input type="hidden" name="acaIdx" />
        <ul>
            <li class="selected">학원소개</li>
            <li>강사진</li>
            <li>강의 및 시간표</li>
        </ul>
      	
        <!-- 학원소개 등록  -->  
        <div>
		<!-- 학원사진등록  -->
		<form name="fileFrm" method="post" action="acaRegistAction.do" enctype="multipart/form-data" onsubmit="return introValidate(this);">
			<table class="table" style="width:100%;" id="example">
				<tr> 
					<th colspan="4" style="font-size: 1.5em;"> - 학원사진등록 </th>
				</tr>
				<tr>
					<th>학원사진</th>
					<td>
						<input type="file" name="introPhoto" />
					</td>
					<td>
						<button class="btn btn-primary" type="button" id="addTrBtn">추가</button>
						<button class="btn btn-danger" type="button" id="trRemove">삭제</button>
					</td>
				</tr>
			</table>

			<!-- 학원 간략 프로필 등록  -->
			<table class="table" style="width:100%;">
				<tr><th colspan="4" style="font-size: 1.5em;"> - 학원프로필등록(간략) </th></tr>
				<tr style="padding: 10px;">
					<th>학원명:</th>
					<td>
						<input type="text" name="AcaName" placeholder="학원이름" value="${dto.acaName } readonly="readonly""/>
					</td>
				</tr> 
				<tr>
					<th>주소</th>
					<td>
						<input type="text" name="AcaAddress" placeholder="기본주소(동, 읍, 리)" style="width: 200px;" value="${dto.acaAddress }" readonly="readonly"/>
						<input type="text" name="AcaDetailAddress" placeholder="상세주소(도로명, 건물번호 등)" style="width: 400px;" value="${dto.acaDetailAddress }" readonly="readonly"/>
						</td>
					</tr>
					<tr>
						<th>대표번호</th>
						<td>
							<input type="text" name="AcaHPNumber" placeholder="학원대표전화번호" value="${dto.acaHPNumber }" readonly="readonly"/>
						</td>
					</tr>
				</table>
				
				<table class="table table-bordered" style="width:100%;">
				<tr><th style="font-size: 1.5em;"> - 학원소개 </th></tr>
				<tr style="padding: 10px;">
					<td>
						<textarea name="introduce" cols="30" rows="10" style="width: 100%;"></textarea>
						</td>
					</tr>
			</table>
				 <p style="text-align: right"><button type="submit" class="btn btn-success">확인</button></p>
		</form>
   		</div>
   		
        <!-- 강사진 등록  -->
		<div>
			<form name="teachFrm" action="teachInfoAction.do" method="post" enctype="multipart/form-data" >
				<div>
					<table class="table" style="width: 400px;">
						<tr><th colspan="2" style="font-size: 1.5em;">- 강사 등록</th></tr>
						<tr>
							<th>강사이미지</th>
							<td>
							<input type="file" name="teaImage"/>
							</td>
						</tr>
						<tr>
							<th> 강사명 </th>
							<td><input type="text" name="teaName" placeholder="강사이름"></td>
						</tr>
						<tr><th style="text-align: center" colspan="2">강사소개</th></tr>
						<tr>
							<td colspan="2">
							<textarea name="teaInfo" cols="30" rows="10" style="width:100%"></textarea>
							</td>
						</tr> 
						<tr>
							<th>강의과목</th>
							<td><input type="text" name="subject" placeholder="과목명, 과목명 ..."></td>
						</tr>
					</table>
					<p style="text-align: right"><button type="button" class="btn btn-primary" id="teaRegi" onclick="teaRegiValidate(this);">등록</button>&nbsp;&nbsp;<button type="submit" class="btn btn-success">확인</button></p>
				</div> 
			</form>
		</div>
        
        <!-- 강의 및 시간표 등록  -->
   		<div style="height: 500px;">
           <form name="classFrm" action="classAction.do" method="post" onsubmit="">
            <table class="table">
               <colgroup>
                  <col width="35%"/>
                  <col width="15%"/>
                  <col width="15%"/>
                  <col width="15%"/>
               </colgroup>
               <tr>
               	<th style="font-size: 1.5em;">- 수강정보입력</th>
               </tr>
               <tr>
                  <td>강의일자 : <input type="date" name="acaStartDate"/>~<input type="date" name="acaEndDate"/></td>
                  <td>강의명 : <input type="text" name="acaClassName" /></td>
                  <td>강사명: <input type="text" name="teaName" /></td>
                  <td rowspan="2" style="text-align: center;vertical-align: middle">
                  <button type="button" class="btn btn-primary" id="timeTab" onclick="classRegiValidate(this);">등록</button> </td>
               </tr>
               <tr>
                  <td>강의시간 : <br /> <input type="time" name="acaStartTime" /> ~ <input type="time" name="acaEndTime" /></td>
                  <td>수강료 : <input type="number" name="" /></td>
                  <td>수강인원 : <input type="number" name="NumberOfParticipants"/></td>
               </tr>
               </table>
               <p align="right"><button type="submit" class="btn btn-success" style="font-size: 1em;">확인</button></p>
            </form>
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
  <script src="/FinallyProject/resources/js/academyRigstEdit.js"></script>
</body>

</html>
