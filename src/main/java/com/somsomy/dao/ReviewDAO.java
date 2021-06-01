package com.somsomy.dao;

import java.util.List;

import com.somsomy.domain.PageBean;
import com.somsomy.domain.ReviewBean;

public interface ReviewDAO {

	Integer getReviewMaxNum();

	List<ReviewBean> getReviewList(PageBean pb);

	void writeReview(ReviewBean rb);

	ReviewBean getReview(int num);

	void updateReview(ReviewBean rb);

	void deleteReview(int num);

}
