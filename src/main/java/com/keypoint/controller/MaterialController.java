package com.keypoint.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.keypoint.dto.MaterialDTO;
import com.keypoint.dto.PageDTO;
import com.keypoint.service.MaterialService;

@Controller
@RequestMapping("/material/*")
public class MaterialController {
	
	//materialService 객체생성
	@Inject
	private MaterialService materialService;

	
	
	
//	가상주소 http://localhost:8080/keypoint/material/materialList
	@GetMapping("/materialList")
	public String materialList(Model model) {
		List<MaterialDTO> materialList = materialService.getMaterialList();
		model.addAttribute("materialList", materialList);
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
		
		return "material/close";
	}// materialInsertPro [자재등록]	
	
	@GetMapping("/materialUpdate")
	public String materialUpdate() {
		return "material/materialUpdate";
	}// materialUpdate [자재수정]
	
	// ------------------------------------홍렬 자재리스트팝업--------------------------------------
	

	@RequestMapping(value = "/purchaseMaterialList", method = RequestMethod.GET)
	public String purchaseMaterialList(Model model, HttpServletRequest request, PageDTO pageDTO) { // 품목 리스트
		String materialCode = request.getParameter("materialCode");
		String materialName = request.getParameter("materialName");
		
		String materialPriceParam = request.getParameter("materialPrice"); // 파라미터 가져오기

		int materialPrice = 0; // 기본값을 0으로 설정하거나, 다른 적절한 기본값 설정

		if (materialPriceParam != null && !materialPriceParam.isEmpty()) {
		    try {
		        materialPrice = Integer.parseInt(materialPriceParam); // 변환 시도
		    } catch (NumberFormatException e) {
		        // 변환 실패 시 예외 처리
		        // 예외 처리를 어떻게 할지에 대한 로직을 작성하거나, 기본값을 다른 값으로 설정할 수 있음
		    }
		}
		
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
	@GetMapping("/materialDelete")
	public String materialDelete(MaterialDTO materialDTO) {
		System.out.println("MaterialController materialDelete()");
		System.out.println(materialDTO);
		materialService.deleteMaterial(materialDTO);
		
		return "material/materialList";
	}// materialDelete [자재삭제]
	
	
	
	
	
	
	
	
	
}// class
