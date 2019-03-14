package mybatis01;

public class AcaTeacherDTO {
	private	String teaimage;
	private	String teaname;
	private	String teaintro;
	private	String subject;
	private	String acaidx;
	private	String teaidx;
	
	public AcaTeacherDTO() {

	}

	public AcaTeacherDTO(String teaimage, String teaname, String teaintro, String subject, String acaidx,
			String teaidx) {
		super();
		this.teaimage = teaimage;
		this.teaname = teaname;
		this.teaintro = teaintro;
		this.subject = subject;
		this.acaidx = acaidx;
		this.teaidx = teaidx;
	}

	public String getTeaimage() {
		return teaimage;
	}

	public void setTeaimage(String teaimage) {
		this.teaimage = teaimage;
	}

	public String getTeaname() {
		return teaname;
	}

	public void setTeaname(String teaname) {
		this.teaname = teaname;
	}

	public String getTeaintro() {
		return teaintro;
	}

	public void setTeaintro(String teaintro) {
		this.teaintro = teaintro;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getAcaidx() {
		return acaidx;
	}

	public void setAcaidx(String acaidx) {
		this.acaidx = acaidx;
	}

	public String getTeaidx() {
		return teaidx;
	}

	public void setTeaidx(String teaidx) {
		this.teaidx = teaidx;
	}
	
	
	
	
}
