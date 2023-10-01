package com.keypoint.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
		
		// member/join.jsp
		// WEB-INF/views/member/join.jsp
		return "receipt/receiptInsert";
	}//
	
	
	
	@GetMapping("/receiptList")
	public String receiptList() {
		
		// member/join.jsp
		// WEB-INF/views/member/join.jsp
		return "receipt/receiptList";
	}//
	
	
	
	
} // class
