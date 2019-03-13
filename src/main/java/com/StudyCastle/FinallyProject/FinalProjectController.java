package com.StudyCastle.FinallyProject;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FinalProjectController {
	//헬로 케슬
	@RequestMapping("/catle/helloCastle.do")
	public String helloCastle() {
		
		return "01Main/helloCastle";
	}
	//케슬 메인
	@RequestMapping("/catle/main.do")
	public String main(HttpServletRequest req, Model model) {
		String num =req.getParameter("param");
		if(req.getParameter("param")==null) {
			System.out.println(num+"여기까지 왔니??");
		}
		
		return "01Main/main";
	}
	//로그인 하기
	@RequestMapping("/catle/Login.do")
	public String Login() {
		
		return "01Main/Login";
	}
	/*//회원가입 타입 구분 바로가기
	@RequestMapping("/catle/regist1.do")
	public String registStep1() {
		
		return "01Main/Regist1";
	}*/
	//회원가입 창 바로가기
	@RequestMapping("/catle/regist.do")
	public ModelAndView registStep2() {
		
		ModelAndView mv = new ModelAndView(); 
		if(mv!=null)
			mv.setViewName("01Main/registA");
		
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
	//리스트로 가기
	@RequestMapping("/catle/list.do")
	public String list() {
		
		return "01Main/list";
	}
	//학원정보 등록 창 바로가기
	@RequestMapping("/catle/updateAcademyInfo.do")
	public String updateAcademyInfo() {
		
		return "01Main/updateAcademyInfo";
	}
	//학원 상세보기 바로가기
	@RequestMapping("/catle/academyInfo.do")
	public String academyInfo() {
		
		return "01Main/AcademyInfo";
	}
	
	//회원가입 분류 학원/개인
	@RequestMapping("/catle/registGroup.do")
	public String registGroup() {
		
		return "01Main/registGroup";
	}
	
	//회원가입 완료 창 띄우기
	@RequestMapping("/catle/registFinish.do")
	public String registFinish() {
	
	return "01Main/registFinish";
	}
}














