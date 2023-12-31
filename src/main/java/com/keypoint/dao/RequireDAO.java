package com.keypoint.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.keypoint.dto.PageDTO;
import com.keypoint.dto.RequireDTO;

@Repository
public class RequireDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace="com.itwillbs.mappers.requireMapper";

	public void insertRequire(String productCode, String materialCode, int reqCount) {
		System.out.println("RequireDAO insertRequire()");
		Map<String, Object> param = new HashMap<>();
		param.put("productCode", productCode);
		param.put("materialCode", materialCode);
		param.put("reqCount", reqCount);
		sqlSession.insert(namespace+".insertRequire", param);
	}// insertRequire
	
//	public void insertRequire(RequireDTO requireDTO) {
////		System.out.println("RequireDAO insertRequire()");
//		sqlSession.insert(namespace+".insertRequire", requireDTO);
//	}// insertRequire

	public List<RequireDTO> getRequireList(PageDTO pageDTO) {
		System.out.println("RequireDAO getRequireList()");
		return sqlSession.selectList(namespace+".getRequireList", pageDTO);
	}// getRequireList

	public void deleteRequire(RequireDTO requireDTO) {
		System.out.println("RequireDAO deleteRequire()");
		sqlSession.delete(namespace+".deleteRequire", requireDTO);
	}// deleteRequire

	public RequireDTO getRequire(Map<String, Object> param) {
	    System.out.println("RequireDAO getRequire()");
	    return sqlSession.selectOne(namespace+".getRequire", param);
	}

	public void updateRequire(RequireDTO requireDTO) {
		System.out.println("RequireDAO updateRequire()");
		sqlSession.delete(namespace+".updateRequire", requireDTO);
	}// updateRequire

	public int getRequireCount(PageDTO pageDTO) {
		System.out.println("RequireDAO getRequireCount()");
		return sqlSession.selectOne(namespace+".getRequireCount", pageDTO);
	}

	public void requireDeleteChecked(String requireCode) {
		System.out.println("RequireDAO requireDeleteChecked()");
		sqlSession.delete(namespace+".requireDeleteChecked", requireCode);
	}// requireDeleteChecked



	
	
	
	
	
}
