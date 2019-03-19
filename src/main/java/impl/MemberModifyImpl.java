package impl;

import dto.MembersDTO;

public interface MemberModifyImpl {

	//일반회원정보 가져오기
	public MembersDTO loadMemberDate(String id);
	
	//일반회원정보변경 처리
	public int memberPAction(MembersDTO membersDTO);
	
	//학원회원정보변경 처리
	public int memberAAction(MembersDTO membersDTO);
}
