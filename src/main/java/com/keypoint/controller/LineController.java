package com.keypoint.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keypoint.dto.LineDTO;

import com.keypoint.dto.PageDTO;
import com.keypoint.dto.ReceiveDTO;
import com.keypoint.service.LineService;

@Controller
@RequestMapping("/line/*")
public class LineController {

	@Inject
	private LineService lineService;

	@GetMapping("/lineList")
	public String lineList(Model model, HttpServletRequest request) {
		System.out.println("LineController lineList()");
		

		// 검색어 가져오기
		String search = request.getParameter("search");
		String search2 = request.getParameter("search2");
				
//		한 화면에 보여줄 글 개수 설정
		int pageSize = 10;
		
//		현재 페이지 번호 가져오기
		String pageNum = request.getParameter("pageNum");
		
//		페이지 번호가 없을 경우 -> "1"로 설정
		if (pageNum == null) {
			pageNum = "1";
		}
		
//		페이지 번호 -> 정수형으로 변경
		int currentPage = Integer.parseInt(pageNum);
		
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);		
		
		// 검색어 저장
		pageDTO.setSearch(search);
		pageDTO.setSearch2(search2);
				
		List<LineDTO> lineList = lineService.getLineList(pageDTO);
		
		
//		페이징
//		게시판 전체 글 개수 가져오기
		int count = lineService.getLineCount();
		
//		한 화면에 보여줄 페이지 개수 설정
		int pageBlock = 10;
		
//		시작하는 페이지 번호
		int startPage = (currentPage -1)/pageBlock*pageBlock+1;
		
//		끝나는 페이지 번호
		int endPage = startPage+pageBlock-1;
		
//		전체페이지 개수
		int pageCount = count/pageSize + (count%pageSize==0?0:1);
		
//		끝나는 페이지 번호 / 전체페이지 개수 비교 
//		ㄴ> 끝나는 페이지가 크면 전체 페이지 개수로 변경
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		
//		pageDTO에 담기
		pageDTO.setCount(pageCount);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		
		model.addAttribute("lineList", lineList);
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("lineCount", count);
		return "line/lineList";
	}// 라인목록조회 + 페이징

	
	
	@GetMapping("/lineInsert")
	public String lineInsert (){
		System.out.println("LineController line/lineInsert");
		return "line/lineInsert";
	}// 라인등록

	@PostMapping("/lineInsertPro")
	public String lineInsertPro(LineDTO lineDTO) {
		System.out.println("LineController line/lineInsertPro");
		System.out.println(lineDTO);
		lineService.lineInsertPro(lineDTO);

		if (lineDTO != null) {
			return "line/msgSuccess"; // 등록완료
		} else {
			return "line/msgFailed"; // 등록실패
		}
	}// 라인등록Pro

	@GetMapping("/lineDetails")
	public String lineDetails(Model model, @RequestParam("lineCode") String lineCode) {
		System.out.println("LineController line/lineDetails");
		LineDTO lineDTO = lineService.getlineDetails(lineCode);
		System.out.println("lineCode"+lineCode);
		System.out.println("LineDTO"+lineDTO);
		model.addAttribute("lineDTO", lineDTO);
		return "line/lineDetails";
	}// receiveDetails [라인상세]
	
	@GetMapping("/lineUpdate")
	public String lineUpdate(Model model, @RequestParam("lineCode") String lineCode) {
		System.out.println("LineController line/lineUpdate");
		LineDTO lineDTO = lineService.getlineDetails(lineCode);
		model.addAttribute("lineDTO", lineDTO);
		return "line/lineUpdate";
	}// receiveUpdate [라인수정]
	
	
	@PostMapping("/lineUpdatePro")
	public String lineUpdatePro(LineDTO lineDTO) {
		System.out.println("LIneController line/lineUpdatePro");
		System.out.println(lineDTO);
		lineService.lineUpdatePro(lineDTO);
		
		if(lineDTO != null) {
			return "line/msgSuccess"; // 등록완료
		}else {
			return "line/msgFailed"; // 등록실패
		}
	}// receiveUpdatePro [수주수정Pro]
	
	
	@PostMapping("/lineDelete")
    public ResponseEntity<String> deleteLines(@RequestBody List<String> lineCodes) {
        try {
            lineService.lineDelete(lineCodes);
            return ResponseEntity.ok("라인이 성공적으로 삭제되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("라인 삭제 중 오류가 발생했습니다: " + e.getMessage());
        }
    }
}
