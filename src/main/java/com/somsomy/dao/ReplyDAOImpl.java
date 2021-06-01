package com.somsomy.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.somsomy.domain.FindPageBean;
import com.somsomy.domain.ReplyBean;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="com.somsomy.mapper.ReplyMapper";
	
	@Override
	public Integer getReplyMaxNum() {
		return sqlSession.selectOne(namespace + ".getReplyMaxNum");
	}

	@Override
	public void writeReply(ReplyBean rb) {
		sqlSession.insert(namespace + ".writeReply", rb);
	}

	@Override
	public void updateReply(ReplyBean rb) {
		sqlSession.update(namespace + ".updateReply", rb);
	}

	@Override
	public List<ReplyBean> getReplyList(FindPageBean pb) {
		return sqlSession.selectList(namespace + ".getReplyList", pb);
	}

	@Override
	public void deleteReply(int num) {
		sqlSession.delete(namespace + ".deleteReply", num);
	}

	@Override
	public Integer getRerefMaxNum(int boardNum) {
		return sqlSession.selectOne(namespace + ".getRerefMaxNum", boardNum);
	}

	@Override
	public void updateReseq(ReplyBean rb) {
		sqlSession.update(namespace + ".updateReseq", rb);
	}

	@Override
	public List<ReplyBean> getReplyChildList(ReplyBean rb) {
		return sqlSession.selectList(namespace + ".getReplyChildList", rb);
	}

	@Override
	public void deleteDate(ReplyBean rb) {
		sqlSession.update(namespace + ".deleteDate", rb);
	}
}
