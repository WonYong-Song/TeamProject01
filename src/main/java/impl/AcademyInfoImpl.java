package impl;

import mybatis01.AcademyMemberDTO;
import mybatis01.MemberDTO;

public interface AcademyInfoImpl {

	public MemberDTO memberLogin(MemberDTO memberDTO, AcademyMemberDTO acDTO);

	public AcademyMemberDTO AcaInfo(String acaIdx);
}
