package com.keypoint.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.keypoint.dao.ReceiveDAO;
import com.keypoint.dto.PageDTO;
import com.keypoint.dto.ReceiveDTO;

@Service
public class ReceiveService {
	
	@Inject
	private ReceiveDAO receiveDAO;
	
	public void receiveInsertPro(ReceiveDTO receiveDTO) {
		System.out.println("ReceiveService receiveInsertPro()");
		receiveDTO.setShipDate(null);
//		receiveDTO.setRoDate(new Timestamp(System.currentTimeMillis()));
//		receiveDTO.setShipSdate(new Timestamp(System.currentTimeMillis()));
		
		receiveDAO.insertReceive(receiveDTO);
	}// receiveInsertPro() [수주등록Pro]
	
/////////////////////////////////////////////////////////////////////////////////////////////
	
//	public List<ReceiveDTO> getReceiveList() {
//		System.out.println("ReceiveService getReceiveList()");
//		return receiveDAO.getReceiveList();
//	}// getReceiveList [수주+출하목록(수주)]
	
	public List<ReceiveDTO> getReceiveList(PageDTO pageDTO) {
		System.out.println("ReceiveService getReceiveList()");
		// 10개씩 가져올때 현페이지에 대한 시작하는 행번호 구하기
		int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize() + 1;
		// 끝나는 행번호 구하기
		int endRow = startRow + pageDTO.getPageSize() - 1;
		
		// 디비 startRow - 1
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		System.out.println("startRow"+startRow+"endRow"+endRow);
		return receiveDAO.getReceiveList(pageDTO);
	}// getReceiveList [수주+출하목록(수주)]
	
	public List<ReceiveDTO> getShipmentList(PageDTO pageDTO1) {
		System.out.println("ReceiveService getShipmentList()");
		// 10개씩 가져올때 현페이지에 대한 시작하는 행번호 구하기
		int startRow1 = (pageDTO1.getCurrentPage()-1)*pageDTO1.getPageSize() + 1;
		// 끝나는 행번호 구하기
		int endRow1 = startRow1 + pageDTO1.getPageSize() - 1;
		
		// 디비 startRow - 1
		pageDTO1.setStartRow(startRow1 - 1);
		pageDTO1.setEndRow(endRow1);
		System.out.println("startRow1"+startRow1+"endRow1"+endRow1);
		return receiveDAO.getShipmentList(pageDTO1);
	}// getShipmentList [수주+출하목록(출하)]
	
	public int getReceiveCount(PageDTO pageDTO) {
		System.out.println("ReceiveService getReceiveCount()");
		return receiveDAO.getReceiveCount(pageDTO);
	}
	
	public int getShipmentCount(PageDTO pageDTO1) {
		System.out.println("ReceiveService getShipmentCount()");
		return receiveDAO.getShipmentCount(pageDTO1);
	}

/////////////////////////////////////////////////////////////////////////////////////////////
	
	public ReceiveDTO getReceiveDetails(String roCode) {
		System.out.println("ReceiveService getReceiveDetails()");
		return receiveDAO.getReceiveDetails(roCode);
	}// getReceiveDetails [수주상세]

	public void receiveUpdatePro(ReceiveDTO receiveDTO) {
		System.out.println("ReceiveService receiveUpdatePro()");
		System.out.println(receiveDTO);
//		receiveDTO.setShipSdate(new Timestamp(System.currentTimeMillis()));
		receiveDAO.updateReceive(receiveDTO);
	}// receiveUpdatePro() [수주수정Pro]

	public void receiveDelete(ReceiveDTO receiveDTO) {
		System.out.println("ReceiveService receiveUpdatePro()");
		System.out.println(receiveDTO);
		receiveDAO.deleteReceive(receiveDTO);
	}// receiveDelete() [수주삭제]

	

	public boolean shipComplete(ReceiveDTO receiveDTO) {
		System.out.println("ReceiveService shipComplete");
		boolean result = receiveDAO.shipComplete(receiveDTO);
		return result;
	}// shipComplete [출하완료]

	/////////////////////////////////////////////////////////////////////////////////////////////
	
	
	
}
