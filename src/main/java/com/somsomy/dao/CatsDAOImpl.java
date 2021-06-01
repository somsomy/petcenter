package com.somsomy.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.somsomy.domain.CatsBean;
import com.somsomy.domain.FindPageBean;
import com.somsomy.domain.PageBean;

@Repository
public class CatsDAOImpl implements CatsDAO{
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.somsomy.mapper.CatsMapper";

	@Override
	public List<CatsBean> getCatList(PageBean pb) {
		return sqlSession.selectList(namespace + ".getCatList", pb);
	}

	@Override
	public Integer getCatCount() {
		return sqlSession.selectOne(namespace + ".getCatCount");
	}

	@Override
	public CatsBean findByCatId(int catId) {
		return sqlSession.selectOne(namespace + ".findByCatId", catId);
	}

	@Override
	public Integer getMaxCatId() {
		return sqlSession.selectOne(namespace + ".getMaxCatId");
	}

	@Override
	public void registerCat(CatsBean cb) {
		sqlSession.insert(namespace + ".registerCat", cb);
	}

	@Override
	public void updateCat(CatsBean cb) {
		sqlSession.update(namespace + ".updateCat", cb);
	}

	@Override
	public void deleteCat(int catId) {
		sqlSession.delete(namespace + ".deleteCat", catId);
	}

	@Override
	public List<CatsBean> getStateCatList(FindPageBean pb) {
		return sqlSession.selectList(namespace + ".getStateCatList", pb);
	}

	@Override
	public int getStateCatCount(String state) {
		return sqlSession.selectOne(namespace + ".getStateCatCount", state);
	}

	@Override
	public void updateReadcount(int catId) {
		sqlSession.update(namespace + ".updateReadcount", catId);
	}

}
