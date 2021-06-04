package com.somsomy.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.somsomy.dao.CatsDAO;
import com.somsomy.domain.CatsBean;
import com.somsomy.domain.FindPageBean;
import com.somsomy.domain.PageBean;

@Service
public class CatsServiceImpl implements CatsService{
	
	@Inject
	private CatsDAO catsDAO;

	@Override
	public List<CatsBean> getCatList(PageBean pb) {
		pb.setCurrentPage(Integer.parseInt(pb.getPageNum()));
		pb.setStartRow((pb.getCurrentPage() - 1) * pb.getPageSize());		
		
		return catsDAO.getCatList(pb);
	}

	@Override
	public Integer getCatCount() {
		return catsDAO.getCatCount();
	}

	@Override
	public Integer getCatCount(String search) {
		return catsDAO.getCatCount(search);
	}

	@Override
	public CatsBean findByCatId(int catId) {
		return catsDAO.findByCatId(catId);
	}

	@Override
	public void registerCat(CatsBean cb) {
		cb.setDate(new Timestamp(System.currentTimeMillis()));
		cb.setReadcount(0);
		
		Integer catId = catsDAO.getMaxCatId();
		
		if(catId == null) {
			cb.setCatId(1);
		} else {
			cb.setCatId(catId + 1);
		}
		
		catsDAO.registerCat(cb);
	}

	@Override
	public void updateCat(CatsBean cb) {
		catsDAO.updateCat(cb);
	}

	@Override
	public void deleteCat(int catId) {
		catsDAO.deleteCat(catId);
	}

	@Override
	public List<CatsBean> getStateCatList(FindPageBean pb) {
		pb.setState(pb.getState().equals("protected") || pb.getState().equals("보호중")? "보호중" : "입양완료");
		
		pb.setCurrentPage(Integer.parseInt(pb.getPageNum()));
		pb.setStartRow((pb.getCurrentPage() - 1) * pb.getPageSize());

		return catsDAO.getStateCatList(pb);
	}

	@Override
	public Integer getStateCatCount(FindPageBean pb) {
		pb.setState(pb.getState().equals("protected") || pb.getState().equals("보호중") ? "보호중" : "입양완료");
		return catsDAO.getStateCatCount(pb);
	}

	@Override
	public void updateReadcount(int catId) {
		catsDAO.updateReadcount(catId);
	}

}
