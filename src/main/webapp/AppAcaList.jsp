<%@page import="org.json.simple.JSONObject"%>
<%@page import="dto.MembersDTO"%>
<%@page import="java.util.List"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="App.AppDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%
//한글처리
request.setCharacterEncoding("UTF-8");
//DB연결
String driver = application.getInitParameter("oracle.jdbc.OracleDriver");
String url = application.getInitParameter("jdbc:oracle:thin:@localhost:1521:orcl");
AppDAO dao = new AppDAO(driver,url);
System.out.println(driver);
System.out.println(url);
/*
파라미터가 없는 경우에는 빈값을 저장한다.
*/
/*검색컬럼*/
String search_column = (request.getParameter("search_column")==null) ? "" : request.getParameter("search_column");
/*검색단어*/
String search_contents = (request.getParameter("search_contents")==null) ? "" : request.getParameter("search_contents");
/*카테고리*/
String button_name = (request.getParameter("button_name")==null) ? "" : request.getParameter("button_name");
System.out.println(search_column);
System.out.println(search_contents);
System.out.println(button_name);
JSONArray jsonArray = new JSONArray();
List<MembersDTO> list = dao.acaList(search_column, search_contents, button_name);
for(MembersDTO m : list){
	JSONObject jsonObject = new JSONObject();
	jsonObject.put("acaName", m.getAcaName());
	jsonObject.put("address", m.getAddress());
	jsonObject.put("detailAddress",m.getDetailAddress());
	jsonObject.put("category", m.getCategory());
	jsonObject.put("acaIntroPhoto", m.getAcaIntroPhoto());
	jsonObject.put("score", m.getScore());
	
	jsonArray.add(jsonObject);
}
out.println(jsonArray.toJSONString());
%> --%>