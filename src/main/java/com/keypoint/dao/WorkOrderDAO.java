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


	public List<WorkOrderDTO> getWorkCusList(Map<String, Object> search) { // 거래처 리스트 들고오기 (거래코드, 거래처명)
		System.out.println("WorkOrderDAO getWorkCusList()");
		System.out.println("cusCode"+search.get("cusCode"));
		System.out.println("cusName"+search.get("cusName"));
		System.out.println("startRow"+search.get("startRow"));
		System.out.println("pageSize"+search.get("pageSize"));
		if(search.get("cusName")==null) {
			search.put("cusName", "");
		}
		if(search.get("cusCode")==null) {
			search.put("cusCode", "");
		}
		return sqlSession.selectList(namespace+".workCusList", search);
	
	}


	public Integer countCusList(Map<String, Object> search) { // 거래처 개수(for 페이징)
		System.out.println("WorkOrderDAO countCusList()");
		return sqlSession.selectOne(namespace+".countCusList", search);
	}


	public List<WorkOrderDTO> getWorkInstructList(Map<String, Object> search) {
		System.out.println("WorkOrderDAO workInstructList()");
		
		if(search.get("woCode")==null) {
			search.put("woCode", "");
		}
		return sqlSession.selectList(namespace+".workInstructList", search);
	
	}


	public int countInstructList(Map<String, Object> search) {
		System.out.println("WorkOrderDAO countInstructList()");
		return sqlSession.selectOne(namespace+".countInstructList", search);
	}


	public List<WorkOrderDTO> getWorkLineList(Map<String, Object> search) {
		System.out.println("WorkOrderDAO workLineList()");
		
		if(search.get("lineCode")==null) {
			search.put("lineCode", "");
		}
		return sqlSession.selectList(namespace+".workLineList", search);
	}


	public int countLineList(Map<String, Object> search) {
		System.out.println("WorkOrderDAO countLineList()");
		return sqlSession.selectOne(namespace+".countLineList", search);
	}


	public List<WorkOrderDTO> getWorkEmpList(Map<String, Object> search) {
		System.out.println("WorkOrderDAO getWorkEmpList()");
		
		if(search.get("empId")==null) {
			search.put("empId", "");
		}
		if(search.get("empName")==null) {
			search.put("empName", "");
		}
		return sqlSession.selectList(namespace+".workEmpList", search);
	}


	public int countEmpList(Map<String, Object> search) {
		System.out.println("WorkOrderDAO countEmpList()");
		return sqlSession.selectOne(namespace+".countEmpList", search);
	}
	
	
	
	
}
