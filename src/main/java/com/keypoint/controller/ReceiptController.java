package com.keypoint.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keypoint.dto.PurchaseDTO;
import com.keypoint.dto.ReceiptDTO;
import com.keypoint.service.ReceiptService;

@Controller
@RequestMapping("/receipt/*")
public class ReceiptController {

	// ReceiptService 객체생성
	@Inject
	private ReceiptService receiptService;
	
	// --------------------------------------------------------------------------------
	
	@GetMapping("/receiptInsert")
	public String receiptInsert() {
		
		
		return "receipt/receiptInsert";
	}//
	
	@PostMapping("/receiptInsertPro")
	public String receiptInsertPro(ReceiptDTO receiptDTO) {
		System.out.println("receiptDTO receiptInsertPro()");
		
		//등록 처리
		System.out.println(receiptDTO);
		
		receiptService.insertReceipt(receiptDTO);
		
		if(receiptDTO != null) {
			return "receipt/msgSuccess"; // 등록완료
		}else {
			return "receipt/msgFailed"; // 등록실패
		}
		
	}//
	
	//----------------------------------------------------------------------------------------------
	
	
	
	
	
	
	
	
	@GetMapping("/receiptList")
	public String receiptList() {
		
		// member/join.jsp
		// WEB-INF/views/member/join.jsp
		return "receipt/receiptList";
	}//
	
	
	
	
} // class
