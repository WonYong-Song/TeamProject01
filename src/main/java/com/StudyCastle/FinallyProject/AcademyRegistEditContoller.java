package com.StudyCastle.FinallyProject;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dto.AcaClassDTO;
import dto.AcaInfoRegiEditDTO;
import impl.AcademyInfoImpl;
import impl.AcademyInfoRegiEditImpl;
import mybatis01.AcaTeacherDTO;

@Controller
public class AcademyRegistEditContoller {
	
	@Autowired
	private SqlSession sqlSession;
	
	//학원등록 및 수정페이지 바로가기
	@RequestMapping("/catle/acaInfoRegiEdit.do")
	public String acaInfoRegiEdit(Model model, HttpSession session, HttpServletRequest req) {
		
		String id = session.getId();
		AcaInfoRegiEditDTO acaRegiEditDTO = sqlSession.getMapper(AcademyInfoRegiEditImpl.class).AcaInfoLoad(id);
		model.addAttribute("RegiEditdto", acaRegiEditDTO);
		
		
		/*sqlSession.getMapper(AcademyInfoRegiEditImpl.class).AcaInfoRegiEdit(acaRegiEditDTO,id);
		sqlSession.getMapper(AcademyInfoRegiEditImpl.class).AcaInfoRegiEdit2(acaRegiEditDTO,id);*/

		
		
		
		/*ArrayList<AcaTeacherDTO> tealists = sqlSession.getMapper(AcademyInfoRegiEditImpl.class).TeacherList(id);
		model.addAttribute("tealists",tealists);
		sqlSession.getMapper(AcademyInfoRegiEditImpl.class).TeacherRegi2(teaDTO,id);
		
		
		String teaIdx = req.getParameter("TeaIdx");
		ArrayList<AcaClassDTO> classlists = sqlSession.getMapper(AcademyInfoRegiEditImpl.class).ClassList(id);
		model.addAttribute("classlists",classlists);*/
		
		return "01Main/acaInfoRegiEdit";
		
	}

}
