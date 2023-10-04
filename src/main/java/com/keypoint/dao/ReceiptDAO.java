package com.keypoint.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.keypoint.dto.PageDTO;
import com.keypoint.dto.PurchaseDTO;
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
	
	public List<ReceiptDTO> getReceiptList(PageDTO pageDTO) {
		System.out.println("ReceiptDAO getReceiptList()");
		
		return sqlSession.selectList(namespace+".getReceiptList", pageDTO);
	} // getReceiptList
	
	public int getReceiptCount() {
		System.out.println("ReceiptDAO getReceiptCount()");
		
		return sqlSession.selectOne(namespace+".getReceiptCount");
	} // getReceiptCount
	
	public ReceiptDTO getReceiptDetails(String grCode) {
		System.out.println("ReceiptDAO getReceiptDetails()");
		
		return sqlSession.selectOne(namespace+".getReceiptDetails", grCode);
	}// getReceiptDetails() [입고상세]
	
	public void updateReceipt(ReceiptDTO receiptDTO) {
		System.out.println("ReceiptPurchaseDAO updateReceipt()");
		System.out.println(receiptDTO);
		
		sqlSession.update(namespace+".updateReceipt",receiptDTO);
	}// updateReceipt() [발주수정]
	
	
	
	
	
	
	
	
	
	
	
} // class
