package com.keypoint.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.keypoint.dao.PurchaseDAO;
import com.keypoint.dao.ReceiptDAO;
import com.keypoint.dto.PageDTO;
import com.keypoint.dto.PurchaseDTO;
import com.keypoint.dto.ReceiptDTO;

@Service
public class ReceiptService {

	@Inject
	private ReceiptDAO receiptDAO;

//	@Inject
//    private PurchaseDAO purchaseDAO;

	// -------------------------------------------------------------------------------------

	public void insertReceipt(ReceiptDTO receiptDTO) {
		System.out.println("PurchaseService insertPurchase()");

		receiptDAO.insertReceipt(receiptDTO);

	} // insertReceipt

	public List<ReceiptDTO> getReceiptList(PageDTO pageDTO) {
		System.out.println("ReceiptService getReceiptList()");

		// 10개씩 가져올때 현페이지에 대한 시작하는 행번호 구하기
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		// 끝나는 행번호 구하기
		int endRow = startRow + pageDTO.getPageSize() - 1;

		// 디비 startRow - 1
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);

		return receiptDAO.getReceiptList(pageDTO);
	}// getReceiptList [입고목록]

	public int getReceiptCount(PageDTO pageDTO) {
		System.out.println("ReceiptService getReceiptCount()");

		return receiptDAO.getReceiptCount(pageDTO);
	} // getReceiptCount

	public ReceiptDTO getReceiptDetails(String grCode) {
		System.out.println("ReceiptService getReceiptDetails()");

		return receiptDAO.getReceiptDetails(grCode);
	}// getReceiptDetails [입고상세]

	public void receiptUpdatePro(ReceiptDTO receiptDTO) {
		System.out.println("receiptService receiptUpdatePro()");
		System.out.println(receiptDTO);
//		receiveDTO.setShipSdate(new Timestamp(System.currentTimeMillis()));
		receiptDAO.updateReceipt(receiptDTO);
	}// receiptUpdatePro() [입고수정Pro]

	public ReceiptDTO getReceiptDetails2(String grCode) {
		System.out.println("ReceiptService getReceiptDetails2()");

		return receiptDAO.getReceiptDetails2(grCode);
	}// getReceiptDetails2 [입고완료상세2]

	public void receiptUpdatePro2(ReceiptDTO receiptDTO) {
		System.out.println("receiptService receiptUpdatePro2()");
		System.out.println(receiptDTO);
//		receiveDTO.setShipSdate(new Timestamp(System.currentTimeMillis()));
		receiptDAO.updateReceipt2(receiptDTO);
	}// receiptUpdatePro2() [입고완료Pro]

	// ------------------------------------------------------------------------------

	public void deleteReceiptAndRelatedData(String grCode) {
		// 1. GoodsReceipt 삭제
		receiptDAO.deleteGoodsReceipt(grCode);

		// 2. 연관된 PurchaseOrder를 찾고 삭제
		String poCode = receiptDAO.getRelatedPurchaseOrderCode(grCode);
		if (poCode != null) {
			receiptDAO.deletePurchaseOrder(poCode);
		}
	} // deleteReceiptAndRelatedData

	// -----------------------------------------------------------

	public void updateMaterialCount(ReceiptDTO receiptDTO) {
		receiptDAO.updateMaterialCount(receiptDTO);
	} // updateMaterialCount

} // class
