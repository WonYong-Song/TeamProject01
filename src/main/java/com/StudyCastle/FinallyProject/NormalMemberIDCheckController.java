package com.StudyCastle.FinallyProject;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import impl.NormalMemberLoginCheckImpl;

@Controller
public class NormalMemberIDCheckController {
	
	@Autowired
	SqlSession sqlSession;
	
	
	@RequestMapping(value="/catle/NormalMemberIdCheck.do",method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> check(HttpServletRequest req){
		
		String user_id = req.getParameter("user_id");
		System.out.println(user_id);
		
		int result = sqlSession.getMapper(NormalMemberLoginCheckImpl.class).loginCheck(user_id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		if(result==0) {
			map.put("msg", "사용중인 아이디가 없습니다.");
		}
		else {
			map.put("msg", "사용중인 아이디가 있습니다.");
		}
		
		System.out.println("map="+map.get("msg"));
		
		return map;
	}
	
}
