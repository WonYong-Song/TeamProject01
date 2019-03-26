package impl;

import java.util.ArrayList;

import dto.MembersDTO;
import mybatis01.AcademyMemberDTO;
import mybatis01.ParamDTO;
import mybatis01.ReviewWriteDTO;

public interface AcademyListImpl {
	//리스트
	public ArrayList<AcademyMemberDTO> AcaList(ParamDTO paramDTO);
	//리뷰
	public ArrayList<ReviewWriteDTO> getReview(String idx);
	//게시물 갯수
	public int getTotalCountSearch(ParamDTO paramDTO);
	//맵에 뿌려줄 게시물 갯수
	public int getTotalCountSearchM(ParamDTO paramDTO);
	//맵에 뿌려줄 게시물 정보
	public ArrayList<AcademyMemberDTO> AcaListM(ParamDTO paramDTO);

}
