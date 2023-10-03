package com.keypoint.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.keypoint.dao.WorkOrderDAO;
import com.keypoint.dto.WorkOrderDTO;


@Service
public class WorkOrderService {

	@Inject
	private WorkOrderDAO workOrderDAO;
	
	
	public List<WorkOrderDTO> getWorkOrderList() {
		System.out.println("WorkOrderService getWorkOrderList()");
		return workOrderDAO.getWorkOrderList();
	}
		
	
	public void workOrderInsertPro(WorkOrderDTO workOrderDTO) {
		System.out.println("workOrderService workOrderInsertPro()");
		
//		workOrderDTO.setWoDate(new Timestamp(System.currentTimeMillis()));
		
		workOrderDAO.insertWorkOrder(workOrderDTO);
		
	} // insertWorkOrder

	
	public List<WorkOrderDTO> getWorkProdList(Map<String, Object> search) {
		System.out.println("WorkOrderService getWorkProdList()");
		return workOrderDAO.getWorkProdList(search);
	}


	public Integer countWorkList(Map<String, Object> search) { // 품목 개수
		System.out.println("PerformServiceImpl countWorklist()");
		return workOrderDAO.countWorkList(search);
	}


	public List<WorkOrderDTO> getWorkCusList(Map<String, Object> search) {
		System.out.println("WorkOrderService getWorkCusList()");
		return workOrderDAO.getWorkCusList(search);
	}


	public int countCusList(Map<String, Object> search) {
		System.out.println("WorkOrderService countCusList()");
		return workOrderDAO.countCusList(search);
	}


	public List<WorkOrderDTO> getWorkInstructList(Map<String, Object> search) {
		System.out.println("WorkOrderService workInstructList()");
		return workOrderDAO.getWorkInstructList(search);
	}


	public int countInstructList(Map<String, Object> search) {		
		System.out.println("WorkOrderService countInstructList()");
		return workOrderDAO.countInstructList(search);
	}


	public List<WorkOrderDTO> getWorkLineList(Map<String, Object> search) {
		System.out.println("WorkOrderService workLineList()");
		return workOrderDAO.getWorkLineList(search);
	}


	public int countLineList(Map<String, Object> search) {
		System.out.println("WorkOrderService countLineList()");
		return workOrderDAO.countLineList(search);
	}


	public List<WorkOrderDTO> getWorkEmpList(Map<String, Object> search) {
		System.out.println("WorkOrderService getWorkEmpList()");
		return workOrderDAO.getWorkEmpList(search);
	}


	public int countEmpList(Map<String, Object> search) {
		System.out.println("WorkOrderService countEmpList()");
		return workOrderDAO.countEmpList(search);
	}


	

	}

