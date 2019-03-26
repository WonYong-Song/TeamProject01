package com.StudyCastle.FinallyProject;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.basic.BasicInternalFrameTitlePane.CloseAction;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	
	//UUID를 이용한 랜덤한 문자열 생성
	public static String getUuid() {
	   String uuid = UUID.randomUUID().toString();
	   uuid = uuid.replaceAll("-", "");
	   return uuid;
	}
	 
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
		
		String path = req.getSession().getServletContext().getRealPath("/resources/teaupload");	   
		if(path!=null) {
			   File file = new File(path);
			   File[] fileArray = file.listFiles();  
			   Map<String, Integer> fileMap = new HashMap<String, Integer>();
			   for(File f : fileArray) {
				   fileMap.put(f.getName(), (int)Math.ceil(f.length()/1024.0));
			   }
			   model.addAttribute("fileName",fileMap);
		   }

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
		String[] acaintrophoto = mtfRequest.getParameterValues("acaintrophoto");		
		System.out.println("사진 = "+acaintrophoto);
		
		sqlSession.getMapper(AcademyInfoRegiEditImpl.class).AcaInfoRegiEdit(address,detailaddress,acaname,telephone1,telephone2,telephone3,id);
		sqlSession.getMapper(AcademyInfoRegiEditImpl.class).AcaInfoRegiEdit2(introduce,category,acaintrophoto,id);
		
		//upload 폴더의 물리적경로 얻어오기
	   String path = req.getSession().getServletContext().getRealPath("/resources/acaUpload");
	   //뷰로 전달할 정보를 저장하기 위해 Map컬렉션 생성
	   Map returnObj = new HashMap();
	   try {
		   /*
		   파일업로드를 위한 객체생성. 객체 생성과 동시에 파일업로드는 완료되고
		   나머지 폼값은 Multipart객체가 통쨰로 받아서 처리한다.
		    */
		   MultipartHttpServletRequest mhsr = 
				   (MultipartHttpServletRequest) req;
		   
		   //업로드폼의 file속성 필드의 이름을 모두 읽음
		   Iterator itr = mhsr.getFileNames();
		   
		   //파일 처리를 위한 변수생성
		   MultipartFile mfile = null;
		   String fileName = "";
		   
		   /*
		   파일 하나의 정보를 저장하기 위한 List계열의 컬렉션을 생성한다.
		   (원본파일명과 실제저장된 파일명)
		    */
		   List resultList = new ArrayList();
		   
		   //업로드할 디렉토리가 없는지 확인후 디렉토리 생성
		   File directory = new File(path);
		   if(!directory.isDirectory()) {
			   directory.mkdirs();
		   }
		   
		   //업로드폼의 file속성의 필드갯수만큼 반복함
		   while(itr.hasNext()) {
			   //input태그의 속성값을 읽어온다(userfile1,2)
			   fileName = (String)itr.next();
			   
			   //서버로 업로드된 임시파일명을 가져온다
			   mfile = mhsr.getFile(fileName);
			   System.out.println("mfile="+mfile);
			   
			   //한글깨짐방지 처리후 업로드된 파일명을 가져온다.
			   String originalName = new String(mfile.getOriginalFilename().getBytes(), "UTF-8");
			   
			   //만약 파일명이 공백이라면 while문의 처음으로 돌아간다.
			   if("".equals(originalName)) {
				   continue;
			   }
			   /*
			   파일명에서 확장자를 가져온다. 파일명에서 확장자는 마지막 .(점)
			   이후에 있기때문에 lastIndexOf()를 사용한다.
			    */
			   String ext = originalName.substring(originalName.lastIndexOf('.'));
			   
			   //uuid로 생성한 문자열과 확장자를 합친다.
			   String saveFileName = getUuid() + ext;
			   
			   //설정한 경로명 조립
			   File serverFullNaem = new File(path+File.separator+saveFileName);
			  
			   //업로드한 파일을 지정경로에 저장한다.
			   mfile.transferTo(serverFullNaem);
			   
			   Map file = new HashMap();
			   file.put("originalName", originalName); //원본파일명
			   file.put("saveFileName", saveFileName);//저장된파일명
			   file.put("serverFullNaem", serverFullNaem); 
			   
			   resultList.add(file);
		   }
		   returnObj.put("files",resultList);
		   
	   }
	   catch (IOException e) {
		   e.printStackTrace();
	   }
	   catch (Exception e) {
		   e.printStackTrace();
	   }
	   model.addAttribute("returnObj", returnObj);
		  
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
		
		//upload 폴더의 물리적경로 얻어오기
		String path = req.getSession().getServletContext().getRealPath("/resources/acaUpload");
	   //뷰로 전달할 정보를 저장하기 위해 Map컬렉션 생성
		Map returnObj = new HashMap();
		try {
		   /*
		   파일업로드를 위한 객체생성. 객체 생성과 동시에 파일업로드는 완료되고
		   나머지 폼값은 Multipart객체가 통쨰로 받아서 처리한다.
		    */
		   MultipartHttpServletRequest mhsr = 
				   (MultipartHttpServletRequest) req;
		   
		   //업로드폼의 file속성 필드의 이름을 모두 읽음
		   Iterator itr = mhsr.getFileNames();
		   
		   //파일 처리를 위한 변수생성
		   MultipartFile mfile = null;
		   String fileName = "";
		   
		   /*
		   파일 하나의 정보를 저장하기 위한 List계열의 컬렉션을 생성한다.
		   (원본파일명과 실제저장된 파일명)
		    */
		   List resultList = new ArrayList();
		   
		   //업로드할 디렉토리가 없는지 확인후 디렉토리 생성
		   File directory = new File(path);
		   if(!directory.isDirectory()) {
			   directory.mkdirs();
	   		}
		   
		   //업로드폼의 file속성의 필드갯수만큼 반복함
		   while(itr.hasNext()) {
			   //input태그의 속성값을 읽어온다(userfile1,2)
			   fileName = (String)itr.next();
			   
			   //서버로 업로드된 임시파일명을 가져온다
			   mfile = mhsr.getFile(fileName);
			   System.out.println("mfile="+mfile);
			   
			   //한글깨짐방지 처리후 업로드된 파일명을 가져온다.
			   String originalName = new String(mfile.getOriginalFilename().getBytes(), "UTF-8");
			   
			   //만약 파일명이 공백이라면 while문의 처음으로 돌아간다.
			   if("".equals(originalName)) {
				   continue;
			   }
			   /*
			   파일명에서 확장자를 가져온다. 파일명에서 확장자는 마지막 .(점)
			   이후에 있기때문에 lastIndexOf()를 사용한다.
			    */
			   String ext = originalName.substring(originalName.lastIndexOf('.'));
			   
			   //uuid로 생성한 문자열과 확장자를 합친다.
			   String saveFileName = getUuid() + ext;
			   
			   //설정한 경로명 조립
			   File serverFullNaem = new File(path+File.separator+saveFileName);
			  
			   //업로드한 파일을 지정경로에 저장한다.
			   mfile.transferTo(serverFullNaem);
			   
			   Map file = new HashMap();
			   file.put("originalName", originalName); //원본파일명
			   file.put("saveFileName", saveFileName);//저장된파일명
			   file.put("serverFullNaem", serverFullNaem); 
			   
			   resultList.add(file);
		   }
		   returnObj.put("files",resultList);
			   
	   }
	   catch (IOException e) {
		   e.printStackTrace();
	   }
	   catch (Exception e) {
		   e.printStackTrace();
	   }
	   model.addAttribute("returnObj", returnObj);
		
		return "redirect:acaInfoRegiEdit.do";
	}
	
	//강의정보 입력
	@RequestMapping("/catle/classInfoInsert.do")
	public String classInfoInsert(AcaClassDTO acaClassDTO, Model model, HttpSession session, HttpServletRequest req) {
	
		sqlSession.getMapper(AcademyInfoRegiEditImpl.class).ClassRegi(acaClassDTO);
		
		return "redirect:acaInfoRegiEdit.do";
	}

	
	//강사정보 상세보기
	@RequestMapping("/catle/teacherInfoView.do")
	public String teacherInfoView(Model model, HttpServletRequest req, HttpSession session) {
		
		String id = (String) session.getAttribute("USER_ID");
		String teaidx = req.getParameter("teaidx");
		AcaTeacherDTO acaTeacherDTO = sqlSession.getMapper(AcademyInfoRegiEditImpl.class).teacherView(teaidx);
		model.addAttribute("teaDTO", acaTeacherDTO);
		
		String path = req.getSession().getServletContext().getRealPath("/resources/teaUpload");
		if(path!=null) {
		   File file = new File(path);
		   File[] fileArray = file.listFiles();  
		   Map<String, Integer> fileMap = new HashMap<String, Integer>();
		   for(File f : fileArray) {
			   fileMap.put(f.getName(), (int)Math.ceil(f.length()/1024.0));
		   }
		   model.addAttribute("fileName",fileMap);
		}   
		

		return "02sub/teacherInfoView";
	}
		
	//강의정보 상세보기
	@RequestMapping("/catle/classInfoView.do")
	public String classInfoView(Model model, HttpServletRequest req, HttpSession session) {
		
		String id = (String) session.getAttribute("USER_ID");
		String classidx = req.getParameter("classidx");
		AcaClassDTO acaClassDTO = sqlSession.getMapper(AcademyInfoRegiEditImpl.class).classView(classidx);
		model.addAttribute("classDTO", acaClassDTO);
		
		ArrayList<AcaTeacherDTO> tealists = sqlSession.getMapper(AcademyInfoRegiEditImpl.class).TeacherList(id);
		model.addAttribute("tealists",tealists);
		
		return "02sub/classInfoView";
	}
	
	
	
	//강사정보수정
	@RequestMapping("/catle/teaInfoUpdate.do")
	@ResponseBody
	public void teaInfoUpdate(AcaTeacherDTO acaTeacherDTO, Model model, HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		sqlSession.getMapper(AcademyInfoRegiEditImpl.class).teaInfoUpd(acaTeacherDTO);
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = resp.getWriter();
		   String str="";
		   str = "<script>";
		   str +=" alert('수정완료'); ";
		   str += "window.opener.location.reload();";
		   str += "window.close();";   
		   str += "</script>";
		   writer.print(str);
		   
		 //upload 폴더의 물리적경로 얻어오기
		String path = req.getSession().getServletContext().getRealPath("/resources/teaUpload");
		//뷰로 전달할 정보를 저장하기 위해 Map컬렉션 생성
		Map returnObj = new HashMap();
		try {
		    /*
		   	파일업로드를 위한 객체생성. 객체 생성과 동시에 파일업로드는 완료되고
		   	나머지 폼값은 Multipart객체가 통쨰로 받아서 처리한다.
		    */
			MultipartHttpServletRequest mhsr = 
				   (MultipartHttpServletRequest) req;
		   
			//업로드폼의 file속성 필드의 이름을 모두 읽음
			Iterator itr = mhsr.getFileNames();
		   
			//파일 처리를 위한 변수생성
			MultipartFile mfile = null;
			String fileName = "";
		   
			/*
		   	파일 하나의 정보를 저장하기 위한 List계열의 컬렉션을 생성한다.
		   	(원본파일명과 실제저장된 파일명)
			*/
			List resultList = new ArrayList();
		   
			//업로드할 디렉토리가 없는지 확인후 디렉토리 생성
			File directory = new File(path);
			if(!directory.isDirectory()) {
			   directory.mkdirs();
			}	
			
			//업로드폼의 file속성의 필드갯수만큼 반복함
			while(itr.hasNext()) {
				//input태그의 속성값을 읽어온다(userfile1,2)
				fileName = (String)itr.next();
		   
				//서버로 업로드된 임시파일명을 가져온다
				mfile = mhsr.getFile(fileName);
				System.out.println("mfile="+mfile);
		   
				//한글깨짐방지 처리후 업로드된 파일명을 가져온다.
				String originalName = new String(mfile.getOriginalFilename().getBytes(), "UTF-8");
		   
				//만약 파일명이 공백이라면 while문의 처음으로 돌아간다.
				if("".equals(originalName)) {
					continue;
				}
			   /*
			   파일명에서 확장자를 가져온다. 파일명에서 확장자는 마지막 .(점)
			   이후에 있기때문에 lastIndexOf()를 사용한다.
			    */
			   String ext = originalName.substring(originalName.lastIndexOf('.'));
			   
			   //uuid로 생성한 문자열과 확장자를 합친다.
			   String saveFileName = getUuid() + ext;
		   
			   //설정한 경로명 조립
			   File serverFullNaem = new File(path+File.separator+saveFileName);
			  
			   //업로드한 파일을 지정경로에 저장한다.
			   mfile.transferTo(serverFullNaem);
		   
			   Map file = new HashMap();
			   file.put("originalName", originalName); //원본파일명
			   file.put("saveFileName", saveFileName);//저장된파일명
			   file.put("serverFullNaem", serverFullNaem); 
				   
				   resultList.add(file);
			   }
		   returnObj.put("files",resultList);
			   
	   }
	   catch (IOException e) {
		   e.printStackTrace();
	   }
	   catch (Exception e) {
		   e.printStackTrace();
	   }
	   model.addAttribute("returnObj", returnObj);
		  
	}
	
	//강의정보수정
	@RequestMapping("/catle/classInfoUpdate.do")
	@ResponseBody
	public void classInfoUpdate(AcaClassDTO acaClassDTO, Model model, HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		sqlSession.getMapper(AcademyInfoRegiEditImpl.class).classInfoUpd(acaClassDTO);
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = resp.getWriter();
		   String str="";
		   str = "<script>";
		   str +=" alert('수정완료'); ";
		   str += "window.opener.location.reload();";
		   str += "window.close();";   
		   str += "</script>";
		   writer.print(str); 
	}
	
	//강사정보삭제
	@RequestMapping(value="/catle/teaInfoDelete/{teaidx}", method = RequestMethod.GET)
	@ResponseBody
	public void teaInfoDelete(AcaTeacherDTO acaTeacherDTO, Model model, HttpSession session, HttpServletRequest req) {
		
		sqlSession.getMapper(AcademyInfoRegiEditImpl.class).teaInfoDel(acaTeacherDTO);
		
	}
	
	//강의정보삭제
	@RequestMapping(value="/catle/classDelete/{classidx}", method = RequestMethod.GET )
	@ResponseBody
	public void classDelete(AcaClassDTO acaClassDTO, Model model, HttpSession session, HttpServletRequest req) {
		
		sqlSession.getMapper(AcademyInfoRegiEditImpl.class).classDel(acaClassDTO);
	
	}

}
