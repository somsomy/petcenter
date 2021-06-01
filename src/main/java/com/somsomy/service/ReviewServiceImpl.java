package com.somsomy.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.somsomy.dao.ReviewDAO;
import com.somsomy.domain.PageBean;
import com.somsomy.domain.ReviewBean;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Inject
	private ReviewDAO reviewDAO;

	@Override
	public Integer getReviewMaxNum() {
		return reviewDAO.getReviewMaxNum();
	}

	@Override
	public List<ReviewBean> getReviewList(PageBean pb) {
		pb.setCurrentPage(Integer.parseInt(pb.getPageNum()));
		pb.setStartRow((pb.getCurrentPage() - 1) * pb.getPageSize());	
		return reviewDAO.getReviewList(pb);
	}

	@Override
	public void writeReview(ReviewBean rb) {
		Integer num = reviewDAO.getReviewMaxNum();
		rb.setDate(new Timestamp(System.currentTimeMillis()));
		rb.setReadcount(0);
		
		if(num == null) {
			rb.setNum(1);
		} else {
			rb.setNum(num + 1);
		}
		
		reviewDAO.writeReview(rb);
	}

	@Override
	public ReviewBean getReview(int num) {
		return reviewDAO.getReview(num);
	}

	@Override
	public void updateReview(ReviewBean rb) {
		reviewDAO.updateReview(rb);
	}

	@Override
	public void deleteReview(int num) {
		reviewDAO.deleteReview(num);
	}

}
