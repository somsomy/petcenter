package com.somsomy.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.somsomy.domain.FindPageBean;
import com.somsomy.domain.PageBean;
import com.somsomy.domain.VolunteerBean;
import com.somsomy.domain.VolunteerReplyBean;

@Repository
public class VolunteerDAOImpl implements VolunteerDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="com.somsomy.mapper.VolunteerMapper";

	@Override
	public Integer getVolunteerCount() {
		return sqlSession.selectOne(namespace + ".getVolunteerCount");
	}

	@Override
	public List<VolunteerBean> getVolunteerList(PageBean pb) {
		return sqlSession.selectList(namespace + ".getVolunteerList", pb);
	}

	@Override
	public void writeVolunteer(VolunteerBean vb) {
		sqlSession.insert(namespace + ".writeVolunteer", vb);
	}

	@Override
	public Integer getMaxNum() {
		return sqlSession.selectOne(namespace + ".getMaxNum");
	}

	@Override
	public void updateReadcount(int num) {
		sqlSession.update(namespace + ".updateReadcount", num);
	}

	@Override
	public List<VolunteerReplyBean> getVolunteerReplyList(FindPageBean pb) {
		return sqlSession.selectList(namespace + ".getVolunteerReplyList", pb);
	}

	@Override
	public int getVolunteerReplyCount(int num) {
		return sqlSession.selectOne(namespace + ".getVolunteerReplyCount", num);
	}

	@Override
	public VolunteerBean getVolunteer(int num) {
		return sqlSession.selectOne(namespace + ".getVolunteer", num);
	}

	@Override
	public void updateVolunteer(VolunteerBean vb) {
		sqlSession.update(namespace + ".updateVolunteer", vb);
	}

	@Override
	public void deleteVolunteer(int num) {
		sqlSession.delete(namespace + ".deleteVolunteer", num);
	}

	@Override
	public void deleteReply(int num) {
		sqlSession.delete(namespace + ".deleteReply", num);
	}



}
