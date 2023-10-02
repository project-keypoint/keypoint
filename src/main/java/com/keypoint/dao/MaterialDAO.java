package com.keypoint.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.keypoint.dto.MaterialDTO;

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

	
	
	
	
	
}
