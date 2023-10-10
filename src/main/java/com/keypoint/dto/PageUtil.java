package com.keypoint.dto;

import org.springframework.ui.Model;

public class PageUtil {

	
	public static void getPaging(PageDTO pageDTO, Model model, int totalCnt) {
		//페이징 처리

		
		// 한 페이지의 시작글 번호  = (현재페이지 - 1) / 블록*블록+1
		System.out.println(pageDTO.getPageBlock());
		int startPage=(pageDTO.getCurrentPage()-1)/pageDTO.getPageBlock()*pageDTO.getPageBlock()+1;
		
		// 한 페이지의 마지막 글 번호 = 시작페이지 + 블록-1
		int endPage=startPage+pageDTO.getPageBlock()-1;
		
		// 전체 글 개수 = 총 개수 / 한 화면 글개수 + (총개수 % 한화면글개수의 나머지가 0이면 == true  0, false 1)
		int pageCount=totalCnt/pageDTO.getPageSize()+(totalCnt%pageDTO.getPageSize()==0?0:1);
		
		if(endPage > pageCount){ // 10 > 12 이면 => 10 == 10 으로 한다
			endPage = pageCount;	// 끝페이지 = 총페이지수
		}
				
		pageDTO.setCount(totalCnt);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		System.out.println(pageDTO);
		
		model.addAttribute("pageDTO", pageDTO);
		
	}
	
}