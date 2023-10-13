package com.keypoint.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.keypoint.dto.MaterialDTO;
import com.keypoint.dto.PageDTO;
import com.keypoint.dto.QualityDTO;
import com.keypoint.service.MaterialService;
import com.keypoint.service.QualityService;

@Controller
@RequestMapping("/qc/*")
public class QualityController {
	
	@Inject
	private QualityService qualityService;
	
	@Inject
	private MaterialService materialService;
	
	@GetMapping("/qcList")
	public String qcList(HttpServletRequest request,Model model) {
		System.out.println("QualityController qc/qcList");
		String search3 = request.getParameter("search3");
		String search4 = request.getParameter("search4");
		String search5 = request.getParameter("search5");
		String search6 = request.getParameter("search6");
		
		String check1 = request.getParameter("check1");
		String check2 = request.getParameter("check2");
		String check3 = request.getParameter("check3");
		String check4 = request.getParameter("check4");
		
		//한 화면에 보여줄 글개수 설정
		int pageSize = 1;
		// 현 페이지 번호 가져오기
		String pageNum=request.getParameter("pageNum");
		// 페이지 번호가 없을 경우 => "1"로 설정
		if(pageNum == null) {
			pageNum = "1";
		}
		// 페이지 번호 => 정수형 변경
		int currentPage = Integer.parseInt(pageNum);
		PageDTO pageDTO =new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		//검색어 저장
		pageDTO.setSearch3(search3);
		pageDTO.setSearch4(search4);
		pageDTO.setSearch5(search5);
		pageDTO.setSearch6(search6);
		pageDTO.setCheck1(check1);
		pageDTO.setCheck2(check2);
		pageDTO.setCheck3(check3);
		pageDTO.setCheck4(check4);
		
		List<QualityDTO> qcList = qualityService.getQcList(pageDTO);
		
		// 전체 글개수 가져오기
		int count = qualityService.getQcCount(pageDTO);
		// 한화면에 보여줄 페이지 개수 설정
		int pageBlock = 5;
		// 시작하는 페이지 번호
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		// 끝나는 페이지 번호
		int endPage = startPage + pageBlock -1;
		// 전체페이지 개수
		int pageCount = count/pageSize+(count%pageSize==0?0:1);
		// 끝나는 페이지 번호  전체페이지 개수 비교 
		//=> 끝나는 페이지 번호가 크면 전체페이지 개수로 변경
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);

		model.addAttribute("qcList", qcList);
		model.addAttribute("pageDTO", pageDTO);
		return "qc/qcList";
	}// qcList [품질검사목록(+생산목록)]
	
	@GetMapping("/qcDetails")
	public String qcDetails(Model model, @RequestParam("poCode") String poCode) {
		System.out.println("QualityController qc/qcDetails");
		QualityDTO qualityDTO = qualityService.getQcDetails(poCode);
		model.addAttribute("qualityDTO", qualityDTO);
		return "qc/qcDetails";
	}// qcDetails [품질검사상세]
	
	@PostMapping("/qcStart")
	public String qcStart(QualityDTO qualityDTO) {
		System.out.println("ReceiveController qcStart");
		System.out.println(qualityDTO);
		qualityService.qcStart(qualityDTO);
		
		if(qualityDTO != null) {
			return "receive/msgSuccess"; // 등록완료
		}else {
			return "receive/msgFailed"; // 등록실패
		}
	}// qcStart [품질검사등록(시작)]
	
	@GetMapping("/qcUpdate")
	public String qcUpdate(Model model, @RequestParam("poCode") String poCode) {
		System.out.println("QualityController qc/qcUpdate");
		QualityDTO  qualityDTO = qualityService.getQcDetails(poCode);
		model.addAttribute("qualityDTO", qualityDTO);
		return "qc/qcUpdate";
	}// qcUpdate [품질검사수정(진행)]
	
	@PostMapping("/qcUpdatePro")
	public String qcUpdatePro(QualityDTO qualityDTO) {
		System.out.println("QualityController qcUpdatePro");
		System.out.println(qualityDTO);
		qualityService.qcUpdatePro(qualityDTO);
		
		if(qualityDTO != null) {
			return "receive/msgSuccess"; // 등록완료
		}else {
			return "receive/msgFailed"; // 등록실패
		}
	}// qcUpdatePro [품질검사(저장)]
	
	
	@PostMapping("/qcTransfer")
	public ResponseEntity<String> qcTransfer(QualityDTO qualityDTO) {
	    System.out.println("QualityController qcTransfer");
	    System.out.println(qualityDTO);
	    
	    String disCode = codeChangeDis("DISQ");//
	    qualityDTO.setDisCode(disCode);
	    
	    boolean result = qualityService.qcTransfer(qualityDTO);
	    if (result)
	        return new ResponseEntity<>("success", HttpStatus.OK);
	    return new ResponseEntity<>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
	}// qcTransfer [품질검사후 상품이동]
	
	@PostMapping("/qcDeleteChecked")
	public ResponseEntity<String> receiveDeleteChecked(@RequestBody QualityDTO qualityDTO) {
	    try {
	        qualityService.qcDeleteChecked(qualityDTO);
	        return ResponseEntity.ok("success");
	    } catch (Exception e) {
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
	    }
	}// qcDeleteChecked [품질검사 다중삭제(체크)]
	
	@GetMapping("/disposedList")
	public String disposedList(HttpServletRequest request,Model model) {
		System.out.println("QualityController qc/disposedList");
		
//		String search = request.getParameter("search");
		String search3 = request.getParameter("search3");
		String search4 = request.getParameter("search4");
		String search5 = request.getParameter("search5");
		String search6 = request.getParameter("search6");
		String search7 = request.getParameter("search7");
		String search8 = request.getParameter("search8");
		
//		String check1 = request.getParameter("check1");
		String check2 = request.getParameter("check2");
		String check3 = request.getParameter("check3");
		String check4 = request.getParameter("check4");
		
		int pageSize = 2; //한 화면에 보여줄 글개수 설정
		String pageNum=request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		PageDTO pageDTO =new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
//		pageDTO.setSearch(search);
		pageDTO.setSearch3(search3);
		pageDTO.setSearch4(search4);
		pageDTO.setSearch5(search5);
		pageDTO.setSearch6(search6);
		pageDTO.setSearch7(search7);
		pageDTO.setSearch8(search8);
//		pageDTO.setCheck1(check1);
		pageDTO.setCheck2(check2);
		pageDTO.setCheck3(check3);
		pageDTO.setCheck4(check4);
		
		List<QualityDTO> disposedList = qualityService.getDisposedList(pageDTO);
		List<QualityDTO> disposedSum = qualityService.getDisposedSum();
		List<QualityDTO> disposedSumMat = qualityService.getDisposedSumMat();
		
		int count = qualityService.getDisposedCount(pageDTO);
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
		
		model.addAttribute("disposedList", disposedList);
		model.addAttribute("disposedSum", disposedSum);
		model.addAttribute("disposedSumMat", disposedSumMat);
		model.addAttribute("pageDTO", pageDTO);
		return "qc/disposedList";
	}// receiveShipList [수주&출하 목록]
	
	
	
	@GetMapping("/disInsertP") // 폐기목록 페이지
	public String disInsertP() {
		System.out.println("QualityController qc/disInsertP");
		return "qc/disInsertP";
	}// disInsert [폐기등록(상품)]
	
	@PostMapping("/disInsertProduct") // 폐기목록 페이지
	public String disInsertPPro(QualityDTO qualityDTO) {
		System.out.println("QualityController qc/disInsertProduct");
		System.out.println(qualityDTO);
		
		qualityService.disInsertP(qualityDTO);
		
		if(qualityDTO != null) {
			return "receive/msgSuccess"; // 등록완료
		}else {
			return "receive/msgFailed"; // 등록실패
		}
	}// disInsert [폐기등록(상품)Pro]
	
	@GetMapping("/disInsertM") // 폐기목록 페이지
	public String disInsertM() {
		System.out.println("QualityController qc/disInsertM");
		return "qc/disInsertM";
	}// disInsert [폐기등록(자재)]
	
	@PostMapping("/disInsertMaterial") // 폐기목록 페이지
	public String disInsertMPro(QualityDTO qualityDTO) {
		System.out.println("QualityController qc/disInsertMaterial");
		System.out.println(qualityDTO);
		
		qualityService.disInsertM(qualityDTO);
		
		if(qualityDTO != null) {
			return "receive/msgSuccess"; // 등록완료
		}else {
			return "receive/msgFailed"; // 등록실패
		}
	}// disInsert [폐기등록(자재)Pro]
	
	public String codeChangeDis(String code_id) {
		Integer numP = qualityService.getMaxNum(code_id);
		if(numP == null) {
			numP = 0;
		}
		return String.format("%s%05d", code_id, ++numP);
    }// disCode 자동증가(품질)
	
	@RequestMapping(value = "/materialList", method = RequestMethod.GET)
	public String materialList(Model model, HttpServletRequest request, PageDTO pageDTO) { // 품목 리스트
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
	 
		List<MaterialDTO> materialList = materialService.getPurchaseMaterialList(search);
				
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
		model.addAttribute("materialList", materialList);
		return "qc/materialList";
	} // purchaseMaterialList
}//class
	
	
	
	
	

