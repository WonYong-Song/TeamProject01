package impl;

import java.util.ArrayList;

import dto.AcaClassDTO;
import dto.AcaInfoRegiEditDTO;
import mybatis01.AcaTeacherDTO;

public interface AcademyInfoRegiEditImpl {
	
	//학원정보 불러오기
	public AcaInfoRegiEditDTO AcaInfoLoad(String id);
	
	//학원소개 등록 
	public void AcaInfoRegiEdit(AcaInfoRegiEditDTO acaInfoRegiEditDTO, String id);//members
	public void AcaInfoRegiEdit2(AcaInfoRegiEditDTO acaInfoRegiEditDTO, String id);//acaIntroduce
	
	//카테고리 셀렉트 옵션
	public ArrayList<AcaInfoRegiEditDTO> categorytList(String category);
	
	/*//강사진 리스트
	public ArrayList<AcaTeacherDTO> TeacherList(String id);
	
	//강사진 등록
	public void TeacherRegi2(AcaTeacherDTO teaDTO, String id);
	
	//강의시간표 리스트
	public ArrayList<AcaClassDTO> ClassList(String teaIdx);
	
	//강의등록
	public void ClassRegi(AcaClassDTO teaDTO, String teaIdx);*/
}
