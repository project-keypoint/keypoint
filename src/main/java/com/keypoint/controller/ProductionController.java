package com.keypoint.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keypoint.dto.LineDTO;
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
	public String productionList(Model model) {
		System.out.println("ProductionController production/productionList");
		List<ProductionDTO> productionList = productionService.getProductionList();
		List<LineDTO> lineList = lineService.getLineList();
//		System.out.println(productionList.get(0).getEmpName());
		model.addAttribute("lineList", lineList);
		model.addAttribute("productionList", productionList);
		return "production/productionList";
	}// productionList [생산실적]
	
	
	
	@GetMapping("/productionInsert")
	public String productionInsert() {
		System.out.println("ProductionController production/productionInsert");
		return "production/productionInsert";
	}// receiveUpdate [작업지시등록]
	
	@PostMapping("/productionInsertPro")
	public String productionInsertPro(ProductionDTO productionDTO) {
		System.out.println("ReceiveController workOrder/workOrderInsertPro");
		System.out.println(productionDTO);
		productionService.productionInsertPro(productionDTO);
		
		if(productionDTO != null) {
			return "production/msgSuccess"; // 등록완료
		}else {
			return "production/msgFailed"; // 등록실패
		}
	}// workOrderInsertPro [작업지시등록Pro]
	
	
	
	
	
	
	
	
}
