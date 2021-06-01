package com.somsomy.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.somsomy.domain.MemberBean;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="com.somsomy.mapper.MemberMapper";

	@Override
	public MemberBean userCheck(MemberBean mb) {
		return sqlSession.selectOne(namespace + ".userCheck", mb);
	}

	@Override
	public MemberBean getMember(String id) {
		return sqlSession.selectOne(namespace + ".getMember", id);
	}

	@Override
	public MemberBean findByNick(MemberBean mb) {
		return sqlSession.selectOne(namespace + ".findByNick", mb);
	}

	@Override
	public void join(MemberBean mb) {
		sqlSession.insert(namespace + ".join", mb);
	}

	@Override
	public void memberUpdate(MemberBean mb) {
		sqlSession.update(namespace + ".memberUpdate", mb);
	}

}
