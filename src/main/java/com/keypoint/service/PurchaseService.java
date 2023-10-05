package com.keypoint.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.keypoint.dao.MaterialDAO;
import com.keypoint.dao.PurchaseDAO;
import com.keypoint.dto.MaterialDTO;
import com.keypoint.dto.PageDTO;
import com.keypoint.dto.PurchaseDTO;
import com.keypoint.dto.ReceiveDTO;
import com.keypoint.dto.WorkOrderDTO;

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
	
	
	public List<PurchaseDTO> getPurchaseList(PageDTO pageDTO) {
		System.out.println("PurchaseService getPurchaseList()");
		
		// 10개씩 가져올때 현페이지에 대한 시작하는 행번호 구하기
		int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize() + 1;
		// 끝나는 행번호 구하기
		int endRow = startRow + pageDTO.getPageSize() - 1;
		
		// 디비 startRow - 1
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		
		
		return purchaseDAO.getPurchaseList(pageDTO);
	}// getPurchaseList [발주목록]
	
	public int getPurchaseCount() {
		System.out.println("PurchaseService getPurchaseCount()");
		
		return purchaseDAO.getPurchaseCount();
	} // getPurchaseCount
	
	
	
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

	
	//-----------------------------------------------------------------------------
	
	public List<PurchaseDTO> getPurchaseOrderList(Map<String, Object> search) {
		System.out.println("purchaseService getPurchaseOrderList()");
		
		
		return purchaseDAO.getPurchaseOrderList(search);
	} // getPurchaseOrderList


	public Integer countPurchaseOrderList(Map<String, Object> search) { // 품목 개수
		System.out.println("purchaseService countPurchaseOrderList()");
		
		
		return purchaseDAO.countPurchaseOrderList(search);
	} // countPurchaseList
	
	// --------------------------------------------------------------------------------------------------
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
} // class
