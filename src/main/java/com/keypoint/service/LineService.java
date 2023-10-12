package com.keypoint.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.keypoint.dao.LineDAO;
import com.keypoint.dto.LineDTO;
import com.keypoint.dto.PageDTO;
import com.keypoint.dto.ReceiveDTO;


@Service
public class LineService {
	
	@Inject LineDAO lineDAO;
	

	public List<LineDTO> getLineList(PageDTO pageDTO) {
		System.out.println("LineService getLineList()");

		//		10개씩 가져올 때, 현페이지에 대한 시작하는 행번호 구하기
//		int startRow = (현재페이지번호 -1) * pageSize + 1;
		int startRow = (pageDTO.getCurrentPage() -1) * pageDTO.getPageSize() + 1;
		
//		끝나는 행 번호 구하기
//		int endRow = startRow + pageSize -1;
		int endRow = startRow + pageDTO.getPageSize() -1;
		
//		디비 startRow -1
		pageDTO.setStartRow(startRow -1);
		pageDTO.setEndRow(endRow);
		
		return lineDAO.getLineList(pageDTO);
	}// getLineList

	public int getLineCount() {
		System.out.println("LineService getLineCount()");

		return lineDAO.getLineCount();
	}

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
