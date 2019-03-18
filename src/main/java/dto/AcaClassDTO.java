package dto;

import java.sql.Date;

public class AcaClassDTO {
	private java.sql.Date acaStartDate;
	private java.sql.Date acaEndDate;
	private String acaDay;
	private java.sql.Date acaStartTime;
	private java.sql.Date acaEndTime;
	private String acaClassName;
	private int NumberOfParticipants;
	private int classIdx;
	private int TeaIdx;
	
	public AcaClassDTO() {}
	
	public AcaClassDTO(Date acaStartDate, Date acaEndDate, String acaDay, Date acaStartTime, Date acaEndTime,
			String acaClassName, int numberOfParticipants, int classIdx, int teaIdx) {
		super();
		this.acaStartDate = acaStartDate;
		this.acaEndDate = acaEndDate;
		this.acaDay = acaDay;
		this.acaStartTime = acaStartTime;
		this.acaEndTime = acaEndTime;
		this.acaClassName = acaClassName;
		NumberOfParticipants = numberOfParticipants;
		this.classIdx = classIdx;
		TeaIdx = teaIdx;
	}

	public java.sql.Date getAcaStartDate() {
		return acaStartDate;
	}

	public void setAcaStartDate(java.sql.Date acaStartDate) {
		this.acaStartDate = acaStartDate;
	}

	public java.sql.Date getAcaEndDate() {
		return acaEndDate;
	}

	public void setAcaEndDate(java.sql.Date acaEndDate) {
		this.acaEndDate = acaEndDate;
	}

	public String getAcaDay() {
		return acaDay;
	}

	public void setAcaDay(String acaDay) {
		this.acaDay = acaDay;
	}

	public java.sql.Date getAcaStartTime() {
		return acaStartTime;
	}

	public void setAcaStartTime(java.sql.Date acaStartTime) {
		this.acaStartTime = acaStartTime;
	}

	public java.sql.Date getAcaEndTime() {
		return acaEndTime;
	}

	public void setAcaEndTime(java.sql.Date acaEndTime) {
		this.acaEndTime = acaEndTime;
	}

	public String getAcaClassName() {
		return acaClassName;
	}

	public void setAcaClassName(String acaClassName) {
		this.acaClassName = acaClassName;
	}

	public int getNumberOfParticipants() {
		return NumberOfParticipants;
	}

	public void setNumberOfParticipants(int numberOfParticipants) {
		NumberOfParticipants = numberOfParticipants;
	}

	public int getClassIdx() {
		return classIdx;
	}

	public void setClassIdx(int classIdx) {
		this.classIdx = classIdx;
	}

	public int getTeaIdx() {
		return TeaIdx;
	}

	public void setTeaIdx(int teaIdx) {
		TeaIdx = teaIdx;
	}
	
	

	
	
	
		
}
