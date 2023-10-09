package com.keypoint.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

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
		
		return noticeDAO.getNoticeList(pageDTO);
	}




//	
	public int getNoticeCount() {
		System.out.println("NoticeService getNoticeCount()");

		return noticeDAO.getNoticeCount();
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





	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
