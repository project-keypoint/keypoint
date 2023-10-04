package com.keypoint.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.keypoint.dao.LineDAO;
import com.keypoint.dto.LineDTO;
import com.keypoint.dto.ReceiveDTO;


@Service
public class LineService {
	
	@Inject LineDAO lineDAO;
	

	public List<LineDTO> getLineList() {
		System.out.println("LineService getLineList()");
		return lineDAO.getLineList();
	}// getLineList


	public void lineInsertPro(LineDTO lineDTO) {
		System.out.println("LineService lineInsertPro()");
		
		lineDAO.lineInsert(lineDTO);
	}// 라인등록Pro


	public LineDTO getlineDetails(String lineCode) {
		System.out.println("LineService getLineDetails()");	
		return lineDAO.getLineDetails(lineCode);
	}// 라인상세


	public void lineUpdatePro(LineDTO lineDTO) {
		System.out.println("LineService lineUpdatePro()");
		System.out.println(lineDTO);
//		receiveDTO.setShipSdate(new Timestamp(System.currentTimeMillis()));
		lineDAO.lineUpdate(lineDTO);
	}// receiveUpdatePro() [수주수정Pro]

}
