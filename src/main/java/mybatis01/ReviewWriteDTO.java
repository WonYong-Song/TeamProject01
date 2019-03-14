package mybatis01;

public class ReviewWriteDTO {
	private String acaIdx;
	private int acaScore;
	private String memberId;
	private String reviewContents;
	
	public ReviewWriteDTO() {}

	public ReviewWriteDTO(String acaIdx, int acaScore, String memberId, String reviewContents) {
		super();
		this.acaIdx = acaIdx;
		this.acaScore = acaScore;
		this.memberId = memberId;
		this.reviewContents = reviewContents;
	}

	public String getAcaIdx() {
		return acaIdx;
	}

	public void setAcaIdx(String acaIdx) {
		this.acaIdx = acaIdx;
	}

	public int getAcaScore() {
		return acaScore;
	}

	public void setAcaScore(int acaScore) {
		this.acaScore = acaScore;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getReviewContents() {
		return reviewContents;
	}

	public void setReviewContents(String reviewContents) {
		this.reviewContents = reviewContents;
	}
	
	
	
}
