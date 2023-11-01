package com.keypoint.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.keypoint.dto.PageDTO;
import com.keypoint.dto.ReceiveDTO;
import com.keypoint.dto.WorkOrderDTO;
import com.keypoint.dto.WorkRoDTO;

@Repository
public class WorkOrderDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.workOrderMapper";
	
	
	public List<WorkOrderDTO> getWorkOrderList(PageDTO pageDTO) {
		System.out.println("WorkOrderDAO getWorkOrderList()");
		return sqlSession.selectList(namespace+".getWorkOrderList", pageDTO);
	}
	
	public int getWorkOrderCount(PageDTO pageDTO) {
		System.out.println("WorkOrderDAO getWorkOrderCount()");
		return sqlSession.selectOne(namespace+".getWorkOrderCount", pageDTO);
	}
	
	
	
	public void insertWorkOrder(WorkOrderDTO workOrderDTO) {
		System.out.println("WorkOrderDAO insertWorkOrder()");
		System.out.println("mfgCode:" + workOrderDTO.getMfgCode());
		System.out.println("materialCode:" + workOrderDTO.getMaterialCode());
		System.out.println("productCode:" + workOrderDTO.getProductCode());
		System.out.println("woCount:" + workOrderDTO.getWoCount());
		System.out.println("woStatus:" + workOrderDTO.getWoStatus());
		System.out.println("woDate:" + workOrderDTO.getWoDate());
		System.out.println("productName:" + workOrderDTO.getProductName());
		
		
		sqlSession.insert(namespace+".insertWorkOrder", workOrderDTO);
		sqlSession.update(namespace+".updateStatusProcess", workOrderDTO);
		
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
	}// deleteWorkOrder() [작업지시삭제]
	


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


	public Integer countProdList(Map<String, Object> search) { // 품목 개수(for 페이징)
		System.out.println("WorkOrderDAO countProdList()");
		return sqlSession.selectOne(namespace+".countProdList", search);
		
	
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
	
	public List<WorkOrderDTO> getWorkCusList2(Map<String, Object> search) {
		System.out.println("WorkOrderDAO getWorkCusList2()");
		if(search.get("cusName")==null) {
			search.put("cusName", "");
		}
		if(search.get("cusCode")==null) {
			search.put("cusCode", "");
		}
		return sqlSession.selectList(namespace+".workCusList2", search);
	}
	
	public Integer countCusList(Map<String, Object> search) { // 거래처 개수(for 페이징)
		System.out.println("WorkOrderDAO countCusList()");
		return sqlSession.selectOne(namespace+".countCusList", search);
	}

	public Integer countCusList2(Map<String, Object> search) {
		System.out.println("WorkOrderDAO countCusList2()");
		return sqlSession.selectOne(namespace+".countCusList2", search);
	}

	

	public List<WorkRoDTO> getWorkRoCodeList(Map<String, Object> search) {
		System.out.println("WorkOrderDAO getWorkRoCodeList()");
		
		if(search.get("roCode")==null) {
			search.put("roCode", "");
		}
		if(search.get("productCode")==null) {
			search.put("productCode", "");
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


	public List<WorkOrderDTO> receiveEmpList(Map<String, Object> search) {
		System.out.println("WorkOrderDAO receiveEmpList()");
		
		if(search.get("empId")==null) {
			search.put("empId", "");
		}
		if(search.get("empName")==null) {
			search.put("empName", "");
		}
		return sqlSession.selectList(namespace+".receiveEmpList", search);
	}

	public List<WorkOrderDTO> productEmpList(Map<String, Object> search) {
		System.out.println("WorkOrderDAO productEmpList()");
		
		if(search.get("empId")==null) {
			search.put("empId", "");
		}
		if(search.get("empName")==null) {
			search.put("empName", "");
		}
		return sqlSession.selectList(namespace+".productEmpList", search);
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
	
	public int countEmpList1(Map<String, Object> search) {
		System.out.println("WorkOrderDAO countEmpList()");
		return sqlSession.selectOne(namespace+".countEmpList1", search);
	}
	
	public int countEmpList2(Map<String, Object> search) {
		System.out.println("WorkOrderDAO countEmpList()");
		return sqlSession.selectOne(namespace+".countEmpList2", search);
	}

	
	public List<WorkOrderDTO> getWorkList(Map<String, Object> search) {
		System.out.println("WorkOrderDAO getWorkList()");
		
		if(search.get("woCode")==null) {
			search.put("woCode", "");
		}
		if(search.get("roCode")==null) {
			search.put("roCode", "");
		}
		return sqlSession.selectList(namespace+".workList", search);
	}


	public int countWorkList(Map<String, Object> search) {
		System.out.println("WorkOrderDAO countWorkList()");
		return sqlSession.selectOne(namespace+".countWorkList", search);
	}
	
	public List<WorkOrderDTO> getNeedPurchaseList(Map<String, Object> search) {
		System.out.println("WorkOrderDAO getWorkList()");
		
		if(search.get("woCode")==null) {
			search.put("woCode", "");
		}
		if(search.get("roCode")==null) {
			search.put("roCode", "");
		}
		return sqlSession.selectList(namespace+".needPurchaseList", search);
	}


	public int countNeedPurchaseList(Map<String, Object> search) {
		System.out.println("WorkOrderDAO countWorkList()");
		return sqlSession.selectOne(namespace+".countNeedPurchaseList", search);
	}

	public void updateWorkOrderStatus(WorkOrderDTO workOrderDTO) {
		System.out.println("WorkOrderDAO updateWorkOrderStatus()");
		sqlSession.update(namespace+".updateWorkOrderStatus", workOrderDTO);
	}// updateWorkOrderStatus
	
	
	
	public void deleteSelected(String woCode) {
		sqlSession.update(namespace+".deleteSelected", woCode);
	}
	
	
	
	
	public void updateMaterialCount(Map<String, Object> param) {
		
		sqlSession.update(namespace+".updateMaterialCount", param);
	}

	public List<Map<String, Object>> selectWorkSum(WorkOrderDTO workOrderDTO) {
		return sqlSession.selectList(namespace+".selectWorkSum", workOrderDTO);
	}


	
	
}
