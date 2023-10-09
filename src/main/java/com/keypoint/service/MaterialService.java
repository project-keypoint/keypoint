package com.keypoint.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.keypoint.dao.MaterialDAO;
import com.keypoint.dto.MaterialDTO;

@Service
public class MaterialService {

	@Inject
	private MaterialDAO materialDAO;

	public void insertMaterial(MaterialDTO materialDTO) {
		System.out.println("MaterialService insertMaterial()");
		materialDAO.insertMaterial(materialDTO);
	}// insertMaterial

	public List<MaterialDTO> getMaterialList() {
		System.out.println("MaterialService getMaterialList()");
		return materialDAO.getMaterialList();
	}// getMaterialList

	public void deleteMaterial(MaterialDTO materialDTO) {
		System.out.println("MaterialService deleteMaterial()");
		materialDAO.deleteMaterial(materialDTO);
	}// deleteMaterial

	public MaterialDTO getMaterial(String materialCode) {
		System.out.println("MaterialService getMaterial()");
		return materialDAO.getMaterial(materialCode);
	}// getMaterial

	public void updateMaterial(MaterialDTO materialDTO) {
		System.out.println("MaterialService updateMaterial()");
		materialDAO.updateMaterial(materialDTO);
	}// updateMaterial

	//-----------------------------------------홍렬 자재리스트팝업--------------------------------------------
	
	public List<MaterialDTO> getPurchaseMaterialList(Map<String, Object> search) {
		System.out.println("materialService getPurchaseMaterialList()");
		
		
		return materialDAO.getPurchaseMaterialList(search);
	} // getPurchaseMaterialList


	public Integer countPurchaseList(Map<String, Object> search) { // 품목 개수
		System.out.println("materialService countPurchaseList()");
		
		
		return materialDAO.countPurchaseList(search);
	} // countPurchaseList

	
	// --------------------------------------------------------------------------------------------------
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
}
