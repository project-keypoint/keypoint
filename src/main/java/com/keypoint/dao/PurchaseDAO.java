package com.keypoint.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.keypoint.dto.PageDTO;
import com.keypoint.dto.PurchaseDTO;
import com.keypoint.dto.ReceiveDTO;

@Repository
public class PurchaseDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.purchaseMapper";

	// ----------------------------------------------------------------------------------
	
	public void insertPurchase(PurchaseDTO purchaseDTO) {
			System.out.println("PurchaseDAO insertPurchase()");
		
			sqlSession.insert(namespace+".insertPurchase", purchaseDTO);
	} // insertPurchase

	public List<PurchaseDTO> getPurchaseList(PageDTO pageDTO) {
		System.out.println("PurchaseDAO getPurchaseList()");
		
		return sqlSession.selectList(namespace+".getPurchaseList", pageDTO);
	} // getPurchaseList
	
	public int getPurchaseCount() {
		System.out.println("PurchaseDAO getPurchaseCount()");
		
		return sqlSession.selectOne(namespace+".getPurchaseCount");
	} // getPurchaseCount
	
	public PurchaseDTO getPurchaseDetails(String poCode) {
		System.out.println("PurchaseDAO getPurchaseDetails()");
		
		return sqlSession.selectOne(namespace+".getPurchaseDetails", poCode);
	}// getPurchaseDetails() [발주상세]

	public void updatePurchase(PurchaseDTO purchaseDTO) {
		System.out.println("PurchaseDAO updatePurchase()");
		System.out.println(purchaseDTO);
		
		sqlSession.update(namespace+".updatePurchase",purchaseDTO);
	}// updatePurchase() [발주수정]

	public void deletePurchase(PurchaseDTO purchaseDTO) {
		System.out.println("PurchaseDAO deletePurchase()");
		System.out.println(purchaseDTO);
		
		sqlSession.update(namespace+".deletePurchase",purchaseDTO);
	}// deletePurchase() [발주삭제]
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
} // class
