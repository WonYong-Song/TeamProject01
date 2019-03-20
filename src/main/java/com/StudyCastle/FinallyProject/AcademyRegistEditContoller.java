package com.StudyCastle.FinallyProject;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import dto.AcaClassDTO;
import dto.AcaInfoRegiEditDTO;
import dto.CategoryDTO;
import impl.AcademyInfoImpl;
import impl.AcademyInfoRegiEditImpl;
import mybatis01.AcaTeacherDTO;
import mybatis01.ClassInfoDTO;

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
		System.out.println("tealists: "+ tealists);
		
		
		//등록된 강의 정보 불러오기
		ArrayList<AcaClassDTO> classlists = sqlSession.getMapper(AcademyInfoRegiEditImpl.class).ClassList(id);
		model.addAttribute("classlists",classlists);
		System.out.println("classlists: "+ classlists);
		
		return "01Main/acaInfoRegiEdit";
		
	}
	
	@RequestMapping("/catle/AcaInfoUpdate.do")
	public String AcaInfoUpdate(Model model, HttpSession session, HttpServletRequest req, MultipartHttpServletRequest mtfRequest) throws UnsupportedEncodingException {
		
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
		String acaintrophoto = req.getParameter("acaintrophoto");		
        
		System.out.println("acaintrophoto"+acaintrophoto);
		System.out.println("telephone1"+telephone2);
		System.out.println("introduce"+introduce);
		System.out.println("id"+id);
		
		sqlSession.getMapper(AcademyInfoRegiEditImpl.class).AcaInfoRegiEdit(address,detailaddress,acaname,telephone1,telephone2,telephone3,id);
		sqlSession.getMapper(AcademyInfoRegiEditImpl.class).AcaInfoRegiEdit2(introduce,category,acaintrophoto,id);
  
		return "redirect:acaInfoRegiEdit.do"; 
	}
	
	//강사정보 입력
	@RequestMapping("/catle/teaInfoInsert.do")
	public String teaInfoInsert(Model model, HttpSession session, HttpServletRequest req) throws UnsupportedEncodingException {
		
		req.setCharacterEncoding("UTF-8");
		String id = (String) session.getAttribute("USER_ID");
		String teaimage = req.getParameter("teaimage");
		String teaname = req.getParameter("teaname");
		String teaintro = req.getParameter("teaintro");
		String subject = req.getParameter("subject");
		
		sqlSession.getMapper(AcademyInfoRegiEditImpl.class).TeacherRegi(teaimage, teaname, teaintro, subject, id);
		
		return "redirect:acaInfoRegiEdit.do";
	}
	
	//강의정보 입력
	@RequestMapping("/catle/classInfoInsert.do")
	public String classInfoInsert(Model model, HttpSession session, HttpServletRequest req) {
		
		
		
		String teaidx = req.getParameter("teaidx");
		System.out.println(teaidx);
	
		String acastartdate = req.getParameter("acastartdate");
		System.out.println(acastartdate);
		
		String acaenddate = req.getParameter("acaenddate");
		System.out.println(acaenddate);
		
		String acaday = req.getParameter("acaday");
		System.out.println(acaday);
		
		String acastarttime =  req.getParameter("acastarttime");
		System.out.println(acastarttime);
		
		String acaendtime =   req.getParameter("acaendtime");
		System.out.println(acaendtime);
		
		String acaclassname = req.getParameter("acaclassname");
		System.out.println(acaclassname);
		
		String pay = req.getParameter("pay");
		System.out.println(pay);
		
		String numberofparticipants = req.getParameter("numberofparticipants");
		System.out.println(numberofparticipants);
		
		sqlSession.getMapper(AcademyInfoRegiEditImpl.class).ClassRegi(acastartdate,acaenddate,acaday,acastarttime,acaendtime,acaclassname,
																pay, numberofparticipants, teaidx);
		
		return "redirect:acaInfoRegiEdit.do";
	}
	
}
