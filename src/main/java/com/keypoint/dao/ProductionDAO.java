package com.keypoint.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.keypoint.dto.PageDTO;
import com.keypoint.dto.ProductionDTO;
import com.keypoint.dto.WorkOrderDTO;
@Repository
public class ProductionDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.productionMapper";
	
	public List<ProductionDTO> getProductionList(PageDTO pageDTO) {
		System.out.println("ProductionDAO getProductionList()");
		return sqlSession.selectList(namespace+".getProductionList", pageDTO);
	}
	
	public int getProductionCount() {
		System.out.println("ProductionDAO getProductionCount()");
		return sqlSession.selectOne(namespace+".getProductionCount");
	}
	
	
	
	public void insertProduction(ProductionDTO productionDTO) {
		System.out.println("ProductionDAO insertProduction()");
		System.out.println("poDate:" + productionDTO.getPoDate());
		
		sqlSession.insert(namespace+".insertProduction", productionDTO);
		
	}
	
	
	public ProductionDTO getProductionDetails(String poCode) {
		System.out.println("ProductionDAO getProductionDetails()");
		return sqlSession.selectOne(namespace+".getProductionDetails", poCode);
	}
	
	
	public void updateProduction(ProductionDTO productionDTO) {
		System.out.println("ProductionDAO updateProduction()");
		sqlSession.update(namespace+".updateProduction",productionDTO);
		System.out.println(productionDTO);
		
	}// updateProduction() [생산실적수정]
	
	public void deleteProduction(ProductionDTO productionDTO) {
		System.out.println("ProductionDAO deleteProduction()");
		System.out.println(productionDTO);
		sqlSession.update(namespace+".deleteProduction",productionDTO);
	}// deleteProduction() [생산실적삭제]
	
	
	
	
}
