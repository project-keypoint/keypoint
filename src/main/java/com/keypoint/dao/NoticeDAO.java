package com.keypoint.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.keypoint.dto.NoticeDTO;

@Repository
public class NoticeDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String nameSpace="com.itwillbs.mappers.NoticeMapper";
	
	public List<NoticeDTO> getNoticeLIst() {
	System.out.println("NoticeDTO getNoticeList()");
	
		return sqlSession.selectList(nameSpace+".getNoticeList");
	} // 노티스 목록

	
	
	
	
	
	
}
