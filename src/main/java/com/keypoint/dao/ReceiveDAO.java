package com.keypoint.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.keypoint.dto.PageDTO;
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
	
	public List<ReceiveDTO> getReceiveList(PageDTO pageDTO) {
		System.out.println("ReceiveDAO getReceiveList()");
		return sqlSession.selectList(namespace+".getReceiveList", pageDTO);
	}// getReceiveListTest() [수주+출하목록(수주)]
	
	public List<ReceiveDTO> getShipmentList(PageDTO pageDTO1) {
		System.out.println("ReceiveDAO getShipmentList()");
		return sqlSession.selectList(namespace+".getShipmentList", pageDTO1);
	}// getReceiveListTest() [수주+출하목록(출하)]
	
	public int getReceiveCount(PageDTO pageDTO) {
		System.out.println("ReceiveDAO getReceiveCount()");
		return sqlSession.selectOne(namespace+".getReceiveCount", pageDTO);
	}
	
	public int getShipmentCount(PageDTO pageDTO1) {
		System.out.println("ReceiveDAO getShipmentCount()");
		return sqlSession.selectOne(namespace+".getShipmentCount", pageDTO1);
	}
	
/////////////////////////////////////////////////////////////////////////////////////////////

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
	
	
	
	@Transactional
	public boolean shipComplete(ReceiveDTO receiveDTO) {
		System.out.println("ReceiveDAO shipComplete()");
		try {
	        sqlSession.update(namespace + ".shipCompleteUpdate", receiveDTO);
	        sqlSession.update(namespace + ".shipCompleteStock", receiveDTO);
	        return true;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}// shipComplete [출하완료]
	
	/////////////////////////////////////////////////////////////////////////////////////////////	
	
	////다중삭제 테스트
	public void receiveDeleteChecked(ReceiveDTO receiveDTO) {
		System.out.println("ReceiveDAO receiveDeleteChecked()");
		sqlSession.update(namespace + ".receiveDeleteChecked", receiveDTO);
	}

	
}// class
