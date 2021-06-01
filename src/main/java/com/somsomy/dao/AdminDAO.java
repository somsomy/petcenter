package com.somsomy.dao;

import java.util.List;

import com.somsomy.domain.NoticeBean;
import com.somsomy.domain.PageBean;

public interface AdminDAO {
	
	public List<NoticeBean> getNoticeList(PageBean pb);
	public Integer getNoticeCount();
	public Integer getMaxNum();
	public void writeNotice(NoticeBean nb);
	public NoticeBean getNotice(int num);
	public void updateReadcount(int num);
}
