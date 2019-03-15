package com.StudyCastle.FinallyProject;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import impl.AcademyInfoImpl;
import impl.AcademyListImpl;
import impl.example;

import mybatis01.AcaTeacherDTO;
import mybatis01.AcademyMemberDTO;

import mybatis01.MemberDTO;

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
	//로그인 처리
	@RequestMapping("/catle/LoginAction.do")
	@ResponseBody
	public Map<String, Object> LoginAction(HttpServletRequest req){
		
		//Json출력
		Map<String, Object> memberMap = new HashMap<String, Object>();
		
		String id = req.getParameter("user_id");
		String pass = req.getParameter("user_pw");
		
		//파라미터 객체 저장
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMemberId(id);
		memberDTO.setMemberPass(pass);
		
		memberDTO =
				sqlSession.getMapper(AcademyInfoImpl.class).memberLogin(memberDTO);
		
		if(memberDTO==null) {
			//로그인실패
			memberMap.put("success", 0);
		}
		else {
			//로그인 성공
			memberMap.put("success", 1);
			memberMap.put("memberInfo", memberDTO);
		}
		
		return memberMap;
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
	
	//줄바꿈처리
	for(AcademyMemberDTO dto : acaList)
	{
		
		String temp =Util.RatingUtil.ratingImg((int) dto.getAvg());
				
			System.out.println(temp);
		dto.setRatingStar(temp);
		dto.setAvg((int) dto.getAvg());
	}
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
/////////////////////////////////////////////////////////////////////////
	//학원 상세보기 바로가기
	@RequestMapping("/catle/academyInfo.do")
	public String academyInfo(Model model,HttpSession session, 
			HttpServletRequest req) {
		
	String acaIdx=req.getParameter("acaIdx");
	System.out.println("상세보기로 넘어갈 학원 번호="+acaIdx);
	/* 학원 댓글 가져오기 s */
	//검색처리
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
		paramDTO.setAcaidx(acaIdx);
	//총개시물 갯수
	int totalRecordCount = sqlSession.getMapper(AcademyInfoImpl.class)
			.getTotalCountSearchReview(paramDTO);

	System.out.println("댓글 totalRecordCount="+totalRecordCount);
	
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
		
	ArrayList<ReviewWriteDTO> reviewDTO = sqlSession.getMapper(AcademyInfoImpl.class).review(paramDTO);
	System.out.println("11111111111111111111111111111");
	//페이지 처리를 위한 처리부분
			String pagingImg = Util.PagingUtil.pagingImg(totalRecordCount,
					pageSize, blockPage, nowPage,
					req.getContextPath()+"/catle/academyInfo.do?acaIdx="+acaIdx+"&"+addQueryString);
			model.addAttribute("pagingImg", pagingImg);
		System.out.println("22222222222222222222222222");
	//줄바꿈처리
	for(ReviewWriteDTO dto1 : reviewDTO)
	{	
		System.out.println(dto1.getReviewContents());
		String temp =
			dto1.getReviewContents().replace("\r\n","<br/>");
		dto1.setReviewContents(temp);
		String temp2 =Util.RatingUtil.ratingImg((int) dto1.getAcaScore());
		dto1.setStarRaiting(temp2);;
	}
	model.addAttribute("reviewDTO", reviewDTO);
	model.addAttribute("pagingImg", pagingImg);
	
	/* 학원 댓글 가져오기 e */
	
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
/////////////////////////////////////////////////////////////////////////
	//댓글쓰기 처리 
	@RequestMapping("/catle/reviewAction.do")
	public String reviewAction(Model model, HttpServletRequest req ,HttpSession session) throws UnsupportedEncodingException {
		req.setCharacterEncoding("UTF-8");
		String acaidx=req.getParameter("acaidx");
		String acaScore=req.getParameter("acaScore");
		String memberId=req.getParameter("memberId");
		String reviewContents=req.getParameter("reviewContents");
		
		System.out.println("acaidx="+acaidx);
		System.out.println("acaScore="+acaScore);
		System.out.println("memberId="+memberId);
		System.out.println("reviewContents="+reviewContents);
		/*if(session.getAttribute("siteUserInfo")==null)
		{
			return "redirect:login.do";
		}*/
		//Mybatis 사용
		/*sqlSession.getMapper(AcademyInfoImpl.class).reviewWrite(
				req.getParameter("name"),req.getParameter("contents"),
				((MemberDTO)session.getAttribute("siteUserInfo")).getMemberId());*/
		
		sqlSession.getMapper(AcademyInfoImpl.class).reviewWrite(
				acaidx,memberId,acaScore,reviewContents);
		 
		
		/*return "redirect:academyInfo.do";*/
		return "redirect:academyInfo.do?acaIdx="+acaidx;
		
	}
	
/////////////////////////////////////////////////////////////////////////	
	
	
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














