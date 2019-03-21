package impl;

import java.util.ArrayList;

import dto.MembersDTO;
import mybatis01.ClassInfoDTO;
import mybatis01.MemberDTO;
import mybatis01.ParamDTO;

public interface MypageImpl {

	//내 결제 정보 보기
	public ArrayList<ClassInfoDTO> myclass(ParamDTO paramDTO);

	public MembersDTO memberInfo(String user_id);

	public int getTotalCountSearch(ParamDTO paramDTO);
	//회원정보 수정을 위한 비밀번호 검증
	public String passConfirm(String id);
	
}
