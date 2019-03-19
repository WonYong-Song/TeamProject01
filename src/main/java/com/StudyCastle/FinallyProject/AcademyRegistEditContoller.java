package com.StudyCastle.FinallyProject;

import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dto.AcaClassDTO;
import dto.AcaInfoRegiEditDTO;
import dto.CategoryDTO;
import impl.AcademyInfoImpl;
import impl.AcademyInfoRegiEditImpl;
import mybatis01.AcaTeacherDTO;

@Controller
public class AcademyRegistEditContoller {
	
	@Autowired
	private SqlSession sqlSession;
	
	//학원등록 및 수정페이지 바로가기
	@RequestMapping("/catle/acaInfoRegiEdit.do")
	public String acaInfoRegiEdit(Model model, HttpSession session, HttpServletRequest req) throws UnsupportedEncodingException {
		
		//학원정보 불러오기
		String id = (String) session.getAttribute("USER_ID");
		AcaInfoRegiEditDTO acaRegiEditDTO = sqlSession.getMapper(AcademyInfoRegiEditImpl.class).AcaInfoLoad(id);
		model.addAttribute("RegiEditdto", acaRegiEditDTO);
		
		//카테고리 정보 불러오기
		ArrayList<CategoryDTO> categoryDTO = sqlSession.getMapper(AcademyInfoRegiEditImpl.class).categorySelect();
		model.addAttribute("categorytList",categoryDTO);
		
		
		//등록된 강사 정보 불러오기
		ArrayList<AcaTeacherDTO> tealists = sqlSession.getMapper(AcademyInfoRegiEditImpl.class).TeacherList(id);
		model.addAttribute("tealists",tealists);
		
		/*//등록된 강의 정보 불러오기
		String teaIdx = req.getParameter("TeaIdx");
		ArrayList<AcaClassDTO> classlists = sqlSession.getMapper(AcademyInfoRegiEditImpl.class).ClassList(teaIdx);
		model.addAttribute("classlists",classlists);*/
		
		return "01Main/acaInfoRegiEdit";
		
	}
	
	@RequestMapping("/catle/AcaInfoUpdate.do")
	public String AcaInfoUpdate(Model model, HttpSession session, HttpServletRequest req) throws UnsupportedEncodingException {
		
		String id = (String) session.getAttribute("USER_ID");
		
		//학원정보 업데이트
		req.setCharacterEncoding("UTF-8");
		String telephone1 = req.getParameter("telephone1");
		String address = req.getParameter("address");
		String detailaddress = req.getParameter("detailaddress");
		String acaname = req.getParameter("acaname");
		String telephone2 = req.getParameter("telephone2");
		String telephone3 = req.getParameter("telephone3");
		String introduce = req.getParameter("introduce");
		String category = req.getParameter("category");
		String acaIntroPhoto = req.getParameter("acaIntroPhoto");
		
		System.out.println("acaIntroPhoto"+acaIntroPhoto);
		System.out.println("telephone1"+telephone2);
		System.out.println("introduce"+introduce);
		System.out.println("id"+id);
		
		sqlSession.getMapper(AcademyInfoRegiEditImpl.class).AcaInfoRegiEdit(address,detailaddress,acaname,telephone1,telephone2,telephone3,id);
		sqlSession.getMapper(AcademyInfoRegiEditImpl.class).AcaInfoRegiEdit2(introduce,category,acaIntroPhoto,id);
		
		
		
		return "redirect:acaInfoRegiEdit.do"; 
	}
	
	@RequestMapping("/catle/teaInfoInsert.do")
	public String teaInfoInsert(Model model, HttpSession session, HttpServletRequest req) {
		
		String subject = req.getParameter("subject");
		String teaimage = req.getParameter("teaimage");
		String teaintro = req.getParameter("teaintro");
		String teaname = req.getParameter("teaname");
		sqlSession.getMapper(AcademyInfoRegiEditImpl.class).TeacherRegi(subject, teaimage, teaintro,teaname);
		
		return "redirect:acaInfoRegiEdit.do";
	}
	
	/*@RequestMapping("/catle/classInfoInsert.do")
	public String classInfoInsert(Model model, HttpSession session, HttpServletRequest req) {
		int teaIdx= Integer.parseInt("teaIdx");
		
		DateFormat d = new SimpleDateFormat("yy/MM/dd");
		DateFormat t = new SimpleDateFormat("hh:mm");
		
		String acaStartDate = d.format("acaStartDate");
		String acaEndDate = d.format("acaEndDate");
		String acaDay = req.getParameter("acaDay");
		String acaStartTime = t.format("acaStartTime");
		String acaEndTime =  t.format("acaEndTime");
		String acaClassName = req.getParameter("acaClassName");
		int NumberOfParticipants = Integer.parseInt("NumberOfParticipants");
		String subject = req.getParameter("subject");
		String teaimage = req.getParameter("teaimage");
		String teaintro = req.getParameter("teaintro");
		String teaname = req.getParameter("teaname");
		sqlSession.getMapper(AcademyInfoRegiEditImpl.class).ClassRegi(acaStartDate,acaEndDate,
																acaDay,acaStartTime,acaEndTime,acaClassName,
																NumberOfParticipants,subject,teaimage,teaintro,teaname);
		
		return "redirect:acaInfoRegiEdit.do";
	}*/
	
}
