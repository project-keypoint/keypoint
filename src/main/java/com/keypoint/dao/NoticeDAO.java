package com.keypoint.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.keypoint.dto.NoticeDTO;

@Repository
public class NoticeDAO {

	
//	SqlSession 객체생성
	@Inject
	private SqlSession sqlSession;

	private static final String nameSpace="com.itwillbs.mappers.noticeMapper";


	
	
	
	
	
//	-----------------------------------------------------------------------------------
	
//	공지사항 리스트
	public List<NoticeDTO> getNoticeList() {
		System.out.println("NoticeDAO getNoticeList()");
		
		return sqlSession.selectList(nameSpace+".getNoticeList");
	}
	
	
	
	
	
}
