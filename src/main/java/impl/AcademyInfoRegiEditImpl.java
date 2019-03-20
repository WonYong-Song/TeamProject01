package impl;

import java.util.ArrayList;

import dto.AcaClassDTO;
import dto.AcaInfoRegiEditDTO;
import dto.CategoryDTO;
import mybatis01.AcaTeacherDTO;

public interface AcademyInfoRegiEditImpl {
	
	//학원정보 불러오기
	public AcaInfoRegiEditDTO AcaInfoLoad(String id);
	
	//학원소개 등록 수정
	public void AcaInfoRegiEdit(String address, String detailaddress,String acaname,String telephone1,String telephone2, String telephone3, String id);//members
	public void AcaInfoRegiEdit2(String introduce, String category, String acaIntroPhoto, String id);//acaIntroduce
	
	//카테고리 셀렉트 옵션
	public ArrayList<CategoryDTO> categorySelect();
	
	//강사진 리스트
	public ArrayList<AcaTeacherDTO> TeacherList(String id);
	
	//강사진 등록
	public void TeacherRegi(String subject, String teaimage, String teaintro, String teaname);
	
	/*//강의시간표 리스트
	public ArrayList<AcaClassDTO> ClassList(String teaIdx);*/
	
	//강의등록
	public void ClassRegi(String acaStartDate,String acaEndDate,String acaDay,String acaStartTime,String acaEndTime,
			String acaClassName,int NumberOfParticipants, String subject,String teaimage,String teaintro,String teaname);
}
