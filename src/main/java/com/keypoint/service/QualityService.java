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

	public void qcDeleteChecked(QualityDTO qualityDTO) {
		System.out.println("QualityService qcDeleteChecked()");
		qualityDAO.qcDeleteChecked(qualityDTO);
	}// qcDeleteChecked [품질검사 다중삭제(체크)]
	
// ======================================================//
	public String codeChangeDis(String code_id) {
		Integer num = getMaxNum(code_id);
		if(num == null) {
			num = 0;
		}
		return String.format("%s%04d", code_id, ++num);
    }// disCode 자동증가(상품)
	
	public Integer getMaxNum(String code_id) {
		return qualityDAO.getMaxNum(code_id);
	}
	
	public void disInsertP(QualityDTO qualityDTO) {
		System.out.println("QualityService disInsertP()");
		String disCode = codeChangeDis("DISP");//
	    qualityDTO.setDisCode(disCode);
	    
		qualityDAO.disInsertP(qualityDTO);
	}// disInsert [폐기등록(상품)]
	
	public void disInsertM(QualityDTO qualityDTO) {
		System.out.println("QualityService disInsertM()");
		String disCode = codeChangeDis("DISM");//
	    qualityDTO.setDisCode(disCode);
	    
		qualityDAO.disInsertM(qualityDTO);
	}// disInsertM [폐기등록(자재)]
	
// ======================================================//	
	public List<QualityDTO> getDisposedList(PageDTO pageDTO) {
		System.out.println("QualityService getDisposedList()");
		// 10개씩 가져올때 현페이지에 대한 시작하는 행번호 구하기
		int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize() + 1;
		// 끝나는 행번호 구하기
		int endRow = startRow + pageDTO.getPageSize() - 1;
		
		// 디비 startRow - 1
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		System.out.println("startRow"+startRow+"endRow"+endRow);
		return qualityDAO.getDisposedList(pageDTO);
	}

	public int getDisposedCount(PageDTO pageDTO) {
		System.out.println("DisposedService getDisposedCount()");
		return qualityDAO.getDisposedCount(pageDTO);
	}

	public List<QualityDTO> getDisposedSum() {
		System.out.println("QualityService getDisposedSum()");
		return qualityDAO.getDisposedSum();
	}

	public List<QualityDTO> getDisposedSumMat() {
		System.out.println("QualityService getDisposedSumMat()");
		return qualityDAO.getDisposedSumMat();
	}

}
