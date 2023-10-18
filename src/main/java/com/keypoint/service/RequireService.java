package com.keypoint.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.keypoint.dao.RequireDAO;
import com.keypoint.dto.PageDTO;
import com.keypoint.dto.RequireDTO;

@Service
public class RequireService {

	@Inject
	private RequireDAO requireDAO;

//	public void insertRequire(RequireDTO requireDTO) {
//		System.out.println("RequireService insertRequire()");
//		for (String mateiralCode : requireDTO.getMaterialCodes()) {
//			requireDAO.insertRequire(mateiralCode);
//		}
//	}// insertRequire
	
	public void insertRequire(RequireDTO requireDTO) {
		System.out.println("RequireService insertRequire()");
		for (int i = 0; i < requireDTO.getMaterialCodes().size(); i++) {
			String productCode = requireDTO.getProductCode();
			String materialCode = requireDTO.getMaterialCodes().get(i);
			int reqCount = Integer.parseInt(requireDTO.getReqCounts().get(i));
			System.out.println(reqCount);
			
			requireDAO.insertRequire(productCode, materialCode, reqCount);
		}
	}// insertRequire

	public List<RequireDTO> getRequireList(PageDTO pageDTO) {
		System.out.println("RequireService getRequireList()");
		// 10개씩 가져올 때 현 페이지에 대한 시작하는 행번호 구하기
		int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		// 끝나는 행번호 구하기
		int endRow = startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow-1);
		pageDTO.setEndRow(endRow);		
		return requireDAO.getRequireList(pageDTO);
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

	public int getRequireCount(PageDTO pageDTO) {
		System.out.println("RequireService getBoardCount()");
		return requireDAO.getRequireCount(pageDTO);
	}// getRequireCount

	public void requireDeleteChecked(RequireDTO requireDTO) {
		System.out.println("RequireService requireDeleteChecked()");
		for (String requireCode : requireDTO.getRequireCodes()) {
			requireDAO.requireDeleteChecked(requireCode);
		}
	}// requireDeleteChecked



	
}
