package com.StudyCastle.FinallyProject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AcademyRegistEdit {
	
	//학원등록페이지
	@RequestMapping("/catle/acaRegister.do")
	public String acaRegister() {
		
		return "01Main/acaRegister";
	}
	
	//학원정보수정 페이지
	@RequestMapping("/catle/acaInfoEdit.do")
	public String acaInfoEdit() {
		
		return "01Main/acaInfoEdit";
	}
}
