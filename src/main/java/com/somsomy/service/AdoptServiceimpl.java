package com.somsomy.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.somsomy.dao.AdoptDAO;
import com.somsomy.domain.AdoptBean;
import com.somsomy.domain.PageBean;

@Service
public class AdoptServiceimpl implements AdoptService {
	@Inject
	private AdoptDAO adoptDAO;

	@Override
	public Integer getMaxNum() {
		return adoptDAO.getMaxNum();
	}

	@Override
	public List<AdoptBean> getBoardList(PageBean pb) {
		pb.setCurrentPage(Integer.parseInt(pb.getPageNum()));
		pb.setStartRow((pb.getCurrentPage() - 1) * pb.getPageSize());		
		
		return adoptDAO.getBoardList(pb);
	}

	@Override
	public void writeAdopt(AdoptBean ab) {
		ab.setDate(new Timestamp(System.currentTimeMillis()));
		ab.setReadcount(0);
		
		Integer num = adoptDAO.getMaxNum();
		
		if(num == null) {
			ab.setNum(1);
		} else {
			ab.setNum(num + 1);
		}
		
		adoptDAO.writeAdopt(ab);
	}

	@Override
	public AdoptBean getAdopt(int num) {
		return adoptDAO.getAdopt(num);
	}

	@Override
	public void updateReadcount(int num) {
		adoptDAO.updateReadcount(num);
	}

	@Override
	public void updateAdopt(AdoptBean ab) {
		adoptDAO.updateAdopt(ab);
	}

	@Override
	public void deleteAdopt(int num) {
		adoptDAO.deleteAdopt(num);
	}

}
