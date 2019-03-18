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
  
/* //사진업로드 버튼 추가 ajax   
$(function(){
 
 var maxAppend = 1; //버튼누른 횟수 저장
    // 사진추가 버튼 클릭시
    $("#addTrBtn").click(function(){
   	 if(maxAppend>=6) return;
        // tr 의 최대번호 구하기
        var lastTrNo = $("#example tr:last").attr("class").replace("imgUp", "");
       var newTr = $("#example tr:eq(1)").clone();
        newTr.removeClass();
        newTr.find("td:eq(0)").attr("rowspan", "1");
        newTr.addClass("imgUp"+(parseInt(lastTrNo)+1));
        $("#example").append(newTr);

        maxAppend++; 
    });
    var maxRemove= 1; //버튼누른 횟수 저장
    $("#trRemove").live("click", function() {
 	   if(maxRemove>=6) return;
  	    $(this).parent().parent().remove();
  	    maxRemove++;
 	  });
}); */
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
		<form name="fileFrm" method="post" action="acaRegistAction.do" enctype="multipart/form-data" >
			<input type="hidden" name="acaIdx" value="${param.acaIdx }" />
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
						<input type="file" name="introPhoto" value="${dto.introPhoto }" multiple="multiple"/>
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
						<input type="text" name="AcaName" placeholder="학원이름" value="${dto.acaName }"/>
					</td>
				</tr> 
				<tr>
					<th>주소</th>
					<td>
						<input type="text" name="AcaAddress" placeholder="기본주소(동, 읍, 리)" style="width: 200px;" value="${dto.acaAddress }"/>
						<input type="text" name="AcaDetailAddress" placeholder="상세주소(도로명, 건물번호 등)" style="width: 400px;" value="${dto.acaDetailAddress }"/>
						</td>
					</tr>
					<tr>
						<th>대표번호</th>
						<td>
							<input type="text" name="AcaHPNumber" placeholder="학원대표전화번호" value="${dto.acaHPNumber }"/>
						</td>
					</tr>
					<tr>
						<th>학원분류</th>
						<td>
							<c:if test="${!empty categorytList}" >
							  <select name="categoryBox" id="categoryBox" style="width:80px;">					
							     <c:forEach var="categorytList" items="${categorytList }" >			
							        <option value="${categorytList.MainCategory  }">${categorytList.MainCategory }</option>
							     </c:forEach>
							  </select>
							</c:if>
						</td>
					</tr>
				</table>
				
				<table class="table table-bordered" style="width:100%; background-color: #EEEEEE;">
				<tr><th style="font-size: 1.5em;"> - 학원소개 </th></tr>
				<tr style="padding: 10px;">
					<td>
						<textarea name="introduce" cols="30" rows="10" style="width: 100%;">${dto.introduce }</textarea>
						</td>
					</tr>
			</table>
				 <p style="text-align: right"><button type="submit" >확인</button></p>
		</form>
   		</div >
        <!-- 강사진 수정  -->
		<div style="border-color: #EEEEEE; background-color: #EEEEEE;">
			<table class="table" style="max-width: 600px; background-color: #ffffff;">
			<colgroup>
				<col width="20%"/>
				<col width="40%"/>
				<col width="40%"/>
			</colgroup>
				
			<thead>
				<tr class="success">
					<th class="text-center">번호</th>
					<th class="text-left">강사명</th>
					<th class="text-center">강의과목</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${empty lists }">
					<tr>
						<td colspan="4" class="text-center">
							등록된 강사가 없습니다.
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${tealists }" var="row" varStatus="loop">
						<tr>
							<td class="text-center">
								${map.totalCount -((map.nowPage-1)*map.pageSize) - loop.index }					
							</td>
							<td class="text-center">
								<a href="./02acaRegiForm/teaInfoView.do?teaidx=${row.teaidx }&nowPage=${param.nowPage }" 
								onClick="window.open(this.href, '', 'width=400, height=430'); return false;">${row.teaName } </a>
							</td>
							<td class="text-center">${row.subject }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			</tbody>	
			</table>		
			<!-- 강사정보추가  -->
			<form name="teachFrm" action="" method="post" enctype="multipart/form-data" onsubmit="teaRegiValidate">
				<div>
					<hr />
					<table class="table" style="width:100%; background-color: #EEEEEE;">
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
					<c:when test="${empty lists }">
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
									${map.totalCount -((map.nowPage-1)*map.pageSize) - loop.index }					
								</td>
								<td class="text-center">
									<a href="./02acaRegiForm/classInfoView.do?teaidx=${row.teaidx }&nowPage=${param.nowPage }" 
									onClick="window.open(this.href, '', 'width=400, height=430'); return false;">${row.acaClassName } </a>
								</td>
								<td class="text-center">${row.teaName }</td>
								<td class="text-center">${row.acaStartDate } ~ ${row.acaEndDate }</td>
								<td class="text-center">${row.acaStartTime } ~ ${row.acaEndTime }</td>
								<td class="text-center">${row.Pay }</td>
								<td class="text-center">${row.NumberOfParticipants }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				</tbody>	
			</table>		
         	<hr />
            <form name="classFrm" action="classActionEdit.do" method="post" onsubmit="">
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
	                 <td>강의일자 : <input type="date" name="acaStartDate"/>~<input type="date" name="acaEndDate"/></td>
	                 <td colspan="2">강의명 : <input type="text" name="acaClassName"/><br /><br />강사명: <input type="text" name="teaName" style="width: 100px;"/></td>
	                 <td rowspan="2" style="text-align: center;vertical-align: middle">
	                 <button type="button" id="timeTab" onclick="classRegiValidate(this);">등록</button> </td>
	              </tr>
	              <tr>
	                 <td>강의시간 : <br /> <input type="time" name="acaStartTime" /> ~ <input type="time" name="acaEndTime" /></td>
	                 <td colspan="2">수강료 : <input type="number" name="classPay" style="width: 100px;"/><br /><br />수강인원 : <input type="number" name="NumberOfParticipants" style="width: 100px;"/></td>
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
  <script src="/FinallyProject/resources/js/academyRigstEdit.js"></script>
</body>

</html>
