package com.keypoint.dao;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.keypoint.dto.PageDTO;
import com.keypoint.dto.QualityDTO;

@Repository
public class QualityDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.qualityMapper";
	
	public List<QualityDTO> getQcList(PageDTO pageDTO) {
		System.out.println("QualityDAO getQcList()");
		return sqlSession.selectList(namespace+".getQcList", pageDTO);
	}// getQcList [품질검사목록]
	
	public int getQcCount(PageDTO pageDTO) {
		System.out.println("QualityDAO getQcCount()");
		return sqlSession.selectOne(namespace+".getQcCount", pageDTO);
	}
	
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

	@Transactional
	public boolean qcTransfer(QualityDTO qualityDTO) {
		System.out.println("QualityDAO qcTransfer()");
	    try {
	        sqlSession.update(namespace + ".qcTransferStatus", qualityDTO);
	        sqlSession.update(namespace + ".qcTransferStock", qualityDTO);
	        sqlSession.insert(namespace + ".qcTransferDefect", qualityDTO);
	        return true;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}// qcTransfer [품질검사후 상품이동]

	public void qcDeleteChecked(QualityDTO qualityDTO) {
		System.out.println("QualityDAO qcDeleteChecked()");
		sqlSession.update(namespace + ".qcDeleteChecked", qualityDTO);
	}// qcDeleteChecked [품질검사 다중삭제(체크)]
	
	@Transactional
	public void disInsertP(QualityDTO qualityDTO) {
		System.out.println("QualityDAO disInsertP()");
		sqlSession.insert(namespace + ".disInsertP", qualityDTO);
		sqlSession.update(namespace + ".disMinusP", qualityDTO);
	}// disInsertP [폐기등록(상품)]
	
	public void disInsertM(QualityDTO qualityDTO) {
		System.out.println("QualityDAO disInsertM()");
		sqlSession.insert(namespace + ".disInsertM", qualityDTO);
		sqlSession.update(namespace + ".disMinusM", qualityDTO);
	}// disInsertM [폐기등록(자재)]

	public List<QualityDTO> getDisposedList(PageDTO pageDTO) {
		System.out.println("QualityDAO getDisposedList()");
		return sqlSession.selectList(namespace+".getDisposedList", pageDTO);
	}

	public int getDisposedCount(PageDTO pageDTO) {
		System.out.println("QualityDAO getDisposedCount()");
		return sqlSession.selectOne(namespace+".getDisposedCount", pageDTO);
	}

	public List<QualityDTO> getDisposedSum() {
		System.out.println("QualityDAO getDisposedSum()");
		return sqlSession.selectList(namespace+".getDisposedSum");
	}

	public List<QualityDTO> getDisposedSumMat() {
		System.out.println("QualityDAO getDisposedSumMat()");
		return sqlSession.selectList(namespace+".getDisposedSumMat");
	}

	public Integer getMaxNum(String code_id) {
		System.out.println("QualityDAO getMaxNum()");
		return sqlSession.selectOne(namespace+".getMaxNum", code_id);
	}// 코드 최대값 불러오기(폐기)

	public List<QualityDTO> getProductList(Map<String, Object> search) {
		System.out.println("QualityDAO getProductList()");
		if(search.get("productName")==null) {
			search.put("productName", "");
		}
		if(search.get("productCode")==null) {
			search.put("productCode", "");
		}
		return sqlSession.selectList(namespace+".getProductList", search);
	}

	public int getProductCount(Map<String, Object> search) {
		System.out.println("QualityDAO getProductCount()");
		return sqlSession.selectOne(namespace+".getProductCount", search);
	}

	

}
