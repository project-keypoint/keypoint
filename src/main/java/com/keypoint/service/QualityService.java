package com.keypoint.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.keypoint.dao.QualityDAO;
import com.keypoint.dto.QualityDTO;


@Service
public class QualityService {
	
	@Inject
	private QualityDAO qualityDAO;
	
	public List<QualityDTO> getQcList() {
		System.out.println("QualityService getQcList()");
		return qualityDAO.getQcList();
	}// getQcList [품질검사목록]

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
