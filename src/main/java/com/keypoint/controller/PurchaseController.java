package com.keypoint.controller;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		
		if(purchaseDTO != null) {
			return "purchase/msgSuccess"; // 등록완료
		}else {
			return "purchase/msgFailed"; // 등록실패
		}
		
	}//
	
	//----------------------------------------------------------------------------------------------
	
	@GetMapping("/purchaseList")
	public String purchaseList(Model model) {
		System.out.println("PurchaseController purchase/purchaseList");
		
		List<PurchaseDTO> purchaseList = purchaseService.getPurchaseList();
		model.addAttribute("purchaseList", purchaseList);
		return "purchase/purchaseList";
	}// receiveTest [수주목록] // 페이징은 나중에
	
	// ------------------------------------------------------------------------------------
	
	@GetMapping("/test2")
	public String test2() {
		
		// /main.jsp
		// WEB-INF/views/tables.jsp
		return "purchase/test2";
	}//

	//------------------------------------------------------------------------------------------
	
	@GetMapping("/purchaseDetails")
	public String purchaseDetails(Model model, @RequestParam("poCode") String poCode) {
		System.out.println("purchaseController purchase/purchaseDetails");
		
		PurchaseDTO purchaseDTO = purchaseService.getPurchaseDetails(poCode);
		model.addAttribute("purchaseDTO", purchaseDTO);
		return "purchase/purchaseDetails";
	}// purchaseDetails [발주상세]
	
	//------------------------------------------------------------------------------------------
	
	@GetMapping("/purchaseUpdate")
	public String purchaseUpdate(Model model, @RequestParam("poCode") String poCode) {
		System.out.println("PurchaseController purchase/purchaseUpdate");
		
		PurchaseDTO purchaseDTO = purchaseService.getPurchaseDetails(poCode);
		model.addAttribute("purchaseDTO", purchaseDTO);
		return "purchase/purchaseUpdate";
	}// purchaseUpdate [발주수정]
	
	@PostMapping("/purchaseUpdatePro")
	public String purchaseUpdatePro(PurchaseDTO purchaseDTO) {
		System.out.println("purchaseController purchase/purchaseUpdatePro");
		System.out.println(purchaseDTO);
		purchaseService.purchaseUpdatePro(purchaseDTO);
		
		if(purchaseDTO != null) {
			return "purchase/msgSuccess"; // 등록완료
		}else {
			return "purchase/msgFailed"; // 등록실패
		}
		
	}// purchaseUpdatePro [발주수정Pro]
	
	//------------------------------------------------------------------------------------------
	
	@GetMapping("/purchaseDelete")
	public String purchaseDeletePro(PurchaseDTO purchaseDTO) {
		System.out.println("purchaseController purchase/purchaseDelete");
		System.out.println(purchaseDTO);
		purchaseService.purchaseDelete(purchaseDTO);
		
		if(purchaseDTO != null) {
			return "purchase/msgSuccess"; // 등록완료
		}else {
			return "purchase/msgFailed"; // 등록실패
		}
	}// purchaseDelete [발주삭제]
	
	//------------------------------------------------------------------------------------------
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
} // class
