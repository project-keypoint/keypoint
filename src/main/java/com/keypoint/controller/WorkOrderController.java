package com.keypoint.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.ui.Model;

import com.keypoint.dto.PageDTO;
import com.keypoint.dto.WorkOrderDTO;
import com.keypoint.service.WorkOrderService;

@Controller
@RequestMapping("/workOrder/*")
public class WorkOrderController {
	
	@Inject
	private WorkOrderService workOrderService;
	
	
	@GetMapping("/workOrderList")
	public String workOrder() {
		System.out.println("WorkOrderController workOrder/workOrderList");
		return "workOrder/workOrderList";
	}// workOrder [작업지시]
	
	@GetMapping("/workOrderInsert")
	public String workOrderInsert() {
		System.out.println("WorkOrderController workOrder/workOrderUpdate");
		return "workOrder/workOrderInsert";
	}// receiveUpdate [작업지시등록]
	
	
	@RequestMapping(value = "/workProdList", method = RequestMethod.GET)
	public String workProdList(Model model, HttpServletRequest request, PageDTO pageDTO) { // 품목 리스트
		String productCode = request.getParameter("productCode");
		String productName = request.getParameter("productName");
		
		// 한 화면에 보여줄 글 개수 설정
		int pageSize = 5; // sql문에 들어가는 항목
		
		// 현페이지 번호 가져오기
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		// 페이지번호를 정수형 변경
		int currentPage=Integer.parseInt(pageNum);
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1; // sql문에 들어가는 항목
		int endRow = startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow-1); // limit startRow (0이 1열이기 때문 1을 뺌)
		pageDTO.setEndRow(endRow);

		Map<String,Object> search = new HashMap<>(); // sql에 들어가야할 서치 항목 및 pageDTO 항목 map에 담기
		search.put("productCode", productCode);
		search.put("productName", productName);
		search.put("startRow", pageDTO.getStartRow());
		search.put("pageSize", pageDTO.getPageSize());
 
		List<WorkOrderDTO> workProdList = workOrderService.getWorkProdList(search);
			
		//페이징 처리
		int count = workOrderService.countWorkList(search);

		int pageBlock = 10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		if(endPage > pageCount){
		 	endPage = pageCount;
		 }
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
				
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("search", search);
		model.addAttribute("workProdList", workProdList);
		return "workOrder/workProdList";
	}
	



@RequestMapping(value = "/workCusList", method = RequestMethod.GET)
public String workCusList(Model model, HttpServletRequest request, PageDTO pageDTO) { // 품목 리스트
	String cusCode = request.getParameter("cusCode");
	String cusName = request.getParameter("cusName");
	
	// 한 화면에 보여줄 글 개수 설정
	int pageSize = 5; // sql문에 들어가는 항목
	
	// 현페이지 번호 가져오기
	String pageNum = request.getParameter("pageNum");
	if(pageNum==null) {
		pageNum="1";
	}
	// 페이지번호를 정수형 변경
	int currentPage=Integer.parseInt(pageNum);
	pageDTO.setPageSize(pageSize);
	pageDTO.setPageNum(pageNum);
	pageDTO.setCurrentPage(currentPage);
	int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1; // sql문에 들어가는 항목
	int endRow = startRow+pageDTO.getPageSize()-1;
	
	pageDTO.setStartRow(startRow-1); // limit startRow (0이 1열이기 때문 1을 뺌)
	pageDTO.setEndRow(endRow);

	Map<String,Object> search = new HashMap<>(); // sql에 들어가야할 서치 항목 및 pageDTO 항목 map에 담기
	search.put("cusCode", cusCode);
	search.put("cusName", cusName);
	search.put("startRow", pageDTO.getStartRow());
	search.put("pageSize", pageDTO.getPageSize());

	List<WorkOrderDTO> workCusList = workOrderService.getWorkCusList(search);
		
	//페이징 처리
	int count = workOrderService.countCusList(search);

	int pageBlock = 10;
	int startPage=(currentPage-1)/pageBlock*pageBlock+1;
	int endPage=startPage+pageBlock-1;
	int pageCount=count/pageSize+(count%pageSize==0?0:1);
	if(endPage > pageCount){
	 	endPage = pageCount;
	 }
	
	pageDTO.setCount(count);
	pageDTO.setPageBlock(pageBlock);
	pageDTO.setStartPage(startPage);
	pageDTO.setEndPage(endPage);
	pageDTO.setPageCount(pageCount);
			
	model.addAttribute("pageDTO", pageDTO);
	model.addAttribute("search", search);
	model.addAttribute("workCusList", workCusList);
	return "workOrder/workCusList";
}
	


@RequestMapping(value = "/workInstructList", method = RequestMethod.GET)
public String workInstructList(Model model, HttpServletRequest request, PageDTO pageDTO) { // 품목 리스트
	String woCode = request.getParameter("woCode");
	
	// 한 화면에 보여줄 글 개수 설정
	int pageSize = 5; // sql문에 들어가는 항목
	
	// 현페이지 번호 가져오기
	String pageNum = request.getParameter("pageNum");
	if(pageNum==null) {
		pageNum="1";
	}
	// 페이지번호를 정수형 변경
	int currentPage=Integer.parseInt(pageNum);
	pageDTO.setPageSize(pageSize);
	pageDTO.setPageNum(pageNum);
	pageDTO.setCurrentPage(currentPage);
	int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1; // sql문에 들어가는 항목
	int endRow = startRow+pageDTO.getPageSize()-1;
	
	pageDTO.setStartRow(startRow-1); // limit startRow (0이 1열이기 때문 1을 뺌)
	pageDTO.setEndRow(endRow);

	Map<String,Object> search = new HashMap<>(); // sql에 들어가야할 서치 항목 및 pageDTO 항목 map에 담기
	search.put("woCode", woCode);
	search.put("startRow", pageDTO.getStartRow());
	search.put("pageSize", pageDTO.getPageSize());

	List<WorkOrderDTO> workInstructList = workOrderService.workInstructList(search);
		
	//페이징 처리
	int count = workOrderService.countInstructList(search);

	int pageBlock = 10;
	int startPage=(currentPage-1)/pageBlock*pageBlock+1;
	int endPage=startPage+pageBlock-1;
	int pageCount=count/pageSize+(count%pageSize==0?0:1);
	if(endPage > pageCount){
	 	endPage = pageCount;
	 }
	
	pageDTO.setCount(count);
	pageDTO.setPageBlock(pageBlock);
	pageDTO.setStartPage(startPage);
	pageDTO.setEndPage(endPage);
	pageDTO.setPageCount(pageCount);
			
	model.addAttribute("pageDTO", pageDTO);
	model.addAttribute("search", search);
	model.addAttribute("workInstructList", workInstructList);
	return "workOrder/workInstructList";
}



}


