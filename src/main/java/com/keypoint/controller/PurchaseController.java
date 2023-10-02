package com.keypoint.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.keypoint.dto.PageDTO;
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
	public String purchaseList(HttpServletRequest request, Model model) {
		System.out.println("PurchaseController purchase/purchaseList");
		
		//한 화면에 보여줄 글개수 설정
		int pageSize = 10;
		// 현 페이지 번호 가져오기
		String pageNum=request.getParameter("pageNum");
		// 페이지 번호가 없을 경우 => "1"로 설정
		if(pageNum == null) {
			pageNum = "1";
		}
		
		// 페이지 번호 => 정수형 변경
		int currentPage = Integer.parseInt(pageNum);
		
		PageDTO pageDTO =new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		List<PurchaseDTO> purchaseList = purchaseService.getPurchaseList(pageDTO);
		
		// 전체 글개수 가져오기
		int count = purchaseService.getPurchaseCount();
		// 한화면에 보여줄 페이지 개수 설정
		int pageBlock = 10;
		// 시작하는 페이지 번호
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		// 끝나는 페이지 번호
		int endPage = startPage + pageBlock -1;
		// 전체페이지 개수
		int pageCount = count/pageSize+(count%pageSize==0?0:1);
		// 끝나는 페이지 번호  전체페이지 개수 비교 
		//=> 끝나는 페이지 번호가 크면 전체페이지 개수로 변경
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		
		model.addAttribute("purchaseList", purchaseList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "purchase/purchaseList";
	}// receiveTest [수주목록] // 페이징은 나중에		
	
	// ------------------------------------------------------------------------------------
	
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
	
	@GetMapping("/test2")
	public String test2() {
		
		// /main.jsp
		// WEB-INF/views/tables.jsp
		return "purchase/test2";
	}//
	
	//------------------------------------------------------------------------------------------
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
} // class
