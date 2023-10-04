package com.keypoint.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.keypoint.dto.MaterialDTO;
import com.keypoint.dto.WorkOrderDTO;

@Repository
public class MaterialDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace="com.itwillbs.mappers.materialMapper";

	public void insertMaterial(MaterialDTO materialDTO) {
		System.out.println("MaterialDAO insertMaterial()");
		sqlSession.insert(namespace+".insertMaterial", materialDTO);
	}// insertMaterial

	public List<MaterialDTO> getMaterialList() {
		System.out.println("MaterialDAO getMaterialList()");
		return sqlSession.selectList(namespace+".getMaterialList");
	}// getMaterialList

	public void deleteMaterial(MaterialDTO materialDTO) {
		System.out.println("MaterialDAO deleteMaterial()");
		sqlSession.update(namespace+".deleteMaterial", materialDTO);
	}// deleteMaterial

	public MaterialDTO getMaterial(String materialDTO) {
		System.out.println("MaterialDAO getMaterial()");
		return sqlSession.selectOne(namespace+".getMaterial", materialDTO);
	}

	// ---------------------------------홍렬 자재리스트 팝업 ---------------------------------------------------------------
	
	public List<MaterialDTO> getPurchaseMaterialList(Map<String,Object> search) { // 품목리스트 들고오기 (품번, 품명만..)
		System.out.println("materialDAO getPurchaseMaterialList()");
		
		System.out.println("materialCode"+search.get("materialCode"));
		System.out.println("materialName"+search.get("materialName"));
		System.out.println("materialPrice"+search.get("materialPrice"));
		System.out.println("startRow"+search.get("startRow"));
		System.out.println("pageSize"+search.get("pageSize"));
		
		if(search.get("materialName")==null) {
			search.put("materialName", "");
		}
		if(search.get("materialCode")==null) {
			search.put("materialCode", "");
		}
		if(search.get("materialPrice")==null) {
			search.put("materialPrice", "");
		}
		return sqlSession.selectList(namespace+".getPurchaseMaterialList", search);
	} // getPurchaseMaterialList


	public Integer countPurchaseList(Map<String, Object> search) { // 품목 개수(for 페이징)
		System.out.println("materialDAO countPurchaseList()");
		
		return sqlSession.selectOne(namespace+".countPurchaseList", search);
	
	} // countPurchaseList
	
	
	// -------------------------------------------------------------------------------------

	
	
	
}
