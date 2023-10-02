package com.keypoint.dao;

import java.util.List;

import javax.inject.Inject;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.keypoint.dto.LineDTO;


@Repository
public class LineDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.lineMapper";

	
	public List<LineDTO> getLineList() {
		System.out.println("LineDAO getLineList()");
		return sqlSession.selectList(namespace+".getLineList");
	}// getLineList

	
	
	
	
	
	
}
