package com.keypoint.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.keypoint.dto.RequireDTO;

@Repository
public class RequireDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace="com.itwillbs.mappers.requireMapper";

	public void insertRequire(RequireDTO requireDTO) {
		System.out.println("RequireDAO insertRequire()");
		sqlSession.insert(namespace+".insertRequire", requireDTO);
	}// insertRequire

	public List<RequireDTO> getRequireList() {
		System.out.println("RequireDAO getRequireList()");
		return sqlSession.selectList(namespace+".getRequireList");
	}// getRequireList

	public void deleteRequire(RequireDTO requireDTO) {
		System.out.println("RequireDAO deleteRequire()");
		sqlSession.delete(namespace+".deleteRequire", requireDTO);
	}// deleteRequire

	public RequireDTO getRequire(String requireCode) {
		System.out.println("RequireDAO getRequire()");
		return sqlSession.selectOne(namespace+".getRequire", requireCode);
	}

	
	
	
	
	
}
