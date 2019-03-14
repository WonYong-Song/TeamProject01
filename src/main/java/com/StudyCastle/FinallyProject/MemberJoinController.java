package com.StudyCastle.FinallyProject;

import java.io.UnsupportedEncodingException;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dto.NormalMemberDTO;
import impl.MemberJoinImpl;

@Controller
public class MemberJoinController {

	@Autowired
	private SqlSession sqlSession;
	
	//회원가입 창 바로가기
	@RequestMapping("/catle/regist.do")
	public ModelAndView registStep2(HttpServletRequest req) {
		String group = req.getParameter("registGroup");
		ModelAndView mv = new ModelAndView(); 
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
	
	
	//회원가입 분류 학원/개인
	@RequestMapping("/catle/registGroup.do")
	public String registGroup() {
		
		return "01Main/registGroup";
	}
	
	//회원가입 완료 창 띄우기
	@RequestMapping("/catle/registFinish.do")
	public String registFinish(HttpServletRequest req) {
		
		try {
			req.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String memberId=req.getParameter("user_id");
		String memberPass=req.getParameter("user_pw1");
		String memberName=req.getParameter("user_name");
		String emainId=req.getParameter("email_id");
		String emainDomain=req.getParameter("email_domain");
		String phone1=req.getParameter("mobile1");
		String phone2=req.getParameter("mobile2");
		String phone3=req.getParameter("mobile3");
		String phoneNumber=phone1+phone2+phone3;
		String[] inter=req.getParameterValues("user_brand");
		String interest = Arrays.toString(inter);
		
		NormalMemberDTO dto = new NormalMemberDTO();
		dto.setMemberId(memberId);
		dto.setMemberPass(memberPass);
		dto.setMemberName(memberName);
		dto.setEmainId(emainId);
		dto.setEmainDomain(emainDomain);
		dto.setPhoneNumber(phoneNumber);
		dto.setInterest(interest);
		
		sqlSession.getMapper(MemberJoinImpl.class).normalmemberjoin(dto);
		
		return "01Main/registFinish";
	}
}
