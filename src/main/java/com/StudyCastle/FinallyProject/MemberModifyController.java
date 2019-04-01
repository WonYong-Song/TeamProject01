package com.StudyCastle.FinallyProject;

import javax.servlet.http.HttpServletRequest;
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
	
	//회원 수정페이지로 이동
	@RequestMapping("/catle/MemberModifyP.do")
	public String memberModify(HttpSession session,Model model,HttpServletRequest req) {
		//세션 영역에 저장된 아이디 가져오기
		String id = (String)session.getAttribute("USER_ID");
		
		MembersDTO dto = sqlSession.getMapper(impl.MemberModifyImpl.class).loadMemberDate(id);
		
		//일반회원인경우
		model.addAttribute("dto", dto);
		if(dto.getGrade()==1) {
			//리턴페이지를 위한 url 설정 s
			String returnPage1=req.getRequestURI();
			String returnUrl =String.format("%s", returnPage1);
			String returnPage = "/catle/main.do";
			System.out.println("returnPage="+returnPage);
			model.addAttribute("returnPage",returnPage);
			//리턴페이지를 위한 url 설정 e
			return "01Main/MemberModifyP";
		}
		
		//학원회원인경우
		else if(dto.getGrade()==2) {
			//리턴페이지를 위한 url 설정 s
			String returnPage1=req.getRequestURI();
			String returnUrl =String.format("%s", returnPage1);
			String returnPage = "/catle/main.do";
			System.out.println("returnPage="+returnPage);
			model.addAttribute("returnPage",returnPage);
			//리턴페이지를 위한 url 설정 e
			return "01Main/MemberModifyA";
		}
		
		return "";
	}
	
	//일반회원 수정처리
	@RequestMapping("/catle/ModifyPAction.do")
	public String modifyPAction(MembersDTO membersDTO,HttpSession session,Model model,HttpServletRequest req) {
		//리턴페이지를 위한 url 설정 s
		String returnPage1=req.getRequestURI();
		String returnUrl =String.format("%s", returnPage1);
		String returnPage = "/catle/main.do";
		System.out.println("returnPage="+returnPage);
		model.addAttribute("returnPage",returnPage);
		//리턴페이지를 위한 url 설정 e
		int result = sqlSession.getMapper(impl.MemberModifyImpl.class).memberPAction(membersDTO);
		System.out.println("result:"+result);
		return "01Main/ModifyFinish";
	}
	
	//학원회원 수정처리
	@RequestMapping("/catle/ModifyAAction.do")
	public String modifyAAction(MembersDTO membersDTO,HttpSession session,Model model,HttpServletRequest req) {
		
		int result = sqlSession.getMapper(impl.MemberModifyImpl.class).memberAAction(membersDTO);
		System.out.println("result:"+result);
		//리턴페이지를 위한 url 설정 s
		String returnPage1=req.getRequestURI();
		String returnUrl =String.format("%s", returnPage1);
		String returnPage = "/catle/main.do";
		System.out.println("returnPage="+returnPage);
		model.addAttribute("returnPage",returnPage);
		//리턴페이지를 위한 url 설정 e
		return "01Main/ModifyFinish";
	}
}
