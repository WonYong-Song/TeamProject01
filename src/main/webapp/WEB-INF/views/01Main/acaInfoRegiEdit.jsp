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
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.1/jquery.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
    #vtab {
        margin: auto;
        width: 100%;
    }
    #vtab > ul > li {
    	font-size : 20px;
    	padding-top : 25px; 
        width: 150px;
        height: 80px;
        list-style-type: none;
        display: block;
        text-align: center;
        border: 1px solid #fff;
        position: relative;
        border-right: none;
        opacity: .3;
        -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=30)";
        filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=30);
    }
    #vtab > ul > li.selected {
        opacity: 1;
        -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=100)";
        filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=100);
        border: 1px solid #ddd;
        border-right: none;
        z-index: 10;
        background-color: #EEEEEE !important;
        position: relative;
    }
    #vtab > ul {
        float: left;
        width: 110px;
        text-align: left;
        display: block;
        margin: auto 0;
        padding: 0;
        position: relative;
    }
    #vtab > div {
        margin-left: 150px;
        border: 1px solid #ddd;
        height: 100%;         
        padding: 12px;
        position: relative;
        z-index: 9;
        -moz-border-radius: 20px;
    }
</style>  
<script>
$(function() {
     var $items = $('#vtab>ul>li');
     $items.click (function() {
         $items.removeClass('selected');
         $(this).addClass('selected');

         var index = $items.index($(this));
         $('#vtab>div').hide().eq(index).show();
     }).eq(0).click ();
 });
$(function(){
	$('#telephone').keyup(function(){
		$('#telephone').val($('#telephone').val().replace(/ /g, ''));
	});
	$('#telephone2').keyup(function(){
		$('#telephone2').val($('#telephone2').val().replace(/ /g, ''));
	});
	$('#telephone3').keyup(function(){
		$('#telephone3').val($('#telephone3').val().replace(/ /g, ''));
	});
});
</script>
<script>
//공백제거
function trimAll(str) {
	   a = str.value;
	   for (; a.indexOf(" ") != -1 ;){
	      a = a.replace(" ","")
	   }
	   str.value = a;
	}
	
function introValidate(f) {
	
	var acaForm = f.telephone1;
	var acaForm2 = f.telephone2;
	var acaForm3 = f.telephone3;
	
	trimAll(acaForm);
	trimAll(acaForm2);
	trimAll(acaForm3);
	
	if(f.acaname.value==""){
		alert("학원이름을 입력해주세요");
		f.acaname.focus();
		return false;
	}
	if(f.address.value==""){
		alert("학원주소를 입력해주세요");
		f.address.focus();
		return false;
	}
	if(f.detailaddress.value==""){
		alert("학원상세주소를 입력해주세요");
		f.detailaddress.focus();
		return false;
	}
	if(acaForm.value==""){
		alert("대표전화번호를 입력해주세요");
		f.telephone1.focus();
		return false;
	}
	if(acaForm2.value==""){
		alert("대표전화번호를 입력해주세요");
		f.telephone2.focus();
		return false;
	}
	if(acaForm3.value==""){
		alert("대표전화번호를 입력해주세요");
		f.telephone3.focus();
		return false;
	}
	if(f.categoryBox.value=""){
		alert("학원분류를 입력해주세요");
		return false;
	}
	
	if(f.introduce.value.length==0){
		alert("학원소개를 입력해주세요");
		f.introduce.focus();
		return false;
	}
	
}
function teaRegiValidate(f) {
	 
	var fileCheck = document.getElementById("teaimage").value;
	 
	if(!fileCheck){
		alert("강사사진을 첨부해 주세요");
		return false;
	}	
	if(f.teaName.value==""){
		alert("강사이름을 입력해주세요");
		f.teaName.focus();
		return false;
	}
	if(f.teaInfo.value.length==0){
		alert("강사 소개를 입력해주세요");
		f.teaInfo.focus();
		return false;
	}
	if(f.subject.value==""){
		alert("강사담당 과목을 입력해주세요");
		f.subject.focus();
		return false;
	}

}
function classRegiValidate(f) {
	if(f.acaStartdate.value==""){
		alert("강의시작일자를 입력해주세요");
		return false;
	}
	if(f.acaEnddate.value==""){
		alert("강의종료일자를 등록해주세요");
		return false;
	}
	if(f.acaStartTime.value==""){
		alert("강의시작시간을 입력해주세요");
		return false;
	}
	if(f.acaEnddate.value==""){
		alert("강의종료시간을 등록해주세요");
		return false;
	}
	if(f.acaDay.value==""){
		alert("강의요일을 입력해주세요");
		f.acaDay.focus();
		return false;
	}
	if(f.acaClassName.value==""){
		alert("강의명을 입력해주세요");
		f.acaClassName.focus();
		return false;
	}
	if(f.teaName.value==""){
		alert("강사명을 입력해주세요");
		f.teaInfo.focus();
		return false;
	}
	if(f.subject.value==""){
		alert("강사담당 과목을 입력해주세요");
		f.subject.focus();
		return false;
	}
	if(f.pay.value==""){
		alert("수강료를 입력해주세요");
		f.pay.focus();
		return false;
	}
	if(f.NumberOfParticipants.value==""){
		alert("수강인원을 입력해주세요");
		f.NumberOfParticipants.focus();
		return false;
	}
}
</script>
</head>

<body id="page-top">
 <!-- Nav Bar -->
 <%@ include file="/../resources/DR_common/commonNavTop.jsp" %>
 <!-- Nav Bar -->
 <section class="signup-section">
    <div class="container" id="vtab" >
        <ul>
            <li class="selected">학원소개</li>
            <li>강사진</li>
            <li>강의 및 시간표</li>
        </ul>
    
        <!-- 학원소개 등록  -->  
       	<div style="border-color: #EEEEEE; background-color: #EEEEEE;">
		<!-- 학원사진등록  -->
		<form name="fileFrm" method="post" action="AcaInfoUpdate.do" enctype="multipart/form-data"  onsubmit="return introValidate(this)">
			<input type="hid den" name="id" value="${RegiEditdto.id }" />
			<table class="table" style="width:100%; background-color: #EEEEEE;" id="example">
			<thead>
				<tr> 
					<th colspan="4" style="font-size: 1.5em;"> - 학원사진등록 </th>
				</tr>
			</thead>	
			<tbody>
				<tr>
					<th>학원사진</th>
					<td>
						<input type="file" name="acaIntroPhoto" value="${RegiEditdto.acaIntroPhoto }" multiple="multiple"/>
					</td>
				</tr>
			</tbody>	
			</table>

			<!-- 학원 간략 프로필 등록  -->
			<table class="table" style="width:100%; background-color: #EEEEEE;">
				<tr><th colspan="4" style="font-size: 1.5em;"> - 학원프로필(간략) </th></tr>
				<tr style="padding: 10px;">
					<th>학원명:</th>
					<td>
						<input type="text" name="acaname" placeholder="학원이름" value="${RegiEditdto.acaname }"/>
					</td>
				</tr> 
				<tr>
					<th>주소</th>
					<td>
						<input type="text" name="address" placeholder="기본주소(동, 읍, 리)" style="width: 200px;" value="${RegiEditdto.address }"/>
						<input type="text" name="detailaddress" placeholder="상세주소(도로명, 건물번호 등)" style="width: 400px;" value="${RegiEditdto.detailaddress }"/>
						</td>
					</tr>
					<tr>
						<th>대표번호</th>
						<td>
							<input type="text" name="telephone1"  id="telephone" value="${RegiEditdto.telephone1 }"/>
							<input type="text" name="telephone2"  id="telephone2" value="${RegiEditdto.telephone2 }"/>
							<input type="text" name="telephone3"  id="telephone3" value="${RegiEditdto.telephone3 }"/>
						</td>
					</tr>
					<tr>
						<th>학원분류</th>
						<td >
							<c:if test="${!empty categorytList}">
							  <select id="categoryBox" style="width:80px;" onchange="document.getElementById('category').value= this.options[this.selectedIndex].value">					
							     <c:forEach var="categorytList" items="${categorytList }" >			
							        <option value="${categorytList.maincategory  }">${categorytList.maincategory }</option>
							     </c:forEach>
							  </select>
							</c:if>
							<input type="text" name="category" id="category" value="${RegiEditdto.category }" readonly="readonly"  />
						</td>
					</tr>
				</table>
				
				<table class="table table-bordered" style="width:100%; background-color: #EEEEEE;">
				<tr><th style="font-size: 1.5em;"> - 학원소개 </th></tr>
				<tr style="padding: 10px;">
					<td>
						<textarea name="introduce" cols="30" rows="10" style="width: 100%;">${RegiEditdto.introduce }</textarea>
						</td>
					</tr>
			</table>
				 <p style="text-align: right"><button type="submit" >확인</button></p>
		</form>
   		</div >
   		
        <!-- 강사진 수정  -->
		<div style="border-color: #EEEEEE; background-color: #EEEEEE;" class="div2" align="center">
			<table class="table" style="max-width: 600px; background-color: #ffffff;">
			<colgroup>
				<col width="20%;"/>
				<col width="30%;"/>
				<col width="30%;"/>
			</colgroup>
				
			<thead>
				<tr class="success">
					<th class="text-center">번호</th>
					<th class="text-center">강사명</th>
					<th class="text-center">강의과목</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${empty tealists }">
					<tr>
						<td colspan="4" class="text-center" >
							등록된 강사가 없습니다.
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${tealists }" var="row" varStatus="loop">
						<tr>
							<td class="text-center">
								${loop.index+1 }					
							</td>
							<td class="text-center">
								<a href="./02sub/teacherEdit.do?teaidx=${row.teaidx }" 
								onClick="window.open(this.href, '', 'width=400, height=430'); return false;">${row.teaname } </a>
							</td>
							<td class="text-center">${row.subject }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			</tbody>	
			</table>		
			<!-- 강사정보추가  -->
			<form name="teachFrm" action="teaInfoInsert.do" method="post" enctype="multipart/form-data" onsubmit="return teaRegiValidate(this)">
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
        
        <!-- 강의 및 시간표 등록  -->
   		<div style=" border-color: #EEEEEE; background-color: #EEEEEE;">
       		<table class="table" style="width: 100%; background-color: #ffffff;">
		        <colgroup>
					<col width="10%"/>
					<col width="30%"/>
					<col width="25%"/>
					<col width="25%"/>
					<col width="10%"/>
				</colgroup>
					
				<thead>
					<tr class="success">
						<th class="text-center">번호</th>
						<th class="text-left">강의명</th>
						<th class="text-center">강사명</th>
						<th class="text-center">강의일자</th>
						<th class="text-center">인원</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${empty classlists }">
						<tr>
							<td colspan="7" class="text-center">
								등록된 시간표가 없습니다.
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${classlists }" var="row" varStatus="loop">
							<tr>
								<td class="text-center">
									${loop.index+1 }					
								</td>
								<td class="text-center">
									<a href="./02acaRegiForm/classInfoView.do?teaidx=${row.teaidx }" 
									onClick="window.open(this.href, '', 'width=400, height=430'); return false;">${row.acaclassname } </a>
								</td>
								<td class="text-center">${row.teaname }</td>
								<td class="text-center">${row.acastartdate } ~ ${row.acaenddate }</td>
								<td class="text-center">${row.numberofparticipants }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				</tbody>	
			</table>		
         	<hr />
            <form name="classFrm" action="classInsertAction.do" method="post" onsubmit="return classRegiValidate(this)">
          	 <div>
	     		<table class="table" style="width:100%; background-color: #EEEEEE;">
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
	                 <td>강의일자 : <input type="date" name="acastartdate"/>~<input type="date" name="acaenddate"/> <br />
                  강의요일 : 
                  <select name="acaday">
                  	<option value="월요일">월</option>
                  	<option value="화요일">화</option>
                  	<option value="수요일">수</option>
                  	<option value="목요일">목</option>
                  	<option value="금요일">금</option>
                  	<option value="토요일">토</option>
                  	<option value="일요일">일</option>
                  </select>
                  </td>
	                 <td colspan="2">강의명 : <input type="text" name="acaclassname"/><br /><br />강사명: <input type="text" name="teaname" style="width: 100px;"/></td>
	                 <td rowspan="2" style="text-align: center;vertical-align: middle">
	                 <button type="button" id="timeTab" onclick="classRegiValidate(this);">등록</button> </td>
	              </tr>
	              <tr>
	                 <td>강의시간 : <br /> <input type="time" name="acastarttime" /> ~ <input type="time" name="acaendtime" /></td>
	                 <td colspan="2">수강료 : <input type="number" name="pay" style="width: 100px;"/><br /><br />수강인원 : <input type="number" name="numberofparticipants" style="width: 100px;"/></td>
	              </tr>
       			</table>
	           </div>
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
</body>

</html>
