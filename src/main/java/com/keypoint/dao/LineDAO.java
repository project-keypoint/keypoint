package com.keypoint.dao;

import java.util.List;

import javax.inject.Inject;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.keypoint.dto.LineDTO;
import com.keypoint.dto.ReceiveDTO;


@Repository
public class LineDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.lineMapper";

	
	public List<LineDTO> getLineList() {
		System.out.println("LineDAO getLineList()");
		return sqlSession.selectList(namespace+".getLineList");
	}// 라인목록조회


	public void lineInsert(LineDTO lineDTO) {
		System.out.println("LineDAO lineInsert()");
		sqlSession.insert(namespace+".lineInsert",lineDTO);
	}// 라인등록


	public LineDTO getLineDetails(String lineCode) {
		System.out.println("LineDAO getLineDetails()");
		return sqlSession.selectOne(namespace+".getLineDetails", lineCode);
	}// getLineDetails() [수주상세]



	
	
	
	
	
	
}
