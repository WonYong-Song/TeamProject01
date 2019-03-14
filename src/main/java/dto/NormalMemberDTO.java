package dto;

import java.sql.Date;

public class NormalMemberDTO {
	private String memberId;
	private String memberPass;
	private Date regidate;
	private String emainId;
	private String emainDomain;
	private String phoneNumber;
	private String interest; 
	private String memberName;
	//기본생성자
	public NormalMemberDTO() {}
	//인자생성자
	public NormalMemberDTO(String memberId, String memberPass, Date regidate, String emainId, String emainDomain,
			String phoneNumber, String interest, String memberName) {
		super();
		this.memberId = memberId;
		this.memberPass = memberPass;
		this.regidate = regidate;
		this.emainId = emainId;
		this.emainDomain = emainDomain;
		this.phoneNumber = phoneNumber;
		this.interest = interest;
		this.memberName = memberName;
	}
	//getter/setter
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPass() {
		return memberPass;
	}
	public void setMemberPass(String memberPass) {
		this.memberPass = memberPass;
	}
	public Date getRegidate() {
		return regidate;
	}
	public void setRegidate(Date regidate) {
		this.regidate = regidate;
	}
	public String getEmainId() {
		return emainId;
	}
	public void setEmainId(String emainId) {
		this.emainId = emainId;
	}
	public String getEmainDomain() {
		return emainDomain;
	}
	public void setEmainDomain(String emainDomain) {
		this.emainDomain = emainDomain;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getInterest() {
		return interest;
	}
	public void setInterest(String interest) {
		this.interest = interest;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	
	
}
