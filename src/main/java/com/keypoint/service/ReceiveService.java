package com.keypoint.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.keypoint.dao.ReceiveDAO;
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

	public List<ReceiveDTO> getReceiveList() {
		System.out.println("ReceiveService getReceiveList()");
		return receiveDAO.getReceiveList();
	}// getReceiveList [수주목록]

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

}
