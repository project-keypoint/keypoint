package com.keypoint.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.keypoint.dto.WorkOrderDTO;

@Repository
public class WorkOrderDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.workOrderMapper";
	
	
	public void insertWorkOrder(WorkOrderDTO workOrderDTO) {
		System.out.println("WorkOrderDAO insertWorkOrder");
		
		sqlSession.insert(namespace+".insertWorkOrder", workOrderDTO);
		
	}


	public List<WorkOrderDTO> getWorkProdList(Map<String,Object> search) { // 품목리스트 들고오기 (품번, 품명만..)
		System.out.println("WorkOrderDAO getWorkProdList()");
		System.out.println("productCode"+search.get("productCode"));
		System.out.println("productName"+search.get("productName"));
		System.out.println("startRow"+search.get("startRow"));
		System.out.println("pageSize"+search.get("pageSize"));
		if(search.get("productName")==null) {
			search.put("productName", "");
		}
		if(search.get("productCode")==null) {
			search.put("productCode", "");
		}
		return sqlSession.selectList(namespace+".workProdList", search);
	}


	public Integer countWorkList(Map<String, Object> search) { // 품목 개수(for 페이징)
		System.out.println("WorkOrderDAO countWorkList()");
		return sqlSession.selectOne(namespace+".countWorkList", search);
		
	
	}
	
	
	
	
}
