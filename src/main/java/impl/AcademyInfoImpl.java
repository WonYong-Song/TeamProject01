package impl;

import mybatis01.AcademyMemberDTO;
import mybatis01.MemberDTO;

public interface AcademyInfoImpl {
	public AcademyMemberDTO AcaInfo();
	
	public MemberDTO memberLogin(MemberDTO memberDTO);
}
