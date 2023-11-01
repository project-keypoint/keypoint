package com.keypoint.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;

import com.keypoint.dto.LineDTO;
import com.keypoint.dto.PageDTO;
import com.keypoint.dto.ReceiveDTO;
import com.keypoint.dto.WorkOrderDTO;
import com.keypoint.dto.WorkRoDTO;
import com.keypoint.service.LineService;
import com.keypoint.service.WorkOrderService;
import javax.servlet.http.HttpSession;
import com.keypoint.dto.EmployeeDTO;
import com.keypoint.service.EmployeeService;

@Controller
@RequestMapping("/workOrder/*")
public class WorkOrderController {
	
	@Inject
	private WorkOrderService workOrderService;
	
	//employeeService 객체생성
		@Inject
		private EmployeeService employeeService;
	
	@GetMapping("/workOrderList")
	public String workOrderList(HttpServletRequest request, Model model, HttpSession session) {
		System.out.println("WorkOrderController workOrder/workOrderList");
		
		// 세션에서 empId 가져오기
		int empId = (int) session.getAttribute("empId");
		
		String search1 = request.getParameter("search1");
		String search2 = request.getParameter("search2");
		String search3 = request.getParameter("search3");
		String search4 = request.getParameter("search4");
		
		String check1 = request.getParameter("check1");
		String check2 = request.getParameter("check2");
		
		
		
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
		pageDTO.setCheck1(check1);
		pageDTO.setCheck2(check2);
		
		
		List<WorkOrderDTO> workOrderList = workOrderService.getWorkOrderList(pageDTO);
		
		int count = workOrderService.getWorkOrderCount(pageDTO);	
		
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
		
		model.addAttribute("workOrderList", workOrderList);
		model.addAttribute("pageDTO", pageDTO);
		
		// empId로 사원정보 가져오기
		EmployeeDTO employeeDTO = employeeService.getEmployeeDetails(empId);
		model.addAttribute("employeeDTO", employeeDTO);
		System.out.println(employeeDTO);
		
		
		return "workOrder/workOrderList";
	}// workOrder [작업지시]
	
	
	@GetMapping("/workOrderInsert")
	public String workOrderInsert() {
		System.out.println("WorkOrderController workOrder/workOrderInsert");
		return "workOrder/workOrderInsert";
	}// receiveUpdate [작업지시등록]
	
	@PostMapping("/workOrderInsertPro")
	public String workOrderInsertPro(WorkOrderDTO workOrderDTO) {
		System.out.println("ReceiveController workOrder/workOrderInsertPro");
		System.out.println("workOrderInsertPro : "+workOrderDTO);
		workOrderService.workOrderInsertPro(workOrderDTO);
	
		
		
		if(workOrderDTO != null) {
			return "workOrder/msgSuccess"; // 등록완료
		}else {
			return "workOrder/msgFailed"; // 등록실패
		}
	}// workOrderInsertPro [작업지시등록Pro]
	
	@GetMapping("/workOrderDetails")
	public String workOrderDetails(Model model, @RequestParam("woCode") String woCode, HttpSession session) {
		System.out.println("WorkOrderController workOrder/workOrderDetails");
		// 세션에서 empId 가져오기
		int empId = (int) session.getAttribute("empId");
		WorkOrderDTO workOrderDTO = workOrderService.getWorkOrderDetails(woCode);
		model.addAttribute("workOrderDTO", workOrderDTO);
		// empId로 사원정보 가져오기
		EmployeeDTO employeeDTO = employeeService.getEmployeeDetails(empId);
		model.addAttribute("employeeDTO", employeeDTO);
		System.out.println(employeeDTO);
		
		return "workOrder/workOrderDetails";
	}// workOrderDetails [작업지시상세]
	
	@GetMapping("/workOrderUpdate")
	public String workOrderUpdate(Model model, @RequestParam("woCode") String woCode) {
		System.out.println("WorkOrderController workOrder/workOrderUpdate");
		WorkOrderDTO workOrderDTO = workOrderService.getWorkOrderDetails(woCode);
		model.addAttribute("workOrderDTO", workOrderDTO);
		return "workOrder/workOrderUpdate";
	}// workOrderUpdate [작업지시수정]
	
	
	
	@PostMapping("/workOrderUpdatePro")
	public String workOrderUpdatePro(WorkOrderDTO workOrderDTO) {
		System.out.println("WorkOrderController workOrder/workOrderUpdatePro");
		System.out.println(workOrderDTO);
		workOrderService.workOrderUpdatePro(workOrderDTO);
		
		
		
		if(workOrderDTO != null) {
			return "workOrder/msgSuccess"; // 등록완료
		}else {
			return "workOrder/msgFailed"; // 등록실패
		}
	}// workOrderUpdatePro [작업지시수정Pro]
	
	
	@GetMapping("/workOrderDelete")
	public String workOrderDelete(WorkOrderDTO workOrderDTO) {
		System.out.println("WorkOrderController workOrder/workOrderDelete");
		System.out.println(workOrderDTO);
		workOrderService.workOrderDelete(workOrderDTO);
		
		if(workOrderDTO != null) {
			return "workOrder/msgSuccess"; // 등록완료
		}else {
			return "workOrder/msgFailed"; // 등록실패
		}
	}// workOrderDelete [작업지시삭제]
	
	
	
	@RequestMapping(value = "/workProdList", method = RequestMethod.GET)
	public String workProdList(Model model, HttpServletRequest request) { // 품목 리스트
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
		return "workOrder/workProdList";
	}
	

//	납품처 거래처 리스트
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

	List<WorkOrderDTO> workCusList = workOrderService.getWorkCusList(search);	//	납품처
		
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


//	납입처 거래처 리스트
@RequestMapping(value = "/workCusList2", method = RequestMethod.GET)
public String workCusList2(Model model, HttpServletRequest request, PageDTO pageDTO) { // 품목 리스트
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
	
	List<WorkOrderDTO> workCusList2 = workOrderService.getWorkCusList2(search);	//	납입처
	
	//페이징 처리
	int count2 = workOrderService.countCusList2(search);
	
	int pageBlock = 10;
	int startPage=(currentPage-1)/pageBlock*pageBlock+1;
	int endPage=startPage+pageBlock-1;
	int pageCount=count2/pageSize+(count2%pageSize==0?0:1);
	if(endPage > pageCount){
		endPage = pageCount;
	}
	
	pageDTO.setCount(count2);
	pageDTO.setCount(count2);
	pageDTO.setPageBlock(pageBlock);
	pageDTO.setStartPage(startPage);
	pageDTO.setEndPage(endPage);
	pageDTO.setPageCount(pageCount);
	
	model.addAttribute("pageDTO", pageDTO);
	model.addAttribute("search", search);
	model.addAttribute("workCusList2", workCusList2);
	return "workOrder/workCusList2";
}
	


@RequestMapping(value = "/workRoCodeList", method = RequestMethod.GET)
public String workRoCodeList(Model model, HttpServletRequest request, PageDTO pageDTO) { // 품목 리스트
	String roCode = request.getParameter("roCode");
	String productCode = request.getParameter("productCode");
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
	search.put("roCode", roCode);
	search.put("productCode", productCode);
	search.put("startRow", pageDTO.getStartRow());
	search.put("pageSize", pageDTO.getPageSize());

	List<WorkRoDTO> workRoCodeList = workOrderService.getWorkRoCodeList(search);
		
	//페이징 처리
	int count = workOrderService.countWorkRoCodeList(search);

	int pageBlock = 10;
	int startPage=(((currentPage-1)/pageBlock)*pageBlock)+1;
	int endPage=startPage + pageBlock - 1; //10
	int pageCount=count/pageSize+(count%pageSize==0?0:1);
	if(endPage > pageCount){
	 	endPage = pageCount;
	 }
	
	pageDTO.setCount(count);
	pageDTO.setPageBlock(pageBlock);
	pageDTO.setStartPage(startPage);
	pageDTO.setEndPage(endPage);
	pageDTO.setPageCount(pageCount);
	
	System.out.println(pageDTO);
			
	model.addAttribute("pageDTO", pageDTO);
	model.addAttribute("search", search);
	model.addAttribute("workRoCodeList", workRoCodeList);
	System.out.println(workRoCodeList);
	
	return "workOrder/workRoCodeList";
}

	
	@RequestMapping(value = "/workLineList", method = RequestMethod.GET)
	public String workLineList(Model model, HttpServletRequest request, PageDTO pageDTO, LineDTO lineDTO) { // 품목 리스트
	String lineCode = request.getParameter("lineCode");
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
	search.put("lineCode", lineCode);
	search.put("startRow", pageDTO.getStartRow());
	search.put("pageSize", pageDTO.getPageSize());

	List<WorkOrderDTO> workLineList = workOrderService.getWorkLineList(search);
		
	//페이징 처리
	int count = workOrderService.countLineList(search);

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
	
	
	model.addAttribute("lineDTO", lineDTO);
	model.addAttribute("pageDTO", pageDTO);
	model.addAttribute("search", search);
	model.addAttribute("workLineList", workLineList);
	return "workOrder/workLineList";
}
	
	// 담당자 조회 영업
	@RequestMapping(value = "/receiveEmpList", method = RequestMethod.GET)
	public String receiveEmpList(Model model, HttpServletRequest request, PageDTO pageDTO) { // 품목 리스트
		String empId = request.getParameter("empId");
		String empName = request.getParameter("empName");
		
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
		search.put("empId", empId);
		search.put("empName", empName);
		search.put("startRow", pageDTO.getStartRow());
		search.put("pageSize", pageDTO.getPageSize());
		search.put("empStatus", "휴직"); 
		search.put("empStatus", "퇴직"); 
		search.put("departmentName", "영업부"); 
		
		List<WorkOrderDTO> receiveEmpList = workOrderService.receiveEmpList(search);
			
		//페이징 처리
		int count = workOrderService.countEmpList2(search);

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
		model.addAttribute("receiveEmpList", receiveEmpList);
		return "workOrder/receiveEmpList";
	}
	
	// 담당자 조회 자재
		@RequestMapping(value = "/productEmpList", method = RequestMethod.GET)
		public String productEmpList(Model model, HttpServletRequest request, PageDTO pageDTO) { // 품목 리스트
			String empId = request.getParameter("empId");
			String empName = request.getParameter("empName");
			
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
			search.put("empId", empId);
			search.put("empName", empName);
			search.put("startRow", pageDTO.getStartRow());
			search.put("pageSize", pageDTO.getPageSize());
			search.put("empStatus", "휴직"); 
			search.put("empStatus", "퇴직"); 
			search.put("departmentName", "자재부"); 
			
			List<WorkOrderDTO> productEmpList = workOrderService.productEmpList(search);
				
			//페이징 처리
			int count = workOrderService.countEmpList(search);

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
			model.addAttribute("productEmpList", productEmpList);
			return "workOrder/productEmpList";
		}
	// 담당자 조회 생산
	@RequestMapping(value = "/workEmpList", method = RequestMethod.GET)
	public String workEmpList(Model model, HttpServletRequest request, PageDTO pageDTO) { // 품목 리스트
		String empId = request.getParameter("empId");
		String empName = request.getParameter("empName");
		
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
		search.put("empId", empId);
		search.put("empName", empName);
		search.put("startRow", pageDTO.getStartRow());
		search.put("pageSize", pageDTO.getPageSize());
		search.put("empStatus", "휴직"); 
		search.put("empStatus", "퇴직"); 
		search.put("departmentName", "생산부"); 
		List<WorkOrderDTO> workEmpList = workOrderService.getWorkEmpList(search);
			
		//페이징 처리
		int count = workOrderService.countEmpList1(search);

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
		model.addAttribute("workEmpList", workEmpList);
		return "workOrder/workEmpList";
	}
	
	
	
	@RequestMapping(value = "/workList", method = RequestMethod.GET)
	public String workList(Model model, HttpServletRequest request, PageDTO pageDTO) {
		System.out.println("WorkOrderController workList()");
		
		String woCode = request.getParameter("woCode");
		String roCode = request.getParameter("roCode");
		
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
		search.put("roCode", roCode);
		search.put("startRow", pageDTO.getStartRow());
		search.put("pageSize", pageDTO.getPageSize());

		List<WorkOrderDTO> workList = workOrderService.getWorkList(search);
			
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
		model.addAttribute("workList", workList);
		System.out.println(workList);
		
		return "workOrder/workList";
	}

	@RequestMapping(value = "/needPurchaseList", method = RequestMethod.GET)
	public String needPurchaseList(Model model, HttpServletRequest request, PageDTO pageDTO) {
		System.out.println("WorkOrderController needPurchaseList()");
		
		String woCode = request.getParameter("woCode");
		String roCode = request.getParameter("roCode");
		
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
		search.put("roCode", roCode);
		search.put("startRow", pageDTO.getStartRow());
		search.put("pageSize", pageDTO.getPageSize());

		List<WorkOrderDTO> workList = workOrderService.getNeedPurchaseList(search);
			
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
		model.addAttribute("workList", workList);
		System.out.println(workList);
		
		return "workOrder/needPurchaseList";
	}		
		
		
	 @PostMapping("/deleteSelected")
	    public String deleteSelected(@RequestParam("postIds") String postIds) {
		 System.out.println(postIds);
		 
	        String[] woCodes = postIds.split("\\|");
	        for (String woCode : woCodes) {
	            workOrderService.deleteSelected(woCode);
	        }
	        return "redirect:/workOrder/workOrderList";
	    }
		
	 
	 
	 


}


