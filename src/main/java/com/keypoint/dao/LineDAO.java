package com.keypoint.dao;

import java.util.List;

import javax.inject.Inject;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.keypoint.dto.LineDTO;
import com.keypoint.dto.PageDTO;
import com.keypoint.dto.ReceiveDTO;


@Repository
public class LineDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.lineMapper";

	
	public List<LineDTO> getLineList(PageDTO pageDTO) {
		System.out.println("LineDAO getLineList()");
		return sqlSession.selectList(namespace+".getLineList" , pageDTO);
	}// 라인목록조회


	public int getLineCount(PageDTO pageDTO) {
		System.out.println("LineDAO getLineCount()");

		return sqlSession.selectOne(namespace+".getLineCount");
	}
	
	public void lineInsert(LineDTO lineDTO) {
		System.out.println("LineDAO lineInsert()");
		sqlSession.insert(namespace+".lineInsert",lineDTO);
	}// 라인등록


	public LineDTO getLineDetails(String lineCode) {
		System.out.println("LineDAO getLineDetails()");
		return sqlSession.selectOne(namespace+".getLineDetails", lineCode);
	}// 라인상세


	public void lineUpdate(LineDTO lineDTO) {
		System.out.println("LineDAO lineUpdate()");
		System.out.println(lineDTO);
		sqlSession.update(namespace+".lineUpdate",lineDTO);
	}// 라인수정


//	public void deleteByLineCodes(String[] lineCodes) {
//        sqlSession.delete(namespace + ".deleteSelectedLines", lineCodes);
//    }


	public void deleteLines(List<String> lineCodes) {
        try {
        	System.out.println("LineDAO deleteLines()");
            sqlSession.delete(namespace+".deleteLines", lineCodes);
        } catch (Exception e) {
            // 예외가 발생하면 필요한 예외 처리를 수행하세요.
            throw new RuntimeException("라인 삭제 중 오류 발생: " + e.getMessage());
        }
    }
	
	
	public String getMaxLineCode() {
		return sqlSession.selectOne(namespace+".getMaxLineCode");
	}
	
	public String getMaxLineName() {
		return sqlSession.selectOne(namespace+".getMaxLineName");
	}
	
}
