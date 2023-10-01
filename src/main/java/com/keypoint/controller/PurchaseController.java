package com.keypoint.controller;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keypoint.dto.PurchaseDTO;
import com.keypoint.service.PurchaseService;


@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {
	
	//productService 객체생성
	@Inject
	private PurchaseService purchaseService;
	
	// ------------------------------------------------------------------------------------

	@GetMapping("/purchaseInsert")
	public String purchaseInsert() {
		
		
		return "purchase/purchaseInsert";
	}//
	
	@PostMapping("/purchaseInsertPro")
	public String purchaseInsertPro(PurchaseDTO purchaseDTO) {
		System.out.println("purchaseDTO purchaseInsertPro()");
		
		//등록 처리
		System.out.println(purchaseDTO);
		
		purchaseService.insertPurchase(purchaseDTO);
		
		// 주소변경하면서 이동 /purchase/test3
		return "redirect:/purchase/purchaseList";
	}//
	
	//----------------------------------------------------------------------------------------------
	

	@GetMapping("/test2")
	public String test2() {
		
		// /main.jsp
		// WEB-INF/views/tables.jsp
		return "purchase/test2";
	}//
	
	@GetMapping("/purchaseList")
	public String purchaseList() {
		
		// /main.jsp
		// WEB-INF/views/tables.jsp
		return "purchase/purchaseList";
	}//
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
} // class
