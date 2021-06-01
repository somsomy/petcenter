package com.somsomy.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.somsomy.domain.AdoptBean;
import com.somsomy.domain.PageBean;

@Repository
public class AdoptDAOImpl implements AdoptDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.somsomy.mapper.AdoptMapper";

	@Override
	public Integer getMaxNum() {
		return sqlSession.selectOne(namespace + ".getMaxNum");
	}

	@Override
	public List<AdoptBean> getBoardList(PageBean pb) {
		return sqlSession.selectList(namespace + ".getBoardList", pb);
	}

	@Override
	public void writeAdopt(AdoptBean ab) {
		sqlSession.insert(namespace + ".writeAdopt", ab);
	}

	@Override
	public AdoptBean getAdopt(int num) {
		return sqlSession.selectOne(namespace + ".getAdopt", num);
	}

	@Override
	public void updateReadcount(int num) {
		sqlSession.update(namespace + ".updateReadcount", num);
	}

	@Override
	public void updateAdopt(AdoptBean ab) {
		sqlSession.update(namespace + ".updateAdopt", ab);
	}

	@Override
	public void deleteAdopt(int num) {
		sqlSession.delete(namespace + ".deleteAdopt", num);
	}

}
