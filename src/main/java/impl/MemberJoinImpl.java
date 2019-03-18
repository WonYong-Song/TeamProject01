package impl;

import dto.MembersDTO;
import mybatis01.MemberDTO;

public interface MemberJoinImpl {

	//일반회원가입처리
	public void normalmemberjoin(MembersDTO membersDTO);
	//학원회원가입처리
	public void acamemberjoin(MembersDTO memberDTO);
	//학원회원가입처리시 상세소개 테이블에 빈값추가하기
	public void introset(String id);
}
