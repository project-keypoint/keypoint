package com.keypoint.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;

import com.keypoint.dto.NoticeDTO;
import com.keypoint.dto.PageDTO;

@Repository
public class NoticeDAO {

	
//	SqlSession 객체생성
	@Inject
	private SqlSession sqlSession;

	private static final String nameSpace="com.itwillbs.mappers.noticeMapper";


	
	
	
	
	
//	-----------------------------------------------------------------------------------
	
//	최대값
	public Integer getMaxNum() {
		System.out.println("NoticeDAO getMaxNum()");
		
		return sqlSession.selectOne(nameSpace+".getMaxNum");
	}
	

//	공지사항 글쓰기
	public void insertNotice(NoticeDTO noticeDTO) {
		System.out.println("NoticeDAO insertNotice()");

		sqlSession.insert(nameSpace+".insertNotice", noticeDTO);
	}


	
//	공지사항 리스트
	public List<NoticeDTO> getNoticeList(PageDTO pageDTO) {
		System.out.println("NoticeDAO getNoticeList()");
		
		return sqlSession.selectList(nameSpace+".getNoticeList", pageDTO);
	}

	
//	전체 글 수 
	public int getNoticeCount(PageDTO pageDTO) {
		System.out.println("NoticeDAO getNoticeCount()");

		return sqlSession.selectOne(nameSpace+".getNoticeCount", pageDTO);
	}


	
//	공지사항 내용보기
	public NoticeDTO getNoticeContent(int noticeNum) {
		System.out.println("NoticeDAO getNoticeContent()");

		return sqlSession.selectOne(nameSpace+".getNoticeContent", noticeNum);
	}


	
//	조회수
	public void updateReadcount(int noticeNum) {
		System.out.println("NoticeDAO updateReadcount()");
		
		sqlSession.update(nameSpace+".updateReadcount", noticeNum);
	}

	

//	글수정
	public void updateNotice(NoticeDTO noticeDTO) {
		System.out.println("NoticeDAO updateNotice()");
		
		sqlSession.update(nameSpace+".updateNotice", noticeDTO);
	}

	

//	글삭제
	public void deleteNotice(NoticeDTO noticeDTO) {
		System.out.println("NoticeDAO deleteNotice()");

		sqlSession.update(nameSpace+".deleteNotice", noticeDTO);
	}

	
//	'등록' 글 수 가져오기
	public int getinserCount() {
		System.out.println("NoticeDAO getinserCount()");

		return sqlSession.selectOne(nameSpace+".getinserCount");
	}









	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


	
	
	
}
