package com.keypoint.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.ui.Model;
import org.springframework.stereotype.Service;

import com.keypoint.dao.WorkOrderDAO;
import com.keypoint.dto.PageDTO;
import com.keypoint.dto.ReceiveDTO;
import com.keypoint.dto.WorkOrderDTO;
import com.keypoint.dto.PageUtil;

@Service
public class WorkOrderService {

	@Inject
	private WorkOrderDAO workOrderDAO;
	
	
	public List<WorkOrderDTO> getWorkOrderList(PageDTO pageDTO) {
		System.out.println("WorkOrderService getWorkOrderList()");
		// 10개씩 가져올때 현페이지에 대한 시작하는 행번호 구하기
		int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize() + 1;
				// 끝나는 행번호 구하기
		int endRow = startRow + pageDTO.getPageSize() - 1;
				
				// 디비 startRow - 1
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		System.out.println("startRow"+startRow+"endRow"+endRow);
		return workOrderDAO.getWorkOrderList(pageDTO);
	}// 작업지시 목록
	
	public int getWorkOrderCount() {
		System.out.println("WorkOrderService getWorkOrderCount()");
		return workOrderDAO.getWorkOrderCount();
	}
	
		
	public WorkOrderDTO getWorkOrderDetails(String woCode) {
		System.out.println("WorkOrderService getWorkOrderDetails()");
		return workOrderDAO.getWorkOrderDetails(woCode);
	}// getReceiveDetails [작업지시상세]
	
	
	public void workOrderInsertPro(WorkOrderDTO workOrderDTO) {
		System.out.println("workOrderService workOrderInsertPro()");
		
//		workOrderDTO.setWoDate(new Timestamp(System.currentTimeMillis()));
		
		workOrderDAO.insertWorkOrder(workOrderDTO);
		
	} // insertWorkOrder
	
	
	public void workOrderUpdatePro(WorkOrderDTO workOrderDTO) {
		System.out.println("WorkOrderService workOrderUpdatePro()");
//		workOrderDTO.setShipSdate(new Timestamp(System.currentTimeMillis()));
		workOrderDAO.updateWorkOrder(workOrderDTO);
	}// workOrderUpdatePro() [작업지시수정Pro]
	
	public void workOrderDelete(WorkOrderDTO workOrderDTO) {
		System.out.println("WorkOrderService receiveUpdatePro()");
		System.out.println(workOrderDTO);
		workOrderDAO.deleteWorkOrder(workOrderDTO);
	}// receiveDelete() [작업지시삭제]
	
	
	
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


	public List<WorkOrderDTO> getWorkRoCodeList(Map<String, Object> search) {
		System.out.println("WorkOrderService getWorkRoCodeList()");
		return workOrderDAO.getWorkRoCodeList(search);
	}


	public int countWorkRoCodeList(Map<String, Object> search) {		
		System.out.println("WorkOrderService countRoCodeList()");
		return workOrderDAO.countWorkRoCodeList(search);
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

	
	
	public List<WorkOrderDTO> workList() {
		System.out.println("WorkOrderService workList()");
		
		return workOrderDAO.workList();
	}

	public List<Map<String, Object>> workList(PageDTO pageDTO, Model model) {
		// 라인 전체 목록
		System.out.println("WorkOrderService lineList()");
		
		int totalCnt = workOrderDAO.workTotalCount();
		PageUtil.getPaging(pageDTO, model, totalCnt);
		
		return workOrderDAO.workList(pageDTO);
	}

	public List<Map<String, Object>> workSearch(Map<String, Object> workSearch, PageDTO pageDTO, Model model) {
		System.out.println("WorkOrderService workSearch()");
		
		int totalCnt = workOrderDAO.workSearchCount(workSearch);
		PageUtil.getPaging(pageDTO, model, totalCnt);
		
		return workOrderDAO.workSearch(workSearch, pageDTO);
	}

	public Integer workTotalCount() {
		System.out.println("WorkOrderService workTotalCount");
		
		return workOrderDAO.workTotalCount();
	}

	public Integer workSearchCount(Map<String, Object> workSearch) {
		System.out.println("WorkOrderService workSearchCount");
		
		return workOrderDAO.workSearchCount(workSearch);
	}
	
	
	
	
	
	
	
	
	
	
	
	
//	public List<WorkOrderDTO> getWorkList(PageDTO pageDTO) {
//		System.out.println("WorkOrderService getWorkList()");
//
//		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
//		int endRow = startRow+pageDTO.getPageSize()-1;
//
//		pageDTO.setStartRow(startRow);
//		pageDTO.setEndRow(endRow);
//		return workOrderDAO.getWorkList(pageDTO);
//	}
//
//	public int getWorkOrderCount(PageDTO pageDTO) {
//		System.out.println("WorkOrderService getWorkOrderCount()");
//
//		return workOrderDAO.getWorkOrderCount(pageDTO);
//
//
//	}
//	
//	
//	public WorkOrderDTO getWork(String woCode) {
//		System.out.println("WorkOrderService getWork()");
//
//		return workOrderDAO.getWork(woCode);
//		
//	}
}

