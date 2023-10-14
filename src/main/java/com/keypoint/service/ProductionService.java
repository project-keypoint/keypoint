package com.keypoint.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.keypoint.dao.ProductionDAO;
import com.keypoint.dao.WorkOrderDAO;
import com.keypoint.dto.PageDTO;
import com.keypoint.dto.ProductionDTO;
import com.keypoint.dto.WorkOrderDTO;
@Service
public class ProductionService {
	
	
	@Inject
	private ProductionDAO productionDAO;
	
	
	public List<ProductionDTO> getProductionList(PageDTO pageDTO) {
		System.out.println("ProductionService getProductionList()");
		
		// 10개씩 가져올때 현페이지에 대한 시작하는 행번호 구하기
				int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize() + 1;
						// 끝나는 행번호 구하기
				int endRow = startRow + pageDTO.getPageSize() - 1;
						
						// 디비 startRow - 1
				pageDTO.setStartRow(startRow - 1);
				pageDTO.setEndRow(endRow);
				System.out.println("startRow"+startRow+"endRow"+endRow);
		
		return productionDAO.getProductionList(pageDTO);
	}
		
	public int getProductionCount(PageDTO pageDTO) {
		System.out.println("ProductionService getProductionCount()");
		return productionDAO.getProductionCount(pageDTO);
	}
	
	
	
	public void productionInsertPro(ProductionDTO productionDTO) {
		System.out.println("productionService productionInsertPro()");
		
//		workOrderDTO.setWoDate(new Timestamp(System.currentTimeMillis()));
		productionDTO.setWoStatus("완료");
		productionDAO.insertProduction(productionDTO);
		
	} // insertWorkOrder
	
	
	
	public ProductionDTO getProductionDetails(String poCode) {
		System.out.println("WorkOrderService getWorkOrderDetails()");
		return productionDAO.getProductionDetails(poCode);
	}// getReceiveDetails [생산실적상세]
	
	
	
	public void productionUpdatePro(ProductionDTO productionDTO) {
		System.out.println("ProductionService productionUpdatePro()");
//		workOrderDTO.setShipSdate(new Timestamp(System.currentTimeMillis()));
		productionDAO.updateProduction(productionDTO);
	}// workOrderUpdatePro() [작업지시수정Pro]
	
	
	public void productionDelete(ProductionDTO productionDTO) {
		System.out.println("ProductionService productionUpdatePro()");
		System.out.println(productionDTO);
		productionDAO.deleteProduction(productionDTO);
	}// productionDelete() [작업지시삭제]
	
	
	
}
