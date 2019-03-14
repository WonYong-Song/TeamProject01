package impl;

import java.util.ArrayList;

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
}
