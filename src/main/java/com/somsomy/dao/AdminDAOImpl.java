package com.somsomy.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.somsomy.domain.NoticeBean;
import com.somsomy.domain.PageBean;

@Repository
public class AdminDAOImpl implements AdminDAO{

	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.somsomy.mapper.AdminMapper";
	
	@Override
	public List<NoticeBean> getNoticeList(PageBean pb) {
		return sqlSession.selectList(namespace + ".getNoticeList", pb);
	}

	@Override
	public Integer getNoticeCount() {
		return sqlSession.selectOne(namespace + ".getNoticeCount");
	}

	@Override
	public Integer getMaxNum() {
		return sqlSession.selectOne(namespace + ".getMaxNum");
	}

	@Override
	public void writeNotice(NoticeBean nb) {
		sqlSession.insert(namespace + ".writeNotice", nb);
	}

	@Override
	public NoticeBean getNotice(int num) {
		return sqlSession.selectOne(namespace + ".getNotice", num);
	}

	@Override
	public void updateReadcount(int num) {
		sqlSession.update(namespace + ".updateReadcount", num);
	}
	
	
}
