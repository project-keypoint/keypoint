package com.keypoint.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.keypoint.dto.LineDTO;
import com.keypoint.dto.PageDTO;
import com.keypoint.dto.ProductionDTO;
import com.keypoint.dto.WorkOrderDTO;
import com.keypoint.service.LineService;
import com.keypoint.service.ProductionService;
import com.keypoint.service.WorkOrderService;

import com.keypoint.dto.EmployeeDTO;
import com.keypoint.service.EmployeeService;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/production/*")
public class ProductionController {
	
	
	@Inject
	private ProductionService productionService;
	
	@Inject
	private WorkOrderService workOrderService;
	
	//employeeService 객체생성
	@Inject
	private EmployeeService employeeService;
	
	
	
	@GetMapping("/productionList")
	public String productionList(HttpServletRequest request, Model model, HttpSession session) {
		System.out.println("ProductionController production/productionList");
		
		// 세션에서 empId 가져오기
			int empId = (int) session.getAttribute("empId");
		
		String search1 = request.getParameter("search1");
		String search2 = request.getParameter("search2");
		String search3 = request.getParameter("search3");
		String search4 = request.getParameter("search4");
		
		
		
		
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
		pageDTO.setSearch1(search1);
		pageDTO.setSearch2(search2);
		pageDTO.setSearch3(search3);
		pageDTO.setSearch4(search4);
		
		
		List<ProductionDTO> productionList = productionService.getProductionList(pageDTO);
//		List<LineDTO> lineList = lineService.getLineList(pageDTO);
	//		System.out.println(productionList.get(0).getEmpName());
		
		int count = productionService.getProductionCount(pageDTO);	
		
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
		
//		model.addAttribute("lineList", lineList);
		model.addAttribute("productionList", productionList);
		model.addAttribute("pageDTO", pageDTO);
		System.out.println(productionList);
		
		// empId로 사원정보 가져오기
		EmployeeDTO employeeDTO = employeeService.getEmployeeDetails(empId);
		model.addAttribute("employeeDTO", employeeDTO);
		System.out.println(employeeDTO);
		
		
		return "production/productionList";
	}// productionList [생산실적]
	
	
	
	@GetMapping("/productionInsert")
	public String productionInsert() {
		System.out.println("ProductionController production/productionInsert");
		return "production/productionInsert";
	}// receiveUpdate [생산실적등록]
	
	@PostMapping("/productionInsertPro")
	public String productionInsertPro(ProductionDTO productionDTO) {
		System.out.println("ProductionController workOrder/workOrderInsertPro");
		System.out.println("productionDTO");
		System.out.println(productionDTO);
		
		WorkOrderDTO workOrderDTO = new WorkOrderDTO();
		workOrderDTO.setWoCode(productionDTO.getWoCode());
		workOrderDTO.setWoStatus("완료");
		
		System.out.println(workOrderDTO);
		
		productionService.productionInsertPro(productionDTO);
		workOrderService.updateWorkOrderStatus(workOrderDTO);
		
		
		List<Map<String, Object>> workSumList = workOrderService.selectWorkSum(workOrderDTO);
		
		System.out.println(workSumList);
		
		for(Map<String, Object> param: workSumList) {
			
			workOrderService.updateMaterialCount(param);
		}
		
		
		
		
		
		
		if(productionDTO != null) {
			return "production/msgSuccess"; // 등록완료
		}else {
			return "production/msgFailed"; // 등록실패
		}
	}// workOrderInsertPro [생산실적등록Pro]
	
	
	
	@GetMapping("/productionDetails")
	public String productionDetails(Model model, @RequestParam("poCode") String poCode, HttpSession session) {
		System.out.println("ProductionController production/productionDetails");
		// 세션에서 empId 가져오기
		int empId = (int) session.getAttribute("empId");
		ProductionDTO productionDTO = productionService.getProductionDetails(poCode);
		model.addAttribute("productionDTO", productionDTO);
		// empId로 사원정보 가져오기
		EmployeeDTO employeeDTO = employeeService.getEmployeeDetails(empId);
		model.addAttribute("employeeDTO", employeeDTO);
		System.out.println(employeeDTO);
		
		return "production/productionDetails";
	}// workOrderDetails [생산실적상세]
	
	
	@GetMapping("/productionUpdate")
	public String productionUpdate(Model model, @RequestParam("poCode") String poCode) {
		System.out.println("ProductionController production/productionUpdate");
		ProductionDTO productionDTO = productionService.getProductionDetails(poCode);
		model.addAttribute("productionDTO", productionDTO);
		return "production/productionUpdate";
	}// workOrderUpdate [생산실적수정]
	
	
	@PostMapping("/productionUpdatePro")
	public String productionUpdatePro(ProductionDTO productionDTO) {
		System.out.println("WorkOrderController production/productionUpdatePro");
		System.out.println(productionDTO);
		productionService.productionUpdatePro(productionDTO);
		
		if(productionDTO != null) {
			return "production/msgSuccess"; // 등록완료
		}else {
			return "production/msgFailed"; // 등록실패
		}
	}// workOrderUpdatePro [생산실적수정Pro]
	
	
	@GetMapping("/productionDelete")
	public String productionDelete(ProductionDTO productionDTO) {
		System.out.println("ProductionController production/productionDelete");
		System.out.println(productionDTO);
		productionService.productionDelete(productionDTO);
		
		if(productionDTO != null) {
			return "production/msgSuccess"; // 등록완료
		}else {
			return "production/msgFailed"; // 등록실패
		}
	}// workOrderDelete [생산실적삭제]
	
	
	
	
	 

//    // "/productionList" URL에 대한 POST 요청 처리 (선택 삭제 등의 작업)
//    @PostMapping("/productionList")
//    @ResponseBody
//    public String processProductionList(HttpServletRequest request, @RequestParam("postIds") String postIds) {
//        // 여기에서 선택 삭제 또는 기타 작업을 수행하고 결과를 반환
//        return "success"; // 삭제 성공시 "success" 반환
//    }

	  
// // "/productionList" URL에 대한 POST 요청 처리 (선택 삭제 또는 기타 작업)
//    @PostMapping("/productionList")
//    @ResponseBody
//    public String processProductionList(@RequestParam("postIds") String postIds) {
//        try {
//            // 여기에서 선택 삭제 또는 기타 작업을 수행
//            // productionService.productionDelete(postIds); // 예를 들어, 선택 삭제 작업을 수행할 때
//
//            return "success"; // 삭제 성공시 "success" 반환
//        } catch (Exception e) {
//            e.printStackTrace();
//            return "error"; // 에러 발생시 "error" 반환 또는 적절한 오류 처리
//        }
//    }
	
	 @PostMapping("/deleteSelected")
	    public String deleteSelected(@RequestParam("postIds") String postIds) {
		 System.out.println(postIds);
		 
	        String[] poCodes = postIds.split("\\|");
	        for (String poCode : poCodes) {
	            productionService.deleteSelected(poCode);
	        }
	        return "redirect:/production/productionList";
	    }
	
	
	
}
