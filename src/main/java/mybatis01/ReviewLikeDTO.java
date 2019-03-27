package mybatis01;

public class ReviewLikeDTO {
	private String idx;
	private String Countlike;
	private String id;
	private String reviewidx;
	
	public ReviewLikeDTO(String idx, String countlike, String id, String reviewidx) {
		super();
		this.idx = idx;
		Countlike = countlike;
		this.id = id;
		this.reviewidx = reviewidx;
	}

	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getCountlike() {
		return Countlike;
	}

	public void setCountlike(String countlike) {
		Countlike = countlike;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getReviewidx() {
		return reviewidx;
	}

	public void setReviewidx(String reviewidx) {
		this.reviewidx = reviewidx;
	}
	
	
	
}
