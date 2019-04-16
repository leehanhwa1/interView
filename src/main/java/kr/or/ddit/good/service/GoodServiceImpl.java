package kr.or.ddit.good.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.good.dao.IGoodDao;
import kr.or.ddit.good.model.GoodVo;

@Service("goodService")
public class GoodServiceImpl implements IGoodService {

	@Resource(name="goodDao")
	private IGoodDao goodDao;
	
	@Override
	public int insert_goodInfo(GoodVo goodVo) {
		return goodDao.insert_goodInfo(goodVo);
	}

	@Override
	public int delete_goodInfo(GoodVo goodVo) {
		return goodDao.delete_goodInfo(goodVo);
	}

	@Override
	public List<GoodVo> select_goodInfo(String mem_id) {
		return goodDao.select_goodInfo(mem_id);
	}

	@Override
	public int select_goodCount(GoodVo goodVo) {
		return goodDao.select_goodCount(goodVo);
	}

	@Override
	public List<GoodVo> select_pushGoodMember(GoodVo goodVo) {
		return goodDao.select_pushGoodMember(goodVo);
	}

	@Override
	public List<GoodVo> select_pushedGoodPost(String mem_id) {
		return goodDao.select_pushedGoodPost(mem_id);
	}

}
