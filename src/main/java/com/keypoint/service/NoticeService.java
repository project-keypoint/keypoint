package com.keypoint.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.keypoint.dao.NoticeDAO;
import com.keypoint.dto.NoticeDTO;
import com.keypoint.dto.PageDTO;



@Service
public class NoticeService {

	
//	NoticeDAO 객체생성
	@Inject NoticeDAO noticeDAO;


	
	
	
	
//	-------------------------------------------------------------------
	
//	공지사항 글쓰기
	public void insertNotice(NoticeDTO noticeDTO) {
		System.out.println("NoticeService insertNotice()");

		noticeDTO.setNoticeDate(new Timestamp(System.currentTimeMillis()));
		noticeDTO.setNoticeReadcount(0);
		
//		넘버값 구하기
		if (noticeDAO.getMaxNum() == null) {
//			글이 없는 경우
			noticeDTO.setNoticeNum(1);
		} else {
//			글이 있는 경우
			noticeDTO.setNoticeNum(noticeDAO.getMaxNum() + 1);
		}
		
		noticeDAO.insertNotice(noticeDTO);
	}
	
	
	
	
//	공지사항 리스트
	public List<NoticeDTO> getNoticeList(PageDTO pageDTO) {
		System.out.println("NoticeService getNoticeList()");
		
//		10개씩 가져올 때, 현페이지에 대한 시작하는 행번호 구하기
//		int startRow = (현재페이지번호 -1) * pageSize + 1;
		int startRow = (pageDTO.getCurrentPage() -1) * pageDTO.getPageSize() + 1;
		
//		끝나는 행 번호 구하기
//		int endRow = startRow + pageSize -1;
		int endRow = startRow + pageDTO.getPageSize() -1;
		
//		디비 startRow -1
		pageDTO.setStartRow(startRow -1);
		pageDTO.setEndRow(endRow);
		
		
		return noticeDAO.getNoticeList(pageDTO);
	}




//	전체 글 수 
	public int getNoticeCount(PageDTO pageDTO) {
		System.out.println("NoticeService getNoticeCount()");

		return noticeDAO.getNoticeCount(pageDTO);
	}



//	공지사항 내용보기
	public NoticeDTO getNoticeContent(int noticeNum) {
		System.out.println("NoticeService getNoticeContent()");

		return noticeDAO.getNoticeContent(noticeNum);
	}



//	조회수
	public void updateReadcount(int noticeNum) {
		System.out.println("NoticeService updateReadcount()");
		
		noticeDAO.updateReadcount(noticeNum);
	}



	
//	글 수정
	public void updateNotice(NoticeDTO noticeDTO) {
		System.out.println("NoticeService updateNotice()");
		
		noticeDAO.updateNotice(noticeDTO);
	}
	
	
	
//	글삭제
	public void deleteNotice(NoticeDTO noticeDTO) {
		System.out.println("NoticeService deleteNotice()");

		noticeDAO.deleteNotice(noticeDTO);
	}



//	'등록' 글 수 가져오기
	public int getinserCount() {
		System.out.println("NoticeService deleteNotice()");

		return noticeDAO.getinserCount();
	}






	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
