package com.keypoint.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.keypoint.dao.ProductionDAO;
import com.keypoint.dao.WorkOrderDAO;
import com.keypoint.dto.ProductionDTO;
import com.keypoint.dto.WorkOrderDTO;
@Service
public class ProductionService {
	
	
	@Inject
	private ProductionDAO productionDAO;
	
	
	
	
	
	public List<ProductionDTO> getProductionList() {
		System.out.println("WorkOrderService getProductionList()");
		return productionDAO.getProductionList();
	}
	
	public void productionInsertPro(ProductionDTO productionDTO) {
		System.out.println("productionService productionInsertPro()");
		
//		workOrderDTO.setWoDate(new Timestamp(System.currentTimeMillis()));
		
		productionDAO.insertProduction(productionDTO);
		
	} // insertWorkOrder
	
	
	
	
}
