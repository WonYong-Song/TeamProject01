package com.StudyCastle.FinallyProject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dto.AcaInfoRegiEditDTO;
import impl.AcademyInfoImpl;
import impl.AcademyInfoRegiEditImpl;
import mybatis01.AcaTeacherDTO;

@Controller
public class AcademyRegistEditContoller {
	
	@Autowired
	SqlSession sqlSession;
	
	//학원등록 및 수정페이지 바로가기
	@RequestMapping("/catle/acaInfoRegiEdit.do")
	public String acaInfoRegiEdit(Model model, HttpSession session, HttpServletRequest req, AcaInfoRegiEditDTO acaInfoRegiEditDTO, AcaTeacherDTO teaDTO) {
		String Idx = req.getParameter("Idx");
		AcaInfoRegiEditDTO acaRegiEditDTO = sqlSession.getMapper(AcademyInfoRegiEditImpl.class).AcaInfoLoad(Idx);
		model.addAttribute("RegiEditdto", acaRegiEditDTO);
		
		String id = req.getParameter("id");
		sqlSession.getMapper(AcademyInfoRegiEditImpl.class).AcaInfoRegiEdit(acaInfoRegiEditDTO,id);
		sqlSession.getMapper(AcademyInfoRegiEditImpl.class).AcaInfoRegiEdit2(acaInfoRegiEditDTO,id);
		sqlSession.getMapper(AcademyInfoRegiEditImpl.class).TeacherRegi(teaDTO,id);
		
		return "01Main/acaInfoRegiEdit";
		
	}

}
