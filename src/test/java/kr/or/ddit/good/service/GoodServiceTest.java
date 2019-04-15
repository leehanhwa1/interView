package kr.or.ddit.good.service;

import static org.junit.Assert.*;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.corporation.service.ICorporationService;
import kr.or.ddit.good.model.GoodVo;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.test.LogicTestConfig;
import kr.or.ddit.users.model.UsersVo;
import kr.or.ddit.users.service.IUsersService;

public class GoodServiceTest extends LogicTestConfig {

	private Logger logger = LoggerFactory.getLogger(GoodServiceTest.class);
	
	@Resource(name="goodService")
	IGoodService goodService;
	
	@Resource(name="memberService")
	IMemberService memberSerivce;
	
	@Resource(name="usersService")
	IUsersService usersService;
	
	@Resource(name="corporationService")
	ICorporationService corpService;

	@Test
	public void testInsert_goodInfo() {
		/***Given***/
		GoodVo goodVo = new GoodVo();
		
		/***When***/
		goodVo.setRef_code("138");
		goodVo.setDivision("28");
		goodVo.setMem_id("jin");
		
		int insertCnt = goodService.insert_goodInfo(goodVo);
		
		/***Then***/
		assertEquals(1, insertCnt);
	}
	
	@Test
	public void testDelete_goodInfo(){
		/***Given***/
		
		/***When***/
		int deleteCnt = goodService.delete_goodInfo("1");
		
		/***Then***/
		assertEquals(1, deleteCnt);
	}
	
	@Test
	public void testSelect_goodInfo(){
		/***Given***/
		
		/***When***/
		List<GoodVo> goodList = goodService.select_goodInfo("jin");
		for(int i=0; i<goodList.size(); i++){
			logger.debug("good info : {}", goodList.get(i).getGood_code());
		}
		
		/***Then***/
		assertTrue(goodList.size() > 0);
	}
	
	@Test
	public void testSelect_goodCount(){
		/***Given***/
		GoodVo goodVo = new GoodVo();
		
		/***When***/
		goodVo.setDivision("28");
		goodVo.setRef_code("138");
		
		int goodCnt = goodService.select_goodCount(goodVo);
		logger.debug("good count : {}", goodCnt);
		
		/***Then***/
		assertTrue(goodCnt > 0);
	}
	
	@Test
	public void testSelect_pushGoodMember(){
		/***Given***/
		GoodVo goodVo 	   = new GoodVo();
		MemberVo member    = new MemberVo();
		UsersVo users	   = new UsersVo();
		CorporationVo corp = new CorporationVo();
		
		String introduce   = "";
		String member_name = "";
		
		/***When***/
		goodVo.setDivision("28");
		goodVo.setRef_code("138");
		
		List<GoodVo> goodinfo = goodService.select_pushGoodMember(goodVo);
		for(int i=0; i<goodinfo.size(); i++){
			logger.debug("good push member : {}", goodinfo.get(i).getMem_id());
			
			member = memberSerivce.select_memberInfo(goodinfo.get(i).getMem_id());
			if(member.getMem_division().equals("1")){
				Map<String, Object> map = usersService.select_introduce(member.getMem_id());
				UsersVo usersVo = (UsersVo) map.get("usersVo");
				introduce 	= usersVo.getIntroduce();
				users = usersService.select_userInfo(member.getMem_id());
				member_name = users.getUser_name();
				
				
				logger.debug("user info : {}, {}", member_name, introduce);
			} else if(member.getMem_division().equals("2")) {
				corp = corpService.select_corpInfo(member.getMem_id());
				member_name = corp.getCorp_name();
				
				logger.debug("corp info : {}", member_name);
			} else {
				
			}
		}
		
		/***Then***/
		assertTrue(goodinfo.size() > 0);
	}

}
