package com.keypoint.service;

import java.util.List;

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

	public MaterialDTO getMaterial(String materialDTO) {
		System.out.println("MaterialService getMaterial()");
		return materialDAO.getMaterial(materialDTO);
	}



	
}
