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
import com.keypoint.dto.WorkRoDTO;
import com.keypoint.dto.PageUtil;
import com.keypoint.dto.ReceiptDTO;

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
	
	public int getWorkOrderCount(PageDTO pageDTO) {
		System.out.println("WorkOrderService getWorkOrderCount()");
		return workOrderDAO.getWorkOrderCount(pageDTO);
	}
	
		
	public WorkOrderDTO getWorkOrderDetails(String woCode) {
		System.out.println("WorkOrderService getWorkOrderDetails()");
		return workOrderDAO.getWorkOrderDetails(woCode);
	}// getWorkOrderDetails [작업지시상세]
	
	
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
		System.out.println("WorkOrderService workOrderUpdatePro()");
		System.out.println(workOrderDTO);
		workOrderDAO.deleteWorkOrder(workOrderDTO);
	}// workOrderDelete() [작업지시삭제]
	
	
	
	
	
	
	public List<WorkOrderDTO> getWorkProdList(Map<String, Object> search) {
		System.out.println("WorkOrderService getWorkProdList()");
		return workOrderDAO.getWorkProdList(search);
	}


	public Integer countProdList(Map<String, Object> search) { // 품목 개수
		System.out.println("WorkOrderService countProdList()");
		return workOrderDAO.countProdList(search);
	}


	public List<WorkOrderDTO> getWorkCusList(Map<String, Object> search) {
		System.out.println("WorkOrderService getWorkCusList()");
		return workOrderDAO.getWorkCusList(search);
	}

	public List<WorkOrderDTO> getWorkCusList2(Map<String, Object> search) {
		System.out.println("WorkOrderService getWorkCusList2()");
		return workOrderDAO.getWorkCusList2(search);
	}

	public int countCusList(Map<String, Object> search) {
		System.out.println("WorkOrderService countCusList()");
		return workOrderDAO.countCusList(search);
	}
	
	public int countCusList2(Map<String, Object> search) {
		System.out.println("WorkOrderService countCusList2()");
		return workOrderDAO.countCusList2(search);
	}


	public List<WorkRoDTO> getWorkRoCodeList(Map<String, Object> search) {
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


	public List<WorkOrderDTO> receiveEmpList(Map<String, Object> search) {
		System.out.println("WorkOrderService receiveEmpList()");
		return workOrderDAO.receiveEmpList(search);
	}
	
	public List<WorkOrderDTO> productEmpList(Map<String, Object> search) {
		System.out.println("WorkOrderService productEmpList()");
		return workOrderDAO.productEmpList(search);
	}
	public List<WorkOrderDTO> getWorkEmpList(Map<String, Object> search) {
		System.out.println("WorkOrderService getWorkEmpList()");
		return workOrderDAO.getWorkEmpList(search);
	}

	public int countEmpList(Map<String, Object> search) {
		System.out.println("WorkOrderService countEmpList()");
		return workOrderDAO.countEmpList(search);
	}

	public int countEmpList1(Map<String, Object> search) {
		System.out.println("WorkOrderService countEmpList()");
		return workOrderDAO.countEmpList(search);
	}
	
	public int countEmpList2(Map<String, Object> search) {
		System.out.println("WorkOrderService countEmpList()");
		return workOrderDAO.countEmpList(search);
	}
	public List<WorkOrderDTO> getWorkList(Map<String, Object> search) {
		System.out.println("WorkOrderService workList()");		
		return workOrderDAO.getWorkList(search);
	}

	public int countWorkList(Map<String, Object> search) {
		System.out.println("WorkOrderService countWorkList()");
		return workOrderDAO.countWorkList(search);
	}
	
	public List<WorkOrderDTO> getNeedPurchaseList(Map<String, Object> search) {
		System.out.println("WorkOrderService getNeedPurchaseList()");		
		return workOrderDAO.getNeedPurchaseList(search);
	}

	public int countNeedPurchaseList(Map<String, Object> search) {
		System.out.println("WorkOrderService countNeedPurchaseList()");
		return workOrderDAO.countNeedPurchaseList(search);
	}

	public void updateWorkOrderStatus(WorkOrderDTO workOrderDTO) {
		workOrderDAO.updateWorkOrderStatus(workOrderDTO);
	}
	
	
	public void deleteSelected(String woCode) {
		 workOrderDAO.deleteSelected(woCode);
	}
	
	
		//작업지시 등록 => 자재 수량 빼기
		public void updateMaterialCount(Map<String, Object> param) {
		    workOrderDAO.updateMaterialCount(param);
		}

		public List<Map<String, Object>> selectWorkSum(WorkOrderDTO workOrderDTO) {
			
			return workOrderDAO.selectWorkSum(workOrderDTO);
		}




	
	
	
	
	
	

}

