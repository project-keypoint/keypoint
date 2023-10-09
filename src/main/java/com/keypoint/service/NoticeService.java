package com.keypoint.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.keypoint.dao.NoticeDAO;
import com.keypoint.dto.NoticeDTO;



@Service
public class NoticeService {

	
//	NoticeDAO 객체생성
	@Inject NoticeDAO noticeDAO;


	
	
	
	
//	-------------------------------------------------------------------
	
//	공지사항 리스트
	public List<NoticeDTO> getNoticeList() {
		System.out.println("NoticeService getNoticeList()");
		
		return noticeDAO.getNoticeList();
	}
	
	
	
	
	
	
	
}
