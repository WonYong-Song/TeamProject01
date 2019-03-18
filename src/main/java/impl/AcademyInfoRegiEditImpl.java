package impl;

import dto.AcaInfoRegiEditDTO;
import mybatis01.AcaTeacherDTO;

public interface AcademyInfoRegiEditImpl {
	
	//학원정보 불러오기
	public AcaInfoRegiEditDTO AcaInfoLoad(String idx);
	
	//학원소개 등록 
	public void AcaInfoRegiEdit(AcaInfoRegiEditDTO acaInfoRegiEditDTO, String id);//members
	public void AcaInfoRegiEdit2(AcaInfoRegiEditDTO acaInfoRegiEditDTO, String id);//acaIntroduce
	
	//강사진 리스트
	public void TeacherList(AcaTeacherDTO teaDTO, String id);
	
	//강사진 등록
	public void TeacherRegi2()
	//강의시간표 리스트
	
	//강의등록
}
