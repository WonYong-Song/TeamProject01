package dto;

public class AcaClassDTO {
	private String acastartdate;
	private String acaenddate;
	private String acaday;
	private String acastarttime;
	private String acaendtime;
	private String acaclassname;
	private String numberofparticipants;
	private String classidx;
	private String teaidx;
	private String pay;
	private String teaname;

	private String startd;
	private String endd;
	
	private String startt;
	private String endt;
	
	private String acaname; //app에서 사용을하기위한 변수
	private String classmembers;//원용이가 만든 맴버변수 - app에서 사용하며 맵퍼에서 현재수강인원을 가져오기위해서 사용함 
	
	public AcaClassDTO() {}

	public AcaClassDTO(String acastartdate, String acaenddate, String acaday, String acastarttime, String acaendtime,
			String acaclassname, String numberofparticipants, String classidx, String teaidx, String pay,
			String teaname, String startd, String endd) {
		this.acastartdate = acastartdate;
		this.acaenddate = acaenddate;
		this.acaday = acaday;
		this.acastarttime = acastarttime;
		this.acaendtime = acaendtime;
		this.acaclassname = acaclassname;
		this.numberofparticipants = numberofparticipants;
		this.classidx = classidx;
		this.teaidx = teaidx;
		this.pay = pay;
		this.teaname = teaname;
		this.startd = startd;
		this.endd = endd;
	}

	public AcaClassDTO(String acastartdate, String acaenddate, String acaday, String acastarttime, String acaendtime,
			String acaclassname, String numberofparticipants, String classidx, String teaidx, String pay,
			String teaname, String startd, String endd, String startt, String endt) {
		this.acastartdate = acastartdate;
		this.acaenddate = acaenddate;
		this.acaday = acaday;
		this.acastarttime = acastarttime;
		this.acaendtime = acaendtime;
		this.acaclassname = acaclassname;
		this.numberofparticipants = numberofparticipants;
		this.classidx = classidx;
		this.teaidx = teaidx;
		this.pay = pay;
		this.teaname = teaname;
		this.startd = startd;
		this.endd = endd;
		this.startt = startt;
		this.endt = endt;
	}

	public String getAcastartdate() {
		return acastartdate;
	}


	public void setAcastartdate(String acastartdate) {
		this.acastartdate = acastartdate;
	}


	public String getAcaenddate() {
		return acaenddate;
	}


	public void setAcaenddate(String acaenddate) {
		this.acaenddate = acaenddate;
	}


	public String getAcaday() {
		return acaday;
	}


	public void setAcaday(String acaday) {
		this.acaday = acaday;
	}


	public String getAcastarttime() {
		return acastarttime;
	}


	public void setAcastarttime(String acastarttime) {
		this.acastarttime = acastarttime;
	}


	public String getAcaendtime() {
		return acaendtime;
	}


	public void setAcaendtime(String acaendtime) {
		this.acaendtime = acaendtime;
	}


	public String getAcaclassname() {
		return acaclassname;
	}


	public void setAcaclassname(String acaclassname) {
		this.acaclassname = acaclassname;
	}


	public String getNumberofparticipants() {
		return numberofparticipants;
	}


	public void setNumberofparticipants(String numberofparticipants) {
		this.numberofparticipants = numberofparticipants;
	}


	public String getClassidx() {
		return classidx;
	}


	public void setClassidx(String classidx) {
		this.classidx = classidx;
	}


	public String getTeaidx() {
		return teaidx;
	}


	public void setTeaidx(String teaidx) {
		this.teaidx = teaidx;
	}


	public String getPay() {
		return pay;
	}


	public void setPay(String pay) {
		this.pay = pay;
	}


	public String getTeaname() {
		return teaname;
	}


	public void setTeaname(String teaname) {
		this.teaname = teaname;
	}

	public String getStartd() {
		return startd;
	}

	public void setStartd(String startd) {
		this.startd = startd;
	}

	public String getEndd() {
		return endd;
	}

	public void setEndd(String endd) {
		this.endd = endd;
	}

	public String getStartt() {
		return startt;
	}

	public void setStartt(String startt) {
		this.startt = startt;
	}

	public String getEndt() {
		return endt;
	}

	public void setEndt(String endt) {
		this.endt = endt;
	}
	
	public String getClassmembers() {
		return classmembers;
	}

	public void setClassmembers(String classmembers) {
		this.classmembers = classmembers;
	}

	public String getAcaname() {
		return acaname;
	}

	public void setAcaname(String acaname) {
		this.acaname = acaname;
	}
}
	