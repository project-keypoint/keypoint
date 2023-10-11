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
		
	public int getProductionCount() {
		System.out.println("ProductionService getProductionCount()");
		return productionDAO.getProductionCount();
	}
	
	
	
	public void productionInsertPro(ProductionDTO productionDTO) {
		System.out.println("productionService productionInsertPro()");
		
//		workOrderDTO.setWoDate(new Timestamp(System.currentTimeMillis()));
		
		productionDAO.insertProduction(productionDTO);
		
	} // insertWorkOrder
	
	
	
	
}
