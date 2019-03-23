package dto;

public class AcaInfoRegiEditDTO {
	//members
	private String id;
	private int idx;
	private String grade;
	private String telephone1;
	private String address;
	private String detailaddress;
	private String acaname;
	private String telephone2;
	private String telephone3;
	
	//학원소개
	private	String introduce;
	private String category;
	private String acaintrophoto;
	private String acaintrophotouu;
	
	public String getAcaintrophotouu() {
		return acaintrophotouu;
	}



	public void setAcaintrophotouu(String acaintrophotouu) {
		this.acaintrophotouu = acaintrophotouu;
	}



	public AcaInfoRegiEditDTO() {}

	

	public AcaInfoRegiEditDTO(String id, int idx, String grade, String telephone1,
			String address, String detailaddress, String acaname, String telephone2, String telephone3,
			String introduce, String category, String acaintrophoto) {
		this.id = id;
		this.idx = idx;
		this.grade = grade;
		this.telephone1 = telephone1;
		this.address = address;
		this.detailaddress = detailaddress;
		this.acaname = acaname;
		this.telephone2 = telephone2;
		this.telephone3 = telephone3;
		this.introduce = introduce;
		this.category = category;
		this.acaintrophoto = acaintrophoto;
	}



	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
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

	public String getAcaname() {
		return acaname;
	}

	public void setAcaname(String acaname) {
		this.acaname = acaname;
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

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getAcaintrophoto() {
		return acaintrophoto;
	}

	public void setAcaintrophoto(String acaintrophoto) {
		this.acaintrophoto = acaintrophoto;
	}
}
