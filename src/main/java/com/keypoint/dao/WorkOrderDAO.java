package com.keypoint.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.keypoint.dto.WorkOrderDTO;

@Repository
public class WorkOrderDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.workOrdermapper";
	
	
	public void insertWorkOrder(WorkOrderDTO workOrderDTO) {
		System.out.println("WorkOrderService insertWorkOrder");
		
		sqlSession.insert(namespace+".insertWorkOrder", workOrderDTO);
		
	}
	
	
	
	
}
