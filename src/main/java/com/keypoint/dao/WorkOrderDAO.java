package com.keypoint.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.keypoint.dto.PageDTO;
import com.keypoint.dto.ReceiveDTO;
import com.keypoint.dto.WorkOrderDTO;

@Repository
public class WorkOrderDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.workOrderMapper";
	
	
	public List<WorkOrderDTO> getWorkOrderList(PageDTO pageDTO) {
		System.out.println("WorkOrderDAO getWorkOrderList()");
		return sqlSession.selectList(namespace+".getWorkOrderList");
	}
	
	public int getWorkOrderCount() {
		System.out.println("WorkOrderDAO getWorkOrderCount()");
		return sqlSession.selectOne(namespace+".getWorkOrderCount");
	}
	
	
	
	public void insertWorkOrder(WorkOrderDTO workOrderDTO) {
		System.out.println("WorkOrderDAO insertWorkOrder()");
		System.out.println("woDate:" + workOrderDTO.getWoDate());
		System.out.println("empName:" + workOrderDTO.getEmpName());
		
		sqlSession.insert(namespace+".insertWorkOrder", workOrderDTO);
		
	}
	
	public WorkOrderDTO getWorkOrderDetails(String woCode) {
		System.out.println("WorkOrderDAO getWorkOrderDetails()");
		return sqlSession.selectOne(namespace+".getWorkOrderDetails", woCode);
	}
	
	
	public void updateWorkOrder(WorkOrderDTO workOrderDTO) {
		System.out.println("WorkOrderDAO updateWorkOrder()");
		sqlSession.update(namespace+".updateWorkOrder",workOrderDTO);
	}// updateReceive() [작업지시수정]
	
	public void deleteWorkOrder(WorkOrderDTO workOrderDTO) {
		System.out.println("WorkOrderDAO deleteWorkOrder()");
		System.out.println(workOrderDTO);
		sqlSession.update(namespace+".deleteWorkOrder",workOrderDTO);
	}// deleteWorkOrder() [수주삭제]
	


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


	public List<WorkOrderDTO> getWorkRoCodeList(Map<String, Object> search) {
		System.out.println("WorkOrderDAO getWorkRoCodeList()");
		
		if(search.get("roCode")==null) {
			search.put("roCode", "");
		}
		return sqlSession.selectList(namespace+".workRoCodeList", search);
	
	}


	public int countWorkRoCodeList(Map<String, Object> search) {
		System.out.println("WorkOrderDAO countWorkRoCodeList()");
		return sqlSession.selectOne(namespace+".countWorkRoCodeList", search);
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

	
	
	public List<WorkOrderDTO> workList() {
		System.out.println("WorkOrderDAO workList()");
		
		return sqlSession.selectList(namespace + ".workList");
	}
	
	
	public List<Map<String, Object>> workList(PageDTO pageDTO) {
		System.out.println("WorkOrderDAO workListPaging()");
		
		return sqlSession.selectList(namespace + ".workListPaging", pageDTO);
	}

	public List<Map<String, Object>> workSearch(Map<String, Object> workSearch, PageDTO pageDTO) {
		System.out.println("WorkOrderDAO workSearch()");
		System.out.println("라인 : " + workSearch);
		
		workSearch.put("startRow", pageDTO.getStartRow());
		workSearch.put("pageSize", pageDTO.getPageSize());
		
		System.out.println("라인 페이징 : " + workSearch);
		
		return sqlSession.selectList(namespace+".workSearch", workSearch);
	}

	public Integer workTotalCount() {
		System.out.println("WorkOrderDAO workTotalCount");
		
		return sqlSession.selectOne(namespace+".workTotalCount");
	}

	public Integer workSearchCount(Map<String, Object> workSearch) {
		System.out.println("WorkOrderDAO workSearchCount");
		
		return sqlSession.selectOne(namespace+".workSearchCount", workSearch);
	}
	
	
	
	
	
	
	
	
	
	
	
	

//	public List<WorkOrderDTO> getWorkList(PageDTO pageDTO) {
//		System.out.println("WorkOrderDAO getWorkList()");
//		pageDTO.setStartRow(pageDTO.getStartRow()-1);
//		return sqlSession.selectList(namespace+".getWorkList", pageDTO);
//	}
//
//
//
//	public int getWorkOrderCount(PageDTO pageDTO) {
//		System.out.println("WorkOrderDAO getWorkOrderCount()");
//		return sqlSession.selectOne(namespace+".getWorkOrderCount", pageDTO);
//	}
//
//
//
//	public WorkOrderDTO getWork(String woCode) {
//		System.out.println("WorkOrderDAO getWork()");
//
//		return sqlSession.selectOne(namespace+".getWork", woCode);
//	}


	
	
	
	
	
}
