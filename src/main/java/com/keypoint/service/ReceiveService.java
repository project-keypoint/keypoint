package com.keypoint.service;

import java.sql.Timestamp;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.keypoint.dao.ReceiveDAO;
import com.keypoint.dto.ReceiveDTO;

@Service
public class ReceiveService {
	
	@Inject
	private ReceiveDAO receiveDAO;
	
	public void insertTest(ReceiveDTO receiveDTO) {
		System.out.println("ReceiveService insertTest()");
//		receiveDTO.setTestDate(new Timestamp(System.currentTimeMillis()));
		receiveDAO.insertTest(receiveDTO);
	}

}
