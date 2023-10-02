package com.keypoint.dao;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.keypoint.dto.QualityDTO;

@Repository
public class QualityDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.qualityMapper";
	
	public List<QualityDTO> getQcList() {
		System.out.println("QualityDAO getQcList()");
		return sqlSession.selectList(namespace+".getQcList");
	}// getQcList [품질검사목록]

	public QualityDTO getQcDetails(String prodCode) {
		System.out.println("QualityDAO getQcDetails()");
		return sqlSession.selectOne(namespace+".getQcDetails", prodCode);
	}// getQcDetails [품질검사상세]

	public void qcStart(QualityDTO qualityDTO) {
		System.out.println("QualityDAO qcStart()");
		sqlSession.insert(namespace+".qcStart", qualityDTO);
	}// qcStart() [품질검사시작]

	public void updateQc(QualityDTO qualityDTO) {
		System.out.println("QualityDAO updateQc()");
		sqlSession.update(namespace+".updateQc", qualityDTO);
	}// updateQc() [품질검사(저장)]


	
	
	
}
