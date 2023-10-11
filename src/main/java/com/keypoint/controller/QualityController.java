package com.keypoint.controller;

import java.util.List;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.keypoint.dto.PageDTO;
import com.keypoint.dto.QualityDTO;
import com.keypoint.dto.ReceiveDTO;
import com.keypoint.service.QualityService;

@Controller
@RequestMapping("/qc/*")
public class QualityController {
	
	@Inject
	private QualityService qualityService;
	
//	@GetMapping("/qcList")
//	public String qcList(Model model) {
//		System.out.println("QualityController qc/qcList");
//		List<QualityDTO> qcList = qualityService.getQcList();
//		model.addAttribute("qcList", qcList);
//		return "qc/qcList";
//	}// qcList [품질검사목록(+생산목록)]
	
	@GetMapping("/qcList")
	public String qcList(HttpServletRequest request,Model model) {
		System.out.println("QualityController qc/qcList");
		//검색어 가져오기 
		String search = request.getParameter("search");
		
		//한 화면에 보여줄 글개수 설정
		int pageSize = 5;
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
		pageDTO.setSearch(search);
		
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
	    
	    String disCode = codeChangeProduct("DISP");//
	    qualityDTO.setDisCode(disCode);
	    
	    boolean result = qualityService.qcTransfer(qualityDTO);
	    if (result)
	        return new ResponseEntity<>("success", HttpStatus.OK);
	    return new ResponseEntity<>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
	}// qcTransfer [품질검사후 상품이동]
	
	private int numP = 1;
	public String codeChangeProduct(String code_id) {
        return String.format("%s%05d", code_id, numP++);
    }// disCode 자동증가(상품)
	
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
	
	@GetMapping("/disposedList") // 폐기목록 페이지
	public String test() {
		System.out.println("QualityController qc/disposedList");
		return "qc/disposedList";
	}// disposedList [폐기목록 페이지]
	
	
}//class
	
	
	
	
	

