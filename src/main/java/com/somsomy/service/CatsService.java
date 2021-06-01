package com.somsomy.service;

import java.util.List;

import com.somsomy.domain.CatsBean;
import com.somsomy.domain.FindPageBean;
import com.somsomy.domain.PageBean;

public interface CatsService {
	public List<CatsBean> getCatList(PageBean pb);
	public Integer getCatCount();
	public CatsBean findByCatId(int catId);
	public void registerCat(CatsBean cb);
	public void updateCat(CatsBean cb);
	public void deleteCat(int catId);
	public List<CatsBean> getStateCatList(FindPageBean pb);
	public int getStateCatCount(String state);
	public void updateReadcount(int catId);
}
