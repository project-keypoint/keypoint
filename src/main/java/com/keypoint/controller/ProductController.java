package com.keypoint.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.keypoint.dto.EmployeeDTO;
import com.keypoint.dto.PageDTO;
import com.keypoint.dto.ProductDTO;
import com.keypoint.dto.WorkOrderDTO;
import com.keypoint.service.EmployeeService;
import com.keypoint.service.ProductService;
import com.keypoint.service.WorkOrderService;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	//productService 객체생성
	@Inject
	private ProductService productService;
	
	//employeeService 객체생성
	@Inject
	private EmployeeService employeeService;
	
	//workOrderService 객체생성(자재부 사원/대리를 위해 완제품목록 팝업띄우기위해)
	@Inject
	private WorkOrderService workOrderService;
	
	// 완제품목록 팝업(자재부 사원/대리를 위해)
	@GetMapping("/workProdList")
	public String workProdList(Model model, HttpServletRequest request) {
		String productCode = request.getParameter("productCode");
		String productName = request.getParameter("productName");
		
		// 한 화면에 보여줄 글 개수 설정
		int pageSize = 5; // sql문에 들어가는 항목
		
		// 현페이지 번호 가져오기
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		
		PageDTO pageDTO = new PageDTO();
		
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
		int count = workOrderService.countProdList(search);

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
		return "product/workProdList";
	}//	workProdList
	
	// 거래처목록 팝업(자재부 사원/대리를 위해)
	@GetMapping("/workCusList")
	public String workCusList(Model model, HttpServletRequest request, PageDTO pageDTO) { 
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
		return "product/workCusList";
	}// workCusList
//	------------------------------여기까지 완제품, 거래처 팝업리스트---------------------------------------
	
//	가상주소 http://localhost:8080/keypoint/product/productList
	@GetMapping("/productList")
	public String productList(HttpServletRequest request, Model model, HttpSession session) {
		System.out.println("ProductController productList()");
		// 세션에서 empId 가져오기
		int empId = (int) session.getAttribute("empId");
		
		// 검색어 가져오기
		String search = request.getParameter("search");
		
		// 한 화면에 보여줄 글개수 설정
		int pageSize = 10;
		// 현 페이지 번호 가져오기
		String pageNum = request.getParameter("pageNum");
		// 페이지 번호가 없을 경우 => "1"로 설정
		if(pageNum == null) {
			pageNum = "1";
		}
		// 페이지 번호 => 정수형 변경
		int currentPage = Integer.parseInt(pageNum);
		
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		// 검색어 저장
		pageDTO.setSearch(search);
		
		List<ProductDTO> productList = productService.getProductList(pageDTO);
		
		// 전체 글개수 가져오기
		int count = productService.getProductCount(pageDTO);
		// 한 화면에 보여줄 페이지 개수 설정
		int pageBlock = 10;
		// 시작하는 페이지 번호
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		// 끝나는 페이지 번호
		int endPage = startPage + pageBlock -1;
		// 끝나는 페이지 번호 전체페이지 개수 비교
		int pageCount = count/pageSize+(count%pageSize==0?0:1);
		// => 끝나는 페이지 번호가 크면 전체 페이지 개수로 변경
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);		
		
		model.addAttribute("productList", productList);
		model.addAttribute("pageDTO", pageDTO);
		
		// empId로 사원정보 가져오기
		EmployeeDTO employeeDTO = employeeService.getEmployeeDetails(empId);
		model.addAttribute("employeeDTO", employeeDTO);
		System.out.println(employeeDTO);
		
		// WEB-INF/views/product/productList.jsp
		return "product/productList";
	}// productList [완제품목록]
	
	@GetMapping("/productInsert")
	public String productInsert() {
		return "product/productInsert";
	}// productInsert [완제품등록]
	
	@PostMapping("/productInsertPro")
	public String productInsertPro(ProductDTO productDTO) {
		System.out.println("ProductController productInsertPro()");
		//회원가입 처리
		System.out.println(productDTO);
		
		productService.insertProduct(productDTO);
		
		if(productDTO != null) {
			return "product/msgSuccess"; // 등록완료
		}else {
			return "product/msgFailed"; // 등록실패
		}
	}// productInsertPro [완제품등록]
	
	@GetMapping("/productUpdate")
	public String productUpdate(Model model, @RequestParam("productCode") String productCode) {
		ProductDTO productDTO = productService.getProduct(productCode);
		System.out.println(productDTO);
		model.addAttribute("productDTO", productDTO);
		return "product/productUpdate";
	}// productUpdate [완제품수정]
	
	@PostMapping("/productUpdatePro")
	public String productUpdatePro(ProductDTO productDTO) {
		System.out.println("ProductController productUpdatePro");
		System.out.println(productDTO);
		productService.updateProduct(productDTO);
		
		if(productDTO != null) {
			return "product/msgSuccess"; // 등록완료
		}else {
			return "product/msgFailed"; // 등록실패
		}
	}// productUpdatePro [완제품수정]
	
	@GetMapping("/productDelete")
	public String productDelete(ProductDTO productDTO) {
		System.out.println("ProductController productDelete()");
		System.out.println(productDTO);
		productService.deleteProduct(productDTO);
		
		return "product/productList";
	}// productDelete [완제품삭제]
	

	

	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
}// class