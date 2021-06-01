package com.somsomy.service;

import java.util.List;

import com.somsomy.domain.FindPageBean;
import com.somsomy.domain.SupporterBean;
import com.somsomy.domain.SupporterCatsBean;

public interface SupportService {

	void insertSupporter(SupporterBean sb);

	Integer getMyCatsCount(String id);

	List<SupporterCatsBean> getMyCatsList(FindPageBean pb);

	SupporterCatsBean getSupporter(int num);

	void updateSupporter(SupporterBean sb);

	void deleteSupporter(int num);

}
