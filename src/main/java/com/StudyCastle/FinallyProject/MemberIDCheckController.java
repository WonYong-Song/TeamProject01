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

import impl.MemberLoginCheckImpl;

@Controller
public class MemberIDCheckController {
	
	@Autowired
	SqlSession sqlSession;
	
	//일반회원 아이디 중복여부 확인(Ajax사용)
	@RequestMapping(value="/catle/MemberIdCheck.do",method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> memberCheck(HttpServletRequest req){
		
		String id = req.getParameter("id");
		
		int result = sqlSession.getMapper(MemberLoginCheckImpl.class).loginCheck(id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		if(result==0) {
			map.put("msg", "사용중인 아이디가 없습니다.");
		}
		else {
			map.put("msg", "사용중인 아이디가 있습니다.");
		}
		
		return map;
	}
	
}
