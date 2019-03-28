package impl;

import java.util.List;

import dto.AcaClassDTO;
import dto.MembersDTO;
import mybatis01.AcaTeacherDTO;

public interface AppImpl {

	//리스트1
	public List<MembersDTO> acalist1();
	//리스트2
	public List<MembersDTO> acalist2(String button_name);
	//리스트3
	public List<MembersDTO> acalist3(String search_contents);
	//리스트4
	public List<MembersDTO> acalist4(String search_contents);
	//리스트5
	public List<MembersDTO> acalist5(String search_contents);
	//리스트6
	public List<MembersDTO> acalist6(String search_contents,String button_name);
	//리스트7
	public List<MembersDTO> acalist7(String search_contents,String button_name);
	//리스트8
	public List<MembersDTO> acalist8(String search_contents,String button_name);
	
	//학원상세정보페이지1
	public List<MembersDTO> detail1(String idx);
	//학원상세정보페이지2
	public List<AcaTeacherDTO> detail2(String idx);
	//학원상세정보페이지3
	public List<AcaClassDTO> detail3(String idx);
	
	//로그인처리
	public MembersDTO loginAction(String id, String pass);
	
	//회원정보 가져오기
	public MembersDTO myInfo(String id);
	
	//회원정보 변경처리
	public int myInfoModifyAction(MembersDTO membersDTO);
	
	//회원가입 시 아이디 체크
	public int idCheck(String id);
}
