package com.StudyCastle.FinallyProject;

import java.util.List;

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
	SqlSession sqlSession;
	
	@RequestMapping("/catle/AppAcaList.do")
	@ResponseBody
	public JSONArray acaList(HttpServletRequest req) {
		JSONArray jsonArray = new JSONArray();
		
		String search_column = req.getParameter("search_column");
		String column_name = null;
		String search_contents = req.getParameter("search_contents");
		String button_name = req.getParameter("button_name");
		//파라미터 확인
		System.out.println("search_column: "+search_column+", search_contents:"+search_contents+", button_name:"+button_name);
		
		if(search_column.equals("이름")) {
			column_name = "a.acaname";
		}
		else if (search_column.equals("위치")) {
			column_name = "a.address";
		}
		
		List<MembersDTO> list;
		if((search_contents.equals("")||search_contents==null)&&(!button_name.equals("전체"))) {
			//전체 카테고리가 아니고 검색어가 없는 경우
			list = sqlSession.getMapper(AppImpl.class).acaList1(button_name);
		}
		else if ((search_contents.equals("")||search_contents==null)&&(button_name.equals("전체"))) {
			//전체 카테고리이고 검색어가 없는 경우
			list = sqlSession.getMapper(AppImpl.class).acaList2();
		}
		else {
			if((search_column.equals("이름")||search_column.equals("위치"))&&column_name!=null) {
				//전체 카테고리가 아니고 검색어가 있는 경우
				list = sqlSession.getMapper(AppImpl.class).acaList3(column_name,button_name,search_contents);
			}
			else {
				//전체 카테고리가 아니고 검색어가 있으며 스피너가 이름+위치인 경우
				list = sqlSession.getMapper(AppImpl.class).acaList4(button_name,search_contents);
			}
		}
		for(MembersDTO m : list) {
			JSONObject jsonObject = new JSONObject();
		}
		
		return jsonArray;
	}
	
}
