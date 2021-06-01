package com.somsomy.dao;

import java.util.List;

import com.somsomy.domain.PageBean;
import com.somsomy.domain.QnaBean;

public interface QnaDAO {
	
	Integer getQnaCount();
	List<QnaBean> getQnaList(PageBean pb);
	Integer getMaxNum();
	void writeQna(QnaBean qb);
	void updateReadcount(int num);
	QnaBean getQna(int num);
	void updateQna(QnaBean qb);
	void deleteQna(int num);
	void updateReseq(QnaBean qb);
	void updateState(int num);

}
