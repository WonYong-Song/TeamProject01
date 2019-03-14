package mybatis01;

import java.sql.Date;

public class MemberDTO {
	////////////////////////
	//// Member 일반회원 /// 
	////////////////////////
	
	private String memberId; 		//아이디
	private String memberPass; 		//비밀번호
	private java.sql.Date regidate; //가입일
	private String emailId; 		//이메일 아이디
	private String emailDomain; 	//이메일도메인
	private String phoneNumber; 	//휴대폰번호
	private String interest; 		//관심사 키워드
	
	//기본생성자
	public MemberDTO() {}
	
	//인자생성자
	public MemberDTO(String memberId, String memberPass, Date regidate, String emailId, String emailDomain,
			String phoneNumber, String interest) {
		super();
		this.memberId = memberId;
		this.memberPass = memberPass;
		this.regidate = regidate;
		this.emailId = emailId;
		this.emailDomain = emailDomain;
		this.phoneNumber = phoneNumber;
		this.interest = interest;
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

	public java.sql.Date getRegidate() {
		return regidate;
	}

	public void setRegidate(java.sql.Date regidate) {
		this.regidate = regidate;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getEmailDomain() {
		return emailDomain;
	}

	public void setEmailDomain(String emailDomain) {
		this.emailDomain = emailDomain;
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
	
	
	
	

}
