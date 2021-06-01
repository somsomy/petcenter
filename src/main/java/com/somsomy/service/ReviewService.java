package com.somsomy.service;

import java.util.List;

import com.somsomy.domain.PageBean;
import com.somsomy.domain.ReviewBean;

public interface ReviewService {

	Integer getReviewMaxNum();

	List<ReviewBean> getReviewList(PageBean pb);

	void writeReview(ReviewBean rb);

	ReviewBean getReview(int num);

	void updateReview(ReviewBean rb);

	void deleteReview(int num);

}
