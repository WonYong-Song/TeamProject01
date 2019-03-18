package com.StudyCastle.FinallyProject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import impl.AcademyInfoImpl;
import mybatis01.AcademyMemberDTO;

@Controller
public class AcademyRegistEdit {
	
	@Autowired
	SqlSession sqlSession;
	
	//학원등록 및 수정페이지 바로가기
	@RequestMapping("/catle/acaInfoRegiEdit.do")
	public String acaInfoRegiEdit(Model model, HttpSession session, HttpServletRequest req) {
		String acaIdx = req.getParameter("acaIdx");
		AcademyMemberDTO acaMemberDTO = sqlSession.getMapper(AcademyInfoImpl.class).AcaInfo(acaIdx);
		model.addAttribute("dto", acaMemberDTO);
		
		
		
		return "01Main/acaInfoRegiEdit";
	}
	
}
