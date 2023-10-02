package com.keypoint.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.keypoint.dao.PurchaseDAO;
import com.keypoint.dto.PurchaseDTO;
import com.keypoint.dto.ReceiveDTO;

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
	
	
	public List<PurchaseDTO> getPurchaseList() {
		System.out.println("PurchaseService getPurchaseList()");
		
		return purchaseDAO.getPurchaseList();
	}// getPurchaseList [발주목록]
	
	public PurchaseDTO getPurchaseDetails(String poCode) {
		System.out.println("PurchaseService getPurchaseDetails()");
		
		return purchaseDAO.getPurchaseDetails(poCode);
	}// getReceiveDetails [발주상세]

	public void purchaseUpdatePro(PurchaseDTO purchaseDTO) {
		System.out.println("ReceiveService receiveUpdatePro()");
		System.out.println(purchaseDTO);
//		receiveDTO.setShipSdate(new Timestamp(System.currentTimeMillis()));
		purchaseDAO.updatePurchase(purchaseDTO);
	}// purchaseUpdatePro() [발주수정Pro]

	public void purchaseDelete(PurchaseDTO purchaseDTO) {
		System.out.println("purchaseService purchaseDelete()");
		System.out.println(purchaseDTO);
		
		purchaseDAO.deletePurchase(purchaseDTO);
	}// purchaseDelete() [발주삭제]

	
	
	
	
} // class
