package com.keypoint.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keypoint.dto.NoticeDTO;
import com.keypoint.service.NoticeService;




@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	@Inject
	private NoticeService noticeService;
	
	
	
	
//	--------------------------------------------------------------------------------------------------
	
//	공지사항 글쓰기
	@GetMapping("/noticeWrite")
	public String noticeWrite() {
		System.out.println("NoticeController noticeWrite()");
		
		

		return "notice/noticeWrite";
	}
	
	
	
//	공지사항 리스트
	@GetMapping("/noticeList")
	public String noticeList(Model model) {
		System.out.println("NoticeController noticeList()");
		
		List<NoticeDTO> noticeList = noticeService.getNoticeList();
		
		model.addAttribute("noticeList", noticeList);

	return "notice/noticeList";
	}
	
	
	
	
	
	
}
