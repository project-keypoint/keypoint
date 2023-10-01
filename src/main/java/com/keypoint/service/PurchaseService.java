package com.keypoint.service;

import java.sql.Timestamp;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.keypoint.dao.PurchaseDAO;
import com.keypoint.dto.PurchaseDTO;

@Service
public class PurchaseService {

	@Inject
	private PurchaseDAO purchaseDAO;

	// ------------------------------------------------------------------------------------
	
	public void insertPurchase(PurchaseDTO purchaseDTO) {
		System.out.println("PurchaseService insertPurchase()");
		
		// purchaseDTO.setPoDate(new Timestamp(System.currentTimeMillis()));
		
		purchaseDAO.insertPurchase(purchaseDTO);
		
	} // insertPurchase
	
	
	
	
	
	
	
	
} // class
