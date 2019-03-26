package impl;

import dto.MembersDTO;
import mybatis01.ClassInfoDTO;

public interface PaymentImpl {
	//결제 처리
	public int payment(String user_id, String item_number);
	//결제된 과목의 수강정보 가져오기
	public ClassInfoDTO classInfo(String item_number);
	//결제시 다시 로그인
	public MembersDTO reLogin(String user_id);
	//해당 클래스의 신청인원을 1 더해줌
	public void numberplus(String item_number);

}
