package com.somsomy.service;

import java.util.List;

import com.somsomy.domain.NoticeBean;
import com.somsomy.domain.PageBean;

public interface AdminService {
	public List<NoticeBean> getNoticeList(PageBean pb);
	public Integer getNoticeCount(String search);
	public Integer getMaxNum();
	public void writeNotice(NoticeBean nb);
	public NoticeBean getNotice(int num);
	public void updateReadcount(int num);

  void updateNotice(NoticeBean nb);

	void deleteNotice(int num);
}
