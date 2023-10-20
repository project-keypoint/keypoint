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
import com.keypoint.dto.PurchaseDTO;
import com.keypoint.dto.QualityDTO;
import com.keypoint.dto.RequireDTO;
import com.keypoint.dto.WorkOrderDTO;
import com.keypoint.service.EmployeeService;
import com.keypoint.service.MaterialService;
import com.keypoint.service.PurchaseService;

@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {

	// productService 객체생성
	@Inject
	private PurchaseService purchaseService;

	@Inject
	private EmployeeService employeeService;

	// ------------------------------------------------------------------------------------

	@GetMapping("/purchaseInsert")
	public String purchaseInsert() {

		return "purchase/purchaseInsert";
	}//

	@PostMapping("/purchaseInsertPro")
	public String purchaseInsertPro(PurchaseDTO purchaseDTO) {
		System.out.println("purchaseDTO purchaseInsertPro()");

		// 등록 처리
		System.out.println(purchaseDTO);

		purchaseService.insertPurchase(purchaseDTO);

		if (purchaseDTO != null) {
			return "purchase/msgSuccess"; // 등록완료
		} else {
			return "purchase/msgFailed"; // 등록실패
		}

	}//

	// ----------------------------------------------------------------------------------------------

	@GetMapping("/purchaseList")
	public String purchaseList(HttpServletRequest request, Model model, HttpSession session) {
		System.out.println("PurchaseController purchase/purchaseList");

		// ---------------------------
		int empId = (int) session.getAttribute("empId");
		// ---------------------------

		// ---------------------------
		String search = request.getParameter("search");
		// ---------------------------
		// ---------------------------
		String search2 = request.getParameter("search2");
		// ---------------------------

		// 한 화면에 보여줄 글개수 설정
		int pageSize = 10;
		// 현 페이지 번호 가져오기
		String pageNum = request.getParameter("pageNum");
		// 페이지 번호가 없을 경우 => "1"로 설정
		if (pageNum == null) {
			pageNum = "1";
		}

		// 페이지 번호 => 정수형 변경
		int currentPage = Integer.parseInt(pageNum);

		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);

		// --------------------
		// 검색어 저장
		pageDTO.setSearch(search);
		// --------------------
		// --------------------
		// 검색어 저장
		pageDTO.setSearch2(search2);
		// --------------------

		List<PurchaseDTO> purchaseList = purchaseService.getPurchaseList(pageDTO);

		// 전체 글개수 가져오기
		int count = purchaseService.getPurchaseCount(pageDTO);

		// 전체 사원 수 employeeCount에 담기
		model.addAttribute("purchaseCount", count);

		// 한화면에 보여줄 페이지 개수 설정
		int pageBlock = 10;
		// 시작하는 페이지 번호
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		// 끝나는 페이지 번호
		int endPage = startPage + pageBlock - 1;
		// 전체페이지 개수
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		// 끝나는 페이지 번호 전체페이지 개수 비교
		// => 끝나는 페이지 번호가 크면 전체페이지 개수로 변경
		if (endPage > pageCount) {
			endPage = pageCount;
		}

		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);

		model.addAttribute("purchaseList", purchaseList);
		model.addAttribute("pageDTO", pageDTO);

		// ------------------------------
		EmployeeDTO employeeDTO = employeeService.getEmployeeDetails(empId);
		model.addAttribute("employeeDTO", employeeDTO);
		// ------------------------------

		return "purchase/purchaseList";
	}// 

	// ------------------------------------------------------------------------------------

	@GetMapping("/purchaseDetails")
	public String purchaseDetails(Model model, @RequestParam("poCode") String poCode, HttpSession session) {
		System.out.println("purchaseController purchase/purchaseDetails");

		// ---------------------------
		int empId = (int) session.getAttribute("empId");
		// ---------------------------

		PurchaseDTO purchaseDTO = purchaseService.getPurchaseDetails(poCode);
		model.addAttribute("purchaseDTO", purchaseDTO);

		// ------------------------------
		EmployeeDTO employeeDTO = employeeService.getEmployeeDetails(empId);
		model.addAttribute("employeeDTO", employeeDTO);
		// ------------------------------

		return "purchase/purchaseDetails";
	}// purchaseDetails [발주상세]

	// ------------------------------------------------------------------------------------------

	@GetMapping("/purchaseUpdate")
	public String purchaseUpdate(Model model, @RequestParam("poCode") String poCode) {
		System.out.println("PurchaseController purchase/purchaseUpdate");

		PurchaseDTO purchaseDTO = purchaseService.getPurchaseDetails(poCode);
		model.addAttribute("purchaseDTO", purchaseDTO);
		return "purchase/purchaseUpdate";
	}// purchaseUpdate [발주수정]

	@PostMapping("/purchaseUpdatePro")
	public String purchaseUpdatePro(PurchaseDTO purchaseDTO) {
		System.out.println("purchaseController purchase/purchaseUpdatePro");
		System.out.println(purchaseDTO);
		purchaseService.purchaseUpdatePro(purchaseDTO);

		if (purchaseDTO != null) {
			return "purchase/msgSuccess"; // 등록완료
		} else {
			return "purchase/msgFailed"; // 등록실패
		}

	}// purchaseUpdatePro [발주수정Pro]

	// ------------------------------------------------------------------------------------------

	@GetMapping("/purchaseDelete")
	public String purchaseDeletePro(PurchaseDTO purchaseDTO) {
		System.out.println("purchaseController purchase/purchaseDelete");
		System.out.println(purchaseDTO);
		purchaseService.purchaseDelete(purchaseDTO);

		if (purchaseDTO != null) {
			return "purchase/msgSuccess"; // 등록완료
		} else {
			return "purchase/msgFailed"; // 등록실패
		}
	}// purchaseDelete [발주삭제]

	// ------------------------------------------------------------------------------------------

	@RequestMapping(value = "/purchaseOrderList", method = RequestMethod.GET)
	public String purchaseOrderList(Model model, HttpServletRequest request, PageDTO pageDTO) { // 품목 리스트
		String poCode = request.getParameter("poCode");
		String materialName = request.getParameter("materialName");

		String poCountParam = request.getParameter("poCount"); // 파라미터 가져오기

		int poCount = 0; // 기본값을 0으로 설정하거나, 다른 적절한 기본값 설정

		if (poCountParam != null && !poCountParam.isEmpty()) {
			try {
				poCount = Integer.parseInt(poCountParam); // 변환 시도
			} catch (NumberFormatException e) {
				// 변환 실패 시 예외 처리
				// 예외 처리를 어떻게 할지에 대한 로직을 작성하거나, 기본값을 다른 값으로 설정할 수 있음
			}
		}

		// 한 화면에 보여줄 글 개수 설정
		int pageSize = 5; // sql문에 들어가는 항목

		// 현페이지 번호 가져오기
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		// 페이지번호를 정수형 변경
		int currentPage = Integer.parseInt(pageNum);
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1; // sql문에 들어가는 항목
		int endRow = startRow + pageDTO.getPageSize() - 1;

		pageDTO.setStartRow(startRow - 1); // limit startRow (0이 1열이기 때문 1을 뺌)
		pageDTO.setEndRow(endRow);

		Map<String, Object> search = new HashMap<>(); // sql에 들어가야할 서치 항목 및 pageDTO 항목 map에 담기
		search.put("poCode", poCode);
		search.put("materialName", materialName);
		search.put("poCount", poCount);
		search.put("startRow", pageDTO.getStartRow());
		search.put("pageSize", pageDTO.getPageSize());

		List<PurchaseDTO> purchaseOrderList = purchaseService.getPurchaseOrderList(search);

		// 페이징 처리
		int count = purchaseService.countPurchaseOrderList(search);

		int pageBlock = 10;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		if (endPage > pageCount) {
			endPage = pageCount;
		}

		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);

		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("search", search);
		model.addAttribute("purchaseOrderList", purchaseOrderList);

		return "purchase/purchaseOrderList";
	} // purchaseOrderList

	// ------------------------------------------------------------------------------------------

	@GetMapping("/requireList")
	public String requireList(Model model, @RequestParam("woCode") String woCode,
			@RequestParam("productCode") String productCode) {
		List<RequireDTO> requireList = purchaseService.getRequireList(woCode);

		model.addAttribute("woCodeTitle", woCode);
		model.addAttribute("productCodeTitle", productCode);
		model.addAttribute("requireList", requireList);

		return "purchase/requireList";
	}// requireList

} // class
