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
<div class="container" style="padding-left: 30px;padding-top: 20px;padding-bottom: 20px;">
     <div class="row" >
         <div  style="width:1055px;">
           <div class="page-header" style="margin: 30px;">
             <h1>캐슬링 후기 <small class="pull-right"></small></h1>
             <hr />
           </div> 
            <div class="comments-list">
            <!-- 학원 후기 -->
            <c:forEach items="${reviewDTO }" var="row" varStatus="loopStatus">
                <div class="media" style=" padding: 15px 30px 10px 30px;">
                  <a class="media-left" href="#" style="width:80px;height:80px;">
                    <img src="http://lorempixel.com/40/40/people/${loopStatus.index }/" style="width:100%;height:100% ">
                  </a>
                  
                  <div class="media-body text-left" style="width:250px;height:100px;padding-left: 50px;">
                      
                    <h4 class="media-heading user_name">${row.id }</h4>
                    ${row.reviewcontents }
                    <div>
                    ${row.starRaiting }
                    
                    </div>
                    <p><small><a href="">Like</a> - <a href="">Share</a></small></p>
                  </div>
                  <p class="pull-right" ><small>${row.writetime }</small></p>
                </div>
            </c:forEach>
            <!--  -->
            	
             
            </div>
            <div>
            
            </div>   
         </div>
     </div>
 </div>