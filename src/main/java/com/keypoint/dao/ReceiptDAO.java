package com.keypoint.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.keypoint.dto.ReceiptDTO;

@Repository
public class ReceiptDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.receiptMapper";

	// ----------------------------------------------------------------------------------
	
	public void insertReceipt(ReceiptDTO receiptDTO) {
		System.out.println("ReceiptDAO insertReceipt()");
		
		sqlSession.insert(namespace+".insertReceipt", receiptDTO);		
	} // insertReceipt
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
} // class
