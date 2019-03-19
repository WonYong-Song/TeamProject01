package impl;

import java.util.ArrayList;

import mybatis01.AcaiIntroduceDTO;
import mybatis01.AcaTeacherDTO;
import dto.MembersDTO;
import mybatis01.AcademyMemberDTO;
import mybatis01.ClassInfoDTO;
import mybatis01.ParamDTO;
import mybatis01.ReviewWriteDTO;

public interface AcademyInfoImpl {


	public MembersDTO memberLogin(MembersDTO membersDTO);

	public AcademyMemberDTO AcaInfo(String acaIdx);
	//리뷰리스트
	public ArrayList<ReviewWriteDTO> review(ParamDTO paramDTO);
	//글쓰기
	public void reviewWrite(String acaidx, String id, String acaScore, String reviewContents);
	//댓글 총갯수 반환
	public int getTotalCountSearchReview(ParamDTO paramDTO);

	public void delete(String idx);
	//강사 정보
	public ArrayList<AcaTeacherDTO> teacherInfo(String acaId);
	//학원 소개
	public AcaiIntroduceDTO acaIntro(String acaId);

	public ArrayList<ClassInfoDTO> classIntro(String acaId);
	//댓글 수정
	public ReviewWriteDTO reviewModify(String idx);
	//댓글 수정 처리
	public int modifyAction(String reviewidx, String acaScore, String reviewContents);
}
