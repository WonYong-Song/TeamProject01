package mybatis01;

public class AcademyMemberDTO {
	private String AcaIdx;
	private String AcaID;
	private String AcaPass;
	private String AcaReqName;
	private String AcaPhoneNumber;
	private String AcaHPNumber;
	private String AcaName;
	private String AcaAddress;
	private String AcaDetailAddress;
	private String AcaEmail;
	private String AcaEmainDomain;
	private double Avg;
	private String RatingStar;
	
	public AcademyMemberDTO() {}
	
	

	public AcademyMemberDTO(String acaIdx, String acaID, String acaPass, String acaReqName, String acaPhoneNumber,
			String acaHPNumber, String acaName, String acaAddress, String acaDetailAddress, String acaEmail,
			String acaEmainDomain, double avg, String ratingStar) {
		super();
		AcaIdx = acaIdx;
		AcaID = acaID;
		AcaPass = acaPass;
		AcaReqName = acaReqName;
		AcaPhoneNumber = acaPhoneNumber;
		AcaHPNumber = acaHPNumber;
		AcaName = acaName;
		AcaAddress = acaAddress;
		AcaDetailAddress = acaDetailAddress;
		AcaEmail = acaEmail;
		AcaEmainDomain = acaEmainDomain;
		Avg = avg;
		RatingStar = ratingStar;
	}



	public AcademyMemberDTO(String acaIdx, String acaID, String acaPass, String acaReqName, String acaPhoneNumber,
			String acaHPNumber, String acaName, String acaAddress, String acaDetailAddress, String acaEmail,
			String acaEmainDomain) {
		super();
		AcaIdx = acaIdx;
		AcaID = acaID;
		AcaPass = acaPass;
		AcaReqName = acaReqName;
		AcaPhoneNumber = acaPhoneNumber;
		AcaHPNumber = acaHPNumber;
		AcaName = acaName;
		AcaAddress = acaAddress;
		AcaDetailAddress = acaDetailAddress;
		AcaEmail = acaEmail;
		AcaEmainDomain = acaEmainDomain; 
	}
	
	public String getRatingStar() {
		return RatingStar;
	}


	public void setRatingStar(String ratingStar) {
		RatingStar = ratingStar;
	}



	public double getAvg() {
		return Avg;
	}

	public void setAvg(double temp) {
		Avg = temp;
	}

	public String getAcaIdx() {
		return AcaIdx;
	}

	public void setAcaIdx(String acaIdx) {
		AcaIdx = acaIdx;
	}

	public String getAcaID() {
		return AcaID;
	}

	public void setAcaID(String acaID) {
		AcaID = acaID;
	}

	public String getAcaPass() {
		return AcaPass;
	}

	public void setAcaPass(String acaPass) {
		AcaPass = acaPass;
	}

	public String getAcaReqName() {
		return AcaReqName;
	}

	public void setAcaReqName(String acaReqName) {
		AcaReqName = acaReqName;
	}

	public String getAcaPhoneNumber() {
		return AcaPhoneNumber;
	}

	public void setAcaPhoneNumber(String acaPhoneNumber) {
		AcaPhoneNumber = acaPhoneNumber;
	}

	public String getAcaHPNumber() {
		return AcaHPNumber;
	}

	public void setAcaHPNumber(String acaHPNumber) {
		AcaHPNumber = acaHPNumber;
	}

	public String getAcaName() {
		return AcaName;
	}

	public void setAcaName(String acaName) {
		AcaName = acaName;
	}

	public String getAcaAddress() {
		return AcaAddress;
	}

	public void setAcaAddress(String acaAddress) {
		AcaAddress = acaAddress;
	}

	public String getAcaDetailAddress() {
		return AcaDetailAddress;
	}

	public void setAcaDetailAddress(String acaDetailAddress) {
		AcaDetailAddress = acaDetailAddress;
	}

	public String getAcaEmail() {
		return AcaEmail;
	}

	public void setAcaEmail(String acaEmail) {
		AcaEmail = acaEmail;
	}

	public String getAcaEmainDomain() {
		return AcaEmainDomain;
	}

	public void setAcaEmainDomain(String acaEmainDomain) {
		AcaEmainDomain = acaEmainDomain;
	}
	
	
}
