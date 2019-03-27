package impl;

import java.util.HashMap;

public interface ReviewLikeImpl {
	//좋아요 체크하기
	void like_check(String user_id, String reviewidx);
	//좋아요취소 하기
	void like_cancel(String user_id, String reviewidx);
	//사용자의 아이디로된 좋아요가 있는지 없는지판별하는 부분
	int likeidentefy(String user_id, String reviewidx);

}
