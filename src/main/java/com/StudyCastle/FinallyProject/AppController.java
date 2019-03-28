package com.StudyCastle.FinallyProject;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.type.IntegerTypeHandler;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonBackReference;

import dto.AcaClassDTO;
import dto.MembersDTO;
import impl.AppImpl;
import mybatis01.AcaTeacherDTO;

@Controller
public class AppController {

	@Autowired
	private SqlSession sqlSession;
	
	
	//학원들의 리스트를 보여주는 맵핑
	@RequestMapping("/catle/AppAcaList.do")
	@ResponseBody
	public JSONArray appList(HttpServletRequest req) {
		//파라미터 받기
		String search_column = req.getParameter("search_column")==null ? "" : req.getParameter("search_column");
		String search_contents = req.getParameter("search_contents")==null ? "" : req.getParameter("search_contents");
		String button_name = req.getParameter("button_name")==null ? "" : req.getParameter("button_name");
		//파라미터 확인
		System.out.println("search_column : "+search_column+", search_contents : "+search_contents+", button_name : "+button_name);
		
		//선택된 컬럼에 따른 쿼리에 넣을 컬럼 넣기
		int column;
		if(search_column.equals("이름")) {
			column = 1;
		}
		else if(search_column.equals("위치")) {
			column = 2;
		}
		else {
			column = 3;
		}
		
		//내보낼 값을 위한 객체
		JSONArray jsonArray = new JSONArray();
		
		
		List<MembersDTO> list = new Vector<MembersDTO>();
		//검색어가 없고 카테고리 선택이 전체인경우
		if(search_contents.equals("")&&button_name.equals("전체")) {
			list = sqlSession.getMapper(AppImpl.class).acalist1();
		}
		//검색어가 없고 카테고리 선택이 전체가 아닌 경우
		else if(search_contents.equals("")&&!button_name.equals("전체")) {
			list = sqlSession.getMapper(AppImpl.class).acalist2(button_name);
		}
		//검색어가 있는 경우
		else {
			//카테고리가 전체인경우
			if(button_name.equals("전체")) {
				switch(column) {
				//컬럼이 이름인경우
				case 1:
					list = sqlSession.getMapper(AppImpl.class).acalist3(search_contents);
					break;
				//컬럼이 위치인경우
				case 2:
					list = sqlSession.getMapper(AppImpl.class).acalist4(search_contents);
					break;
				//컬럼이 이름+위치인경우
				default :
					list = sqlSession.getMapper(AppImpl.class).acalist5(search_contents);
					break;
				}
			}
			//카테고리가 전체가 아닌 경우
			else {
				switch(column) {
				//컬럼이 이름인경우
				case 1:
					list = sqlSession.getMapper(AppImpl.class).acalist6(search_contents,button_name);
					break;
				//컬럼이 위치인경우
				case 2:
					list = sqlSession.getMapper(AppImpl.class).acalist7(search_contents,button_name);
					break;
				//컬럼이 이름+위치인경우
				default :
					list = sqlSession.getMapper(AppImpl.class).acalist8(search_contents,button_name);
					break;
				}
			}
		}
		for(MembersDTO s : list) {
			
			JSONObject jsonObject = new JSONObject();
			
			jsonObject.put("idx", s.getIdx());
			jsonObject.put("acaName", s.getAcaName());
			jsonObject.put("address", s.getAddress());
			jsonObject.put("detailAddress", s.getDetailAddress());
			jsonObject.put("category", s.getCategory());
			jsonObject.put("acaIntroPhoto", s.getAcaIntroPhoto());
			jsonObject.put("acaIntroPhotoUU", s.getAcaIntroPhotoUU());
			jsonObject.put("score", s.getScore());
			
			jsonArray.add(jsonObject);
		}
		System.out.println(jsonArray.toJSONString());
		
		return jsonArray;
	}
	
	
	//학원의 상세정보를 보여주는 매핑
	@RequestMapping("catle/AppAcaDetail.do")
	@ResponseBody
	public JSONObject detailInfo(HttpServletRequest req) {
		JSONObject jsonResult = new JSONObject();
		JSONArray jsonArray1 = new JSONArray();
		JSONArray jsonArray2 = new JSONArray();
		JSONArray jsonArray3 = new JSONArray();
		
		//파라미터 받기
		String idx = (req.getParameter("idx")==null) ? "" : req.getParameter("idx");
		System.out.println(idx);
		
		//맵퍼의 결과를 회신하기위한 리스트객체 생성
		List<MembersDTO> list1 = new Vector<MembersDTO>();
		List<AcaTeacherDTO> list2 = new Vector<AcaTeacherDTO>();
		List<AcaClassDTO> list3 = new Vector<AcaClassDTO>();
		
		//1.학원사진명, 카테테고리, 학원명, 학원전화번호, 학원주소, 학원소개의 정보를 가져옴
		list1 = sqlSession.getMapper(AppImpl.class).detail1(idx);
		for(MembersDTO s : list1) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("acaIntroPhoto", s.getAcaIntroPhoto());
			jsonObject.put("acaIntroPhotoUU", s.getAcaIntroPhotoUU());
			jsonObject.put("category", s.getCategory());
			jsonObject.put("acaName", s.getAcaName());
			jsonObject.put("telephone1", s.getTelephone1());
			jsonObject.put("telephone2", s.getTelephone2());
			jsonObject.put("telephone3", s.getTelephone3());
			jsonObject.put("address", s.getAddress());
			jsonObject.put("detailAddress", s.getDetailAddress());
			jsonObject.put("introduce", s.getIntroduce());
			
			jsonArray1.add(jsonObject);
		}
		jsonResult.put("학원정보", jsonArray1);
		System.out.println("학원정보:" + jsonResult.toJSONString());
		
		
		//2.강사이미지, 강사명, 강사소개, 강의과목의 정보를 가져옴
		list2 = sqlSession.getMapper(AppImpl.class).detail2(idx);
		for(AcaTeacherDTO s : list2) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("teaImage", s.getTeaimage());
			jsonObject.put("teaImageUU", s.getTeaimageuu());
			jsonObject.put("teaName", s.getTeaname());
			jsonObject.put("teaIntro", s.getTeaintro());
			jsonObject.put("subject", s.getSubject());
			jsonArray2.add(jsonObject);
		}
		jsonResult.put("강사정보", jsonArray2);
		System.out.println("강사정보까지 진행후 : " + jsonResult.toJSONString());
		
		
		//3.강의명,강사명,강의기간(시작일~종료일),강의요일,강의시간(시작시간~종료시간),수강인원
		list3 = sqlSession.getMapper(AppImpl.class).detail3(idx);
		for(AcaClassDTO s : list3) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("classTeaName", s.getTeaname());//강사명
			jsonObject.put("startDate", s.getAcastartdate());//강의시작일
			jsonObject.put("endDate", s.getAcaenddate());//강의종료일
			jsonObject.put("day", s.getAcaday());//강의요일
			jsonObject.put("startTime", s.getAcastarttime());//강의시작시간
			jsonObject.put("endTime", s.getAcaendtime());//강의종료시간
			jsonObject.put("className", s.getAcaclassname());//강의명
			jsonObject.put("participants", s.getNumberofparticipants());//강의정원
			jsonObject.put("pay", s.getPay());//수강료
			jsonObject.put("classMembers", s.getClassmembers());//현재수강신청인원
			
			jsonArray3.add(jsonObject);
		}
		jsonResult.put("강의정보", jsonArray3);
		System.out.println("강사정보까지 진행후 : " + jsonResult.toJSONString());
		
		return jsonResult;
	}
	
	@RequestMapping("catle/AppLoginAction.do")
	@ResponseBody
	public JSONObject loginAction1(HttpServletRequest req) {
		JSONObject jsonObject = new JSONObject();
		
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		
		MembersDTO dto = sqlSession.getMapper(AppImpl.class).loginAction(id,pass);
	
		if(dto!=null) {
			jsonObject.put("id", dto.getId());
			jsonObject.put("name", dto.getName());
		}
		
		return jsonObject;
	}
	
	@RequestMapping("catle/AppMyInfo.do")
	@ResponseBody
	public JSONObject myInfo(HttpServletRequest req) {
		JSONObject jsonObject = new JSONObject();
		
		String id = req.getParameter("id");
		
		MembersDTO dto = sqlSession.getMapper(AppImpl.class).myInfo(id);
		if(dto!=null) {
			jsonObject.put("id", dto.getId());
			jsonObject.put("pass", dto.getPass());
			jsonObject.put("emailid", dto.getEmailId());
			jsonObject.put("emaildomain", dto.getEmailDomain());
			jsonObject.put("mobile1", dto.getMobile1());
			jsonObject.put("mobile2", dto.getMobile2());
			jsonObject.put("mobile3", dto.getMobile3());
			jsonObject.put("name", dto.getName());
			jsonObject.put("interest", dto.getInterest());
		
		}
		
		return jsonObject;
	}
	
	@RequestMapping("catle/AppMyInfoModifyAction.do")
	@ResponseBody
	public JSONObject myInfoModifyAction(HttpServletRequest req) {
		String info = req.getParameter("info");
		System.out.println("info : " + info);
		
		int result = 0;
		
		JSONParser parser = new JSONParser();
		Object object1, object2;
		JSONObject jsonObject = null;
		JSONArray jsonArray = null;
		try {
			object1 = parser.parse(info);
			jsonObject = (JSONObject)object1;
			object2 = parser.parse(jsonObject.get("interest").toString());
			jsonArray =  (JSONArray)object2;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println("jsonObject : "+jsonObject.toJSONString()+", jsonArray : "+jsonArray.toJSONString());
		
		
		MembersDTO dto = new MembersDTO();
		//jsonObject파싱
		dto.setId(jsonObject.get("id").toString());
		System.out.println(jsonObject.get("id").toString());
		dto.setPass(jsonObject.get("pass").toString());
		dto.setName(jsonObject.get("name").toString());
		dto.setEmailId(jsonObject.get("emailid").toString());
		dto.setEmailDomain(jsonObject.get("emaildomain").toString());
		dto.setMobile1(jsonObject.get("mobile1").toString());
		dto.setMobile2(jsonObject.get("mobile2").toString());
		dto.setMobile3(jsonObject.get("mobile3").toString());
		String interest = "";
		for(Object obj : jsonArray) {
			interest += ","+obj.toString();
		}
		System.out.println("interest:"+interest.substring(1, interest.length()));
		dto.setInterest(interest.substring(1, interest.length()));
		
		result = sqlSession.getMapper(AppImpl.class).myInfoModifyAction(dto);
		
		JSONObject jsonObject2 = new JSONObject();
		jsonObject2.put("result", result);
		return jsonObject2;
	}
	
	@RequestMapping("catle/AppLoginIDCheck.do")
	@ResponseBody
	public JSONObject loginIDCheck(HttpServletRequest req) {
		JSONObject object = new JSONObject();
		
		String id = req.getParameter("id");
		
		int result = 0;
		result = sqlSession.getMapper(AppImpl.class).idCheck(id);
		
		object.put("result", result);
		System.out.println(result);
		return object;
	}
	
	@RequestMapping("catle/AppMemberJoinAction.do")
	@ResponseBody
	public JSONObject memberJoinAction(HttpServletRequest req) {
		String info = req.getParameter("info");
		System.out.println("info : " + info);
		
		int result = 0;
		
		JSONParser parser = new JSONParser();
		Object object1, object2;
		JSONObject jsonObject = null;
		JSONArray jsonArray = null;
		try {
			object1 = parser.parse(info);
			jsonObject = (JSONObject)object1;
			object2 = parser.parse(jsonObject.get("interest").toString());
			jsonArray =  (JSONArray)object2;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println("jsonObject : "+jsonObject.toJSONString()+", jsonArray : "+jsonArray.toJSONString());
		
		MembersDTO dto = new MembersDTO();
		//jsonObject파싱
		dto.setId(jsonObject.get("id").toString());
		System.out.println(jsonObject.get("id").toString());
		dto.setPass(jsonObject.get("pass").toString());
		dto.setName(jsonObject.get("name").toString());
		dto.setEmailId(jsonObject.get("emailid").toString());
		dto.setEmailDomain(jsonObject.get("emaildomain").toString());
		dto.setMobile1(jsonObject.get("mobile1").toString());
		dto.setMobile2(jsonObject.get("mobile2").toString());
		dto.setMobile3(jsonObject.get("mobile3").toString());
		String interest = "";
		for(Object obj : jsonArray) {
			interest += ","+obj.toString();
		}
		System.out.println("interest:"+interest.substring(1, interest.length()));
		dto.setInterest(interest.substring(1, interest.length()));
		
		
		result = sqlSession.getMapper(AppImpl.class).memberjoin(dto);
		
		
		JSONObject jsonObject2 = new JSONObject();
		jsonObject2.put("result", result);
		return jsonObject2;
	}
}
