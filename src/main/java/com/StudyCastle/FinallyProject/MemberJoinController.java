package com.StudyCastle.FinallyProject;

import java.io.UnsupportedEncodingException;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dto.MembersDTO;
import impl.MemberJoinImpl;

@Controller
public class MemberJoinController {

	@Autowired
	private SqlSession sqlSession;
	
	//회원가입 분류 학원/개인 페이지 처리
	@RequestMapping("/catle/regist.do")
	public ModelAndView registStep2(HttpServletRequest req,Model model) {
		String group = req.getParameter("registGroup");
		ModelAndView mv = new ModelAndView(); 
		//리턴페이지를 위한 url 설정 s
		String returnPage1=req.getRequestURI();
		String returnUrl =String.format("%s", returnPage1);
		String returnPage = "/catle/main.do";
		System.out.println("returnPage="+returnPage);
		model.addAttribute("returnPage",returnPage);
		//리턴페이지를 위한 url 설정 e
		if(group.equals("A"))
			mv.setViewName("01Main/ServiceTerm");
		
		else {
			mv.setViewName("01Main/registP");
		}
		return mv;
	}
	
	
	//회원가입 처리 
	@RequestMapping("/catle/registAction.do")
	public String registAction() {
		
		return "01Main/RegistAction";
	}
	
	
	//회원가입 분류 학원/개인 페이지이동
	@RequestMapping("/catle/registGroup.do")
	public String registGroup(Model model,HttpServletRequest req) { 
		//리턴페이지를 위한 url 설정 s
		String returnPage1=req.getRequestURI();
		String returnUrl =String.format("%s", returnPage1);
		String returnPage = returnUrl.substring(15);
		System.out.println("returnPage="+returnPage);
		model.addAttribute("returnPage",returnPage);
		//리턴페이지를 위한 url 설정 e
		return "01Main/registGroup";
	}
	
	//일반회원 가입 완료 처리
	@RequestMapping("/catle/registFinish.do")
	public String registFinish(MembersDTO dto, HttpServletRequest req) {
		
		sqlSession.getMapper(MemberJoinImpl.class).normalmemberjoin(dto); 
		
		return "01Main/registFinish";
	}
	
	//학원회원가입창 띄우기
	@RequestMapping("/catle/registA.do")
	public String registA() {
	
	return "01Main/registA";
	}
	
	//학원회원 가입 완료 처리
	@RequestMapping("/catle/acaregistFinish.do")
	public String acaregistFinish(MembersDTO dto) {
		
		sqlSession.getMapper(MemberJoinImpl.class).acamemberjoin(dto); 
		sqlSession.getMapper(MemberJoinImpl.class).introset(dto.getId()); 
		
		return "01Main/registFinish";
	}
}
