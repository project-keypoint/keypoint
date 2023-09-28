package com.keypoint.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.keypoint.dto.ReceiveDTO;

@Repository
public class ReceiveDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.receiveMapper";

	public void insertTest(ReceiveDTO receiveDTO) {
		System.out.println("ReceiveDAO insertTest()");
		sqlSession.insert(namespace+".insertTest", receiveDTO);
	}

}
