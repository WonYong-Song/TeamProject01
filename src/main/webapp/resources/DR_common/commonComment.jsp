<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!------ 댓글처리 ---------->
<style>
.user_name{
    font-size:14px;
    font-weight: bold;
}
.comments-list .media{
    border-bottom: 1px dotted #ccc;
}
/* 별점 */
.checked {
  color: orange;
}
</style>
<script>
function Modify(n){
	$.ajax({
		url : "../mybatis/modify.do",
		type : "get",
		data : {
			reviewidx : n
		},
		dataType : "html",
		contentType : "text/html; charset:utf-8",
		success:function(responseData){			
			//alert(responseData);
			$('#editR').html(responseData);
		},
		error:function(errorData){
			alert("오류발생:"+errorData.status+":"
				+errorData.statusText);
		}
	});
}
$(function(){
	

}); 
</script>
<!-- 댓글 삭제를 확인하기위한 스크립트 s -->
<script type="text/javascript">
function deletes(ri,ai){
	if (confirm("정말 삭제하시겠습니까??") == true){    //확인
		location.href="delete.do?idx="+ri+"&acaIdx="+ai;
	}else{   //취소
	    return;
	}

}
</script>
<!-- 댓글 삭제를 확인하기위한 스크립트 e -->
<!-- 좋아요 구현을 위한 스크립트 s -->
<script>
function like_func(m,ri){
	/* var reviewidx = $('#reviewidx').val(); */
	$.ajax({
		url:"../catle/reviewLike.do",
		type:"get",
		cache:false,
		dataType:"json",
		data: {
			reviewidx : ri, group : m
		},
		success:function(data){
			
			var msg ='';
			msg+=data.msg
			location.reload();
		},
		error:function(errorData){
			 location.reload(); 
			 alert("오류발생:"+errorData.status+":"
				+errorData.statusText); 
		}
	});
}
</script>
<!-- 좋아요 구현을 위한 스크립트 e -->
<div class="container" style="padding-left: 30px;padding-top: 20px;padding-bottom: 20px;">
     <div class="row" >
         <div  style="width:1055px;">
           <div class="page-header" style="margin: 30px;">
             <h1> 캐슬링 후기 <small class="pull-right"></small></h1>
             
             <form class="form-inline" style="vertical-align:middle; width:auto;margin-left: 50%;margin-top: 5%" >	
				<input type="hidden" name="acaIdx"value="${dto.idx }">
				<div class="form-group">
					<select name="keyField" class="form-control">			
						<option value="reviewcontents">내용</option>
						<option value="id">작성자ID</option>
						<option value="score">이름</option>
					</select>
				</div>
				<div class="input-group">
					<input type="text" name="keyString"  class="form-control" />
					<div class="input-group-btn">
						<button type="submit" class="btn btn-info" style="height: 20px;margin-top: -1%;padding-top: -20%;border: #CED4DA 1px;background-color: #699F9B" >
						<div style="margin-top: -15%">검색하기</div>
						</button>
					</div>
				</div>

			</form>	
			 <hr />
           </div> 
            <div class="comments-list">
            <!-- 학원 후기 -->
            <c:forEach items="${reviewDTO }" var="row" varStatus="loopStatus">
                <div class="media" style=" padding: 15px 30px 10px 30px;">
                  <a class="media-left" href="#" style="width:80px;height:80px;">
                    <img src="http://lorempixel.com/40/40/people/${loopStatus.index }/" style="width:100%;height:100% ">
                  </a>
                  <input type="hidden" id="reviewidx" value="${row.reviewidx }"/>
                  <div class="media-body text-left" style="width:250px;height:100px;padding-left: 50px;">
                      
                    <h4 class="media-heading user_name">${row.id }
                    <c:choose>
						<c:when test="${row.reviewgroup eq 0 }">
							
						</c:when>
						<c:when test="${row.reviewgroup eq 2 }">

						</c:when>
						<c:otherwise>
							<img style="width:50px;height:50px;" src="../resources/img/heartjpg.jpg" alt="" />
							
						</c:otherwise>
					</c:choose>
                    </h4>
                    ${row.reviewcontents }
                    <div>
                    ${row.starRaiting }
                    
                    </div>좋아요 수${row.countlike }
                    <c:choose>
						<c:when test="${row.reviewgroup eq 0 }">
							<p><small><a onclick="like_func('like','${row.reviewidx }')" class="liketoggle" style="cursor: pointer;color: #839997">좋아요</a></small></p>
						</c:when>
						<c:when test="${row.reviewgroup eq 2 }">
							<p><small style="color: #839997" class="liketoggle">로그인을 하시고 댓글에 좋아요를 눌러주세요!</small></p>
						</c:when>
						<c:otherwise>

							<p><small><a onclick="like_func('likecancel','${row.reviewidx }')" class="liketoggle" style="cursor: pointer;color: #839997">좋아요취소</a></small></p>
						</c:otherwise>
					</c:choose>
					
                    </div>
                   
                  <p class="pull-right" ><small>${row.writetime }&nbsp;</small></p>
                    <div style="vertical-align: bottom;height:20px;" >
                    <c:if test="${row.id eq USER_ID }">
                    <p><small><a  onclick="Modify('${row.reviewidx }');" style="cursor: pointer;color: #839997">&nbsp;수정</a> - <a onclick="deletes('${row.reviewidx }','${row.acaidx}');" style="cursor: pointer;color: #839997">삭제</a></small></p>
                    </c:if>
                    <%-- <p><small><a href="modify.do?idx=${row.reviewidx}&acaIdx=${row.acaidx}">수정</a> - <a href="delete.do?idx=${row.reviewidx}&acaIdx=${row.acaidx}">삭제</a></small></p> --%>
                    </div>
                </div>
               
                
            </c:forEach>
            <!--  -->
            	
             
            </div>
            <div>
            
            </div>   
         </div>
     </div>
 </div>