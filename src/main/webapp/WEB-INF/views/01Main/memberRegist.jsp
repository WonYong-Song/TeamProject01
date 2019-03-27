<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
  /* Remove the navbar's default margin-bottom and rounded borders */ 
  .navbar {
    margin-bottom: 0;
    border-radius: 0;
	  height:auto;
  }
  
  /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
  .row.content {height: 450px}
  
  /* Set gray background color and 100% height */
  .sidenav {
    padding-top: 20px;
    background-color: #f1f1f1;
    height: 100%;
  }
  #myNavbar2{
  	margin-top: 45px;
  }
  #myNavbar3{
  	text-align: center;
  }
  
  /* Set black background color, white text and some padding */
  footer {
    background-color: #555;
    color: white;
    padding: 15px;
  }
  
  /* On small screens, set height to 'auto' for sidenav and grid */
  @media screen and (max-width: 767px) {
    .sidenav {
      height: auto;
      padding: 15px;
    }
    .row.content {height:auto;} 
  }
  #title{
	  	vertical-align: middle;
	  	/* border: 1px solid white; */
		margin-left: 50px;
	
  }
  #logo{
  	  vertical-align:bottom;
	   margin-left: 750px;
  }
  .nav{
  /* 	border: 1px solid white; */
  }
  #menu{
  	align:center;
  	vertical-align: center;
  	margin-right: 0px;


  }
  #menu ul{
  	margin-right: 30px;
  }
  #join li{
  	font-size: 0.8em;

  }
  #join {

  	margin-right: 10px;
  }
  div{
  /* 	border: 1px solid white; */
  }
  .navbar-brand{
 	 vertical-align: middle;
  }
  
  
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
  .menu:hover{
  	color:black;
  }
</style>
</head>
<body>


<!-- HEAD -->

<!-- HEAD -->
<!-- SIDE -->
<!-- SIDE -->
<!-- CONTENT -->
<!-- 돌아갈 페이지를 위한 hidden -->
<input type="hidden" name="returnPage" value="<%=request.getParameter("returnPage")%>" />
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 ">

    </div>
    <div class="col-sm-8 text-left" style="margin-top:16px; margin-bottom: 15px"> 
      <!-- <h1>Welcome</h1>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
      <hr>
      <h3>Test</h3>
      <p>Lorem ipsum...</p> -->
     <%--  <%@ include file="../DR_Skin/PhotoSlide.jsp"%> --%>

     <%@ include file="/resources/DR_common/commonRegist.jsp" %>

    </div>
  <!--   <div class="col-sm-2 sidenav">
      <div class="well">
        <p>ADS</p>
      </div>
      <div class="well">
        <p>ADS</p>
      </div>
    </div> -->
  </div>
</div>
<!-- CONTENT -->

<!-- BOTTOM -->
<!-- BOTTOM -->
</div>
</body>
</html>
