package mybatis01;

public class AcademyMemberDTO {
	private String id;
	private String pass;
	private String regidate;
	private String emailid;
	private String emaildomain;
	private String mobile1;
	private String name;
	private String idx;
	private String grade;
	private String telephone1;
	private String address;
	private String detailaddress;
	private String interest; 
	private String acaname;
	private String mobile2;
	private String mobile3;
	private String telephone2;
	private String telephone3;

	
	
	private double Avg;
	private String RatingStar;
	
	public AcademyMemberDTO() {}

	public AcademyMemberDTO(String id, String pass, String regidate, String emailid, String emaildomain, String mobile1,
			String name, String idx, String grade, String telephone1, String address, String detailaddress,
			String interest, String acaname, String mobile2, String mobile3, String telephone2, String telephone3,
			double avg) {
		super();
		this.id = id;
		this.pass = pass;
		this.regidate = regidate;
		this.emailid = emailid;
		this.emaildomain = emaildomain;
		this.mobile1 = mobile1;
		this.name = name;
		this.idx = idx;
		this.grade = grade;
		this.telephone1 = telephone1;
		this.address = address;
		this.detailaddress = detailaddress;
		this.interest = interest;
		this.acaname = acaname;
		this.mobile2 = mobile2;
		this.mobile3 = mobile3;
		this.telephone2 = telephone2;
		this.telephone3 = telephone3;
		Avg = avg;
	}

	public AcademyMemberDTO(String id, String pass, String regidate, String emailid, String emaildomain, String mobile1,
			String name, String idx, String grade, String telephone1, String address, String detailaddress,
			String interest, String acaname, String mobile2, String mobile3, String telephone2, String telephone3,
			double avg, String ratingStar) {
		super();
		this.id = id;
		this.pass = pass;
		this.regidate = regidate;
		this.emailid = emailid;
		this.emaildomain = emaildomain;
		this.mobile1 = mobile1;
		this.name = name;
		this.idx = idx;
		this.grade = grade;
		this.telephone1 = telephone1;
		this.address = address;
		this.detailaddress = detailaddress;
		this.interest = interest;
		this.acaname = acaname;
		this.mobile2 = mobile2;
		this.mobile3 = mobile3;
		this.telephone2 = telephone2;
		this.telephone3 = telephone3;
		Avg = avg;
		RatingStar = ratingStar;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getRegidate() {
		return regidate;
	}

	public void setRegidate(String regidate) {
		this.regidate = regidate;
	}

	public String getEmailid() {
		return emailid;
	}

	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}

	public String getEmaildomain() {
		return emaildomain;
	}

	public void setEmaildomain(String emaildomain) {
		this.emaildomain = emaildomain;
	}

	public String getMobile1() {
		return mobile1;
	}

	public void setMobile1(String mobile1) {
		this.mobile1 = mobile1;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getTelephone1() {
		return telephone1;
	}

	public void setTelephone1(String telephone1) {
		this.telephone1 = telephone1;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDetailaddress() {
		return detailaddress;
	}

	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}

	public String getInterest() {
		return interest;
	}

	public void setInterest(String interest) {
		this.interest = interest;
	}

	public String getAcaname() {
		return acaname;
	}

	public void setAcaname(String acaname) {
		this.acaname = acaname;
	}

	public String getMobile2() {
		return mobile2;
	}

	public void setMobile2(String mobile2) {
		this.mobile2 = mobile2;
	}

	public String getMobile3() {
		return mobile3;
	}

	public void setMobile3(String mobile3) {
		this.mobile3 = mobile3;
	}

	public String getTelephone2() {
		return telephone2;
	}

	public void setTelephone2(String telephone2) {
		this.telephone2 = telephone2;
	}

	public String getTelephone3() {
		return telephone3;
	}

	public void setTelephone3(String telephone3) {
		this.telephone3 = telephone3;
	}

	public double getAvg() {
		return Avg;
	}

	public void setAvg(double avg) {
		Avg = avg;
	}

	public String getRatingStar() {
		return RatingStar;
	}

	public void setRatingStar(String ratingStar) {
		RatingStar = ratingStar;
	}
	
	


	
}
