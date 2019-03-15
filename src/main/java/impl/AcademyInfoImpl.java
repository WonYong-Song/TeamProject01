package impl;

import java.util.ArrayList;

import mybatis01.AcademyMemberDTO;
import mybatis01.MemberDTO;
import mybatis01.ParamDTO;
import mybatis01.ReviewWriteDTO;

public interface AcademyInfoImpl {


	public MemberDTO memberLogin(MemberDTO memberDTO, AcademyMemberDTO acDTO);

	public AcademyMemberDTO AcaInfo(String acaIdx);
	//리뷰리스트
	public ArrayList<ReviewWriteDTO> review(ParamDTO paramDTO);
	//글쓰기
	public void reviewWrite(String acaidx, String id, String acaScore, String reviewContents);
	//댓글 총갯수 반환
	public int getTotalCountSearchReview(ParamDTO paramDTO);
}
