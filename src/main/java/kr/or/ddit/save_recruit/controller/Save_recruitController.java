package kr.or.ddit.save_recruit.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.apply_recruit.model.Apply_recruitVo;
import kr.or.ddit.apply_recruit.service.IApply_recruitService;
import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.corporation.service.ICorporationService;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.recruit.model.RecruitVo;
import kr.or.ddit.recruit.service.IRecruitService;
import kr.or.ddit.save_recruit.model.Save_recruitVo;
import kr.or.ddit.save_recruit.service.ISave_recruitService;
import kr.or.ddit.search_log.model.Search_logVo;
import kr.or.ddit.search_log.service.ISearch_logService;

@Controller
public class Save_recruitController {
	private Logger logger = LoggerFactory.getLogger(Save_recruitController.class);
	
	@Resource(name="save_recruitService")
	private ISave_recruitService srecrService;

	@Resource(name="recruitService")
	private IRecruitService recrService;

	@Resource(name="corporationService")
	private ICorporationService corpService;
	
	@Resource(name="search_logService")
	private ISearch_logService sLogService;

	@Resource(name="apply_recruitService")
	private IApply_recruitService appService;

	// @채용공고저장 페이지 요청.
	@RequestMapping("/srecr")
	public String srecr(HttpSession session, Model model){
		MemberVo mVo = (MemberVo) session.getAttribute("SESSION_MEMBERVO");
		
		// 처음 srList도 ajax로 가져오도록 수정.
		
		// 저장한 검색어 리스트 (saveList) 넘기기.
		Search_logVo sVo = new Search_logVo();

		sVo.setUser_id(mVo.getMem_id());
		sVo.setSearch_save("2");
		List<Search_logVo> saveList = sLogService.getSaveList(sVo);
		
		model.addAttribute("saveList", saveList);
		
		// 지원한 채용공고 리스트 (appList) 넘기기.
		Save_recruitVo tempSVo = new Save_recruitVo();
		tempSVo.setRecr_app("t");
		tempSVo.setUser_id(mVo.getMem_id());
		
		List<Apply_recruitVo> tempList = appService.getAppList(mVo.getMem_id());
		List<RecruitVo> appList = new ArrayList<>();
		List<String> corpImgList_app = new ArrayList<>();
		List<String> corpIdList_app = new ArrayList<>();
		List<String> corpNmList_app = new ArrayList<>();
		
		if(tempList != null){
			for(int i=0; i < tempList.size(); i++){
				String recruit_code = tempList.get(i).getRecruit_code();
				
				appList.add(recrService.getRecr(recruit_code));
				
				RecruitVo rVo = recrService.getRecr(recruit_code);
				
				CorporationVo cVo = corpService.select_corpInfo(rVo.getCorp_id());
				
				corpImgList_app.add(cVo.getLogo_path());
				corpIdList_app.add(cVo.getCorp_id());
				corpNmList_app.add(cVo.getCorp_name());				
			}
		}
		
		model.addAttribute("appList", appList);
		model.addAttribute("corpNmList_app", corpNmList_app);
		model.addAttribute("corpImgList_app", corpImgList_app);
		model.addAttribute("corpIdList_app", corpIdList_app);
		
		return "srecrTiles";
	}
	
	// @채용공고 스크랩
	@RequestMapping("/scrap")
	public String scrap(String scrap_flag, HttpSession session, HttpServletRequest req, String req_page,
			Model model) {
		MemberVo mVo = (MemberVo) session.getAttribute("SESSION_MEMBERVO");
		String scrap_code = null;
		
		// 채용공고 스크랩을 한 경우. scrap_flag.substring(0, 1) -> 't'
		if( scrap_flag != null && 
				(scrap_flag.substring(0, 1).equals("t") || scrap_flag.substring(0, 1).equals("f")) ){
			// recruit_code는 scrap_flag - substring - 앞의 한글자만 빼면 됨.
			scrap_code = scrap_flag.substring(1, scrap_flag.length());
			
			List<Save_recruitVo> uSRList = new ArrayList<>();
			uSRList = srecrService.getUserSrecrList(mVo.getMem_id());
			
			// 조회한 데이터가 없는 경우 먼저 insert를 해야됨.
			boolean srecr_Flag = false;
			for(Save_recruitVo sVo : uSRList){
				if(sVo.getRecruit_code().equals(scrap_code)){
					srecr_Flag = true;
				}
			}
			
			if(uSRList.size() == 0 || srecr_Flag  == false){
				// last sVo(lSVo): 특정 채용공고저장(user_id, recruit_cod)의 마지막 항목.
				// lSVo를 잘못 가져왔네.
				Save_recruitVo lSVo = srecrService.getULSrecr(mVo.getMem_id());
				
				Save_recruitVo sVo = new Save_recruitVo();
				sVo.setRecruit_code(scrap_code);
				sVo.setSave_code(String.valueOf(srecrService.getSrecrCnt()+1));
				sVo.setSave_flag("t");
				sVo.setUser_id(mVo.getMem_id());
				
				// recr_app값을 가져와야 함.
				Save_recruitVo tempSVo = new Save_recruitVo();
				tempSVo.setUser_id(mVo.getMem_id());
				tempSVo.setRecruit_code(scrap_code);
				
				Save_recruitVo checkSVo = srecrService.getLastSrecr(tempSVo);
				String recr_app = "";
				
				if(checkSVo == null){
					recr_app = "f";
				}else{
					recr_app = checkSVo.getRecr_app();
				}
				
				sVo.setRecr_app(recr_app);
				srecrService.insertSrecr(sVo);
				
				// rRList1가 변하지 않도록 lSVo로 lVRVo를 수정. save_code는 '기존값+2'로 수정.
				int int_code = Integer.valueOf(lSVo.getSave_code());
				lSVo.setSave_code(String.valueOf(int_code+2));
				srecrService.insertSrecr(lSVo);
			}else{
				for(Save_recruitVo sVo : uSRList){
					if(sVo.getRecruit_code().equals(scrap_code)){
						if(scrap_flag.substring(0, 1).equals("t")){
							// scrap_flag를 't'로 보내면 - '스크랩 안한 항목이니까 스크랩해줘'
							// - setSave_flag("t")
							sVo.setSave_flag("t");
						}else{
							sVo.setSave_flag("f");
						}
						srecrService.updateSrecr(sVo);
					}
				}
			}
		}

		// req_page : 스크랩 처리를 요청한 페이지 이름.
		// 없으면 채용공고 페이지. 
		// 'srecr'은 저장한 채용공고 페이지. 
		// 'srListAjax'는 저장한 채용공고 리스트 ajax.
		// 'rRList1Ajax'는 추천 채용공고1 리스트 ajax.
		if(req_page != null && req_page.equals("srecr")){
			return "redirect:" + req.getContextPath() + "/srecr";
		}else if(req_page != null && req_page.equals("srListAjax")){
			return "redirect:" + req.getContextPath() + "/srListAjaxHtml";
		}else if(req_page != null && req_page.equals("rRList1Ajax")){
			return "redirect:" + req.getContextPath() + "/rRList1AjaxHtml";
		}else if(req_page != null && req_page.equals("recr_detail")){
			model.addAttribute("recruit_code", scrap_code);
			return "redirect:" + req.getContextPath() + "/recr_detail";
		}
		
		return "redirect:" + req.getContextPath() + "/recruit";
	}
	
	// @저장한 채용공고 리스트 스크랩 취소 ajax.
	@RequestMapping("/srListAjaxHtml")
	public String srListAjaxHtml(HttpSession session, Model model) {
		MemberVo mVo = (MemberVo) session.getAttribute("SESSION_MEMBERVO");
		
		// tempSVo - tempList를 조회하기 위한 임시 sVo
		Save_recruitVo tempSVo = new Save_recruitVo();	
		tempSVo.setSave_flag("t");
		tempSVo.setUser_id(mVo.getMem_id());
		
		// tempList에서 중복되는 값을 제거 - sSrecrList
		List<Save_recruitVo> tempList = srecrService.getSSrecrList(tempSVo);
		List<Save_recruitVo> sSrecrList = new ArrayList<>();
		
		for(int i=0; i < tempList.size(); i++){
			boolean add_flag = true;
			
			if(tempList.get(i).getRecr_app().equals("t")){
				// add하지 않음.
				continue;
			}
			
			for(int j=0; j < sSrecrList.size(); j++){
				if( tempList.get(i).getRecruit_code().equals(sSrecrList.get(j).getRecruit_code()) ){
					add_flag = false;
				}
			}
			
			if(add_flag == true){
				sSrecrList.add(tempList.get(i));
			}
		}
		
		List<RecruitVo> srList = new ArrayList<>();
		
		for(int i=0; i < sSrecrList.size(); i++){
			RecruitVo rVo = recrService.getRecr(sSrecrList.get(i).getRecruit_code());
			srList.add(rVo);
		}
		
		// srList에 맞는 corpImgList/corpNmList 보내기.
		List<String> corpImgList = new ArrayList<>();
		List<String> corpNmList = new ArrayList<>();
		List<String> corpIdList = new ArrayList<>();
		
		for(int i=0; i < srList.size(); i++){
			RecruitVo rVo = srList.get(i);
			CorporationVo cVo = corpService.select_corpInfo(rVo.getCorp_id());
			
			corpImgList.add(cVo.getLogo_path());
			corpNmList.add(cVo.getCorp_name());
			corpIdList.add(cVo.getCorp_id());
		}
		
		model.addAttribute("srList", srList);
		model.addAttribute("corpNmList", corpNmList);
		model.addAttribute("corpImgList", corpImgList);		
		model.addAttribute("corpIdList", corpIdList);		
		
		return "save_recruit/srListAjaxHtml";
	}
	
	
	
	
	
	
}




