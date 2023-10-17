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
import com.keypoint.dto.MaterialDTO;
import com.keypoint.dto.PageDTO;
import com.keypoint.dto.ProductDTO;
import com.keypoint.service.EmployeeService;
import com.keypoint.service.MaterialService;

@Controller
@RequestMapping("/material/*")
public class MaterialController {
	
	//materialService 객체생성
	@Inject
	private MaterialService materialService;

	//employeeService 객체생성
	@Inject
	private EmployeeService employeeService;
	
	
//	가상주소 http://localhost:8080/keypoint/material/materialList
	@GetMapping("/materialList")
	public String materialList(HttpServletRequest request, Model model, HttpSession session) {
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
		
		List<MaterialDTO> materialList = materialService.getMaterialList(pageDTO);
		
		// 전체 글개수 가져오기
		int count = materialService.getMaterialCount(pageDTO);
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
		
		model.addAttribute("materialList", materialList);
		model.addAttribute("pageDTO", pageDTO);
		
		// empId로 사원정보 가져오기
		EmployeeDTO employeeDTO = employeeService.getEmployeeDetails(empId);
		model.addAttribute("employeeDTO", employeeDTO);
		System.out.println(employeeDTO);
		
		// WEB-INF/views/material/materialList.jsp
		return "material/materialList";
	}// materialList [자재목록]
	
	@GetMapping("/materialInsert")
	public String materialInsert() {
		return "material/materialInsert";
	}// materialInsert [자재등록]	
	
	@PostMapping("/materialInsertPro")
	public String materialInsertPro(MaterialDTO materialDTO) {
		System.out.println("MaterialController materialInsertPro()");
		//회원가입 처리
		System.out.println(materialDTO);
		
		materialService.insertMaterial(materialDTO);
		
		if(materialDTO != null) {
			return "material/msgSuccess"; // 등록완료
		}else {
			return "material/msgFailed"; // 등록실패
		}
	}// materialInsertPro [자재등록]	
	
	@GetMapping("/materialUpdate")
	public String materialUpdate(Model model, @RequestParam("materialCode") String materialCode) {
		MaterialDTO materialDTO = materialService.getMaterial(materialCode);
		System.out.println(materialDTO);
		model.addAttribute("materialDTO", materialDTO);
		return "material/materialUpdate";
	}// materialUpdate [자재수정]
	
	@PostMapping("/materialUpdatePro")
	public String materialUpdatePro(MaterialDTO materialDTO) {
		System.out.println("MaterialController materialUpdatePro");
		System.out.println(materialDTO);
		materialService.updateMaterial(materialDTO);
		
		if(materialDTO != null) {
			return "material/msgSuccess"; // 등록완료
		}else {
			return "material/msgFailed"; // 등록실패
		}
	}// materialUpdatePro [자재수정]
	
	@GetMapping("/materialDelete")
	public String materialDelete(MaterialDTO materialDTO) {
		System.out.println("MaterialController materialDelete()");
		System.out.println(materialDTO);
		materialService.deleteMaterial(materialDTO);
		
		return "material/materialList";
	}// materialDelete [자재삭제]
	
	
	// ------------------------------------홍렬 자재리스트팝업--------------------------------------
	

	@RequestMapping(value = "/purchaseMaterialList", method = RequestMethod.GET)
	public String purchaseMaterialList(Model model, HttpServletRequest request, PageDTO pageDTO) { // 품목 리스트
		String materialCode = request.getParameter("materialCode");
		String materialName = request.getParameter("materialName");
		String materialPrice = request.getParameter("materialPrice");
		
//		String materialPriceParam = request.getParameter("materialPrice"); // 파라미터 가져오기

//		int materialPrice = 0; // 기본값을 0으로 설정하거나, 다른 적절한 기본값 설정

//		if (materialPriceParam != null && !materialPriceParam.isEmpty()) {
//		    try {
//		        materialPrice = Integer.parseInt(materialPriceParam); // 변환 시도
//		    } catch (NumberFormatException e) {
//		        // 변환 실패 시 예외 처리
//		        // 예외 처리를 어떻게 할지에 대한 로직을 작성하거나, 기본값을 다른 값으로 설정할 수 있음
//		    }
//		}
		
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
		search.put("materialCode", materialCode);
		search.put("materialName", materialName);
		search.put("materialPrice", materialPrice);
		search.put("startRow", pageDTO.getStartRow());
		search.put("pageSize", pageDTO.getPageSize());
	 
		List<MaterialDTO> purchaseMaterialList = materialService.getPurchaseMaterialList(search);
				
			//페이징 처리
		int count = materialService.countPurchaseList(search);
	
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
		model.addAttribute("purchaseMaterialList", purchaseMaterialList);
		return "material/purchaseMaterialList";
	} // purchaseMaterialList
	
	
	// --------------------------------------------------------------------------------------------------
	
	// ------------------------------------홍렬2 자재리스트팝업--------------------------------------
	
	
	@RequestMapping(value = "/purchaseMaterialList2", method = RequestMethod.GET)
	public String purchaseMaterialList2(Model model, HttpServletRequest request, PageDTO pageDTO) { // 품목 리스트
		String materialCode = request.getParameter("materialCode");
		String materialName = request.getParameter("materialName");
	
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
		search.put("materialCode", materialCode);
		search.put("materialName", materialName);
		search.put("startRow", pageDTO.getStartRow());
		search.put("pageSize", pageDTO.getPageSize());
		
		List<MaterialDTO> purchaseMaterialList2 = materialService.getPurchaseMaterialList2(search);
		
		//페이징 처리
		int count = materialService.countPurchaseList2(search);
		
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
		model.addAttribute("purchaseMaterialList2", purchaseMaterialList2);
		return "material/purchaseMaterialList2";
	} // purchaseMaterialList
	
	
	// --------------------------------------------------------------------------------------------------

	
	
	
	
	
	
	
	
	
}// class
