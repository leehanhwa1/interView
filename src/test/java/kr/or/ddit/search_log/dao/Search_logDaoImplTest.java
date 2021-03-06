package kr.or.ddit.search_log.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Before;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.search_log.model.Search_logVo;
import kr.or.ddit.search_log.service.ISearch_logService;
import kr.or.ddit.test.LogicTestConfig;

public class Search_logDaoImplTest extends LogicTestConfig{
	private Logger logger = LoggerFactory.getLogger(Search_logDaoImplTest.class);
	
	@Resource(name="search_logDao")
	private ISearch_logDao sLogDao;
	
	@Before
	public void setup(){
		// insert 테스트를 위해 먼저 delete를 실행. - insert 테스트 메서드 안으로 이동.
		//search_logDao.deleteSearch_logForTest("2");
	}
	
	/**
	 * 
	 * Method : testGetAllCnt
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 전체 검색내역 수 조회 테스트
	 */
	@Test
	public void testGetAllCnt() {
		/***Given***/
		
		/***When***/
		int search_logCnt = sLogDao.getAllCnt();

		/***Then***/
		assertNotNull(search_logCnt);
	}
	
	/**
	 * 
	 * Method : testInsertSearch_log
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 검색내역 등록 테스트.
	 */
	@Test
	public void testInsertSearch_log(){
		/***Given***/
		sLogDao.deleteSearch_logForTest("2");
		
		Search_logVo sVo = new Search_logVo();
		sVo.setSearch_code("2");
		sVo.setSearch_word("google");
		sVo.setSearch_local("대전");
		sVo.setUser_id("brown");
		sVo.setSearch_save("1");
		sVo.setSearch_alarm("2");
//		sVo.setDel_flag("1");
		
		/***When***/
		int insertCnt = sLogDao.insertSearch_log(sVo);

		/***Then***/
		assertEquals(1, insertCnt);
	}

	/**
	 * 
	 * Method : testGetSaveList
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 저장한 검색어 리스트 조회 테스트.
	 */
	@Test
	public void testGetSaveList(){
		/***Given***/
		Search_logVo sVo = new Search_logVo();
		sVo.setUser_id("brown");
		sVo.setSearch_save("2");
		sVo.setDel_flag("2");
		
		/***When***/
		List<Search_logVo> saveList = sLogDao.getSaveList(sVo);
		
		/***Then***/
		assertNotNull(saveList);
//		assertEquals(10, saveList.size());
	}
	
	/**
	 * 
	 * Method : testGetSearch_log
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 특정 검색내역 조회 테스트.
	 */
	@Test
	public void testGetSearch_log() {
		/***Given***/

		/***When***/
		Search_logVo sVo = sLogDao.getSearch_log("1");
		logger.debug("sVo - word : {}", sVo.getSearch_word());

		/***Then***/
		assertNotNull(sVo);
	}
	
	/**
	 * 
	 * Method : testUpdateSLogNotDel
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 검색내역 수정 (del_flag가 '1'인 경우) 테스트.
	 */
	@Test
	public void testUpdateSLogNotDel() {
		/***Given***/
		Search_logVo sVo = sLogDao.getSearch_log("11");
		sVo.setSearch_alarm("1");

		/***When***/
		int updateCnt = sLogDao.updateSLogNotDel(sVo);

		/***Then***/
		assertNotNull(updateCnt);
	}
	
	
	
}









