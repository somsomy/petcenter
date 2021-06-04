package com.somsomy.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.somsomy.dao.QnaDAO;
import com.somsomy.domain.PageBean;
import com.somsomy.domain.QnaBean;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Inject
	private QnaDAO qnaDAO;

	@Override
	public Integer getQnaCount(String search) {
		return qnaDAO.getQnaCount(search);
	}

	@Override
	public List<QnaBean> getQnaList(PageBean pb) {
		pb.setCurrentPage(Integer.parseInt(pb.getPageNum()));
		pb.setStartRow((pb.getCurrentPage()-1)*pb.getPageSize());
		
		return qnaDAO.getQnaList(pb);
	}

	@Override
	public void writeQna(QnaBean qb) {
		
		qb.setDate(new Timestamp(System.currentTimeMillis()));
		qb.setState("답변대기");
		qb.setReadcount(0);
		qb.setRe_lev(0);
		qb.setRe_seq(0);
				
		if(qnaDAO.getMaxNum() == null) {
			qb.setNum(1);
			qb.setRe_ref(1);
		}else {
			qb.setNum(qnaDAO.getMaxNum() + 1);
			qb.setRe_ref(qnaDAO.getMaxNum() + 1);
		}
		
		qnaDAO.writeQna(qb);
	}

	@Override
	public void updateReadcount(int num) {
		qnaDAO.updateReadcount(num);
	}

	@Override
	public QnaBean getQna(int num) {
		return qnaDAO.getQna(num);
	}

	@Override
	public void updateQna(QnaBean qb) {
		qnaDAO.updateQna(qb);
	}

	@Override
	public void deleteQna(int num) {
		qnaDAO.deleteQna(num);
	}

	@Override
	public void reWriteQna(QnaBean qb) {
		qnaDAO.updateReseq(qb);
		qnaDAO.updateState(qb.getNum());
		
		qb.setDate(new Timestamp(System.currentTimeMillis()));
		qb.setReadcount(0);
		qb.setRe_ref(qb.getNum());
		qb.setNum(qnaDAO.getMaxNum()+1);
		qb.setRe_lev(qb.getRe_lev()+1);
		qb.setRe_seq(qb.getRe_seq()+1);
		
		qnaDAO.writeQna(qb);
	}

}
