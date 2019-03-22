package com.StudyCastle.FinallyProject;

import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dto.MembersDTO;
import impl.AppImpl;

@Controller
public class AppController {

	@Autowired
	private SqlSession sqlSession;
	
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
			System.out.println("여기 들어옴"); 
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
			jsonObject.put("score", s.getScore());
			
			jsonArray.add(jsonObject);
		}
		
		
		return jsonArray;
	}
}
