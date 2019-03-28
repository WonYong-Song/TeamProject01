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

import javax.servlet.ServletRequest;
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
import org.springframework.web.multipart.MultipartRequest;

import dto.AcaClassDTO;
import dto.AcaInfoRegiEditDTO;
import dto.CategoryDTO;
import impl.AcademyInfoImpl;
import impl.AcademyInfoRegiEditImpl;
import mybatis01.AcaTeacherDTO;
import mybatis01.ClassInfoDTO;

@Controller
public class AcademyRegistEditController {
	
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
	public String acaInfoRegiEdit(Model model, HttpSession session, HttpServletRequest req) {		
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
		
		String path = req.getSession().getServletContext().getRealPath("/resources/acaupload");	   
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

	//학원정보수정 
	@RequestMapping("/catle/AcaInfoUpdate.do")
	public String AcaInfoUpdate(HttpSession session, HttpServletRequest req, MultipartHttpServletRequest mtfRequest) throws UnsupportedEncodingException {
		
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
		String acaimgOrigin = req.getParameter("acaimgOrigin");
		String acaimgOriuu = req.getParameter("acaimgOriuu");
		
		String path = req.getSession().getServletContext().getRealPath("/resources/acaUpload");
		String originalName = "";
		String serverFullName ="";
		
		File directory = new File(path);
		if(directory.isDirectory() == false){ 
			directory.mkdir(); 
		 }
		Iterator<String> files =  mtfRequest.getFileNames();
		MultipartFile mpf = mtfRequest.getFile(files.next());
		
		if(mpf == null || mpf.getSize()<=0) {
			originalName = acaimgOrigin;
			serverFullName = acaimgOriuu;	
		}
		else{
			List<MultipartFile> fileList = mtfRequest.getFiles("acaintrophoto");
			
			for(MultipartFile filePart : fileList) {
				originalName = filePart.getOriginalFilename();//원본파일
				String ext = originalName.substring(originalName.lastIndexOf("."));//확장자 구분
				serverFullName = getUuid()+ ext; //서버에 저장될 UUID형식 파일명
				directory = new File(path +File.separator+ serverFullName);
				if(!originalName.equals("")) {
					try {
						filePart.transferTo(directory);
					}
					catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
		sqlSession.getMapper(AcademyInfoRegiEditImpl.class).AcaInfoRegiEdit(address,detailaddress,acaname,telephone1,telephone2,telephone3,id);
		sqlSession.getMapper(AcademyInfoRegiEditImpl.class).AcaInfoRegiEdit2(introduce,category,originalName,serverFullName,id);

		return "redirect:acaInfoRegiEdit.do"; 
	}
	
	//강사정보 입력
	@RequestMapping("/catle/teaInfoInsert.do")
	public String teaInfoInsert(HttpSession session, HttpServletRequest req, MultipartHttpServletRequest mtfRequest) throws UnsupportedEncodingException {
		
		req.setCharacterEncoding("UTF-8");
		String id = (String) session.getAttribute("USER_ID");
		String teaname = req.getParameter("teaname");
		String teaintro  = req.getParameter("teaintro");
		String subject = req.getParameter("subject");
		
		String path = req.getSession().getServletContext().getRealPath("/resources/teaUpload");
		String originalName = "";
		String serverFullName ="";
		
		File directory = new File(path);
		if(directory.isDirectory() == false){ 
			directory.mkdir(); 
		 }
		Iterator<String> files =  mtfRequest.getFileNames();
		MultipartFile mpf = mtfRequest.getFile(files.next());
		
		if(mpf == null || mpf.getSize()<=0) {
			
		}
		List<MultipartFile> fileList = mtfRequest.getFiles("teaimage");
	
		for(MultipartFile filePart : fileList) {
			originalName = filePart.getOriginalFilename();//원본파일
			String ext = originalName.substring(originalName.lastIndexOf("."));//확장자 구분
			serverFullName = getUuid()+ ext; //서버에 저장될 UUID형식 파일명
			directory = new File(path +File.separator+ serverFullName);
			if(!originalName.equals("")) {
				try {
					filePart.transferTo(directory);
				}
				catch (Exception e) {
					e.printStackTrace();
				}
			}
			
		}
		
		sqlSession.getMapper(AcademyInfoRegiEditImpl.class).TeacherRegi(originalName,serverFullName ,teaname,teaintro,subject,id);
		 
		return "redirect:acaInfoRegiEdit.do";
	}
	
	//강의정보 입력
	@RequestMapping("/catle/classInfoInsert.do")
	public String classInfoInsert(AcaClassDTO acaClassDTO, HttpSession session, HttpServletRequest req) {
	
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
	public void teaInfoUpdate(HttpSession session, HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest mtfRequest) throws IOException {
		
		req.setCharacterEncoding("UTF-8");
		String teaname = req.getParameter("teaname");
		String teaintro  = req.getParameter("teaintro");
		String subject = req.getParameter("subject");
		String teaidx = req.getParameter("teaidx");
		String teaimgOrigin = req.getParameter("teaimgOrigin"); 
		String teaimgOriuu = req.getParameter("teaimgOriuu");
		
		String path = req.getSession().getServletContext().getRealPath("/resources/acaUpload");
		String originalName = "";
		String serverFullName ="";
		
		File directory = new File(path);
		if(directory.isDirectory() == false){ 
			directory.mkdir(); 
		 }
		Iterator<String> files =  mtfRequest.getFileNames();
		MultipartFile mpf = mtfRequest.getFile(files.next());
		
		if(mpf == null || mpf.getSize()<=0) {
			originalName = teaimgOrigin;
			serverFullName = teaimgOriuu;	
		}
		else{
			List<MultipartFile> fileList = mtfRequest.getFiles("teaimage");
			
			for(MultipartFile filePart : fileList) {
				originalName = filePart.getOriginalFilename();//원본파일
				String ext = originalName.substring(originalName.lastIndexOf("."));//확장자 구분
				serverFullName = getUuid()+ ext; //서버에 저장될 UUID형식 파일명
				directory = new File(path +File.separator+ serverFullName);
				if(!originalName.equals("")) {
					try {
						filePart.transferTo(directory);
					}
					catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
	
		
		
		sqlSession.getMapper(AcademyInfoRegiEditImpl.class).teaInfoUpd(originalName,serverFullName ,teaname,teaintro,subject,teaidx);
		
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
	
	//강의정보수정
	@RequestMapping("/catle/classInfoUpdate.do")
	@ResponseBody
	public void classInfoUpdate(AcaClassDTO acaClassDTO, HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
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
	public void teaInfoDelete(AcaTeacherDTO acaTeacherDTO, HttpSession session, HttpServletRequest req) {
		
		sqlSession.getMapper(AcademyInfoRegiEditImpl.class).teaInfoDel(acaTeacherDTO);
		
	}
	
	//강의정보삭제
	@RequestMapping(value="/catle/classDelete/{classidx}", method = RequestMethod.GET )
	@ResponseBody
	public void classDelete(AcaClassDTO acaClassDTO, HttpSession session, HttpServletRequest req) {
		
		sqlSession.getMapper(AcademyInfoRegiEditImpl.class).classDel(acaClassDTO);
	
	}

}
