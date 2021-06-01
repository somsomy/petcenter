package com.somsomy.service;

import java.util.List;

import com.somsomy.domain.PageBean;
import com.somsomy.domain.QnaBean;

public interface QnaService {
	Integer getQnaCount();
	List<QnaBean> getQnaList(PageBean pb);
	void writeQna(QnaBean qb);
	void updateReadcount(int parseInt);
	QnaBean getQna(int num);
	void updateQna(QnaBean qb);
	void deleteQna(int num);
	void reWriteQna(QnaBean qb);
}
