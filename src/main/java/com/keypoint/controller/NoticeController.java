package com.keypoint.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keypoint.dto.NoticeDTO;
import com.keypoint.dto.PageDTO;
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
		System.out.println(noticeDTO);
		
		noticeService.insertNotice(noticeDTO);
		
		
		if(noticeDTO != null) {
			return "notice/msgSuccess"; // 등록완료
		} else {
			return "notice/msgFailed"; // 등록실패
		}
		
		
	}
	
	
	
	
	
//	공지사항 리스트
	@GetMapping("/noticeList")
	public String noticeList(Model model, HttpServletRequest request) {
		System.out.println("NoticeController noticeList()");
		
		
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
		
		
		List<NoticeDTO> noticeList = noticeService.getNoticeList(pageDTO);
		
		
//		페이징
//		게시판 전체 글 개수 가져오기
		int count = noticeService.getNoticeCount();
		
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
		
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("noticeCount", count);

	return "notice/noticeList";
	}
	
	
	
	
//	글 내용보기
	@GetMapping("/noticeContent")
	public String noticeContent(NoticeDTO noticeDTO, Model model) {
		System.out.println("NoticeController noticeContent()");

		
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
			return "notice/msgSuccess"; // 등록완료
		} else {
			return "notice/msgFailed"; // 등록실패
		}
		
		
	}
	
	
	
	
//	글 삭제--임시
	@GetMapping("/noticeDeletePro")
	public String noticeDeletePro(NoticeDTO noticeDTO) {
		System.out.println("NoticeController noticeDeletePro()");
		
		noticeService.deleteNotice(noticeDTO);
		
	
		return "redirect:/notice/noticeList";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
