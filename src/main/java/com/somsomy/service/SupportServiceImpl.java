package com.somsomy.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.somsomy.dao.SupportDAO;
import com.somsomy.domain.FindPageBean;
import com.somsomy.domain.PageBean;
import com.somsomy.domain.SupporterBean;
import com.somsomy.domain.SupporterCatsBean;

@Service
public class SupportServiceImpl implements SupportService {
	
	@Inject
	private SupportDAO supportDAO;

	@Override
	public void insertSupporter(SupporterBean sb) {
		Integer num = supportDAO.getMaxNum();
		
		if(num == null) {
			sb.setNum(1);
		} else {
			sb.setNum(num + 1);
		}
		
		sb.setSupportStart(sb.getYear()+"-"+sb.getMonth()+"-"+sb.getDay());
		sb.setDate(new Timestamp(System.currentTimeMillis()));
		supportDAO.insertSupporter(sb);
	}

	@Override
	public Integer getMyCatsCount(String id) {
		return supportDAO.getMyCatsCount(id);
	}

	@Override
	public List<SupporterCatsBean> getMyCatsList(FindPageBean pb) {
		pb.setCurrentPage(Integer.parseInt(pb.getPageNum()));
		pb.setStartRow((pb.getCurrentPage()-1)*pb.getPageSize());
		
		return supportDAO.getMyCatsList(pb);
	}

	@Override
	public SupporterCatsBean getSupporter(int num) {
		return supportDAO.getSupporter(num);
	}

	@Override
	public void updateSupporter(SupporterBean sb) {
		if(sb.getSupportType().equals("year")) {
			sb.setSupportType("년 단위 정기후원");
		}
		
		sb.setSupportStart(sb.getYear()+"-"+sb.getMonth()+"-"+sb.getDay());
		
		supportDAO.updateSupporter(sb);
	}

	@Override
	public void deleteSupporter(int num) {
		supportDAO.deleteSupporter(num);
	}

}
