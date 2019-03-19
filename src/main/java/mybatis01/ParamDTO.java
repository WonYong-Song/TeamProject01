package mybatis01;

public class ParamDTO {
	//멤버변수
	private String keyField;//검색필드
	private String keyString;//검색어
	private int start;//select 시작값
	private int end;//select 종료값
	private String acaidx;
	private String user_id;
	
	
	//기본생성자
	/*
	해당 DTO객체는 Mybatis의 Mapper파일로 파라미터 전달용도로
	생성한 객체로 전달되는 시점에 DTO객체가 NULL값이면 
	예외가 발생하기때문에 기본생성자에서 객체는 빈값으로 
	초기화 해줘야 한다. 
	 */
	public ParamDTO() {
		this.keyField = "";
		this.keyString = "";
		this.start = 0;
		this.end = 0;
		this.acaidx ="";
	}
	//인자생성자1
	public ParamDTO(String keyField, String keyString, int start, int end) {
		 
		this.keyField = keyField;
		this.keyString = keyString;
		this.start = start;
		this.end = end;
	}	
	//인자생성자2
	public ParamDTO(String keyField, String keyString, int start, int end, String acaidx) {
		super();
		this.keyField = keyField;
		this.keyString = keyString;
		this.start = start;
		this.end = end;
		this.acaidx = acaidx;
	}
	
	
	public ParamDTO(String keyField, String keyString, int start, int end, String acaidx, String user_id) {
		super();
		this.keyField = keyField;
		this.keyString = keyString;
		this.start = start;
		this.end = end;
		this.acaidx = acaidx;
		this.user_id = user_id;
	}
	
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getAcaidx() {
		return acaidx;
	}
	public void setAcaidx(String acaidx) {
		this.acaidx = acaidx;
	}
	//getter/setter
	public String getKeyField() {
		return keyField;
	}
	
	public void setKeyField(String keyField) {
		this.keyField = keyField;
	}
	public String getKeyString() {
		return keyString;
	}
	public void setKeyString(String keyString) {
		this.keyString = keyString;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}

}
