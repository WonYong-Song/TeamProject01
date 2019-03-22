package impl;

import java.util.ArrayList;

import dto.AcaClassDTO;
import dto.AcaInfoRegiEditDTO;
import dto.CategoryDTO;
import mybatis01.AcaTeacherDTO;
import mybatis01.ClassInfoDTO;

public interface AcademyInfoRegiEditImpl {
	
	//학원정보 불러오기
	public AcaInfoRegiEditDTO AcaInfoLoad(String id);
	
	//학원소개 등록 수정
	public void AcaInfoRegiEdit(String address, String detailaddress,String acaname,String telephone1,String telephone2, String telephone3, String id);//members
	public void AcaInfoRegiEdit2(String introduce, String category, String acaintrophoto, String id);//acaIntroduce
	
	//카테고리 셀렉트 옵션
	public ArrayList<CategoryDTO> categorySelect();
	
	//강사진 리스트
	public ArrayList<AcaTeacherDTO> TeacherList(String id);
	
	//강사진 등록
	public void TeacherRegi(String teaimage, String teaname, String teaintro, String subject, String id);
	
	
	//강의시간표 리스트
	public ArrayList<AcaClassDTO> ClassList(String id);
	
	//강의등록
	public void ClassRegi(AcaClassDTO acaClassDTO);
	
	
	//강사정보 뷰
	public void teacherView(AcaTeacherDTO acaTeacherDTO, String id);
	//강사정보 수정
	public void teaInfoUpd(AcaTeacherDTO acaTeacherDTO);
	//강사정보 삭제
	public void teaInfoDel(AcaTeacherDTO acaTeacherDTO);
	
	//강의정보 뷰
	public AcaClassDTO classView(String classidx);
	//강의정보 수정
	public void classInfoUpd(AcaClassDTO acaClassDTO);
	//강의정보 삭제
	public void classDel(AcaClassDTO acaClassDTO);

	
	
	
}
