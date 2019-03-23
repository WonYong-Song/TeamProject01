package com.StudyCastle.FinallyProject;


import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import dto.MembersDTO;
import impl.AcademyInfoImpl;
import impl.AcademyListImpl;
import impl.MypageImpl;
import impl.PaymentImpl;
import impl.example;
import mybatis01.AcaTeacherDTO;
import mybatis01.AcademyMemberDTO;
import mybatis01.AcaiIntroduceDTO;
import mybatis01.ClassInfoDTO;
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
	//로그아웃
		@RequestMapping("/catle/Logout.do")
		public String logout(HttpServletRequest req, HttpSession session,
				HttpServletResponse resp) {
			session.removeAttribute("USER_ID");

			return "01Main/main";
		}
	//로그인 처리
	@RequestMapping("/catle/LoginAction.do")
	public void LoginAction(MembersDTO membersDTO,
			HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws ServletException, IOException{
		
		membersDTO =
				sqlSession.getMapper(AcademyInfoImpl.class).memberLogin(membersDTO);
				
		if(membersDTO==null) {
			//로그인실패
			
			/*if(!(membersDTO.getId().equals("id") || membersDTO.getPass().equals("pass"))) {

				req.getRequestDispatcher("/catle/Login.do").forward(req, resp);
			}*/
			
			req.getRequestDispatcher("/catle/Login.do").forward(req, resp);
		}
		else {
			//로그인 성공
			//세션에 ID값 저장
			session.setAttribute("USER_ID", membersDTO.getId());
			session.setAttribute("GRADE", membersDTO.getGrade());
			
			req.getRequestDispatcher("/catle/main.do").forward(req, resp);
			
		}
		
		//return memberMap;
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
	System.out.println("카테고리="+cateB);
	
		
		
	/* 학원 평점 들고오기 s	*/
	/*ArrayList<ReviewWriteDTO> reviewList =sqlSession.getMapper(AcademyListImpl.class)getReview();*/
	/* 학원 평점 들고오기 e	*/
	/* 검색처리 s*/ 
	ParamDTO paramDTO = new ParamDTO();
	paramDTO.setCateB(cateB);
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
	System.out.println("11111111111111111111111111111");
	ArrayList<AcademyMemberDTO> acaList= sqlSession.getMapper(AcademyListImpl.class).AcaList(paramDTO);
	System.out.println("카테고리="+cateB);
	//페이지 처리를 위한 처리부분
	String pagingImg = Util.PagingUtil.pagingImg(totalRecordCount,
			pageSize, blockPage, nowPage,
			req.getContextPath()+"/catle/list.do?"+addQueryString+"cateB="+cateB+"&");
	model.addAttribute("pagingImg", pagingImg);
	System.out.println("11111111111111111111111111111");
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
	model.addAttribute("cateB",cateB);
	
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
	System.out.println("상세보기로 넘어갈 학원 번호="+acaIdx+"&");
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
			String pagingImg = Util.PagingUtil2.pagingImg(totalRecordCount,
					pageSize, blockPage, nowPage,
					req.getContextPath()+"/catle/academyInfo.do?acaIdx="+acaIdx+"&"+addQueryString);
			model.addAttribute("pagingImg", pagingImg);
		System.out.println("22222222222222222222222222");
	//줄바꿈처리
	for(ReviewWriteDTO dto1 : reviewDTO)
	{	
		System.out.println(dto1.getReviewcontents());
		String temp =
			dto1.getReviewcontents().replace("\r\n","<br/>");
		dto1.setReviewcontents(temp);
		String temp2 =Util.RatingUtil.ratingImg((int) dto1.getScore());
		dto1.setStarRaiting(temp2);;
		System.out.println("정보");
		System.out.println(dto1.getAcaidx());
		System.out.println(dto1.getScore());
		System.out.println(dto1.getId());
		System.out.println(dto1.getStarRaiting());
	}
	model.addAttribute("reviewDTO", reviewDTO);
	model.addAttribute("pagingImg", pagingImg);
	
	/* 학원 댓글 가져오기 e */
	
	/* 학원 정보 받기 s*/
	AcademyMemberDTO acaMemberDTO = sqlSession.getMapper(AcademyInfoImpl.class).AcaInfo(acaIdx);
	String acaId = acaMemberDTO.getId();
	System.out.println("강사를 찾아야할 학원 id"+acaId);
	/* 강사진 가져오기 s*/
	ArrayList<AcaTeacherDTO> acaTeacherDTO = sqlSession.getMapper(AcademyInfoImpl.class).teacherInfo(acaId);
	for(AcaTeacherDTO dto : acaTeacherDTO)
	{
		System.out.println(dto.getId());
		System.out.println(dto.getSubject());
		System.out.println(dto.getTeaname());
	}
	model.addAttribute("teachers", acaTeacherDTO);
	/* 강사진 가져오기 e*/
	
	/* 학원 소개 가져오기 s*/
	AcaiIntroduceDTO acaIntroDTO = sqlSession.getMapper(AcademyInfoImpl.class).acaIntro(acaId);
	model.addAttribute("intro", acaIntroDTO);
	/* 학원 소개 가져오기 e*/
	
	/* 강의 목록 가져오기 S*/
	ArrayList<ClassInfoDTO> classIntroDTO = sqlSession.getMapper(AcademyInfoImpl.class).classIntro(acaId);
	model.addAttribute("classInfo", classIntroDTO);
	for(ClassInfoDTO dto : classIntroDTO)
	{
		String startD = dto.getAcastartdate().substring(0,10);
		String endD = dto.getAcaenddate().substring(0,10);
		String startT = dto.getAcastarttime().substring(10,16);
		String endT = dto.getAcaendtime().substring(10,16);
		
		dto.setAcastartdate(startD);
		dto.setAcaenddate(endD);
		dto.setAcastarttime(startT);
		dto.setAcaendtime(endT);
	}
	/* 강의 목록 가져오기 E*/
	
	System.out.println(acaMemberDTO.getAddress());
	model.addAttribute("dto", acaMemberDTO);
	String adress=acaMemberDTO.getAddress();
	model.addAttribute("adress",adress);
	/* 학원 정보 받기 s*/
	String user_id=(String) session.getAttribute("USER_ID");
	System.out.println(user_id);
	model.addAttribute("user_id",user_id);
	/* 강사 목록 받기*/			  
	/*AcaTeacherDTO acaTeacherDTO = sqlSession.getMapper(AcademyInfoImpl.class).AcaInfo();*/
	/* 강사 목록 받기*/
	/* 공유를 위한 url받기*/
	StringBuffer URL=req.getRequestURL();
	System.out.println("URL="+URL);
	String FULLURL =String.format("%s?acaIdx=%s", URL,acaIdx);
	model.addAttribute("FULLURL",FULLURL);
	model.addAttribute("naver","http://naver.com");
	
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
	//수정하기
	@RequestMapping("/mybatis/modify.do")
	public String modify(Model model, HttpServletRequest req, HttpServletResponse resp,
			HttpSession session) throws IOException{
		
		String idx =req.getParameter("reviewidx");
		System.out.println(idx);
		System.out.println("수정으로갈 리뷰 idx="+idx);
		if(session.getAttribute("siteUserInfo")!=null)
		{
		return "redirect:login.do";
		}
		
		//mybatis 사용
		ReviewWriteDTO reviewModify = sqlSession.getMapper(AcademyInfoImpl.class).reviewModify(idx);

		String str ="         <form name=\"writeFrm\" id=\"editF\" method=\"post\" \r\n" + 
			
				"				action=\"../mybatis/modifyAction.do\" >"+
				"                <div class=\"media\" style=\" padding: 0px 30px 10px 43px;margin-bottom: 80px;\">\r\n" + 
				
				"                  \r\n" + 
				"                  <a class=\"media-left\" href=\"#\" style=\"width:80px;height:80px;margin-top: 4%\">\r\n" + 
				"                    <img src=\"http://lorempixel.com/40/40/people/1/\" style=\"width:100%;height:100%;\">\r\n" + 
				"                  </a>\r\n" + 
				"                  \r\n" + 
				"                  <div class=\"media-body text-left\" style=\"width:200px;height:100px;padding-left: 40px;\">\r\n" + 
				"                      <input type=\"hidden\" name=\"memberId\" value='"+reviewModify.getId()+"' />\r\n" + 
				"                      <input type=\"hidden\" name=\"acaidx\" value='"+reviewModify.getAcaidx()+"' />\r\n" + 
				"                      <input type=\"hidden\" name=\"reviewidx\" value='"+reviewModify.getReviewidx()+"' />\r\n" + 
				"                      <span class=\"media-heading user_name\">"+reviewModify.getId()+"</span>\r\n" + 
				"                      <select class=\"form-control\" name=\"acaScore\">			\r\n" + 
				"							<option value=\"0\">별점 매기기</option>\r\n" + 
				"							<option value=\"1\">1점</option>\r\n" + 
				"							<option value=\"2\">2점</option>\r\n" + 
				"							<option value=\"3\">3점</option>\r\n" + 
				"							<option value=\"4\">4점</option>\r\n" + 
				"							<option value=\"5\">5점</option>\r\n" + 
				"					</select>\r\n" + 
				"                    \r\n" + 
				"                    <div style=\"width:100%;height: 100%;\">\r\n" + 
				"                    <textarea rows=\"10\" class=\"form-control\" style=\"width:100%;height: 100%\" name=\"reviewContents\">"+reviewModify.getReviewcontents()+"</textarea>\r\n" + 
				"                    </div>\r\n" + 
			
				"                    <p><small><a onclick=\"writeValidate2();\" style=\"cursor:pointer;color:#839997;\">수정하기</a> - <a href=\"\">돌아가기</a></small></p>\r\n" + 
				"                  </div>\r\n" + 
				"                  <p class=\"pull-right\" ><small></small></p>\r\n" + 
				
				"                </div> "+
				"               </form> ";
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
	    //가져온 Write 객체에 응답할 Text를 작성한다.
	    //writer.write("안녕하세요");
	    //응답을 보낸다.
	    //writer.flush();
	    writer.println(str);
	    System.out.println("1111111111111111111111111111111111");
	    writer.close();
	    System.out.println(str);
	 
	 return str;
	}
	
	
	//수정처리
	@RequestMapping("/mybatis/modifyAction.do")
	public String modifyAction(Model model, HttpServletRequest req,
		HttpSession session) {
		//수정하기로 넘어갈 정보
		System.out.println("수정하기로 넘어갈 정보");
		String acaidx=req.getParameter("acaidx");
		String acaScore=req.getParameter("acaScore");
		String memberId=req.getParameter("memberId");
		String reviewContents=req.getParameter("reviewContents");
		String reviewidx=req.getParameter("reviewidx");
		
		System.out.println("acaidx="+acaidx);
		System.out.println("acaScore="+acaScore);
		System.out.println("memberId="+memberId);
		System.out.println("reviewContents="+reviewContents);
		System.out.println("reviewidx="+reviewidx);
		
		//JdbcTemplate 사용
		/*dao.modify(req.getParameter("idx"),
			req.getParameter("name"),
			req.getParameter("contents"),
			((MemberVO)session.getAttribute("siteUserInfo")).getId());*/
		
		//Mybatis 사용
		int affected = sqlSession.getMapper(AcademyInfoImpl.class).modifyAction(
				reviewidx,acaScore,reviewContents);
		
		 System.out.println("수정된 댓글 행의갯수 :"+affected);
		if(affected ==1) {
			System.out.println("수정완료");
		}
		else {
			System.out.println("수정실패");
		}
		
		
		model.addAttribute("acaIdx",acaidx);  //<--- 여기에 제대로 된 값을 담으면 될듯...
      
		return "redirect:/catle/academyInfo.do?";
	}
	
	// 댓글 삭제하기
	@RequestMapping("/catle/delete.do")
	public String delete(HttpServletRequest req, Model model,
		HttpSession session){
		String acaIdx=req.getParameter("acaIdx");
		System.out.println("삭제하기로 넘어갈 학원 번호="+acaIdx);
		if(session.getAttribute("USER_ID")==null){
			return "redirect:login.do";
		}

		//JdbcTemplate 사용
		/*dao.delete(req.getParameter("idx"),
			((MemberVO)session.getAttribute("siteUserInfo")).getId());*/
		
		//Mybatis사용
		sqlSession.getMapper(AcademyInfoImpl.class)
			.delete(req.getParameter("idx"));

		return "redirect:academyInfo.do?acaIdx="+acaIdx;
	}
	
	//결제 완료창 띄우기
	@RequestMapping("/catle/paymentAction.do")
	public String paymentAction(Model model, HttpServletRequest req, HttpSession session) {
	System.out.println("----------------결제과정 시작----------------");
    //넘어오는 user_id(어쩔수없이 이 네임으로 아이디를 받음)
	String user_id = req.getParameter("item_name");
	System.out.println("세로 생성해야할 아이디="+user_id);
	//세로운 세션생성을 위해 reLogin
	MembersDTO membersDTO = sqlSession.getMapper(PaymentImpl.class).reLogin(user_id);
	System.out.println("세로 생성된 아이디="+membersDTO.getId());
	System.out.println("111111111111111111111111111111111111");
	
	//세션에 ID값 저장
	session.setAttribute("USER_ID", membersDTO.getId());
	session.setAttribute("GRADE", membersDTO.getGrade());
	System.out.println("111111111111111111111111111111111111");
	if(session.getAttribute("USER_ID")==null){
		
		return "redirect:Login.do";
	}
	//결제한 수강정보 가져오기
	String item_number = req.getParameter("item_number");
	System.out.println("111111111111111111111111111111111111");
	//결제를 진행하는 Mybatis!
	int affected = sqlSession.getMapper(PaymentImpl.class).payment(user_id,item_number);
	System.out.println("결제가 완료된 아이디="+user_id);
	System.out.println("결제완료된 과목 idx="+item_number);
	System.out.println("111111111111111111111111111111111111");
	//결제된 과목의 정보를 가져오는 Mybatis!
	ClassInfoDTO classDTO = sqlSession.getMapper(PaymentImpl.class).classInfo(item_number);
	System.out.println(classDTO.getAcaclassname());
	System.out.println(classDTO.getPay());
	System.out.println("111111111111111111111111111111111111");
	if(affected ==1) {
		System.out.println("결제완료");
	}
	else {
		System.out.println("결제실패");
	}
	/* 문자열 처리 함수 */
	String startD = classDTO.getAcastartdate().substring(0,10);
	String endD = classDTO.getAcaenddate().substring(0,10);
	String startT = classDTO.getAcastarttime().substring(10,16);
	String endT = classDTO.getAcaendtime().substring(10,16);
	
	classDTO.setAcastartdate(startD);
	classDTO.setAcaenddate(endD);
	classDTO.setAcastarttime(startT);
	classDTO.setAcaendtime(endT);

		
	model.addAttribute("user_id",user_id);
	model.addAttribute("classDTO",classDTO);
	
	return "01Main/paymentFinish";
	}
	
	//일반회원마이페이지
	@RequestMapping("/catle/memberMyPage.do")
	public String memberMyPage(Model model, HttpServletRequest req, HttpSession session) {
		//세션 아이디 들고오기
		if(session.getAttribute("USER_ID")==null){
			
			return "redirect:Login.do";
		}
		String msg=req.getParameter("msg");
		String user_id=(String) session.getAttribute("USER_ID");
		System.out.println(user_id);
		ParamDTO paramDTO = new ParamDTO();
		String addQueryString = "";
		String keyField = req.getParameter("keyField");				
		String keyString = req.getParameter("keyString");
		System.out.println("keyField"+keyField);
		System.out.println("keyString"+keyString);
		if(keyString!=null){
			addQueryString = String.format("keyField=%s"
				+"&keyString=%s&", keyField, keyString);

			paramDTO.setKeyField(keyField);
			paramDTO.setKeyString(keyString);
		}
		System.out.println("1111111111111111111111111111111111111111");
		paramDTO.setUser_id(user_id);
		int totalRecordCount = sqlSession.getMapper(MypageImpl.class).getTotalCountSearch(paramDTO);
		//검색어에 따른 레코드 갯수 확인용 
		System.out.println("totalRecordCount="+ totalRecordCount);
		
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
		//수강신청한 강의정보 들고오기
		System.out.println("1111111111111111111111111111111111111111");
		ArrayList<ClassInfoDTO> classIntroDTO =sqlSession.getMapper(MypageImpl.class).myclass(paramDTO);
		
		System.out.println("1111111111111111111111111111111111111111");
		
		System.out.println("1111111111111111111111111111111111111111");
		MembersDTO memberInfo = sqlSession.getMapper(MypageImpl.class).memberInfo(user_id);
		int virtualNum = 0;
		int countNum = 0;
		for(ClassInfoDTO dto : classIntroDTO)
		{
			
			
			virtualNum = totalRecordCount
				- (((nowPage-1)*pageSize) + countNum++);
			dto.setSetVirtualNum(virtualNum);
			
			String startD = dto.getAcastartdate().substring(0,10);
			String endD = dto.getAcaenddate().substring(0,10);
			String startT = dto.getAcastarttime().substring(10,16);
			String endT = dto.getAcaendtime().substring(10,16);
			
			dto.setAcastartdate(startD);
			dto.setAcaenddate(endD);
			dto.setAcastarttime(startT);
			dto.setAcaendtime(endT);
		}
		//페이지 처리를 위한 처리부분
		String pagingImg = Util.PagingUtil.pagingImg(totalRecordCount,
				pageSize, blockPage, nowPage,
				req.getContextPath()+"/catle/memberMyPage.do?"+addQueryString);
		model.addAttribute("pagingImg", pagingImg);
		//회원정보 가져오기
		model.addAttribute("myClass",classIntroDTO);
		model.addAttribute("memberInfo",memberInfo);
		model.addAttribute("pagingImg",pagingImg);
		
		model.addAttribute("msg",msg);
		return "01Main/memberMyPage";
	}
	/* 비밀번호 검증 */
	@RequestMapping("/catle/passConfirm.do")
	public String passConfirm(Model model, HttpServletRequest req, HttpSession session) {
		
		String pass=req.getParameter("pass");
		String id=(String) session.getAttribute("USER_ID");
		System.out.println("pass="+pass);
		System.out.println("id="+id);
		
		String DTOpass =sqlSession.getMapper(MypageImpl.class).passConfirm(id);
		System.out.println("1111111111111111111111111111111111111111111");
		if(!DTOpass.equals(null) && DTOpass.equals(pass)) {
			System.out.println("1111111111111111111111111111111111111111111");
			return "redirect:MemberModifyP.do";
		}

		System.out.println("22222222222222222222222222222222222222222");
		String msg = "비밀번호가 일치하지 않습니다.";
		model.addAttribute("msg",msg);
		return "redirect:memberMyPage.do";
		
	}
	

	//다음 api 지도로 검색결과 뿌리기
	@RequestMapping("/catle/acaSearchMap.do")
	public String acaSearchMap(Model model, HttpServletRequest req, HttpSession session) {
		
		/* 검색어처리 s*/ 
		ParamDTO paramDTO = new ParamDTO();
		String addQueryString = "";
		String keyField = req.getParameter("keyField");				
		String keyString = req.getParameter("keyString");
		
		System.out.println("keyField="+keyField);
		System.out.println("keyString="+keyString);
		if(keyString!=null){
			addQueryString = String.format("keyField=%s"
				+"&keyString=%s&", keyField, keyString);

			paramDTO.setKeyField(keyField);
			paramDTO.setKeyString(keyString);
			
		}
		System.out.println("keyField="+keyField);
		System.out.println("keyStrin="+keyString);
		/* 검색어처리 e */ 
		//조건에 맞는 학원의 갯수
		int totalRecordCount = sqlSession.getMapper(AcademyListImpl.class).getTotalCountSearchM(paramDTO);
		System.out.println("totalRecordCount="+totalRecordCount);
		
		//페이지 처리를 위한 설정값
		int pageSize = 10;
		int blockPage = 5;
		
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
		System.out.println("11111111111111111111111111111");
		ArrayList<AcademyMemberDTO> acaList= sqlSession.getMapper(AcademyListImpl.class).AcaListM(paramDTO);
		//페이지 처리를 위한 처리부분
		String pagingImg = Util.PagingUtil.pagingImg(totalRecordCount,
				pageSize, blockPage, nowPage,
				req.getContextPath()+"/catle/list.do?"+addQueryString);
		model.addAttribute("pagingImg", pagingImg);
		System.out.println("11111111111111111111111111111");
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
	
		
		return "01Main/AcaSearchMap";
	}
	
	
	
}














