package com.keypoint.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.keypoint.dto.PurchaseDTO;

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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
} // class
