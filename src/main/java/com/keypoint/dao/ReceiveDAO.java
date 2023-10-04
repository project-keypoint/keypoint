package com.keypoint.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.keypoint.dto.ReceiveDTO;

@Repository
public class ReceiveDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.receiveMapper";

	public void insertReceive(ReceiveDTO receiveDTO) {
		System.out.println("ReceiveDAO insertReceive()");
		sqlSession.insert(namespace+".insertReceive",receiveDTO);
	}// insertReceive() [수주등록]

	public List<ReceiveDTO> getReceiveList() {
		System.out.println("ReceiveDAO getReceiveList()");
		return sqlSession.selectList(namespace+".getReceiveList");
	}// getReceiveList() [수주목록]

	public ReceiveDTO getReceiveDetails(String roCode) {
		System.out.println("ReceiveDAO getReceiveDetails()");
		return sqlSession.selectOne(namespace+".getReceiveDetails", roCode);
	}// getReceiveDetails() [수주상세]

	public void updateReceive(ReceiveDTO receiveDTO) {
		System.out.println("ReceiveDAO updateReceive()");
		System.out.println(receiveDTO);
		sqlSession.update(namespace+".updateReceive",receiveDTO);
	}// updateReceive() [수주수정]

	public void deleteReceive(ReceiveDTO receiveDTO) {
		System.out.println("ReceiveDAO deleteReceive()");
		System.out.println(receiveDTO);
		sqlSession.update(namespace+".deleteReceive",receiveDTO);
	}// deleteReceive() [수주삭제]

// 테스트
	
	public List<ReceiveDTO> getReceiveListTest() {
		System.out.println("ReceiveDAO getReceiveListTest()");
		return sqlSession.selectList(namespace+".getReceiveListTest");
	}// getReceiveListTest() [수주+출하목록(테스트)]
	
	
}// class
