package com.StudyCastle.FinallyProject;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dto.MembersDTO;

@Controller
public class MemberModifyController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/catle/MemberModifyP.do")
	public String memberModify(HttpSession session,Model model) {
		//세션 영역에 저장된 아이디 가져오기
		String id = (String)session.getAttribute("USER_ID");
		
		MembersDTO dto = sqlSession.getMapper(impl.MemberModifyImpl.class).memberModify(id);
		
		model.addAttribute("dto", dto);
		
		return "01Main/MemberModifyP";
	}
}
