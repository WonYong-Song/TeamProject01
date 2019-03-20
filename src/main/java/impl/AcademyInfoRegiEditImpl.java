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
	public void ClassRegi(String acastartdate,String acaenddate,String acaday,String acastarttime,String acaendtime,
			String acaclassname,String pay, String numberofparticipants, String teaidx);
}
