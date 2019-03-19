package impl;

import java.util.ArrayList;

import dto.MembersDTO;
import mybatis01.ClassInfoDTO;

public interface MypageImpl {

	//내 결제 정보 보기
	public ArrayList<ClassInfoDTO> myclass(String user_id);
	
}
