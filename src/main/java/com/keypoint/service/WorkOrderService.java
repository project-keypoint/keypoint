package com.keypoint.service;

import java.sql.Timestamp;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.keypoint.dao.WorkOrderDAO;
import com.keypoint.dto.WorkOrderDTO;


@Service
public class WorkOrderService {

	@Inject
	private WorkOrderDAO workOrderDAO;
	
	public void insertWorkOrder(WorkOrderDTO workOrderDTO) {
		System.out.println("workOrderService insertWorkOrder()");
		
		workOrderDTO.setWoDate(new Timestamp(System.currentTimeMillis()));
		
		workOrderDAO.insertWorkOrder(workOrderDTO);
		
	} // insertWorkOrder
}
