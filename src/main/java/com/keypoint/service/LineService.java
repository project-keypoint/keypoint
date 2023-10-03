package com.keypoint.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.keypoint.dao.LineDAO;
import com.keypoint.dto.LineDTO;


@Service
public class LineService {
	
	@Inject LineDAO lineDAO;
	

	public List<LineDTO> getLineList() {
		System.out.println("LineService getLineList()");
		return lineDAO.getLineList();
	}// getLineList


	public void lineInsert(LineDTO lineDTO) {
		System.out.println("LineService lineInsert()");
		
		lineDAO.lineInsert(lineDTO);
	}// 라인등록Pro

}
