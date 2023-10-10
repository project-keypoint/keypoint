package com.keypoint.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.keypoint.dto.PageDTO;
import com.keypoint.dto.ReceiveDTO;
import com.keypoint.service.ReceiveService;

@Controller
@RequestMapping("/receive/*")
public class ReceiveController {
	
	@Inject
	private ReceiveService receiveService;
	
	@GetMapping("/receiveShipList")
	public String shipmentTest(HttpServletRequest request,Model model) {
		System.out.println("ReceiveController receive/shipmentTest");
		
		String search = request.getParameter("search");
		int pageSize = 3; //한 화면에 보여줄 글개수 설정
		String pageNum=request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		PageDTO pageDTO =new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setSearch(search);
		
		List<ReceiveDTO> receiveList = receiveService.getReceiveList(pageDTO);
		
		int count = receiveService.getReceiveCount(pageDTO);
		System.out.println("count"+count+"pagesize"+pageSize);
		int pageBlock = 5; // 한화면에 보여줄 페이지 개수 설정
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		System.out.println("컨트롤러startPage"+startPage);
		int endPage = startPage + pageBlock -1;
		int pageCount = count/pageSize+(count%pageSize==0?0:1);
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		// =======================================
		
		String search1 = request.getParameter("search1");
		int pageSize1 = 1; //한 화면에 보여줄 글개수 설정
		String pageNum1=request.getParameter("pageNum1");
		if(pageNum1 == null) {
			pageNum1 = "1";
		}
		int currentPage1 = Integer.parseInt(pageNum1);
		PageDTO pageDTO1 =new PageDTO();
		pageDTO1.setPageSize(pageSize1);
		pageDTO1.setPageNum(pageNum1);
		pageDTO1.setCurrentPage(currentPage1);
		pageDTO1.setSearch(search1);
		
		List<ReceiveDTO> shipmentList = receiveService.getShipmentList(pageDTO1);
		
		int count1 = receiveService.getShipmentCount(pageDTO1);
		System.out.println("count1"+count1+"pagesize1"+pageSize1);
		int pageBlock1 = 5; // 한화면에 보여줄 페이지 개수 설정
		int startPage1=(currentPage1-1)/pageBlock1*pageBlock1+1;
		System.out.println("컨트롤러startPage1"+startPage1);
		int endPage1 = startPage1 + pageBlock1 -1;
		int pageCount1 = count1/pageSize1+(count1%pageSize1==0?0:1);
		if(endPage1 > pageCount1) {
			endPage1 = pageCount1;
		}
		pageDTO1.setCount(count1);
		pageDTO1.setPageBlock(pageBlock1);
		pageDTO1.setStartPage(startPage1);
		pageDTO1.setEndPage(endPage1);
		pageDTO1.setPageCount(pageCount1);
		
		model.addAttribute("receiveList", receiveList);
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("shipmentList", shipmentList);
		model.addAttribute("pageDTO1", pageDTO1);
		return "receive/receiveShipList";
	}// receiveShipList [수주&출하 목록]
	
	@GetMapping("/receiveInsert")
	public String receiveInsert() {
		System.out.println("ReceiveController receive/receiveInsert");
		return "receive/receiveInsert";
	}// receiveInsert [수주등록]
	
	@PostMapping("/receiveInsertPro")
	public String receiveInsertPro(ReceiveDTO receiveDTO) {
		System.out.println("ReceiveController receive/receiveInsertPro");
		System.out.println(receiveDTO);
		receiveService.receiveInsertPro(receiveDTO);
		
		if(receiveDTO != null) {
			return "receive/msgSuccess"; // 등록완료
		}else {
			return "receive/msgFailed"; // 등록실패
		}
	}// receiveInsertPro [수주등록Pro]
	
	@GetMapping("/receiveDetails")
	public String receiveDetails(Model model, @RequestParam("roCode") String roCode) {
		System.out.println("ReceiveController receive/receiveDetails");
		ReceiveDTO receiveDTO = receiveService.getReceiveDetails(roCode);
		model.addAttribute("receiveDTO", receiveDTO);
		return "receive/receiveDetails";
	}// receiveDetails [수주상세]
	
	@GetMapping("/receiveUpdate")
	public String receiveUpdate(Model model, @RequestParam("roCode") String roCode) {
		System.out.println("ReceiveController receive/receiveUpdate");
		ReceiveDTO receiveDTO = receiveService.getReceiveDetails(roCode);
		model.addAttribute("receiveDTO", receiveDTO);
		return "receive/receiveUpdate";
	}// receiveUpdate [수주수정]
	
	@PostMapping("/receiveUpdatePro")
	public String receiveUpdatePro(ReceiveDTO receiveDTO) {
		System.out.println("ReceiveController receive/receiveUpdatePro");
		System.out.println(receiveDTO);
		receiveService.receiveUpdatePro(receiveDTO);
		
		if(receiveDTO != null) {
			return "receive/msgSuccess"; // 등록완료
		}else {
			return "receive/msgFailed"; // 등록실패
		}
	}// receiveUpdatePro [수주수정Pro]
	
	@GetMapping("/receiveDelete")
	public String receiveDeletePro(ReceiveDTO receiveDTO) {
		System.out.println("ReceiveController receive/receiveDelete");
		System.out.println(receiveDTO);
		receiveService.receiveDelete(receiveDTO);
		
		if(receiveDTO != null) {
			return "receive/msgSuccess"; // 등록완료
		}else {
			return "receive/msgFailed"; // 등록실패
		}
	}// receiveDelete [수주삭제]
	
	@PostMapping("/shipComplete")
	public ResponseEntity<String> qcTransfer(ReceiveDTO receiveDTO) {
	    System.out.println("ReceiveController shipComplete");
	    System.out.println(receiveDTO);
	    boolean result = receiveService.shipComplete(receiveDTO);
	    if (result)
	        return new ResponseEntity<>("success", HttpStatus.OK);
	    return new ResponseEntity<>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
	}// shipComplete [출하완료]
	
	/////////////////////////////////////////////////////////////////////
	
	@GetMapping("/empty") // 빈페이지
	public String empty() {
		System.out.println("ReceiveController receive/empty");
		return "receive/empty";
	}// empty [빈페이지]
	
	@GetMapping("/test") // 테스트페이지
	public String test() {
		System.out.println("ReceiveController receive/test");
		return "receive/test";
	}// test [테스트페이지]
	
}//class
