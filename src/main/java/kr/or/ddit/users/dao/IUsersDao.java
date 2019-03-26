package kr.or.ddit.users.dao;

import kr.or.ddit.users.model.UsersVo;

public interface IUsersDao {

	/**
	 * 
	 * Method : select_userInfo
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 회원정보 조회.
	 */
	UsersVo select_userInfo(String user_id);
}
