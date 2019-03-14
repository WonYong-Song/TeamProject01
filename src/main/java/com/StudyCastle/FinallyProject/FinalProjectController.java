package com.StudyCastle.FinallyProject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import impl.AcademyInfoImpl;
import impl.AcademyListImpl;
import impl.example;


import mybatis01.AcaTeacherDTO;
import mybatis01.AcademyMemberDTO;
import mybatis01.ParamDTO;
import mybatis01.ReviewWriteDTO;


@Controller
public class FinalProjectController {
	
	@Autowired
	private SqlSession sqlSession;
	
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
	//리스트로 가기
	@RequestMapping("/catle/list.do")
	public String list(Model model,HttpSession session, HttpServletRequest req) {
	
	String cateB = req.getParameter("cateB");
	model.addAttribute("cateB",cateB);
		
		
	/* 학원 평점 들고오기 s	*/
	/*ArrayList<ReviewWriteDTO> reviewList =sqlSession.getMapper(AcademyListImpl.class)getReview();*/
	/* 학원 평점 들고오기 e	*/
	/* 검색처리 s*/ 
	ParamDTO paramDTO = new ParamDTO();
	String addQueryString = "";
	String keyField = req.getParameter("keyField");				
	String keyString = req.getParameter("keyString");
	if(keyString!=null){
		addQueryString = String.format("keyField=%s"
			+"&keyString=%s&", keyField, keyString);

		paramDTO.setKeyField(keyField);
		paramDTO.setKeyString(keyString);
		
	}
	System.out.println("keyField="+keyField);
	System.out.println("keyStrin="+keyString);
	/* 검색처리 e*/ 
	//검색어 처리 
	int totalRecordCount = sqlSession.getMapper(AcademyListImpl.class).getTotalCountSearch(paramDTO);
	//검색어에 따른 레코드 갯수 확인용 
	System.out.println("totalRecordCount="+totalRecordCount);
	
	
	//페이지 처리를 위한 설정값
	int pageSize = 4;
	int blockPage = 2;
	
	//전체페이지수계산하기
	int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);

	//시작 및 끝 rownum 구하기
	int nowPage = req.getParameter("nowPage")==null ? 1 :
		Integer.parseInt(req.getParameter("nowPage"));
	int start = (nowPage-1) * pageSize + 1;
	int end = nowPage * pageSize;

	//검색처리위한 추가부분
	paramDTO.setStart(start);
	paramDTO.setEnd(end);
	
	ArrayList<AcademyMemberDTO> acaList= sqlSession.getMapper(AcademyListImpl.class).AcaList(paramDTO);
	
	//페이지 처리를 위한 처리부분
	String pagingImg = Util.PagingUtil.pagingImg(totalRecordCount,
			pageSize, blockPage, nowPage,
			req.getContextPath()+"/catle/list.do?"+addQueryString);
	model.addAttribute("pagingImg", pagingImg);
	
	/*//줄바꿈처리
	for(AcademyMemberDTO dto : acaList)
	{
		String temp =
			dto.getContents().replace("\r\n","<br/>");
		dto.setContents(temp);
	}*/
	/* 별점처리를 위한 부분 s */
	Map<String,String> checkMap = new HashMap<String,String>();
	req.setAttribute("score", checkMap);
	/* 별점처리를 위한 부분 e */
	model.addAttribute("acaList", acaList);
		return "01Main/list";
	}
/////////////////////////////////////////////////////////////////////////
	//학원정보 등록 창 바로가기
	@RequestMapping("/catle/updateAcademyInfo.do")
	public String updateAcademyInfo() {
		
		return "01Main/updateAcademyInfo";
	}
	//학원 상세보기 바로가기
	@RequestMapping("/catle/academyInfo.do")
	public String academyInfo(Model model,HttpSession session, 
			HttpServletRequest req) {
		
	String acaIdx=req.getParameter("acaIdx");
	System.out.println("상세보기로 넘어갈 학원 번호="+acaIdx);
	
	/* 학원 정보 받기 s*/
	AcademyMemberDTO acaMemberDTO = sqlSession.getMapper(AcademyInfoImpl.class).AcaInfo(acaIdx);
	System.out.println(acaMemberDTO.getAcaAddress());
	model.addAttribute("dto", acaMemberDTO);
	String adress=acaMemberDTO.getAcaAddress();
	model.addAttribute("adress",adress);
	/* 학원 정보 받기 s*/
	/* 강사 목록 받기*/			  
	/*AcaTeacherDTO acaTeacherDTO = sqlSession.getMapper(AcademyInfoImpl.class).AcaInfo();*/
	/* 강사 목록 받기*/
	
		return "01Main/AcademyInfo";
	}
	
	
	
	
	//결제 완료창 띄우기
	@RequestMapping("/catle/paymentAction.do")
	public String paymentAction() {
	
	return "01Main/paymentFinish";
	}
	
	//결제 완료창 띄우기
	@RequestMapping("/catle/registA.do")
	public String registA() {
	
	return "01Main/registA";
	}	
	
	//일반회원마이페이지
	@RequestMapping("catle/memberMyPage.do")
	public String memberMyPage() {
		
		return "01Main/memberMyPage";
	}
}














