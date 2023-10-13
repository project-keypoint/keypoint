package com.keypoint.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.keypoint.dao.MaterialDAO;
import com.keypoint.dto.MaterialDTO;
import com.keypoint.dto.PageDTO;

@Service
public class MaterialService {

	@Inject
	private MaterialDAO materialDAO;

	public void insertMaterial(MaterialDTO materialDTO) {
		System.out.println("MaterialService insertMaterial()");
		materialDAO.insertMaterial(materialDTO);
	}// insertMaterial

	public List<MaterialDTO> getMaterialList(PageDTO pageDTO) {
		System.out.println("MaterialService getMaterialList()");
		// 10개씩 가져올 때 현 페이지에 대한 시작하는 행번호 구하기
		int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		// 끝나는 행번호 구하기
		int endRow = startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow-1);
		pageDTO.setEndRow(endRow);		
		return materialDAO.getMaterialList(pageDTO);
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
	
	public int getMaterialCount(PageDTO pageDTO) {
		System.out.println("MaterialService getMaterialCount()");
		return materialDAO.getMaterialCount(pageDTO);
	}// getMaterialCount	

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
	
	//-----------------------------------------홍렬 자재리스트팝업--------------------------------------------
	
	public List<MaterialDTO> getPurchaseMaterialList2(Map<String, Object> search) {
		System.out.println("materialService getPurchaseMaterialList()");
		
		
		return materialDAO.getPurchaseMaterialList2(search);
	} // getPurchaseMaterialList
	
	
	public Integer countPurchaseList2(Map<String, Object> search) { // 품목 개수
		System.out.println("materialService countPurchaseList()");
		
		
		return materialDAO.countPurchaseList2(search);
	} // countPurchaseList


	
	
	// --------------------------------------------------------------------------------------------------
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
}
