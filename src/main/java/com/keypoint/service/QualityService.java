package com.keypoint.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.keypoint.dao.QualityDAO;
import com.keypoint.dto.PageDTO;
import com.keypoint.dto.QualityDTO;


@Service
public class QualityService {
	
	@Inject
	private QualityDAO qualityDAO;
	
//	public List<QualityDTO> getQcList() {
//		System.out.println("QualityService getQcList()");
//		return qualityDAO.getQcList();
//	}// getQcList [품질검사목록]
	
	public List<QualityDTO> getQcList(PageDTO pageDTO) {
		System.out.println("QualityService getQcList()");
		// 10개씩 가져올때 현페이지에 대한 시작하는 행번호 구하기
		int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize() + 1;
		// 끝나는 행번호 구하기
		int endRow = startRow + pageDTO.getPageSize() - 1;
		
		// 디비 startRow - 1
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		
		return qualityDAO.getQcList(pageDTO);
	}// getQcList [품질검사목록]
	
	public int getQcCount(PageDTO pageDTO) {
		System.out.println("QualityService getQcCount()");
		return qualityDAO.getQcCount(pageDTO);
	}
	
	public QualityDTO getQcDetails(String prodCode) {
		System.out.println("QualityService getQcDetails()");
		return qualityDAO.getQcDetails(prodCode);
	}// getQcDetails [품질검사상세]

	public void qcStart(QualityDTO qualityDTO) {
		System.out.println("QualityService qcStart()");
		qualityDTO.setQcStatus("대기");
		qualityDTO.setQcTest1("대기");
		qualityDTO.setQcTest2("대기");
		qualityDTO.setQcTest3("대기");
		qualityDTO.setQcPass(0);
		qualityDTO.setQcDefect(0);
		qualityDAO.qcStart(qualityDTO);
	}// qcStart [품질검사시작]

	public void qcUpdatePro(QualityDTO qualityDTO) {
		System.out.println("QualityService qcUpdatePro()");
		qualityDAO.updateQc(qualityDTO);
	}// qcUpdatePro [품질검사(저장)]

	public boolean qcTransfer(QualityDTO qualityDTO) {
	    System.out.println("QualityService qcTransfer()");
	    boolean result = qualityDAO.qcTransfer(qualityDTO);
	    return result;
	}// qcTransfer [품질검사후 상품이동]

	
}
