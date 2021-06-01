package com.somsomy.service;

import java.util.List;

import com.somsomy.domain.AdoptBean;
import com.somsomy.domain.PageBean;
import com.somsomy.domain.ReviewBean;

public interface AdoptService {
	
	Integer getMaxNum();

	List<AdoptBean> getBoardList(PageBean pb);

	void writeAdopt(AdoptBean ab);

	AdoptBean getAdopt(int num);

	void updateReadcount(int num);

	void updateAdopt(AdoptBean ab);

	void deleteAdopt(int num);

}
