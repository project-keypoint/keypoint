package com.keypoint.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.keypoint.dao.NoticeDAO;
import com.keypoint.dto.NoticeDTO;



@Service
public class NoticeService {

	@Inject NoticeDAO noticeDAO;
	
	public List<NoticeDTO> getNoticeList(){
		System.out.println("noticeService getNoticeList()");
		return noticeDAO.getNoticeLIst();
		
	}// 노티스 목록
	
	
	
	
	
	
	
	
}
