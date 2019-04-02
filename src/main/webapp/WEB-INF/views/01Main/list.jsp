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
/* 별점 */
.checked {
  color: orange;
}

</style>

<body id="page-top">
 <!-- Nav Bar -->
 <%@ include file="/../resources/DR_common/commonNavTop.jsp" %>
 <!-- Nav Bar -->
  <!-- Signup Section -->
  <section id="signup" class="signup-section" style="height:300px;">
    <div class="container">
      <div class="row" >
        <div class="col-md-12 col-lg-10 mx-auto text-center" style="margin-top: -5%;">

          <i class="far fa-paper-plane fa-2x mb-2 text-white"></i>
          <h2 class="text-white mb-5">'변화는 모든 배움의 마지막 결과이다.'</h2>
			
          <form class="form-inline d-flex" >
			<div style="width:1000px;">
			<select name="keyField" class="form-control" style="height:59px;padding-right: 10px;">
				<option value="address">캐슬 위치</option>
				<option value="acaname" >캐슬 이름</option>
				<!-- <option value="contents">이름+위치</option> -->
			</select>
			<input type="hidden" value="${cateB }" name="cateB"/>
            <input type="text" name="keyString"  class="form-control" placeholder="캐슬정보를 입력해주세요"  
            	style="width:400px;"/>
            <button type="submit" class="btn btn-primary mx-auto">캐슬찾기</button>
            </div>
          </form>

        </div>
      </div>
    </div>
  </section>
<!-- 
	<i class="fas fa-envelope text-primary mb-2"></i>  이메일 아이콘
    <i class="fas fa-map-marked-alt text-primary mb-2"></i> 주소 아이콘
	<hr class="my-4">  하단 바 
	  <h4 class="text-uppercase m-0">학원 주소</h4> 카테고리
             
      <div class="small text-black-50">4923 Market Street, Orlando FL</div>
-->
	 
  <!-- Contact Section -->
  <c:forEach items="${acaList }" var="row">
  <section class="contact-section bg-black">
    <div class="container">
      <div class="row">
        <div class="col-md-10 col-lg-10 mx-auto text-center" style="margin-bottom: -45px;">
         <a href="academyInfo.do?acaIdx=${row.idx }",target="_blank" >
          <div class="card py-4 h-60" style="width:900px;height:auto;">
          	<div style="padding: 0px 6px 0px 6px">
             <table class="table table-bordered " style="margin-top: -2%; border-top: none;">
             <colgroup>
					<col width="120px"/>
					<col width="60px"/>
					<col width="100px"/>
					<col width="60px"/>
					<col width="120px"/>
			</colgroup>
             <tr>
             	<td rowspan="3" style="padding: 3px;height:150px;wieth:200px; border: 2px solid red;">
            		<c:choose>
						<c:when test="${not empty row.acaintrophotouu }">
							<img src="../resources/acaUpload/${row.acaintrophotouu }" style="width:100%;height:auto%;border-radius:5px; border: 2px solid blue;"alt="엑스박스" />
						</c:when>
						<c:when test="${empty row.acaintrophotouu and row.category eq '입시' }">
							<img src="../resources/img/입시.jpg" style="width:100%;height:113%;border-radius:5px;"alt="엑스박스" />
						</c:when>
						<c:when test="${empty row.acaintrophotouu and row.category eq '예체능' }">
							<img src="../resources/img/예체능.jpg" style="width:100%;height:113%;border-radius:5px;  "alt="엑스박스" />
						</c:when>
						<c:otherwise>
							<img src="../resources/img/직업교육.jpg" style="width:100%;height:113%;border-radius:5px;"alt="엑스박스" />
						</c:otherwise>
					</c:choose>
             	</td>
             	<td>분류</td>
             	<td colspan="3" style="text-align: left">전체>학원>${cateB }</td>
             </tr>
             <tr>
             	<td>캐슬 이름</td>
             	<td style="text-align: left">${row.acaname }</td>
             	<td>캐슬 평점</td>
             		<c:choose>
						<c:when test="${not empty row.ratingStar }">
							<td class="text-center" style="text-align:center;vertical-align: middle;">${row.ratingStar }&nbsp;&nbsp;<span style="color: #FFA500;">${row.avg }/5.0</span></td>
						</c:when>
						<c:otherwise>
							<td><span style="color: #315684">평점이 없습니다</sapn></td>
						</c:otherwise>
					</c:choose>
             		<!-- <span class="fa fa-star checked" ></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star checked"></span>
					<span class="fa fa-star"></span>
					<span class="fa fa-star"></span> -->
             </tr>
             <tr>
             	<td>캐슬 주소</td>
             	<td colspan="3" style="text-align: left">${row.address }&nbsp;${row.detailaddress }</td>
             </tr>
             </table>
             </div>
           	</div>
          </a>
        </div>
      </div>
    </div>
  </section>
  
   </c:forEach>
	<section class="contact-section bg-black">
    <div class="container">
      <div class="row">
			<ul class="pagination" style="margin-left: 49%">
				${pagingImg }
			</ul>
      </div>
    </div>
   </section>
  <!-- Footer -->
 
  <footer class="bg-black small text-center text-white-50">
    <%@ include file="/../resources/DR_common/commonBottom.jsp" %>
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
