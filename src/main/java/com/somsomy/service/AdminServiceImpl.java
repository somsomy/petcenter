package com.somsomy.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.somsomy.dao.AdminDAO;
import com.somsomy.domain.NoticeBean;
import com.somsomy.domain.PageBean;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Inject
	private AdminDAO adminDAO;

	@Override
	public List<NoticeBean> getNoticeList(PageBean pb) {
		pb.setCurrentPage(Integer.parseInt(pb.getPageNum()));
		pb.setStartRow((pb.getCurrentPage()-1)*pb.getPageSize());
		
		return adminDAO.getNoticeList(pb);
	}

	@Override
	public Integer getNoticeCount() {
		return adminDAO.getNoticeCount();
	}

	@Override
	public Integer getMaxNum() {
		return adminDAO.getMaxNum();
	}

	@Override
	public void writeNotice(NoticeBean nb) {
		nb.setDate(new Timestamp(System.currentTimeMillis()));
		nb.setReadcount(0);

		if(adminDAO.getMaxNum() == null) {
			nb.setNum(1);
		} else {
			nb.setNum(adminDAO.getMaxNum()+1);
		}
		
		adminDAO.writeNotice(nb);
	}

	@Override
	public NoticeBean getNotice(int num) {
		return adminDAO.getNotice(num);
	}

	@Override
	public void updateReadcount(int num) {
		adminDAO.updateReadcount(num);
	}

}
