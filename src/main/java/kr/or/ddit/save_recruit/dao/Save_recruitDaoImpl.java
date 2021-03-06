package kr.or.ddit.save_recruit.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.save_recruit.model.Save_recruitVo;

@Repository("save_recruitDao")
public class Save_recruitDaoImpl implements ISave_recruitDao{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	/**
	 * 
	 * Method : insertSrecr
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param sVo
	 * @return
	 * Method 설명 : 채용공고저장 등록.
	 */
	@Override
	public int insertSrecr(Save_recruitVo sVo) {
		int insertCnt = sqlSessionTemplate.insert("srecr.insertSrecr", sVo);
		
		return insertCnt;
	}

	/**
	 * 
	 * Method : deleteForTest
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param save_code
	 * @return
	 * Method 설명 : 테스트를 위한 채용공고저장 삭제.
	 */
	@Override
	public int deleteForTest(String save_code) {
		int deleteCnt = sqlSessionTemplate.delete("srecr.deleteForTest", save_code);
		
		return deleteCnt;
	}

	/**
	 * 
	 * Method : getSrecrCnt
	 * 작성자 : PC19
	 * 변경이력 :
	 * @return
	 * Method 설명 : 전체 채용공고저장 수 조회.
	 */
	@Override
	public int getSrecrCnt() {
		int srecrCnt = sqlSessionTemplate.selectOne("srecr.getSrecrCnt");
		
		return srecrCnt;
	}

	/**
	 * 
	 * Method : getUserSrecrList
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 특정 유저의 전체 채용공고저장 목록 조회.
	 */
	@Override
	public List<Save_recruitVo> getUserSrecrList(String user_id) {
		List<Save_recruitVo> uSRList = sqlSessionTemplate.selectList("srecr.getUserSrecrList", user_id);
		
		return uSRList;
	}

	/**
	 * 
	 * Method : getLastSrecr
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param tempSVo
	 * @return
	 * Method 설명 : 특정 채용공고저장 중 마지막 항목 조회.
	 */
	@Override
	public Save_recruitVo getLastSrecr(Save_recruitVo tempSVo) {
		Save_recruitVo sVo = sqlSessionTemplate.selectOne("srecr.getLastSrecr", tempSVo);
		
		return sVo;
	}

	/**
	 * 
	 * Method : getSrecr
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param recruit_code
	 * @return
	 * Method 설명 : 특정 채용공고저장 목록 조회.
	 */
	@Override
	public List<Save_recruitVo> getSrecr(String recruit_code) {
		List<Save_recruitVo> srecrList = sqlSessionTemplate.selectList("srecr.getSrecr", recruit_code);
		
		return srecrList;
	}

	/**
	 * 
	 * Method : updateSrecr
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param sVo
	 * @return
	 * Method 설명 : 채용공고저장 수정.
	 */
	@Override
	public int updateSrecr(Save_recruitVo sVo) {
		int updateCnt = sqlSessionTemplate.update("srecr.updateSrecr", sVo);
		
		return updateCnt;
	}

	/**
	 * 
	 * Method : getSSrecrList
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param sVo
	 * @return
	 * Method 설명 : 특정 유저가 스크랩한 채용공고 목록 조회.
	 */
	@Override
	public List<Save_recruitVo> getSSrecrList(Save_recruitVo sVo) {
		List<Save_recruitVo> sSrecrList = sqlSessionTemplate.selectList("srecr.getSSrecrList", sVo);
		
		return sSrecrList;
	}

	/**
	 * 
	 * Method : getAppList
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param tempSVo
	 * @return
	 * Method 설명 : 특정 유저가 지원한 채용공고 목록 조회.
	 */
	@Override
	public List<Save_recruitVo> getAppList(Save_recruitVo tempSVo) {
		List<Save_recruitVo> appList = sqlSessionTemplate.selectList("srecr.getAppList", tempSVo);
		
		return appList;
	}

	/**
	 * 
	 * Method : getULSrecr
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param mem_id
	 * @return
	 * Method 설명 : 특정 유저의 마지막 채용공고저장 조회.
	 */
	@Override
	public Save_recruitVo getULSrecr(String mem_id) {
		Save_recruitVo sVo = sqlSessionTemplate.selectOne("srecr.getULSrecr", mem_id);
		
		return sVo;
	}
	
}
