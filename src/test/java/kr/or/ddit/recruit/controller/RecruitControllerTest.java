package kr.or.ddit.recruit.controller;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.corporation.service.ICorporationService;
import kr.or.ddit.recruit.model.RecruitVo;
import kr.or.ddit.recruit.service.IRecruitService;
import kr.or.ddit.test.WebTestConfig;

public class RecruitControllerTest extends WebTestConfig{

	@Resource(name="corporationService")
	private ICorporationService corpService;
	
	@Resource(name="recruitService")
	private IRecruitService recrService;	
	
	/**
	 * 
	 * Method : testRecr_detail
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 채용공고 상세조회 페이지 테스트.
	 * @throws Exception 
	 */
	@Test
	public void testRecr_detail() throws Exception {
		/***Given***/
		String recruit_code = "1";
		
		/***When***/
		MvcResult mvcResult = mockMvc.perform(get("/recr_detail").param("recruit_code", recruit_code)).andReturn();
		ModelAndView mav = mvcResult.getModelAndView();
		String viewName = mav.getViewName();
		
		RecruitVo rVo = (RecruitVo) mav.getModel().get("recr");
		CorporationVo cVo = (CorporationVo) mav.getModel().get("corp");
		
		/***Then***/
		assertEquals("recr_detailTiles", viewName);
		assertNotNull(rVo);
		assertNotNull(cVo);
	}

	
	
	
}



