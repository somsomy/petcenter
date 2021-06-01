package com.somsomy.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.somsomy.domain.FindPageBean;
import com.somsomy.domain.SupporterBean;
import com.somsomy.domain.SupporterCatsBean;

@Repository
public class SupportDAOImpl implements SupportDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.somsomy.mapper.SupporterMapper";

	@Override
	public Integer getMaxNum() {
		return sqlSession.selectOne(namespace + ".getMaxNum");
	}

	@Override
	public void insertSupporter(SupporterBean sb) {
		sqlSession.insert(namespace + ".insertSupporter", sb);
	}

	@Override
	public Integer getMyCatsCount(String id) {
		return sqlSession.selectOne(namespace + ".getMyCatsCount", id);
	}

	@Override
	public List<SupporterCatsBean> getMyCatsList(FindPageBean pb) {
		
		return sqlSession.selectList(namespace + ".getMyCatsList", pb);
	}

	@Override
	public SupporterCatsBean getSupporter(int num) {
		return sqlSession.selectOne(namespace + ".getSupporter", num);
	}

	@Override
	public void updateSupporter(SupporterBean sb) {
		sqlSession.update(namespace + ".updateSupporter", sb);
	}

	@Override
	public void deleteSupporter(int num) {
		sqlSession.delete(namespace + ".deleteSupporter", num);
	}

}
