package com.keypoint.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.keypoint.dao.ReceiptDAO;
import com.keypoint.dto.PurchaseDTO;
import com.keypoint.dto.ReceiptDTO;

@Service
public class ReceiptService {

	@Inject
	private ReceiptDAO receiptDAO;
	
	// -------------------------------------------------------------------------------------
	
	public void insertReceipt(ReceiptDTO receiptDTO) {
		System.out.println("PurchaseService insertPurchase()");
		
		// purchaseDTO.setPoDate(new Timestamp(System.currentTimeMillis()));
		
		receiptDAO.insertReceipt(receiptDTO);
		
	} // insertReceipt
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
} // class
