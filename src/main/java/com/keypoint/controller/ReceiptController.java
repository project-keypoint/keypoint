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
	public String receiptList(HttpServletRequest request, Model model) {
		System.out.println("ReceiptController receipt/receiptList");
		
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
		
		List<ReceiptDTO> receiptList = receiptService.getReceiptList(pageDTO);
		
		// 전체 글개수 가져오기
		int count = receiptService.getReceiptCount();
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
		
		
		model.addAttribute("receiptList", receiptList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "receipt/receiptList";
	}// receiveTest [수주목록] // 페이징은 나중에		
	
	// ----------------------------------------------------------------------------------------------------------
	
	@GetMapping("/receiptDetails")
	public String receiptDetails(Model model, @RequestParam("grCode") String grCode) {
		System.out.println("receiptController receipt/receiptDetails");
		
		ReceiptDTO receiptDTO = receiptService.getReceiptDetails(grCode);
		model.addAttribute("receiptDTO", receiptDTO);
		return "receipt/receiptDetails";
	}// receiptDetails [입고상세]
	
	// -------------------------------------------------------------------------------------------------
	
	@GetMapping("/receiptUpdate")
	public String receiptUpdate(Model model, @RequestParam("grCode") String grCode) {
		System.out.println("PurchaseController receipt/receiptUpdate");
		
		ReceiptDTO receiptDTO = receiptService.getReceiptDetails(grCode);
		model.addAttribute("receiptDTO", receiptDTO);
		return "receipt/receiptUpdate";
	}// purchaseUpdate [발주수정]
	
	@PostMapping("/receiptUpdatePro")
	public String receiptUpdatePro(ReceiptDTO receiptDTO) {
		System.out.println("receiptController receipt/receiptUpdatePro");
		System.out.println(receiptDTO);
		receiptService.receiptUpdatePro(receiptDTO);
		
		if(receiptDTO != null) {
			return "receipt/msgSuccess"; // 등록완료
		}else {
			return "receipt/msgFailed"; // 등록실패
		}
		
	}// receiptUpdatePro [발주수정Pro]
	
	//------------------------------------------------------------------------------------------
	
	
	
	
	
	
	
	
	
	
	
	
} // class
