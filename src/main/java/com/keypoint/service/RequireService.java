package com.keypoint.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.keypoint.dao.RequireDAO;
import com.keypoint.dto.RequireDTO;

@Service
public class RequireService {

	@Inject
	private RequireDAO requireDAO;

	public void insertRequire(RequireDTO requireDTO) {
		System.out.println("RequireService insertRequire()");
		requireDAO.insertRequire(requireDTO);
	}// insertRequire

	public List<RequireDTO> getRequireList() {
		System.out.println("RequireService getRequireList()");
		return requireDAO.getRequireList();
	}// getRequireList

	public void deleteRequire(RequireDTO requireDTO) {
		System.out.println("RequireService deleteRequire()");
		requireDAO.deleteRequire(requireDTO);
	}// deleteRequire

	public RequireDTO getRequire(Map<String, Object> param) {
		System.out.println("RequireService getRequire()");
		return requireDAO.getRequire(param);
	}// getRequire

	public void updateRequire(RequireDTO requireDTO) {
		System.out.println("RequireService updateRequire()");
		requireDAO.updateRequire(requireDTO);
	}// updateRequire



	
}
