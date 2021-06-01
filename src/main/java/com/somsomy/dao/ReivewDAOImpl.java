package com.somsomy.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.somsomy.domain.PageBean;
import com.somsomy.domain.ReviewBean;

@Repository
public class ReivewDAOImpl implements ReviewDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.somsomy.mapper.ReviewMapper";
	@Override
	public Integer getReviewMaxNum() {
		return sqlSession.selectOne(namespace + ".getReviewMaxNum");
	}
	@Override
	public List<ReviewBean> getReviewList(PageBean pb) {
		return sqlSession.selectList(namespace + ".getReviewList", pb);
	}
	@Override
	public void writeReview(ReviewBean rb) {
		sqlSession.insert(namespace + ".writeReview", rb);
	}
	@Override
	public ReviewBean getReview(int num) {
		return sqlSession.selectOne(namespace + ".getReview", num);
	}
	@Override
	public void updateReview(ReviewBean rb) {
		sqlSession.update(namespace + ".updateReview", rb);
	}
	@Override
	public void deleteReview(int num) {
		sqlSession.delete(namespace + ".deleteReview", num);
	}


}
