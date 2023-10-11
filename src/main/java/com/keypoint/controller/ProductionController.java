package com.keypoint.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keypoint.dto.LineDTO;
import com.keypoint.dto.PageDTO;
import com.keypoint.dto.ProductionDTO;
import com.keypoint.dto.WorkOrderDTO;
import com.keypoint.service.LineService;
import com.keypoint.service.ProductionService;
import com.keypoint.service.WorkOrderService;

@Controller
@RequestMapping("/production/*")
public class ProductionController {
	
	
	@Inject
	private ProductionService productionService;
	
	@Inject
	private WorkOrderService workOrderService;
	
	@Inject
	private LineService lineService;
	
	
	
	@GetMapping("/productionList")
	public String productionList(HttpServletRequest request, Model model) {
		System.out.println("ProductionController production/productionList");
		
		int pageSize = 10; //한 화면에 보여줄 글개수 설정
		String pageNum=request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		
		PageDTO pageDTO =new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		List<ProductionDTO> productionList = productionService.getProductionList(pageDTO);
		List<LineDTO> lineList = lineService.getLineList();
	//		System.out.println(productionList.get(0).getEmpName());
		
		int count = productionService.getProductionCount();	
		
		int pageBlock = 10; // 한화면에 보여줄 페이지 개수 설정
		
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		
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
		
		model.addAttribute("lineList", lineList);
		model.addAttribute("productionList", productionList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "production/productionList";
	}// productionList [생산실적]
	
	
	
	@GetMapping("/productionInsert")
	public String productionInsert() {
		System.out.println("ProductionController production/productionInsert");
		return "production/productionInsert";
	}// receiveUpdate [작업지시등록]
	
	@PostMapping("/productionInsertPro")
	public String productionInsertPro(ProductionDTO productionDTO) {
		System.out.println("ProductionController workOrder/workOrderInsertPro");
		System.out.println(productionDTO);
		productionService.productionInsertPro(productionDTO);
		
		if(productionDTO != null) {
			return "production/msgSuccess"; // 등록완료
		}else {
			return "production/msgFailed"; // 등록실패
		}
	}// workOrderInsertPro [작업지시등록Pro]
	
	
	
	
	
	
	
	
}
