<%@page import="dto.MembersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="helloCastle.do">Study Castle</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="main.do" style="cursor: pointer;font-size:1.22em;">메인으로</a>
          </li>
  
<% if(session.getAttribute("USER_ID")==null){ %> 
      <!-- 로그인전 -->
          <li class="nav-item">
           <a class="nav-link js-scroll-trigger"  href="Login.do" style="cursor: pointer;font-size:1.22em;">로그인</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="registGroup.do" style="cursor: pointer;font-size:1.22em;">회원가입</a>
          </li>

<% }else if(Integer.parseInt(session.getAttribute("GRADE").toString())==2){ %>
<%-- <%} else if(session.getAttribute("USER_ID")==null){ %> --%> 
      <!--기업 회원 로그인후 -->
      	 <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="MemberModifyP.do" style="cursor: pointer;font-size:1.22em;">학원기본정보 수정</a>
         </li>
         <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="acaInfoRegiEdit.do" style="cursor: pointer;font-size:1.22em;">학원부가정보 등록 및 수정</a>
         </li>
         <li class="nav-item">
            <p  class="nav-link js-scroll-trigger" style="cursor: pointer;font-size:1.22em;"><%=session.getAttribute("USER_ID")%>님</p>
         </li>
         
         <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="Logout.do" style="cursor: pointer;font-size:1.22em;">로그아웃</a>
         </li>
<% }else { %>
      <!--개인 회원 로그인후 -->
      <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="MemberModifyP.do" style="cursor: pointer;font-size:1.22em;">회원정보수정</a>
          </li>
           <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="memberMyPage.do" style="cursor: pointer;font-size:1.22em;">마이페이지</a>
          </li>
          <li class="nav-item">
            <p  class="nav-link js-scroll-trigger" style="cursor: pointer;font-size:1.22em;"><%=session.getAttribute("USER_ID")%>님</p>
         </li>
         
         <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="Logout.do" style="cursor: pointer;font-size:1.22em;">로그아웃</a>
          </li>
<% } %>         
          
        </ul>
    </div>
    </div>
  </nav>
