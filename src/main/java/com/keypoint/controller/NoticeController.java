package com.keypoint.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.keypoint.dto.EmployeeDTO;
import com.keypoint.dto.NoticeDTO;
import com.keypoint.dto.PageDTO;
import com.keypoint.dto.RequireDTO;
import com.keypoint.service.EmployeeService;
import com.keypoint.service.NoticeService;




@Controller
@RequestMapping("/notice/*")
public class NoticeController {

//	NoticeService 객체생성
	@Inject
	private NoticeService noticeService;
	
//	upload 폴더 파일경로 객체생성
	@Resource(name="uploadPath")
	private String uploadPath;
	
//	EmployeeService 객체생성
	@Inject
	private EmployeeService employeeService;
	
	
	
	
	
//	--------------------------------------------------------------------------------------------------
	
//	공지사항 글쓰는 화면
	@GetMapping("/noticeWrite")
	public String noticeWrite() {
		System.out.println("NoticeController noticeWrite()");
		
		return "notice/noticeWrite";
	}
	
	
	
//	공지사항 글쓰기
	@PostMapping("/noticeWritePro")
	public String noticeWritePro(NoticeDTO noticeDTO) {
		System.out.println("NoticeController noticeWritePro()");
		
		noticeService.insertNotice(noticeDTO);
	
		if(noticeDTO != null) {
			return "notice/msgSuccess"; // 등록완료
		} else {
			return "notice/msgFailed"; // 등록실패
		}	
	}
	
	
	
	
//	공지사항 리스트
	@GetMapping("/noticeList")
	public String noticeList(Model model, HttpServletRequest request, HttpSession session) {
		System.out.println("NoticeController noticeList()");
		
		
//		검색어 가져오기
		String search = request.getParameter("search");
		String search2 = request.getParameter("search2");
		
		
		
//		세션에서 empId 가져오기
		int empId = (int)session.getAttribute("empId");
		
//		empId 사원정보 가져오기
		EmployeeDTO employeeDTO = employeeService.getEmployeeDetails(empId);
		model.addAttribute("employeeDTO", employeeDTO);
		
		
//		한 화면에 보여줄 글 개수 설정
		int pageSize = 8;
		
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
		
//		검색어 저장
		pageDTO.setSearch(search);
		pageDTO.setSearch2(search2);
		
		
		List<NoticeDTO> noticeList = noticeService.getNoticeList(pageDTO);
		
		
		
//		페이징
//		게시판 전체 글 개수 가져오기
		int count = noticeService.getNoticeCount(pageDTO);
		
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
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		model.addAttribute("noticeCount", count);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pageDTO", pageDTO);

	return "notice/noticeList";
	}
	
	
	
	
//	글 내용보기
	@GetMapping("/noticeContent")
	public String noticeContent(NoticeDTO noticeDTO, Model model, HttpSession session) {
		System.out.println("NoticeController noticeContent()");

		
//		세션에서 empId 가져오기
		int empId = (int)session.getAttribute("empId");
		
//		empId 사원정보 가져오기
		EmployeeDTO employeeDTO = employeeService.getEmployeeDetails(empId);
		model.addAttribute("employeeDTO", employeeDTO);
		
		
		
		
//		공지사항 글 가져오기
		noticeDTO = noticeService.getNoticeContent(noticeDTO.getNoticeNum());
		model.addAttribute("noticeDTO", noticeDTO);
		
//		조회수
		noticeService.updateReadcount(noticeDTO.getNoticeNum());
		
		return "notice/noticeContent";
	}
	
	
	
	
//	글 수정화면
	@GetMapping("/noticeUpdate")
	public String noticeUpdate(NoticeDTO noticeDTO, Model model) {
		System.out.println("NoticeController noticeUpdate()");
		
		
//		공지사항 글 가져오기
		noticeDTO = noticeService.getNoticeContent(noticeDTO.getNoticeNum());
		model.addAttribute("noticeDTO", noticeDTO);
		
	
		return "notice/noticeUpdate";
	}
	
	
	
	
//	글 수정하기
	@PostMapping("/noticeUpdatePro")
	public String noticeUpdatePro(NoticeDTO noticeDTO) {
		System.out.println("NoticeController noticeUpdatePro()");
		System.out.println(noticeDTO);
		
		noticeService.updateNotice(noticeDTO);
		
		if(noticeDTO != null) {
			return "notice/msgUpSuccess"; // 등록완료
		} else {
			return "notice/msgFailed"; // 등록실패
		}
	}
	
	
	
	
//	글 삭제-->'noticeStatus = '삭제'
	@GetMapping("/noticeDeletePro")
	public String noticeDeletePro(NoticeDTO noticeDTO) {
		System.out.println("NoticeController noticeDeletePro()");
		
		noticeService.deleteNotice(noticeDTO);
		
	
		return "redirect:/notice/noticeList";
	}
	
	
	
//	다중삭제
	@PostMapping("/noticeDeleteChecked")
	public ResponseEntity<String> noticeDeleteChecked(@RequestBody NoticeDTO noticeDTO) {
	  System.out.println("NoticeController requireDeleteChecked()");
	  System.out.println(noticeDTO);
	  
	  try {
	    noticeService.noticeDeleteChecked(noticeDTO);
	    return ResponseEntity.ok("success");
	  } catch (Exception e) {
	    e.printStackTrace();
	    return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
	  }
	}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
